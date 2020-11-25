unit uDM;

interface

uses
  System.SysUtils, System.Classes, VCL.Dialogs, JS, XData.Web.Connection,
  WEBLib.Modules, WEBLib.IndexedDb, Data.DB, WEBLib.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, XData.Web.Client, VCL.TMSFNCEdit;

type
  TEATTagTextChange = procedure(const pOldText, pNewText: String) of object;
  TEATTag = class(TObject)
  protected
    FTagText: String;
    FTextChangeEvent: TEATTagTextChange;
    FTextEdit1: TTMSFNCEditButton;
    FTextEdit2: TTMSFNCEditButton;
    FtTags: TXDataWebDataSet;
    FXDataConn: TXDataWebConnection;
    procedure UpdateTagText(const pTagText: String);
    procedure UpdateXDataConn(pXDataWebConn: TXDataWebConnection);
    procedure tTagsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(const pXDataWebConn: TXDataWebConnection); overload;
    destructor Free(); overload;
  published
    property TagText: String read FTagText write UpdateTagText;
    property tTags: TXDataWebDataSet read FtTags write FtTags;
    property XDataConn: TXDataWebConnection read FXDataConn write UpdateXDataConn;
    property TextEdit1: TTMSFNCEditButton read FTextEdit1 write FTextEdit1;
    property TextEdit2: TTMSFNCEditButton read FTextEdit2 write FTextEdit2;
    property OnTagTextChange: TEATTagTextChange read FTextChangeEvent write FTextChangeEvent;
  end;

  Tdm = class(TWebDataModule)
    XDataConn: TXDataWebConnection;
    XDataClient: TXDataWebClient;
    tAssetType: TXDataWebDataSet;
    tAssetTypeid: TStringField;
    tAssetTypename: TStringField;
    tAssetTypedescription: TStringField;
    tAssetTypedeactivatedDate: TDateTimeField;
    dsAssetType: TWebDataSource;
    dsEATClient: TWebDataSource;
    dbEATClient: TWebIndexedDbClientDataset;
    dbEATClientname: TStringField;
    dbEATClientsettings: TStringField;
    tTags: TXDataWebDataSet;
    dsTags: TWebDataSource;
    tTagsid: TStringField;
    tTagstagText: TStringField;
    tTagsdeactivatedDate: TDateTimeField;
    procedure dbEATClientAfterOpen(DataSet: TDataSet);
    procedure tAssetTypeAfterOpen(DataSet: TDataSet);
    procedure XDataClientLoad(Response: TXDataClientResponse);
    procedure tTagsAfterOpen(DataSet: TDataSet);
    procedure XDataConnConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TagHelper: TEATTag;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uEduAssetTracker;

{$R *.dfm}

procedure Tdm.dbEATClientAfterOpen(DataSet: TDataSet);
begin
  // ALE 20201121 see if we have an IndexedDB entry for firstAccess yet
  if dbEATClient.Locate('name', 'firstAccess', [TLocateOption.loCaseInsensitive]) then
  begin
    frmEAT.LogIt('IndexedDB firstAccess found');
    frmEAT.lblFirstAccess.Caption := 'Device first access: ' + dm.dbEATClient.FieldByName('value').AsString;
    frmEAT.GoCamera();
    frmEAT.pc.ActivePageIndex := 1;
  end
  else
  begin
    frmEAT.LogIt('IndexedDB firstAccess not found');
    dbEATClient.Insert;
    dbEATClient.FieldByName('name').AsString := 'firstAccess';
    dbEATClient.FieldByName('value').AsString :=
     FormatDateTime('yyyy-mm-dd', Now()) + 'T'
      + FormatDateTime('hh:nn:ss.zzz', Now()) + 'Z';
    dbEATClient.Post;
    frmEAT.lblFirstAccess.Caption := 'Device first access: ' + dm.dbEATClient.FieldByName('value').AsString;
  end;
  frmEAT.btnWelcomeResetFirstAccess.Enabled := True;
end;

procedure Tdm.tAssetTypeAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetType Opened');
  dsAssetType.Enabled := True;
  tAssetType.First;
end;

procedure Tdm.tTagsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tTags Opened');
  dsTags.Enabled := True;
  tTags.First;
end;

procedure Tdm.XDataClientLoad(Response: TXDataClientResponse);
begin
  ShowMessage(TJSJson.stringify(Response.Result));
end;

procedure Tdm.XDataConnConnect(Sender: TObject);
begin
  //tAssetType.Load;
  //tTags.Load;
end;

{ TEATTag }

constructor TEATTag.Create(const pXDataWebConn: TXDataWebConnection);
begin
  inherited Create();

  FXDataConn := pXDataWebConn;
  FtTags := TXDataWebDataSet.Create(nil);
  FtTags.Connection := FXDataConn;
  FtTags.EntitySetName := 'tTags';
  FtTags.AfterOpen := tTagsAfterOpen;
end;

destructor TEATTag.Free;
begin
{
  if FtTags <> nil then
    FtTags.ApplyUpdates;
  FtTags.Free;
}
  inherited Free();
end;

procedure TEATTag.tTagsAfterOpen(DataSet: TDataSet);
begin
  //dsTags.Enabled := True;
  FtTags.First;
  frmEAT.LogIt('TEATag tTags Opened fTags.id=' + FtTags.FieldByName('id').AsString);
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
    //FtTags.Refresh;
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

procedure TEATTag.UpdateXDataConn(pXDataWebConn: TXDataWebConnection);
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
