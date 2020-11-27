unit uTEATAudit;

interface

uses
  System.SysUtils, System.Classes, JS, XData.Web.Connection,
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
  public
    { Public declarations }
    constructor Create(const pXDataWebConn: TXDataWebConnection); overload;
    destructor Free(); overload;
    function AuditIt(const pTable_name, pId_row, pAudit: String): String;
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
begin
  if FtAudit.Active then
  begin

  end
  else
  begin
    // ALE 20201127 Add item to the queue
    FAuditItemQueue.Add(FUtil.GetUUIDStr);
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

procedure TEATAudit.tAuditAfterOpen(DataSet: TDataSet);
begin
  //dsTags.Enabled := True;
  LogIt('TEATAudit tAudit Opened');

  // TODO ALE 20201127 replay our queued audit items to the dataset

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
    FtAudit.QueryString := '$filter=tagText eq ''' + pTagText + ''' AND deactivatedDate eq null';
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
