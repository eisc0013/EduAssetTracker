unit uTEATTag;

interface

uses
  System.SysUtils, System.Classes, JS, XData.Web.Connection,
  WEBLib.Modules, Data.DB, WEBLib.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, XData.Web.Client, VCL.TMSFNCEdit, uTEATAudit, uTEATCommon;

type
  TEATTagTextChange = procedure(const pOldText, pNewText: String) of object;
  TEATTagIdChange = procedure(const pOldTagId, pNewTagId: String) of object;
  TEATLogItEvent = procedure(const pLogText: String) of object;
  TEATTag = class(TObject)
  protected
    FTagId: String;
    FTagText: String;
    FIdChangeEvent: TEATTagIdChange;
    FTextChangeEvent: TEATTagTextChange;
    FLogItEvent: TEATLogItEvent;
    FTextEdit1: TTMSFNCEditButton;
    FTextEdit2: TTMSFNCEditButton;
    FtTags: TXDataWebDataSet;
    FdsTags: TWebDataSource;
    FXDataConn: TXDataWebConnection;
    FUtil: TEATUtil;
    FAudit: TEATAudit;
    procedure UpdateTagText(const pTagText: String);
    procedure tTagsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(const pXDataWebConn: TXDataWebConnection); overload;
    destructor Free(); overload;
    procedure LogIt(const pLogText: String);
    function AddTag(): String;
    // TODO function UpdateTag(const pId, pTagText: String; const pDeactivatedDate: TDateTime): Boolean;
  published
    property TagId: String read FTagId;
    property TagText: String read FTagText write UpdateTagText;
    property tTags: TXDataWebDataSet read FtTags write FtTags;
    property dsTags: TWebDataSource read FdsTags write FdsTags;
    property XDataConn: TXDataWebConnection read FXDataConn;
    property Audit: TEATAudit read FAudit write FAudit;
    property TextEdit1: TTMSFNCEditButton read FTextEdit1 write FTextEdit1;
    property TextEdit2: TTMSFNCEditButton read FTextEdit2 write FTextEdit2;
    property OnTagIdChange: TEATTagIdChange read FIdChangeEvent write FIdChangeEvent;
    property OnTagTextChange: TEATTagTextChange read FTextChangeEvent write FTextChangeEvent;
    property OnLogItEvent: TEATLogItEvent read FLogItEvent write FLogItEvent;
  end;


implementation

{ TEATTag }

function TEATTag.AddTag(): String;
begin
  FtTags.Insert;
  FtTags.FieldByName('id').AsString := FUtil.GetUUIDStr();
  FtTags.FieldByName('tagText').AsString := FTagText;
  FtTags.Post;
  FtTags.ApplyUpdates;
  FAudit.AuditIt('tTags', FtTags.FieldByName('id').AsString,
   'Asset added with tagText=' + FTagText);
end;

constructor TEATTag.Create(const pXDataWebConn: TXDataWebConnection);
begin
  inherited Create();

  FUtil := TEATUtil.Create();
  FXDataConn := pXDataWebConn;
  FtTags := TXDataWebDataSet.Create(nil);
  FtTags.Connection := FXDataConn;
  FtTags.EntitySetName := 'tTags';
  FtTags.AfterOpen := tTagsAfterOpen;
  FdsTags := TWebDataSource.Create(nil);
  FdsTags.DataSet := FtTags;
end;

destructor TEATTag.Free;
begin
  FUtil.Free;

  inherited Free();
end;

procedure TEATTag.LogIt(const pLogText: String);
begin
  if Assigned(FLogItEvent) then
  begin
    FLogItEvent(pLogText);
  end;
end;

procedure TEATTag.tTagsAfterOpen(DataSet: TDataSet);
var
  lNewTagId, lOldTagId: String;
begin
  dsTags.Enabled := True;
  FtTags.First;
  lOldTagId := FTagId;
  lNewTagId := FtTags.FieldByName('id').AsString;
  LogIt('TEATag tTags Opened fTags.id=' + lNewTagId);

  FTagId := lNewTagId;
  if Assigned(FIdChangeEvent) then
  begin
    FIdChangeEvent(lOldTagId, lNewTagId);  // ALE 20201124 send along the new Id to lookup
  end;
end;

procedure TEATTag.UpdateTagText(const pTagText: String);
var
  lOldTagText, lNewTagText: String;
begin
  if FTagText <> pTagText then
  begin
    lOldTagText := FTagText;
    lNewTagText := pTagText;

    FTagText := pTagText;

    // ALE 20201124 start the lookup of the tag
    FtTags.Close;
    FtTags.QueryString := '$filter=tagText eq ''' + pTagText + ''' AND deactivatedDate eq null';
    FtTags.Load;

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

end.
