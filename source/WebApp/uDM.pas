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
    tPerson: TXDataWebDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    dsPerson: TWebDataSource;
    tRoom: TXDataWebDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField2: TDateTimeField;
    dsRoom: TWebDataSource;
    tBuilding: TXDataWebDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField3: TDateTimeField;
    dsBuilding: TWebDataSource;
    tVendor: TXDataWebDataSet;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    DateTimeField4: TDateTimeField;
    dsVendor: TWebDataSource;
    tDocuments: TXDataWebDataSet;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    DateTimeField5: TDateTimeField;
    dsDocuments: TWebDataSource;
    tAssetDocuments: TXDataWebDataSet;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    DateTimeField6: TDateTimeField;
    dsAssetDocuments: TWebDataSource;
    procedure dbEATClientAfterOpen(DataSet: TDataSet);
    procedure tAssetTypeAfterOpen(DataSet: TDataSet);
    procedure XDataClientLoad(Response: TXDataClientResponse);
    procedure tTagsAfterOpen(DataSet: TDataSet);
    procedure XDataConnConnect(Sender: TObject);
    procedure tAssetAfterOpen(DataSet: TDataSet);
    procedure tTagsdeactivatedChange(Sender: TField);
    procedure tPersonAfterOpen(DataSet: TDataSet);
    procedure tRoomAfterOpen(DataSet: TDataSet);
    procedure tBuildingAfterOpen(DataSet: TDataSet);
    procedure tVendorAfterOpen(DataSet: TDataSet);
    procedure tDocumentsAfterOpen(DataSet: TDataSet);
    procedure tAssetDocumentsAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterPost(DataSet: TDataSet);
    procedure DataSetBeforeInsertEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    TagHelper: TEATTag;
    procedure LoadTables();
    procedure FlushTables();
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

procedure Tdm.FlushTables;
begin
  tAsset.ApplyUpdates;
  tAssetType.ApplyUpdates;
  tPerson.ApplyUpdates;
  tRoom.ApplyUpdates;
  tBuilding.ApplyUpdates;
  tVendor.ApplyUpdates;
  tDocuments.ApplyUpdates;
  tAssetDocuments.ApplyUpdates;
  tTags.ApplyUpdates;
end;

procedure Tdm.LoadTables;
begin
  tAsset.Load;
  tAssetType.Load;
  tPerson.Load;
  tRoom.Load;
  tBuilding.Load;
  tVendor.Load;
  tDocuments.Load;
  tAssetDocuments.Load;
  tTags.Load;
end;

procedure Tdm.tAssetAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAsset Opened');
  dsAsset.Enabled := True;
  tAsset.First;
end;

procedure Tdm.tAssetDocumentsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetDocuments Opened');
  dsAssetDocuments.Enabled := True;
  tAssetDocuments.First;
end;

procedure Tdm.tAssetTypeAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetType Opened');
  dsAssetType.Enabled := True;
  tAssetType.First;
end;

procedure Tdm.tBuildingAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tBuilding Opened');
  dsBuilding.Enabled := True;
  tBuilding.First;
end;

procedure Tdm.tDocumentsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tDocuments Opened');
  dsDocuments.Enabled := True;
  tDocuments.First;
end;

procedure Tdm.tPersonAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tPerson Opened');
  dsPerson.Enabled := True;
  tPerson.First;
end;

procedure Tdm.tRoomAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tRoom Opened');
  dsRoom.Enabled := True;
  tRoom.First;
end;

procedure Tdm.tTagsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tTags Opened');
  dsTags.Enabled := True;
  tTags.First;
end;

procedure Tdm.DataSetAfterPost(DataSet: TDataSet);
begin
  DataSet.DisableControls;
end;

procedure Tdm.DataSetBeforeInsertEdit(DataSet: TDataSet);
begin
  DataSet.EnableControls;
end;

procedure Tdm.tTagsdeactivatedChange(Sender: TField);
begin
  ShowMessage('OnChange');
end;

procedure Tdm.tVendorAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tVendor Opened');
  dsVendor.Enabled := True;
  tVendor.First;
end;

procedure Tdm.XDataClientLoad(Response: TXDataClientResponse);
begin
  ShowMessage(TJSJson.stringify(Response.Result));
end;

procedure Tdm.XDataConnConnect(Sender: TObject);
begin
  LoadTables();
end;

end.
