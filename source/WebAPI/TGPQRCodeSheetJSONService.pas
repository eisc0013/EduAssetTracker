unit TGPQRCodeSheetJSONService;

interface

uses
  System.Classes, XData.Service.Common;

type
  [ServiceContract]
  ITGPQRCodeSheetJSONService = interface(IInvokable)
    ['{F8B64452-621F-420E-82B7-2060C220B4BF}']
    // By default, any service operation responds to (is invoked by) a POST request from the client.
    function GetQRCodePDF(lPages: Cardinal): String;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ITGPQRCodeSheetJSONService));

end.
