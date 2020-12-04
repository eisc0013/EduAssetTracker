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
    dsAssetType: TWebDataSource;
    dsEATClient: TWebDataSource;
    dbEATClient: TWebIndexedDbClientDataset;
    dbEATClientname: TStringField;
    dbEATClientsettings: TStringField;
    tTags: TXDataWebDataSet;
    dsTags: TWebDataSource;
    tAsset: TXDataWebDataSet;
    dsAsset: TWebDataSource;
    tPerson: TXDataWebDataSet;
    dsPerson: TWebDataSource;
    tRoom: TXDataWebDataSet;
    dsRoom: TWebDataSource;
    tBuilding: TXDataWebDataSet;
    dsBuilding: TWebDataSource;
    tVendor: TXDataWebDataSet;
    dsVendor: TWebDataSource;
    tDocuments: TXDataWebDataSet;
    dsDocuments: TWebDataSource;
    tAssetDocuments: TXDataWebDataSet;
    dsAssetDocuments: TWebDataSource;
    tTagsid: TStringField;
    tTagstagText: TStringField;
    tTagsdeactivatedDate: TDateTimeField;
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
    tAssetTypeid: TStringField;
    tAssetTypename: TStringField;
    tAssetTypedescription: TStringField;
    tAssetTypedeactivatedDate: TDateTimeField;
    tPersonid: TStringField;
    tPersonname: TStringField;
    tPersonemail: TStringField;
    tPersondeactivatedDate: TDateTimeField;
    tRoompersonId: TXDataWebEntityField;
    tRoombuildingId: TXDataWebEntityField;
    tRoomid: TStringField;
    tRoomnameplate: TStringField;
    tRoomgrade: TStringField;
    tRoomdeactivatedDate: TDateTimeField;
    tBuildingid: TStringField;
    tBuildingname: TStringField;
    tBuildingphone: TStringField;
    tBuildingaddress: TStringField;
    tBuildingdeactivatedDate: TDateTimeField;
    tVendorid: TStringField;
    tVendorname: TStringField;
    tVendorwebsite: TStringField;
    tVendoremail: TStringField;
    tVendorphone: TStringField;
    tVendornotes: TStringField;
    tVendordeactivatedDate: TDateTimeField;
    tDocumentsid: TStringField;
    tDocumentsprivate_: TIntegerField;
    tDocumentsurl: TStringField;
    tDocumentssizeBytes: TIntegerField;
    tDocumentsdeactivatedDate: TDateTimeField;
    tAssetDocumentsassetId: TXDataWebEntityField;
    tAssetDocumentsdocumentId: TXDataWebEntityField;
    tAssetDocumentsid: TStringField;
    tTagsList: TXDataWebDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    dsTagsList: TWebDataSource;
    tAssetTypeList: TXDataWebDataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateTimeField2: TDateTimeField;
    dsAssetTypeList: TWebDataSource;
    tPersonList: TXDataWebDataSet;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    DateTimeField3: TDateTimeField;
    dsPersonList: TWebDataSource;
    tRoomList: TXDataWebDataSet;
    XDataWebEntityField1: TXDataWebEntityField;
    XDataWebEntityField2: TXDataWebEntityField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateTimeField4: TDateTimeField;
    dsRoomList: TWebDataSource;
    tBuildingList: TXDataWebDataSet;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    DateTimeField5: TDateTimeField;
    dsBuildingList: TWebDataSource;
    tVendorList: TXDataWebDataSet;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    DateTimeField6: TDateTimeField;
    dsVendorList: TWebDataSource;
    tAssetNA: TXDataWebDataSet;
    XDataWebEntityField3: TXDataWebEntityField;
    XDataWebEntityField4: TXDataWebEntityField;
    XDataWebEntityField5: TXDataWebEntityField;
    XDataWebEntityField6: TXDataWebEntityField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    DateTimeField7: TDateTimeField;
    StringField26: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField27: TStringField;
    StringField28: TStringField;
    DateTimeField8: TDateTimeField;
    dsAssetNA: TWebDataSource;
    tRoomNA: TXDataWebDataSet;
    XDataWebEntityField7: TXDataWebEntityField;
    XDataWebEntityField8: TXDataWebEntityField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    DateTimeField9: TDateTimeField;
    dsRoomNA: TWebDataSource;
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
    procedure tTagsListAfterOpen(DataSet: TDataSet);
    procedure tAssetTypeListAfterOpen(DataSet: TDataSet);
    procedure tPersonListAfterOpen(DataSet: TDataSet);
    procedure tRoomListAfterOpen(DataSet: TDataSet);
    procedure tBuildingListAfterOpen(DataSet: TDataSet);
    procedure tVendorListAfterOpen(DataSet: TDataSet);
    procedure tAssetNAAfterOpen(DataSet: TDataSet);
    procedure tRoomNAAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    TagHelper: TEATTag;
    procedure LoadTables();
    procedure FlushTables(const pTableName: String);
    procedure CloneDataset(pDataIn, pDataOut: TXDataWebDataSet);
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

procedure Tdm.FlushTables(const pTableName: String);
begin
  if pTableName = 'tAsset' then
  begin
    tAsset.ApplyUpdates;
    tAssetNA.Load;
  end
  else if pTableName = 'tAssetNA' then
  begin
    tAssetNA.ApplyUpdates;
    tAsset.Load;
  end
  else if pTableName = 'tAssetType' then
  begin
    tAssetType.ApplyUpdates;
    CloneDataset(tAssetType, tAssetTypeList);
  end
  else if pTableName = 'tPerson' then
  begin
    tPerson.ApplyUpdates;
    CloneDataset(tPerson, tPersonList);
  end
  else if pTableName = 'tRoom' then
  begin
    tRoom.ApplyUpdates;
    CloneDataset(tRoom, tRoomList);
    tRoomNA.Load;
  end
  else if pTableName = 'tRoomNA' then
  begin
    tRoomNA.ApplyUpdates;
    tRoom.Load;
    tRoomList.Load;
  end
  else if pTableName = 'tBuilding' then
  begin
    tBuilding.ApplyUpdates;
    CloneDataset(tBuilding, tBuildingList);
  end
  else if pTableName = 'tVendor' then
  begin
    tVendor.ApplyUpdates;
    CloneDataset(tVendor, tVendorList);
  end
  else { ALE 20201201 not implemented
  if pTableName = 'tDocuments' then
  begin
    tDocuments.ApplyUpdates;
    CloneDataset(tDocuments, tDocumentsList);
  end;
  if pTableName = 'tAssetDocuments' then
  begin
    tAssetDocuments.ApplyUpdates;
    CloneDataset(tAssetDocuments, tAssetDocumentsList);
  end;
  }
  if pTableName = 'tTags' then
  begin
    tTags.ApplyUpdates;
    CloneDataset(tTags, tTagsList);
  end;


end;

procedure Tdm.LoadTables;
begin
  tAsset.Load;
  tAssetNA.Load;
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
  // ALE 20201201 not implemented CloneDataset(dsAssetDocuments, tAssetDocumentsList);
  // ALE 20201201 not implemented tAssetDocumentsList.Open;
  dsAssetDocuments.Enabled := True;
  tAssetDocuments.First;
end;

procedure Tdm.tAssetNAAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetNA Opened');
  dsAssetNA.Enabled := True;
  tAssetNA.First;
end;

procedure Tdm.tAssetTypeAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetType Opened');
  CloneDataset(tAssetType, tAssetTypeList);
  tAssetTypeList.Open;
  dsAssetType.Enabled := True;
  tAssetType.First;
end;

procedure Tdm.tAssetTypeListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tAssetTypeList Opened');
  dsAssetTypeList.Enabled := True;
  tAssetTypeList.First;
end;

procedure Tdm.tBuildingAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tBuilding Opened');
  CloneDataset(tBuilding, tBuildingList);
  tBuildingList.Open;
  dsBuilding.Enabled := True;
  tBuilding.First;
end;

procedure Tdm.tBuildingListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tBuildingList Opened');
  dsBuildingList.Enabled := True;
  tBuildingList.First;
end;

procedure Tdm.tDocumentsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tDocuments Opened');
  // ALE 20201201 not implemented CloneDataset(tDocuments, tDocumentsList);
  // ALE 20201201 not implemented tDocumentsList.Open;
  dsDocuments.Enabled := True;
  tDocuments.First;
end;

procedure Tdm.tPersonAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tPerson Opened');
  CloneDataset(tPerson, tPersonList);
  tPersonList.Open;
  dsPerson.Enabled := True;
  tPerson.First;
end;

procedure Tdm.tPersonListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tPersonList Opened');
  dsPersonList.Enabled := True;
  tPersonList.First;
end;

procedure Tdm.tRoomAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tRoom Opened');
  CloneDataset(tRoom, tRoomList);
  tRoomList.Open;
  dsRoom.Enabled := True;
  tRoom.First;
end;

procedure Tdm.tRoomListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tRoomList Opened');
  dsRoomList.Enabled := True;
  tRoomList.First;
end;

procedure Tdm.tRoomNAAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tRoomNA Opened');
  dsRoomNA.Enabled := True;
  tRoomNA.First;
end;

procedure Tdm.tTagsAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tTags Opened');
  CloneDataset(tTags, tTagsList);
  tTagsList.Open;
  dsTags.Enabled := True;
  tTags.First;
end;

procedure Tdm.CloneDataset(pDataIn, pDataOut: TXDataWebDataSet);
var
  Rows: TJSArray;
begin
  Rows := TJSArray.new;
  pDataIn.First;
  while not pDataIn.Eof do
  begin
    Rows.push(pDataIn.CurrentData);
    pDataIn.Next;
  end;
  pDataOut.SetJsonData(Rows);
end;

procedure Tdm.DataSetAfterPost(DataSet: TDataSet);
begin
  frmEAT.LogIt(DataSet.Name + ' AfterPost, Flushing Tables');
  FlushTables(DataSet.Name);
end;

procedure Tdm.DataSetBeforeInsertEdit(DataSet: TDataSet);
begin
  frmEAT.LogIt(DataSet.Name + ' BeforeInsertEdit');
  DataSet.EnableControls;
end;

procedure Tdm.tTagsdeactivatedChange(Sender: TField);
begin
  ShowMessage('OnChange');
end;

procedure Tdm.tTagsListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tTagsList Opened');
  dsTagsList.Enabled := True;
  tTagsList.First;
end;

procedure Tdm.tVendorAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tVendor Opened');
  CloneDataset(tVendor, tVendorList);
  tVendorList.Open;
  dsVendor.Enabled := True;
  tVendor.First;
end;

procedure Tdm.tVendorListAfterOpen(DataSet: TDataSet);
begin
  frmEAT.LogIt('tVendorList Opened');
  dsVendorList.Enabled := True;
  tVendorList.First;
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
