unit uEduAssetTracker;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.QRCode,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCPDFLib, Vcl.StdCtrls, WEBLib.StdCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCGraphicsTypes, WEBLib.REST, WEBLib.ExtCtrls,
  XData.Web.Connection, XData.Web.Client, WEBLib.JSON, WEBLib.DBCtrls, Data.DB,
  WEBLib.DB, XData.Web.JsonDataset, XData.Web.Dataset, XData.Model.Classes,
  Vcl.Grids, Vcl.Menus, WEBLib.Menus, WEBLib.ComCtrls, WEBLib.Devices,
  WEBLib.WebCtrls, WEBLib.SignIn, WEBLib.IndexedDb, DateUtils, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCCustomControl, VCL.TMSFNCHTMLText,
  VCL.TMSFNCEdit, WEBLib.FlexControls, WEBLib.Toast,
  WinAPI.Windows, uDM, uTEATCommon, uTEATAudit, Vcl.Mask, WEBLib.Mask,
  WEBLib.Grids, VCL.TMSFNCTableView;

type
  TURIType = (Invalid, Full, Shortener);
  TfrmEAT = class(TWebForm)
    pc: TWebPageControl;
    tsDev: TWebTabSheet;
    tsScanAsset: TWebTabSheet;
    tsSignIn: TWebTabSheet;
    WebLabel3: TWebLabel;
    btnQRCodeSheet_1Big2Small_FullURI: TWebButton;
    btnQRCodeSheet: TWebButton;
    btnQRCodeGoogle: TWebButton;
    QRCodeGoogleAPIs: TWebHttpRequest;
    WebDBGrid1: TWebDBGrid;
    pnlAssetType: TWebPanel;
    WebLabel2: TWebLabel;
    WebLabel4: TWebLabel;
    WebLabel5: TWebLabel;
    WebDBEdit2: TWebDBEdit;
    WebDBEdit1: TWebDBEdit;
    WebDBEdit3: TWebDBEdit;
    WebButton2: TWebButton;
    imgQRCode: TWebImageControl;
    QRCode: TWebQRCode;
    pnlCam: TWebPanel;
    pnlScanMemo: TWebPanel;
    qrDecode: TWebQRDecoder;
    memScanAsset: TWebMemo;
    pnlScanHeader: TWebPanel;
    cam: TWebCamera;
    WebSignIn1: TWebSignIn;
    memSignIn: TWebMemo;
    imgWebProfile: TWebImageControl;
    btnSignOut: TWebButton;
    tsLog: TWebTabSheet;
    memLog: TWebMemo;
    tsWelcome: TWebTabSheet;
    btnWelcomeContinue: TWebButton;
    btnWelcomeResetFirstAccess: TWebButton;
    lblWelcomeMessage: TTMSFNCHTMLText;
    lblFirstAccess: TWebLabel;
    pnlAssetTagText: TWebPanel;
    edtAssetTagText: TTMSFNCEditButton;
    lblAssetTagText: TWebLabel;
    tmrQRDetectPause: TWebTimer;
    btnQRCodeSheet_2Big_FullURI: TWebButton;
    btnQRCodeSheet_1BigFullURI_1BigUUID: TWebButton;
    btnQRCodeSheet_1BigTGPURI_1BigUUID: TWebButton;
    btnTagTest: TWebButton;
    edtAssetTagTextTest: TTMSFNCEditButton;
    btnTagAdd: TWebButton;
    edtTagText: TWebDBEdit;
    edtTagId: TWebDBEdit;
    WebLabel1: TWebLabel;
    WebLabel6: TWebLabel;
    btnFlushAudit: TWebButton;
    tsAssetInfo: TWebTabSheet;
    pnlAITagText: TWebPanel;
    pnlAIAssetInfo: TWebPanel;
    scAI: TWebScrollBox;
    pnlAIAsset: TWebPanel;
    pnlAIAssetHeader: TWebPanel;
    pnlAIAssetType: TWebPanel;
    pnlAIAssetTypeHeader: TWebPanel;
    pnlAIPerson: TWebPanel;
    WebPanel4: TWebPanel;
    pnlAIRoom: TWebPanel;
    WebPanel6: TWebPanel;
    pnlAIBuilding: TWebPanel;
    WebPanel8: TWebPanel;
    WebLabel7: TWebLabel;
    WebLabel8: TWebLabel;
    WebLabel9: TWebLabel;
    WebLabel10: TWebLabel;
    WebLabel11: TWebLabel;
    pnlAIVendor: TWebPanel;
    WebPanel10: TWebPanel;
    WebLabel12: TWebLabel;
    pnlAIDocument: TWebPanel;
    WebPanel12: TWebPanel;
    WebLabel13: TWebLabel;
    pnlAITag: TWebPanel;
    WebPanel3: TWebPanel;
    WebLabel14: TWebLabel;
    pnlAIAssetId: TWebPanel;
    edtAIAssetId: TWebDBEdit;
    WebLabel15: TWebLabel;
    pnlAIAssetsDBNav: TWebPanel;
    dbnAsset: TWebDBNavigator;
    WebLabel16: TWebLabel;
    edtAITagId: TWebDBLookupComboBox;
    WebLabel17: TWebLabel;
    edtAIVendorId: TWebDBLookupComboBox;
    edtRoomId: TWebDBLookupComboBox;
    WebLabel18: TWebLabel;
    pnlAITagDBNav: TWebPanel;
    dbnTag: TWebDBNavigator;
    WebPanel1: TWebPanel;
    WebLabel19: TWebLabel;
    edtAITagTagId: TWebDBEdit;
    pnlAITagDetail: TWebPanel;
    WebLabel20: TWebLabel;
    edtAITagText: TWebDBEdit;
    WebLabel21: TWebLabel;
    WebDBEdit4: TWebDBEdit;
    btnAITagsFlush: TWebButton;
    pnlAIAssetTypeDBNav: TWebPanel;
    dbnAssetType: TWebDBNavigator;
    pnlAIPersonDBNav: TWebPanel;
    dbnPerson: TWebDBNavigator;
    pnlAIRoomDBNav: TWebPanel;
    dbnRoom: TWebDBNavigator;
    pnlAIVendorDBNav: TWebPanel;
    dbnVendor: TWebDBNavigator;
    pnlAIDocumentDBNav: TWebPanel;
    dbnDocument: TWebDBNavigator;
    pnlAIBuildingDBNav: TWebPanel;
    dbnBuilding: TWebDBNavigator;
    WebLabel22: TWebLabel;
    WebDBLookupComboBox1: TWebDBLookupComboBox;
    pnlAIAssetTypeId: TWebPanel;
    WebLabel23: TWebLabel;
    edtAIAssetTypeId: TWebDBEdit;
    pnlAIPersonId: TWebPanel;
    WebLabel24: TWebLabel;
    edtAIPersonId: TWebDBEdit;
    pnlAIRoomId: TWebPanel;
    WebLabel25: TWebLabel;
    edtAIRoomId: TWebDBEdit;
    pnlAIBuildingId: TWebPanel;
    WebLabel26: TWebLabel;
    edtAIBuildingId: TWebDBEdit;
    pnlAIVendorId: TWebPanel;
    WebLabel27: TWebLabel;
    edtAIVendorVendorId: TWebDBEdit;
    pnlAIDocumentsId: TWebPanel;
    WebLabel28: TWebLabel;
    edtAIDocumentsId: TWebDBEdit;
    pnlAIAssetTypesDetail: TWebPanel;
    WebLabel29: TWebLabel;
    WebLabel30: TWebLabel;
    edtAIAssetTypeName: TWebDBEdit;
    edtAIAssetTypeDeactivatedDate: TWebDBEdit;
    WebLabel31: TWebLabel;
    edtAIAssetTypesDescription: TWebDBMemo;
    pnlAIPersonDetail: TWebPanel;
    WebLabel32: TWebLabel;
    WebLabel33: TWebLabel;
    edtAIPersonName: TWebDBEdit;
    edtAIPersonDateDeactivated: TWebDBEdit;
    WebLabel34: TWebLabel;
    edtAIPersonEmail: TWebDBEdit;
    pnlAIAssetDetail: TWebPanel;
    WebLabel35: TWebLabel;
    WebLabel36: TWebLabel;
    WebLabel37: TWebLabel;
    WebLabel38: TWebLabel;
    WebLabel39: TWebLabel;
    WebLabel40: TWebLabel;
    WebLabel41: TWebLabel;
    WebLabel42: TWebLabel;
    edtAIAssetMake: TWebDBEdit;
    edtAIAssetModel: TWebDBEdit;
    edtAIAssetSN: TWebDBEdit;
    edtAIAssetDateDeactivated: TWebDBEdit;
    edtAIAssetPurchaseDate: TWebDBEdit;
    edtAIAssetPurchaseInvoice: TWebDBEdit;
    edtAIAssetPurchasePrice: TWebDBEdit;
    edtAIAssetWarrantyDurationDays: TWebDBEdit;
    WebLabel43: TWebLabel;
    edtAIAssetPurchaseNotes: TWebDBMemo;
    WebLabel44: TWebLabel;
    edtAIAssetNotes: TWebDBMemo;
    pnlAIRoomDetail: TWebPanel;
    WebLabel45: TWebLabel;
    WebLabel46: TWebLabel;
    edtAIRoomNameplate: TWebDBEdit;
    edtAIRoomDeactivatedDate: TWebDBEdit;
    WebLabel47: TWebLabel;
    WebLabel48: TWebLabel;
    edtAIRoomBuilding: TWebDBLookupComboBox;
    edtAIRoomPerson: TWebDBLookupComboBox;
    WebLabel49: TWebLabel;
    edtAIRoomGrade: TWebDBEdit;
    pnlAIBuildingDetail: TWebPanel;
    WebLabel50: TWebLabel;
    WebLabel51: TWebLabel;
    edtAIBuildingName: TWebDBEdit;
    edtAIBuildingDeactivatedDate: TWebDBEdit;
    edtAIBuildingPhone: TWebDBEdit;
    WebLabel52: TWebLabel;
    WebLabel53: TWebLabel;
    edtAIBuildingAddress: TWebDBMemo;
    pnlAIVendorDetail: TWebPanel;
    WebLabel54: TWebLabel;
    WebLabel55: TWebLabel;
    WebLabel56: TWebLabel;
    edtAIVendorName: TWebDBEdit;
    edtAIVendorDeactivatedDate: TWebDBEdit;
    edtAIVendorWebsite: TWebDBEdit;
    WebLabel57: TWebLabel;
    edtAIVendorPhone: TWebDBEdit;
    WebLabel58: TWebLabel;
    edtAIVendorEmail: TWebDBEdit;
    WebLabel59: TWebLabel;
    edtAIVendorNotes: TWebDBMemo;
    btnQRCodeSheet_1BigTGPURI_1BigUUID_GSalePup: TWebButton;
    tvScan: TTMSFNCTableView;
    WebButton1: TWebButton;
    procedure btnQRCodeGoogleClick(Sender: TObject);
    procedure QRCodeGoogleAPIsResponse(Sender: TObject; AResponse: string);
    procedure WebFormShow(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure btnQRCodeSheetClick(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);
    procedure qrDecodeDecoded(Sender: TObject; ADecoded: string);
    procedure tsScanAssetShow(Sender: TObject);
    procedure tsScanAssetHide(Sender: TObject);
    procedure WebSignIn1GoogleSignedIn(Sender: TObject;
      Args: TGoogleSignedInEventArgs);
    procedure WebSignIn1GoogleSignedOut(Sender: TObject);
    procedure btnSignOutClick(Sender: TObject);
    procedure btnWelcomeContinueClick(Sender: TObject);
    procedure btnWelcomeResetFirstAccessClick(Sender: TObject);
    procedure camCameraStop(Sender: TObject; ACamera: TCameraDevice);
    procedure camCameraPause(Sender: TObject; ACamera: TCameraDevice);
    procedure camCameraResume(Sender: TObject; ACamera: TCameraDevice);
    procedure camCameraStreamPlay(Sender: TObject; ACamera: TCameraDevice);
    procedure edtAssetTagTextButtonClick(Sender: TObject);
    procedure tmrQRDetectPauseTimer(Sender: TObject);
    procedure btnQRCodeSheet_1Big2Small_FullURIClick(Sender: TObject);
    procedure btnQRCodeSheet_2Big_FullURIClick(Sender: TObject);
    procedure btnQRCodeSheet_1BigFullURI_1BigUUIDClick(Sender: TObject);
    procedure btnQRCodeSheet_1BigTGPURI_1BigUUIDClick(Sender: TObject);
    procedure btnTagTestClick(Sender: TObject);
    procedure WebFormDestroy(Sender: TObject);
    procedure edtAssetTagTextTestButtonClick(Sender: TObject);
    procedure btnTagAddClick(Sender: TObject);
    procedure WebFormUnload(Sender: TObject);
    procedure btnFlushAuditClick(Sender: TObject);
    procedure WebFormResize(Sender: TObject);
    procedure btnAITagsFlushClick(Sender: TObject);
    procedure btnQRCodeSheet_1BigTGPURI_1BigUUID_GSalePupClick(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
  private
    { Private declarations }
    fWebRequest: TWebHTTPRequest;
    fPDFFile: TBytes;
    fCamStopped: Boolean;
    fCamPaused: Boolean;
    fCamQRReader: Boolean;
    fUtil: TEATUtil;
    fAudit: TEATAudit;
    procedure DrawAssetTag(APDF: TTMSFNCPDFLib; ALeft, ATop, ARight, ABottom: Integer; AQR: TBitmap);
    function GetAssetTagTextURLFragment(): String;
    procedure StartCamera();
    procedure ResumeCamera();
    procedure PauseCamera();
    function IsUUID(const pUUID: String): Boolean;
    function IsAssetURI(const pURI: String): TURIType;
    function GetAssetTagTextFromURI(const pURI: String): String;
    function GetQRCodeSheetPDF(const pLayout: String): Boolean;
    procedure TagTextChangeHandler(const pOldText, pNewText: String);
    procedure TagIdChangeHandler(const pOldId, pNewId: String);
    procedure TagLogItEventHandler(const pLogText: String);
    procedure ArrangeAIPanels();
    procedure ScanItemFillTableView(const pClear: Boolean = False);
  public
    { Public declarations }
    procedure LogIt(pLogText: String);
    procedure GoCamera();
  end;

const
  BASE_URL = 'https://EduAssetTracker.ynotwidgets.com';
  //BASE_URL2 = ' https://s.tgp.net/EAT/32a88eec-61d6-40a4-8e08-79f1c7b5104b';
  WEBAPP_URL = BASE_URL + '/EduAssetTracker.html';
  SHORTENER_URL = 'https://s.tgp.net/EAT/';
  API_URL = BASE_URL + '/api/';

var
  frmEAT: TfrmEAT;

implementation

{$R *.dfm}

uses uDM, uTEATTag;

procedure TfrmEAT.ArrangeAIPanels;
const
  P_ASSET = 0;
  P_ASSETT = 1;
  P_PER = 2;
  P_ROOM = 3;
  P_BLDG = 4;
  P_VEND = 5;
  P_DOC = 6;
  P_TAG = 7;
  MRG = 4;
var
  lCols: NativeInt;
  lRows: NativeInt;
  lTop, lLeft: NativeInt;
  lPH: array[P_ASSET..P_TAG] of NativeInt; // ALE 20201128 heights of panels
  lPW: array[P_ASSET..P_TAG] of NativeInt; // ALE 20201128 widths of panels
begin
  // ALE 20201127 Crazy responsive layout code here
  //  the individual panels on the Asset Info tab can be 377 pixels
  //  to work with the Google Pixel 4a
  // With margins, the main form can be 401 pixels to host that 377 pixel
  //  wide panel.  385 pixels is width of scAI at one column
  // Order when stacked vertical one column
  //  0 - Assets
  //  1 - Asset Types
  //  2 - People
  //  3 - Rooms
  //  4 - Buildings
  //  5 - Vendors
  //  6 - Docments
  //  7 - Tags if needed
  // When stacked vertical two column
  //  0 - Assets,    1 - Asset Types
  //                 2 - People
  //  3 - Rooms,     4 - Buildings
  //  5 - Vendors,   6 - Documents
  //  7 - Tags
  // When stacked vertical three column
  //  0 - Assets,    1 - Asset Types, 2 - People
  //                 3 - Rooms,       4 - Buildings
  //  5 - Vendors,   6 - Documents,   7 - Tags
  // When stacked vertical four column
  //  0 - Assets,    1 - Asset Types, 2 - People,    3 - Rooms
  //                 4 - Buildings,   5 - Vendors,   6 - Documents,
  //  7 - Tags
  lPH[P_ASSET] := pnlAIAsset.Height + MRG;
  lPH[P_ASSETT] := pnlAIAssetType.Height + MRG;
  lPH[P_PER] := pnlAIPerson.Height + MRG;
  lPH[P_ROOM] := pnlAIRoom.Height + MRG;
  lPH[P_BLDG] := pnlAIBuilding.Height + MRG;
  lPH[P_VEND] := pnlAIVendor.Height + MRG;
  lPH[P_DOC] := pnlAIDocument.Height + MRG;
  lPH[P_TAG] := pnlAITag.Height + MRG;
  lPW[P_ASSET] := pnlAIAsset.Width + MRG;
  lPW[P_ASSETT] := pnlAIAssetType.Width + MRG;
  lPW[P_PER] := pnlAIPerson.Width + MRG;
  lPW[P_ROOM] := pnlAIRoom.Width + MRG;
  lPW[P_BLDG] := pnlAIBuilding.Width + MRG;
  lPW[P_VEND] := pnlAIVendor.Width + MRG;
  lPW[P_DOC] := pnlAIDocument.Width + MRG;
  lPw[P_TAG] := pnlAITag.Width + MRG;

  //scAI.Width;
  //scAI.Height;
  lCols := (frmEAT.Width - 30) div  (pnlAIAsset.Width + MRG);
  LogIt('ArrangeAIPanels Max Columns: ' + IntToStr(lCols));
  if lCols < 1 then
    lCols := 1
  else if lCols > 4 then
    lCols := 4;

  lTop := MRG;
  lLeft := MRG;

  if lCols = 1 then
  begin
    pnlAIAsset.Left := lLeft;
    pnlAIAsset.Top := lTop;
    pnlAIAssetType.Left := lLeft;
    pnlAIAssetType.Top := lTop + lPH[P_ASSET];
    pnlAIPerson.Left := lLeft;
    pnlAIPerson.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT];
    pnlAIRoom.Left := lLeft;
    pnlAIRoom.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT] + lPH[P_PER];
    pnlAIBuilding.Left := lLeft;
    pnlAIBuilding.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT] + lPH[P_PER] + lPH[P_ROOM];
    pnlAIVendor.Left := lLeft;
    pnlAIVendor.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT] + lPH[P_PER] + lPH[P_ROOM] + lPH[P_ROOM];
    pnlAIDocument.Left := lLeft;
    pnlAIDocument.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT] + lPH[P_PER] + lPH[P_ROOM] + lPH[P_ROOM] + lPH[P_VEND];
    pnlAITag.Left := lLeft;
    pnlAITag.Top := lTop + lPH[P_ASSET] + lPH[P_ASSETT] + lPH[P_PER] + lPH[P_ROOM] + lPH[P_ROOM] + lPH[P_VEND] + lPH[P_DOC];
  end
  else if lCols = 2 then
  begin
    // ALE 20201128 Row 0, Col 0
    pnlAIAsset.Left := lLeft;
    pnlAIAsset.Top := lTop;
    // ALE 20201128 Row 0, Col 1
    pnlAIAssetType.Left := lLeft + lPW[P_ASSET];
    pnlAIAssetType.Top := lTop;
    // ALE 20201128 Row 1, Col 1
    pnlAIPerson.Left := lLeft + lPW[P_ASSET];
    pnlAIPerson.Top := lTop + lPH[P_ASSETT];
    // ALE 20201128 Row 2
    pnlAIRoom.Left := lLeft;
    pnlAIRoom.Top := lTop + lPH[P_ASSET];
    pnlAIBuilding.Left := lLeft + lPW[P_ASSET];
    pnlAIBuilding.Top := lTop + lPH[P_ASSETT] + lPH[P_PER];
    // ALE 20201128 Row 3
    pnlAIVendor.Left := lLeft;
    pnlAIVendor.Top := lTop + lPH[P_ASSET] + lPH[P_PER];
    pnlAIDocument.Left := lLeft + lPW[P_ASSET];
    pnlAIDocument.Top := lTop + lPH[P_ASSETT] + lPH[P_PER] + lPH[P_BLDG];
    // ALE 20201128 Row 4
    pnlAITag.Left := lLeft;
    pnlAITag.Top := lTop + lPH[P_ASSET] + lPH[P_PER] + lPH[P_VEND];
  end
  else if lCols = 3 then
  begin
    // ALE 20201128 Row 0, Col 0
    pnlAIAsset.Left := lLeft;
    pnlAIAsset.Top := lTop;
    // ALE 20201128 Row 0, Col 1
    pnlAIAssetType.Left := lLeft + lPW[P_ASSET];
    pnlAIAssetType.Top := lTop;
    // ALE 20201128 Row 0, Col 2
    pnlAIPerson.Left := lLeft + lPW[P_ASSET] + lPW[P_ASSETT];
    pnlAIPerson.Top := lTop;
    // ALE 20201128 Row 1, Col 1
    pnlAIRoom.Left := lLeft + lPW[P_ASSET];
    pnlAIRoom.Top := lTop + lPH[P_ASSETT];
    // ALE 20201128 Row 1, Col 2
    pnlAIBuilding.Left := lLeft + lPW[P_ASSET] + lPW[P_ROOM];
    pnlAIBuilding.Top := lTop + lPH[P_ASSETT];
    // ALE 20201128 Row 2
    pnlAIVendor.Left := lLeft;
    pnlAIVendor.Top := lTop + lPH[P_ASSET];
    pnlAIDocument.Left := lLeft + lPW[P_VEND];
    pnlAIDocument.Top := lTop + lPH[P_ASSETT] + lPH[P_ROOM];
    pnlAITag.Left := lLeft + lPW[P_VEND] + lPW[P_DOC];
    pnlAITag.Top :=  lTop + lPH[P_ASSETT] + lPH[P_ROOM];
  end
  else if lCols = 4 then
  begin
    // ALE 20201128 Row 0, Col 0
    pnlAIAsset.Left := lLeft;
    pnlAIAsset.Top := lTop;
    // ALE 20201128 Row 0, Col 1
    pnlAIAssetType.Left := lLeft + lPW[P_ASSET];
    pnlAIAssetType.Top := lTop;
    // ALE 20201128 Row 0, Col 2
    pnlAIPerson.Left := lLeft + lPW[P_ASSET] + lPW[P_ASSETT];
    pnlAIPerson.Top := lTop;
    // ALE 20201128 Row 0, Col 3
    pnlAIRoom.Left := lLeft + lPW[P_ASSET] + lPW[P_ASSETT] + lPW[P_PER];
    pnlAIRoom.Top := lTop;
    // ALE 20201128 Row 1, Col 1
    pnlAIBuilding.Left := lLeft + lPW[P_ASSET];
    pnlAIBuilding.Top := lTop + lPH[P_ROOM];
    // ALE 20201128 Row 1, Col 2
    pnlAIVendor.Left := lLeft + lPW[P_ROOM] + lPW[P_BLDG];
    pnlAIVendor.Top := lTop + lPH[P_PER];
    // ALE 20201128 Row 1, Col 3
    pnlAIDocument.Left := lLeft + lPW[P_ROOM] + lPW[P_BLDG] + lPW[P_VEND];
    pnlAIDocument.Top := lTop + lPH[P_ROOM];
    // ALE 20201128 Row 2
    pnlAITag.Left := lLeft;
    pnlAITag.Top :=  lTop + lPH[P_ASSET];
  end;
end;

procedure TfrmEAT.btnAITagsFlushClick(Sender: TObject);
begin
  dm.tTags.ApplyUpdates;
end;

procedure TfrmEAT.btnFlushAuditClick(Sender: TObject);
begin
  fAudit.FlushToServer;
end;

procedure TfrmEAT.btnQRCodeGoogleClick(Sender: TObject);
var
  I: Integer;
  lBMPs: array[0..9] of TBitmap;
  lBMPStm: TMemoryStream;
begin
//  QRCodeGoogleAPIs.URL := 'https://chart.googleapis.com/chart?cht=qr&chs=50x50&chl=https%3A%2F%2Ftgp.net%2FXYZCde%2Fabc%2F123e4567-e89b-12d3-a456-426614174000';
//  QRCodeGoogleAPIs.Execute();
  lBMPStm := TMemoryStream.Create;
  for I := 0 to 9 do
  begin
    imgQRCode.URL := 'https://chart.googleapis.com/chart?cht=qr&chs=50x50&chl=https%3A%2F%2Ftgp.net%2FXYZCde%2Fabc%2F123e4567-e89b-12d3-a456-426614174000' + IntToStr(Random(1000000000));
    lBMPs[I] := TBitmap.Create(nil);
    //imgQRCode.Picture.SaveToStream(lBMPStm);
    //lBMPs[I].LoadFromStream(lBMPStm);
  end;
  lBMPStm.Free;

  // TODO ALE 20201104 allows us to pick off an asset id or somesuch
  //  https://ynotwidgets.com/EduAssetTracker/EduAssetTracker.html?AssetId=3B5EBCFD-7043-4C3A-86EE-B489516EC393
  //  3b5ebcfd-7043-4c3a-86ee-b489516ec393
  ShowMessage(document.documentURI);
end;

procedure TfrmEAT.btnQRCodeSheetClick(Sender: TObject);
begin
  fWebRequest := TWebHTTPRequest.Create(nil);
  fWebRequest.URL := API_URL + 'TGPQRCodeSheetService/GetQRCodePDF';
  fWebRequest.Command := httpPOST;
  fWebRequest.Headers.AddPair('Content-Type', 'application/json');
  fWebRequest.PostData := '{"lPages": 1}';
  //lWebRequest.Execute();
  fWebRequest.Execute(
    procedure(AResponse: String; AReq: TJSXMLHttpRequest)
      var
        lBytes: TBytes;
        lResponseLen: Integer;
        js: TJSON;
        ja: TJSONArray;
        jo: TJSONObject;
        i: integer;
      begin
        lResponseLen := Length(AResponse);
        console.log('btnQRCodeSheetClick response char length: ' + IntToStr(lResponseLen));
        //console.log('Response Byte Length: ' + IntToStr(ByteLength(AResponse)));
        //ShowMessage(IntToStr(lResponseLen));
        for i := 0 to Length(AResponse) - 1 do
        begin
          lBytes[i] := Ord(AResponse[i+1]);
        end;
        //lBytes := TEncoding.UTF8.GetBytes(AResponse);
        Application.DownloadPDFFile(lBytes, 'EduAssetTrackerQRCodeSheet.pdf', True);
        Application.DownloadBinaryFile(lBytes, 'EduAssetTrackerQRCodeSheetB.pdf', False);
        //ShowMessage(AResponse);
        {
        js := TJSON.Create;

        try
          ja := TJSONArray(js.Parse(AResponse));

          ShowMessage('Retrieved items:' +inttostr(ja.Count));

          for i := 0 to ja.Count - 1 do
          begin
            jo := TJSONObject(ja.Items[i]);
            //WebListBox1.Items.Add(jo.GetJSONValue('title'));
          end;
        finally
          js.Free;
        end;
        }
        fWebRequest.Free;
      end
  );
  //lWebRequest.
  //lWebRequest.Free;

  //Application.Navigate(API_URL + ; ATarget: TNavigationTarget);
end;

procedure TfrmEAT.btnQRCodeSheet_1Big2Small_FullURIClick(Sender: TObject);
begin
  GetQRCodeSheetPDF('1Big2Small_FullURI');
end;

procedure TfrmEAT.btnQRCodeSheet_1BigFullURI_1BigUUIDClick(Sender: TObject);
begin
GetQRCodeSheetPDF('1BigFullURI_1BigUUID');
end;

procedure TfrmEAT.btnQRCodeSheet_1BigTGPURI_1BigUUIDClick(Sender: TObject);
begin
  GetQRCodeSheetPDF('1BigTGPURI_1BigUUID');
end;

procedure TfrmEAT.btnQRCodeSheet_1BigTGPURI_1BigUUID_GSalePupClick(
  Sender: TObject);
begin
  GetQRCodeSheetPDF('1BigTGPURI_1BigUUID_GSalePups');
end;

procedure TfrmEAT.btnQRCodeSheet_2Big_FullURIClick(Sender: TObject);
begin
  GetQRCodeSheetPDF('2Big_FullURI');
end;

procedure TfrmEAT.btnSignOutClick(Sender: TObject);
begin
  WebSignIn1.SignOut(stGoogle);
end;

procedure TfrmEAT.btnTagAddClick(Sender: TObject);
begin
  dm.TagHelper.AddRecord();
  btnTagAdd.Enabled := False;

  // ALE 20201228 also refresh the form's tag tables
  dm.tTags.Close;
  dm.tTags.Load;
end;

procedure TfrmEAT.btnTagTestClick(Sender: TObject);
begin
  dm.TagHelper.OnTagTextChange := TagTextChangeHandler;
  dm.TagHelper.TagText := 'Fred';
end;

procedure TfrmEAT.TagIdChangeHandler(const pOldId, pNewId: String);
begin
  LogIt('TagId Change Old Id: ' + pOldId + ' New Id: ' + pNewId);
  if (pNewId = '') AND (dm.TagHelper.TagText <> '') then
  begin
    btnTagAdd.Enabled := True;
    ScanItemFillTableView(True);
  end
  else
  begin
    pnlAITagText.Caption := 'Tag Text: ' + dm.TagHelper.TagText;
    PauseCamera;
    if dm.tAssetSA.Active then
    begin
      dm.tAssetSA.Locate('tagId.id', dm.TagHelper.TagId, []);
      ScanItemFillTableView();
    end;
    // ALE 20201218 assume read-only pc.ActivePage := tsAssetInfo;
  end;
end;

procedure TfrmEAT.TagLogItEventHandler(const pLogText: String);
begin
  LogIt(pLogText);
end;

procedure TfrmEAT.TagTextChangeHandler(const pOldText, pNewText: String);
begin
  LogIt('TagText Change Old Text: ' + pOldText + ' New Text: ' + pNewText);
end;

procedure TfrmEAT.btnWelcomeContinueClick(Sender: TObject);
begin
    LogIt('Welcome Continue button clicked');
    GoCamera();
    pc.ActivePageIndex := 1;
end;

procedure TfrmEAT.DrawAssetTag(APDF: TTMSFNCPDFLib; ALeft, ATop, ARight, ABottom: Integer; AQR: TBitmap);
begin
  APDF.Graphics.DrawRectangle(RectF(ALeft, ATop, ARight, ABottom));
  APDF.Graphics.Font.SizeNoScale := 14;
  //APDF.Graphics.DrawText(edtName.Text, PointF(ALeft + 25, ATop + 20));
  APDF.Graphics.DrawLine(PointF(ALeft + 15, ATop + 45), PointF(ARight - 15, ATop + 45));
  APDF.Graphics.Font.SizeNoScale := 12;
  //APDF.Graphics.DrawText(edtCompany.Text, PointF(ALeft + 25, ABottom - 90));
  APDF.Graphics.Font.SizeNoScale := 10;
  //APDF.Graphics.DrawText(edtAddress.Text, PointF(ALeft + 25, ABottom - 70));
  //APDF.Graphics.DrawText(edtAddressSc.Text, PointF(ALeft + 25, ABottom - 60));
  APDF.Graphics.DrawText(QRCode.Text, PointF(ALeft + 25, ABottom - 45));
  if AQR <> nil then
    APDF.Graphics.DrawImage(AQR, RectF(ARight - 95, ABottom - 90, ARight - 95 + AQR.Width, ABottom - 90 + AQR.Height));
end;

procedure TfrmEAT.edtAssetTagTextButtonClick(Sender: TObject);
begin
  if IsUUID(edtAssetTagText.Text) then
  begin
    dm.TagHelper.TagText := edtAssetTagText.Text;
  end;
end;

procedure TfrmEAT.edtAssetTagTextTestButtonClick(Sender: TObject);
begin
  // ALE 20201104 the below works
  if IsUUID(edtAssetTagTextTest.Text) then
    edtAssetTagTextTest.Text := 'Valid ' + edtAssetTagTextTest.Text
  else
    edtAssetTagTextTest.Text := 'Invalid';
  // RegEx for UUID https://stackoverlow.com/questions/136505
end;

function TfrmEAT.GetAssetTagTextURLFragment: String;
begin
  Result := '?AssetId=' + fUtil.GetUUIDStr;
end;

function TfrmEAT.GetQRCodeSheetPDF(const pLayout: String): Boolean;
begin
  Result := False;
  fWebRequest := TWebHTTPRequest.Create(nil);
  fWebRequest.URL := API_URL + 'TGPQRCodeSheetJSONService/GetQRCodePDF';
  fWebRequest.Command := httpPOST;
  fWebRequest.Headers.AddPair('Content-Type', 'application/json');
  fWebRequest.PostData := '{"lPages": 1, "lLayout": "' + pLayout + '"}';
  //lWebRequest.Execute();
  fWebRequest.Execute(
    procedure(AResponse: String; AReq: TJSXMLHttpRequest)
      var
        lBytes: TBytes;
        lBytesJS: TJSUint8Array;
        lByteString: String;
        lResponseLen: Integer;
        js: TJSON;
        ja: TJSONArray;
        jo: TJSONObject;
        i: integer;
        lPDFBase64: String;
      begin
        js := TJSON.Create;

        try
          jo := js.Parse(AResponse);
          lPDFBase64 := jo.GetJSONValue('value');
        finally
          js.Free;
        end;
        lResponseLen := Length(AResponse);
        {$IFNDEF WIN32}
        asm
          // ALE 20201112 finally broke the logjam
          //  https://stackoverflow.com/questions/16245767/creating-a-blob-from-a-base64-string-in-javascript
          lByteString = atob(lPDFBase64);
          for (let i = 0; i < lByteString.length; i++) {
            lBytes[i] = lByteString.charCodeAt(i);
          }
          lBytesJS = new Uint8Array(lBytes);
        end;
        {$ENDIF}
        // ALE 20201112 now convert to JSUIntArray
        //fPDFFile := Copy(lBytes);
        Console.log('Response Char Length: ' + IntToStr(lResponseLen));
        Console.log('Byte array length: ' + IntToStr(lBytesJS.byteLength));
        //Console.log('Response Byte Length: ' + IntToStr(ByteLength(AResponse)));
        //ShowMessage(IntToStr(lResponseLen));
        //lBytes := TEncoding.UTF8.GetBytes(AResponse);
        Application.DownloadPDFFile(lBytesJS, 'EduAssetTrackerQRCodeSheet.pdf', True);
        //Application.DownloadBinaryFile(lBytes, 'EduAssetTrackerQRCodeSheetB.pdf', False);
        //ShowMessage(AResponse);
        Result := True;
        ShowMessage('PDF Created');
        {
        js := TJSON.Create;

        try
          ja := TJSONArray(js.Parse(AResponse));

          ShowMessage('Retrieved items:' +inttostr(ja.Count));

          for i := 0 to ja.Count - 1 do
          begin
            jo := TJSONObject(ja.Items[i]);
            //WebListBox1.Items.Add(jo.GetJSONValue('title'));
          end;
        finally
          js.Free;
        end;
        }
      end
  );
  //lWebRequest.
  //lWebRequest.Free;

  //Application.Navigate(API_URL + ; ATarget: TNavigationTarget);
end;

function TfrmEAT.GetAssetTagTextFromURI(const pURI: String): String;
begin
  Result := '';
  if IsAssetURI(pURI) = TURIType.Full then
  begin
    Result := Copy(pURI, Length('AssetId=') + Pos('AssetId=', pURI), UUID_STR_LEN);
  end
  else if IsAssetURI(pURI) = TURIType.Shortener then
  begin
    Result := Copy(pURI, Length(SHORTENER_URL) + 1, UUID_STR_LEN);
  end;
end;

function TfrmEAT.IsAssetURI(const pURI: String): TURIType;
var
  lUUID: String;
begin
  Result := TURIType.Invalid;

  if Pos('AssetId=', pURI) > 0 then
  begin
    lUUID := Copy(pURI, Length('AssetId=') + Pos('AssetId=', pURI), UUID_STR_LEN);
    if IsUUID(lUUID) then
    begin
      // ALE 20201121 so we have a UUID, check for correct path
      if Pos(LowerCase(WEBAPP_URL), LowerCase(pURI)) = 1 then
      begin
        LogIt('IsAssetURI found AssetId=' + lUUID);
        Result := TURIType.Full;
      end;
    end;
  end
  else if Pos(LowerCase(SHORTENER_URL), LowerCase(pURI)) = 1 then
  begin
    lUUID := Copy(pURI, Length(SHORTENER_URL) + 1, UUID_STR_LEN);
    if IsUUID(lUUID) then
    begin
        LogIt('IsAssetURI found AssetId=' + lUUID);
        Result := TURIType.Shortener;
    end;
  end;
end;

function TfrmEAT.IsUUID(const pUUID: String): Boolean;
begin
  Result := TJSRegExp.New('\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b').test(LowerCase(pUUID));
end;

procedure TfrmEAT.QRCodeGoogleAPIsResponse(Sender: TObject; AResponse: string);
begin
//  imgQRCode.Base64Image := AResponse;
end;

procedure TfrmEAT.ResumeCamera;
begin
  LogIt('Camera resuming');
  fCamStopped := False;
  fCamPaused := False;
  cam.Resume;
end;

procedure TfrmEAT.ScanItemFillTableView(const pClear: Boolean = False);
var
  lTVI: TTMSFNCTableViewItem;
begin
  tvScan.Items.Clear;
  if pClear then
  begin
    tvScan.ItemAppearance.HTMLTemplate := '<table><tr><td><b><#FIELDDESC></b></td><td><#FIELDVALUE></td></tr></td>';
    lTVI := tvScan.Items.Add;
    lTVI.HTMLTemplateItems.Values['FIELDDESC'] := 'Make       ';
    lTVI.HTMLTemplateItems.Values['FIELDVALUE'] := dm.tAssetSA.FieldByName('make').AsString;
    lTVI := tvScan.Items.Add;
    lTVI.HTMLTemplateItems.Values['FIELDDESC'] := 'Model      ';
    lTVI.HTMLTemplateItems.Values['FIELDVALUE'] := dm.tAssetSA.FieldByName('model').AsString;
    lTVI := tvScan.Items.Add;
    lTVI.HTMLTemplateItems.Values['FIELDDESC'] := 'Tag Text   ';
    lTVI.HTMLTemplateItems.Values['FIELDVALUE'] := dm.tAssetSA.FieldByName('tagId.tagText').AsString;
  end;
  LogIt('ScanItemFillTableView TagText='
   + dm.tAssetSA.FieldByName('tagId.tagText').AsString
   + ' TagId=' + dm.tAssetSA.FieldByName('tagId.id').AsString
   + ' Model=' + dm.tAssetSA.FieldByName('model').AsString);
end;

procedure TfrmEAT.StartCamera;
begin
  LogIt('Camera starting');
  fCamStopped := False;
  fCamPaused := False;
  cam.Start;
end;

procedure TfrmEAT.GoCamera;
begin
    if fCamPaused then
    begin
      ResumeCamera();
    end
    else if fCamStopped then
    begin
      StartCamera();
    end;
    tmrQRDetectPause.Enabled := False;
    qrDecode.EnableTimer := True;
end;

procedure TfrmEAT.PauseCamera;
begin
  if NOT fCamStopped then
  begin
    LogIt('Camera pausing');
    cam.Pause;
    fCamStopped := True;
    fCamPaused := True;
  end;
  qrDecode.EnableTimer := False;
end;

procedure TfrmEAT.tmrQRDetectPauseTimer(Sender: TObject);
begin
  tmrQRDetectPause.Enabled := False;
  if pc.ActivePageIndex = 1 then
  begin
    GoCamera();
  end;
end;

procedure TfrmEAT.tsScanAssetHide(Sender: TObject);
begin
  LogIt('Scan Asset tab Hiding');
  PauseCamera();
end;

procedure TfrmEAT.tsScanAssetShow(Sender: TObject);
begin
  LogIt('Scan Asset tab Showing');
  GoCamera();
end;

procedure TfrmEAT.WebButton1Click(Sender: TObject);
begin
  ScanItemFillTableView();
end;

procedure TfrmEAT.WebButton2Click(Sender: TObject);
var
  Container: TXDataEntityContainer;
  I: Integer;
begin
  dm.XDataConn.Connected := True;
  if (dm.XDataConn.Connected) then
  begin
  //tAssetType.Active := True;
  //dsAssetType.Enabled := True;
  {
  Container  := XDataWebConnection1.Model.DefaultEntityContainer;

  for I := 0 to Container.EntitySets.Count - 1 do
  begin
    ShowMessage(Container.EntitySets[I].Name);
  end;
  }
  //  dm.tAssetType.Load;
  //XDataWebClient1.List('tAssetType');
  //dm.tAssetType.First;
  //XDataWebClient1.Get('tAssetType', '{9D07B232-0296-4072-88B9-EF30D62B24CA}');
//  ShowMessage(IntToStr(tAssetType.ServerRecordCount));
  end;
end;


procedure TfrmEAT.btnWelcomeResetFirstAccessClick(Sender: TObject);
begin
  LogIt('Resetting firstAccess');
  if dm.dbEATClient.Locate('name', 'firstAccess', [TLocateOption.loCaseInsensitive]) then
  begin
    LogIt('IndexedDB firstAccess found, deleting');
    lblFirstAccess.Caption := '';
    dm.dbEATClient.Delete;
  end
end;

procedure TfrmEAT.camCameraPause(Sender: TObject; ACamera: TCameraDevice);
begin
  LogIt('Camera paused');
end;

procedure TfrmEAT.camCameraResume(Sender: TObject; ACamera: TCameraDevice);
begin
  LogIt('Camera resumed');
end;

procedure TfrmEAT.camCameraStop(Sender: TObject; ACamera: TCameraDevice);
begin
  LogIt('Camera stopped');
  fCamStopped := True;
end;

procedure TfrmEAT.camCameraStreamPlay(Sender: TObject; ACamera: TCameraDevice);
begin
  LogIt('Camera started');
end;

procedure TfrmEAT.WebFormCreate(Sender: TObject);
var
  lRegEx: TJSRegExp;
  lAssetTagText: String;
begin
  fCamStopped := True;
  fCamPaused := False;

  pc.ActivePageIndex := 0; // ALE 20201121 Welcome page

  fUtil := TEATUtil.Create();
  fAudit := TEATAudit.Create(dm.XDataConn);
  fAudit.OnLogItEvent := TagLogItEventHandler;

  dm.TagHelper := TEATTag.Create(dm.XDataConn);
  dm.TagHelper.Audit := fAudit;
  dm.TagHelper.OnTagTextChange := TagTextChangeHandler;
  dm.TagHelper.OnTagIdChange := TagIdChangeHandler;
  dm.TagHelper.OnLogItEvent := TagLogItEventHandler;
  dm.TagHelper.TextEdit1 := edtAssetTagText;
  dm.TagHelper.TextEdit2 := edtAssetTagTextTest;
  edtTagId.DataSource := dm.TagHelper.dsTags;
  edtTagId.DataField := 'id';
  edtTagText.DataSource := dm.TagHelper.dsTags;
  edtTagText.DataField := 'tagText';

  //edtAssetTagText.Text := document.documentURI;
  // ALE 20201104 for AssetTagText
  lAssetTagText := GetAssetTagTextFromURI(document.documentURI);
  dm.TagHelper.TagText := lAssetTagText;
  LogIt('frmEAT created with AssetId=' + edtAssetTagText.Text);

  WebSignIn1.BeginUpdate;
  // ALE 20201120 OAuth2 API Key
  WebSignIn1.Services.Google.AppKey := '180763458518-8tc5nv8mohsbjm0dkch5lrk2cbn7oggc.apps.googleusercontent.com';
  //WebSignIn1.Services.Facebook.AppKey := '1938271136467571';
  WebSignIn1.EndUpdate;

  dm.dbEATClient.Active := True;
  dm.XDataConn.Connected := True;

end;

procedure TfrmEAT.WebFormDestroy(Sender: TObject);
begin
  // ALE 20201124 gets called when we are loading the SPA dm.TagHelper.Free;
end;

procedure TfrmEAT.WebFormResize(Sender: TObject);
begin
  ArrangeAIPanels();
end;

procedure TfrmEAT.WebFormShow(Sender: TObject);
begin
// Works fine  edtAssetTagText.Text := document.documentURI;
end;

procedure TfrmEAT.WebFormUnload(Sender: TObject);
begin
  fAudit.FlushToServer;
  fAudit.Free;
  fUtil.Free;
end;

procedure TfrmEAT.qrDecodeDecoded(Sender: TObject; ADecoded: string);
var
  lAssetTagText: String;
begin
  LogIt('QR Code decoded: ' + ADecoded);
  memScanAsset.Text := FormatDateTime('hh:nn:ss.zzz ', Now()) + ADecoded;
  tmrQRDetectPause.Enabled := True;
  PauseCamera();
  if IsAssetURI(ADecoded) in [TURIType.Full, TURIType.Shortener] then
  begin
    lAssetTagText := GetAssetTagTextFromURI(ADecoded);
    dm.TagHelper.TagText := lAssetTagText;
  end
  else if IsUUID(ADecoded) then
  begin
    dm.TagHelper.TagText := ADecoded;
  end
  else
  begin
    // ALE 20201122 not a UUID or EduAssetTracker URI
    GoCamera();
  end;
end;

procedure TfrmEAT.WebSignIn1GoogleSignedIn(Sender: TObject;
  Args: TGoogleSignedInEventArgs);
begin
  LogIt('Signed in to Google');
  //ShowMessage('Google Signed In');
  memSignIn.Lines.Clear;
  memSignIn.Lines.Add('Google Sign In');
  memSignIn.Lines.Add('Username: ' + Args.FirstName + ' ' + Args.LastName);
  memSignIn.Lines.Add('Email: ' + Args.Email);

  memSignIn.Lines.Add('ID:' + Args.ID);
  imgWebProfile.URL := Args.ImageUrl;

  btnSignOut.Enabled := True;

end;

procedure TfrmEAT.WebSignIn1GoogleSignedOut(Sender: TObject);
begin
  LogIt('Signed out of Google');
  memSignIn.Lines.Add('Signed out of Google');
  btnSignOut.Enabled := False;
end;

procedure TfrmEAT.LogIt(pLogText: String);
var
  lLogItem: String;
begin
  lLogItem := FormatDateTime('hh:nn:ss.zzz ', Now()) + pLogText;
  memLog.Lines.Insert(0, lLogItem);
  console.log(lLogItem);
end;

end.
