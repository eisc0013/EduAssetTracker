unit TGPQRCodeSheetService;

interface

uses
  System.Classes, XData.Service.Common;

type
  [ServiceContract]
  ITGPQRCodeSheetService = interface(IInvokable)
    ['{249203FF-94C6-4AFC-982D-3260DB88741C}']
    [HttpGet] function Sum(A, B: double): double;
    // By default, any service operation responds to (is invoked by) a POST request from the client.
    function EchoString(Value: string): string;
    function GetQRCodePDF(lPages: Cardinal): TStream;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ITGPQRCodeSheetService));

end.
