unit uEduAssetTracker;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.QRCode,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCPDFLib, Vcl.StdCtrls, WEBLib.StdCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCGraphicsTypes, WEBLib.REST, WEBLib.ExtCtrls,
  XData.Web.Connection, XData.Web.Client, WEBLib.JSON, WEBLib.DBCtrls, Data.DB,
  WEBLib.DB, XData.Web.JsonDataset, XData.Web.Dataset, XData.Model.Classes,
  Vcl.Grids, Vcl.Menus, WEBLib.Menus, WEBLib.ComCtrls, WEBLib.Devices;

type
  TfrmEAT = class(TWebForm)
    XDataWebClient1: TXDataWebClient;
    XDataWebConnection1: TXDataWebConnection;
    tAssetType: TXDataWebDataSet;
    tAssetTypeid: TStringField;
    tAssetTypename: TStringField;
    tAssetTypedescription: TStringField;
    tAssetTypedeactivatedDate: TDateTimeField;
    dsAssetType: TWebDataSource;
    WebPageControl1: TWebPageControl;
    tsDev: TWebTabSheet;
    tsScanAsset: TWebTabSheet;
    WebPageControl1Sheet3: TWebTabSheet;
    WebLabel3: TWebLabel;
    WebButton1: TWebButton;
    btnQRCodeSheet: TWebButton;
    btnQRCodeGoogle: TWebButton;
    QRCodeGoogleAPIs: TWebHttpRequest;
    edtAssetId: TWebEdit;
    btnRegExTest: TWebButton;
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
    WebPanel2: TWebPanel;
    WebQRDecoder1: TWebQRDecoder;
    WebMemo1: TWebMemo;
    pnlScanHeader: TWebPanel;
    cam: TWebCamera;
    WebButton3: TWebButton;
    procedure btnQRCodeGoogleClick(Sender: TObject);
    procedure QRCodeGoogleAPIsResponse(Sender: TObject; AResponse: string);
    procedure WebFormShow(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure btnRegExTestClick(Sender: TObject);
    procedure btnQRCodeSheetClick(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);
    procedure XDataWebClient1Load(Response: TXDataClientResponse);
    procedure tAssetTypeAfterOpen(DataSet: TDataSet);
    procedure WebQRDecoder1Decoded(Sender: TObject; ADecoded: string);
    procedure tsScanAssetShow(Sender: TObject);
    procedure tsScanAssetHide(Sender: TObject);
    procedure WebButton3Click(Sender: TObject);
  private
    { Private declarations }
    fWebRequest: TWebHTTPRequest;
    fPDFFile: TBytes;
    fCamStopped: Boolean;
    fCamQRReader: Boolean;
    procedure DrawAssetTag(APDF: TTMSFNCPDFLib; ALeft, ATop, ARight, ABottom: Integer; AQR: TBitmap);
    function GetAssetIdURLFragment(): String;
  public
    { Public declarations }
    function GetUUIDStr(): String;
  end;

const
  BASE_URL = 'https://EduAssetTracker.ynotwidgets.com';
  WEBAPP_URL = BASE_URL + '/EduAssetTracker.html';
  API_URL = BASE_URL + '/api/';

var
  frmEAT: TfrmEAT;

implementation

{$R *.dfm}

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
        Console.log('Response Char Length: ' + IntToStr(lResponseLen));
        //Console.log('Response Byte Length: ' + IntToStr(ByteLength(AResponse)));
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
      end
  );
  //lWebRequest.
  //lWebRequest.Free;

  //Application.Navigate(API_URL + ; ATarget: TNavigationTarget);
end;

procedure TfrmEAT.btnRegExTestClick(Sender: TObject);
begin
  // ALE 20201104 the below works
  if TJSRegExp.New('\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b').test(edtAssetId.Text) then
    edtAssetId.Text := 'Valid ' + edtAssetId.Text
  else
    edtAssetId.Text := 'Invalid';
  // RegEx for UUID https://stackoverlow.com/questions/136505
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

function TfrmEAT.GetAssetIdURLFragment: String;
begin
  Result := '?AssetId=' + GetUUIDStr;
end;

function TfrmEAT.GetUUIDStr: String;
var
  lGUID: TGUID;
begin
  CreateGUID(lGUID);
  Result := Copy(LowerCase(GUIDToString(lGUID)), 2, 36);
end;

procedure TfrmEAT.QRCodeGoogleAPIsResponse(Sender: TObject; AResponse: string);
begin
//  imgQRCode.Base64Image := AResponse;
end;

procedure TfrmEAT.tAssetTypeAfterOpen(DataSet: TDataSet);
begin
  //ShowMessage('Dataset opened');
  //dsAssetType.Enabled := False;
  dsAssetType.Enabled := True;
  tAssetType.First;
end;

procedure TfrmEAT.tsScanAssetHide(Sender: TObject);
begin
  //if not cam.Paused then
  //  cam.Pause;
end;

procedure TfrmEAT.tsScanAssetShow(Sender: TObject);
begin
  //if cam.Paused then
  //  cam.Resume
  //else
  //  cam.Start;
end;

procedure TfrmEAT.WebButton1Click(Sender: TObject);
begin
  fWebRequest := TWebHTTPRequest.Create(nil);
  fWebRequest.URL := API_URL + 'TGPQRCodeSheetJSONService/GetQRCodePDF';
  fWebRequest.Command := httpPOST;
  fWebRequest.Headers.AddPair('Content-Type', 'application/json');
  fWebRequest.PostData := '{"lPages": 1}';
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

procedure TfrmEAT.WebButton2Click(Sender: TObject);
var
  Container: TXDataEntityContainer;
  I: Integer;
begin
  XDataWebConnection1.Connected := True;
  if (XDataWebConnection1.Connected) then
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
  tAssetType.Load;
  //XDataWebClient1.List('tAssetType');
  //tAssetType.First;
  //XDataWebClient1.Get('tAssetType', '{9D07B232-0296-4072-88B9-EF30D62B24CA}');
//  ShowMessage(IntToStr(tAssetType.ServerRecordCount));
  end;
end;

procedure TfrmEAT.WebButton3Click(Sender: TObject);
begin
  cam.Start;
end;

procedure TfrmEAT.WebFormCreate(Sender: TObject);
var
  lRegEx: TJSRegExp;
begin
  //edtAssetId.Text := document.documentURI;
  // ALE 20201104 for AssetId
  if Pos('AssetId=', document.documentURI) > 0 then
    edtAssetId.Text := Copy(document.documentURI, 8 + Pos('AssetId=', document.documentURI), MaxInt)
  else
    edtAssetId.Text := '';
end;

procedure TfrmEAT.WebFormShow(Sender: TObject);
begin
// Works fine  edtAssetId.Text := document.documentURI;
end;

procedure TfrmEAT.WebQRDecoder1Decoded(Sender: TObject; ADecoded: string);
begin
  WebMemo1.Text := FormatDateTime('hh:nn:ss.zzz ', Now()) + ADecoded;
  WebQRDecoder1.EnableTimer := True;
  // TODO ALE 20201117 should we save battery? WebCamera1.Stop;
end;

procedure TfrmEAT.XDataWebClient1Load(Response: TXDataClientResponse);
begin
ShowMessage(TJSJson.stringify(Response.Result));
end;

end.
