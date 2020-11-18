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
    function GetQRCodePDF(lPages: Cardinal): String;
  end;

const
  //BASEURL = 'https://ynotwidgets.com/TGP/EduAssetTracker/asset/';
  BASEURL = 'https://EduAssetTracker.ynotwidgets.com/EduAssetTracker.html';

implementation

uses uTGPQRCodePDF;

{ TTGPQRCodeSheetJSONService }

function TTGPQRCodeSheetJSONService.GetQRCodePDF(lPages: Cardinal): String;
var
  lQRPDF: TTGPQRPDF;
  lPDFStream: TMemoryStream;
begin
  //TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/pdf');

  lQRPDF := TTGPQRPDF.Create(lPages);
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
