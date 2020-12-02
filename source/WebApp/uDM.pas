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
  frmEAT.LogIt(DataSet.Name + ' AfterPost, Flushing Tables');
  FlushTables();
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
