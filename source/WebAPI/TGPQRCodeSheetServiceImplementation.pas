unit TGPQRCodeSheetServiceImplementation;

interface

uses
  System.Classes,
  XData.Server.Module,
  XData.Service.Common,
  TGPQRCodeSheetService;

type
  [ServiceImplementation]
  TTGPQRCodeSheetService = class(TInterfacedObject, ITGPQRCodeSheetService)
  private
    function Sum(A, B: double): double;
    function EchoString(Value: string): string;
    function GetQRCodePDF(lPages: Cardinal): TStream;
  end;

const
  //BASEURL = 'https://ynotwidgets.com/TGP/EduAssetTracker/asset/';
  BASEURL = 'https://eduassettracker.ynotwidgets.com/api/asset/';

implementation

uses uTGPQRCodePDF;

function TTGPQRCodeSheetService.GetQRCodePDF(lPages: Cardinal): TStream;
var
  lQRPDF: TTGPQRPDF;
begin
  TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/pdf');

  lQRPDF := TTGPQRPDF.Create(lPages);
  lQRPDF.BaseText := BASEURL;
  lQRPDF.FileName := 'C:\Temp\QRCodes.pdf';
  Result := lQRPDF.GeneratePDF();

end;

function TTGPQRCodeSheetService.Sum(A, B: double): double;
begin
  Result := A + B;
end;

function TTGPQRCodeSheetService.EchoString(Value: string): string;
begin
  Result := Value;
end;

initialization
  RegisterServiceType(TTGPQRCodeSheetService);

end.
