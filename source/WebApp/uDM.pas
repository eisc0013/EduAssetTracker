unit uDM;

interface

uses
  System.SysUtils, System.Classes, VCL.Dialogs, JS, XData.Web.Connection,
  WEBLib.Modules, WEBLib.IndexedDb, Data.DB, WEBLib.DB, XData.Web.JsonDataset,
  XData.Web.Dataset, XData.Web.Client, VCL.TMSFNCEdit, uTEATTag;

 type
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
    tAsset: TXDataWebDataSet;
    dsAsset: TWebDataSource;
    tAssettagId: TXDataWebEntityField;
    tAssetroomId: TXDataWebEntityField;
    tAssettypeId2: TXDataWebEntityField;
    tAssetvendorId: TXDataWebEntityField;
    tAssetid: TStringField;
    tAssetmake: TStringField;
    tAssetmodel: TStringField;
    tAssetserialNumber: TStringField;
    tAssetpurchaseDate: TDateTimeField;
    tAssetpurchaseInvoice: TStringField;
    tAssetpurchasePrice: TIntegerField;
    tAssetwarrantyDurationDays: TIntegerField;
    tAssetpurchaseNotes: TStringField;
    tAssetnotes: TStringField;
    tAssetdeactivatedDate: TDateTimeField;
    procedure dbEATClientAfterOpen(DataSet: TDataSet);
    procedure tAssetTypeAfterOpen(DataSet: TDataSet);
    procedure XDataClientLoad(Response: TXDataClientResponse);
    procedure tTagsAfterOpen(DataSet: TDataSet);
    procedure XDataConnConnect(Sender: TObject);
    procedure tAssetAfterOpen(DataSet: TDataSet);
    procedure tTagsdeactivatedChange(Sender: TField);
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

procedure Tdm.tAssetAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAsset Opened');
  dsAsset.Enabled := True;
  tAsset.First;
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
  frmEAT.LogIt('tTags.id=' + tTags.FieldByName('id').AsString);
end;

procedure Tdm.tTagsdeactivatedChange(Sender: TField);
begin
  ShowMessage('OnChange');
end;

procedure Tdm.XDataClientLoad(Response: TXDataClientResponse);
begin
  ShowMessage(TJSJson.stringify(Response.Result));
end;

procedure Tdm.XDataConnConnect(Sender: TObject);
begin
  tAsset.Load;
  tAssetType.Load;
  tTags.Load;
end;

end.
