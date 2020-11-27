unit uTEATAudit;

interface

uses
  System.SysUtils, System.Classes, Web, JS, XData.Web.Connection,
  WEBLib.Modules, Data.DB, WEBLib.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, XData.Web.Client, VCL.TMSFNCEdit, uTEATCommon;

type
  TEATAuditItem = record // ALE 20201127 keep in sync wit tLog
    id: String;
    table_name: String;
    id_row: String;
    audit: String;
  end;
  TEATTagTextChange = procedure(const pOldText, pNewText: String) of object;
  TEATAuditOpen = procedure(const pTAudit: TXDataWebDataSet) of object;
  TEATLogItEvent = procedure(const pLogText: String) of object;
  TEATAudit = class(TObject)
  protected
    FTagId: String;
    FTagText: String;
    FAuditItemQueue: TStringList;
    FAuditOpenEvent: TEATAuditOpen;
    FTextChangeEvent: TEATTagTextChange;
    FLogItEvent: TEATLogItEvent;
    FTextEdit1: TTMSFNCEditButton;
    FTextEdit2: TTMSFNCEditButton;
    FtAudit: TXDataWebDataSet;
    FdsAudit: TWebDataSource;
    FXDataConn: TXDataWebConnection;
    FUtil: TEATUtil;
    procedure UpdateTagText(const pTagText: String);
    procedure UpdateXDataConn(pXDataWebConn: TXDataWebConnection);
    procedure tAuditAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function PostAuditRecord(const pId, pTable_name, pId_row, pAudit: String): Boolean;
  public
    { Public declarations }
    constructor Create(const pXDataWebConn: TXDataWebConnection); overload;
    destructor Free(); overload;
    function AuditIt(const pTable_name, pId_row, pAudit: String): String;
    procedure FlushToServer();
    procedure LogIt(const pLogText: String);
  published
    property TagId: String read FTagId;
    property TagText: String read FTagText write UpdateTagText;
    property tAudit: TXDataWebDataSet read FtAudit write FtAudit;
    property dsTags: TWebDataSource read FdsAudit write FdsAudit;
    property XDataConn: TXDataWebConnection read FXDataConn write UpdateXDataConn;
    property TextEdit1: TTMSFNCEditButton read FTextEdit1 write FTextEdit1;
    property TextEdit2: TTMSFNCEditButton read FTextEdit2 write FTextEdit2;
    property OnAuditOpen: TEATAuditOpen read FAuditOpenEvent write FAuditOpenEvent;
    property OnTagTextChange: TEATTagTextChange read FTextChangeEvent write FTextChangeEvent;
    property OnLogItEvent: TEATLogItEvent read FLogItEvent write FLogItEvent;
  end;


implementation

{ TEATAudit }

function TEATAudit.AuditIt(const pTable_name, pId_row, pAudit: String): String;
var
  lEncodedAudit: String;
begin
  if FtAudit.Active then
  begin
    LogIt('TEATAudit AuditIt to WebDataSet');
    PostAuditRecord(FUtil.GetUUIDStr(), pTable_name, pId_row, pAudit);
  end
  else
  begin
    LogIt('TEATAudit AuditIt to AuditItemQueue');
    lEncodedAudit := window.btoa(pAudit);
    // ALE 20201127 Add item to the queue
    FAuditItemQueue.Add(Format('%s="%s","%s","%s"',
     [FUtil.GetUUIDStr(), pTable_name, pId_row, lEncodedAudit]));
  end;

end;

constructor TEATAudit.Create(const pXDataWebConn: TXDataWebConnection);
begin
  inherited Create();

  FUtil := TEATUtil.Create();
  FAuditItemQueue := TStringList.Create();
  FXDataConn := pXDataWebConn;
  FtAudit := TXDataWebDataSet.Create(nil);
  FtAudit.Connection := FXDataConn;
  FtAudit.EntitySetName := 'tLog';
  FtAudit.AfterOpen := tAuditAfterOpen;
  FdsAudit := TWebDataSource.Create(nil);
  FdsAudit.DataSet := FtAudit;

  FtAudit.QueryString := '$filter=id eq null';
  FtAudit.Load;
end;

procedure TEATAudit.FlushToServer;
begin
  if FtAudit.Active then
  begin
    LogIt('TEATAudit FlushToServer triggered');
    FtAudit.ApplyUpdates;
  end
  else
  begin
    LogIt('TEATAudit FlushToServer table not active');
  end;
end;

destructor TEATAudit.Free;
begin
{
  if FtTags <> nil then
    FtTags.ApplyUpdates;
  FtTags.Free;
}
  FAuditItemQueue.Free;
  FUtil.Free;

  inherited Free();
end;

procedure TEATAudit.LogIt(const pLogText: String);
begin
  if Assigned(FLogItEvent) then
  begin
    FLogItEvent(pLogText);
  end;
end;

function TEATAudit.PostAuditRecord(const pId, pTable_name, pId_row,
  pAudit: String): Boolean;
begin
  Result := False;

  if FtAudit.Active then
  begin
    FtAudit.Insert;
    FtAudit.FieldByName('id').AsString := pId;
    FtAudit.FieldByName('table_name').AsString := pTable_name;
    FtAudit.FieldByName('id_row').AsString := pId_row;
    FtAudit.FieldByName('audit').AsString := pAudit;
    FtAudit.Post;
    Result := True;
  end;
end;

procedure TEATAudit.tAuditAfterOpen(DataSet: TDataSet);
var
  lAI, lItem: TStringList;
begin
  //dsTags.Enabled := True;
  LogIt('TEATAudit tAudit Opened');

  // TODO ALE 20201127 replay our queued audit items to the dataset
  lItem := TStringList.Create;
  lAI := FAuditItemQueue;
  while FAuditItemQueue.Count > 0 do
  begin
    lItem.CommaText := lAI.ValueFromIndex[0];
    PostAuditRecord(lAI.Names[0], lItem[0], lItem[1], window.btoa(lItem[2]));
  end;

  if Assigned(FAuditOpenEvent) then
  begin
    FAuditOpenEvent(FtAudit);
  end;
end;

procedure TEATAudit.UpdateTagText(const pTagText: String);
var
  lOldTagText, lNewTagText: String;
begin
  if FTagText <> pTagText then
  begin
    lOldTagText := FTagText;
    lNewTagText := pTagText;

    FTagText := pTagText;

    // ALE 20201124 start the lookup of the tag
    //FtTags.Refresh;
    FtAudit.Close;
    FtAudit.QueryString := '$filter=id eq null';
    FtAudit.Load;

    if Assigned(FTextEdit1) then
    begin
      FTextEdit1.Text := lNewTagText;
    end;
    if Assigned(FTextEdit2) then
    begin
      FTextEdit2.Text := lNewTagText;
    end;
    if Assigned(FTextChangeEvent) then
    begin
      FTextChangeEvent(lOldTagText, lNewTagText);
    end;
  end;
end;

procedure TEATAudit.UpdateXDataConn(pXDataWebConn: TXDataWebConnection);
begin
{
  if FXDataConn <> pXDataWebConn then
  begin
    if (FXDataConn <> nil) AND FXDataConn.Connected then
      FXDataConn.Close;
    FXDataConn := pXDataWebConn;
    FXDataConn.Connected := True;
  end;
}
end;

end.
