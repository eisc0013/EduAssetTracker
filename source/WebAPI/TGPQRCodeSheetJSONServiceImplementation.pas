unit TGPQRCodeSheetJSONServiceImplementation;

interface

uses
  System.Classes,
  System.SysUtils,
  System.NetEncoding,
  XData.Server.Module,
  XData.Service.Common,
  TGPQRCodeSheetJSONService;

type
  [ServiceImplementation]
  TTGPQRCodeSheetJSONService = class(TInterfacedObject, ITGPQRCodeSheetJSONService)
  private
    function GetQRCodePDF(const lPages: Cardinal; const lLayout: String): String;
  end;

const
  BASEURL = 'https://EduAssetTracker.ynotwidgets.com/EduAssetTracker.html';

implementation

uses uTGPQRCodePDF;

{ TTGPQRCodeSheetJSONService }

function TTGPQRCodeSheetJSONService.GetQRCodePDF(const lPages: Cardinal; const lLayout: String): String;
var
  lQRPDF: TTGPQRPDF;
  lPDFStream: TMemoryStream;
begin
  //TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/pdf');

  lQRPDF := TTGPQRPDF.Create(lPages);
  if lLayout <> '' then
  begin
    lQRPDF.Layout := lLayout;
  end;
  lQRPDF.BaseText := BASEURL + '?AssetId=';
  //lQRPDF.FileName := 'C:\Temp\QRCodes.pdf';
  lPDFStream := TMemoryStream.Create;
  lPDFStream.LoadFromStream(lQRPDF.GeneratePDF(ExtractFilePath(ParamStr(0))));
  //Result := Format('%s%s%s', ['{"PDFContentBase64": "',
  // TNetEncoding.Base64.EncodeBytesToString(lPDFStream.Memory, lPDFStream.Size),
  // '"}']);' +
  Result := TNetEncoding.Base64.EncodeBytesToString(lPDFStream.Memory, lPDFStream.Size);
  lPDFStream.Free;
  lQRPDF.Free;
end;

initialization
  RegisterServiceType(TTGPQRCodeSheetJSONService);

end.
