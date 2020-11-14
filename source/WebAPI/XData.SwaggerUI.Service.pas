unit XData.SwaggerUI.Service;
// ALE 20201109 modified to pull swagger.json from https

interface

uses
  Generics.Collections, System.Classes, System.SysUtils,
  XData.Service.Common;

type
  [URIPathSegment('swaggerui')]
  [SwaggerExclude]
  ICustomSwaggerUIService = interface(IInvokable)
  ['{5F9D3A0A-D4A1-435D-B7B7-24EBD452D266}']
    [HttpGet, URIPathSegment('')]
    function SwaggerUI: TStream;
  end;

  TCustomSwaggerUIService = class(TInterfacedObject, ICustomSwaggerUIService)
  public
    function SwaggerUI: TStream;
  end;

  [ServiceContract]
  [SwaggerExclude]
  ISwaggerUIService = interface(ICustomSwaggerUIService)
  ['{73022ACC-516F-4D0B-8365-548A32BC39E4}']
  end;

  [ServiceImplementation]
  TSwaggerUIService = class(TCustomSwaggerUIService, ISwaggerUIService, ICustomSwaggerUIService)
  end;

procedure RegisterSwaggerUIService;

implementation

uses
  Sparkle.Utils,
  Sparkle.HttpServer.Response,
  XData.Aurelius.Model,
  XData.Server.Module;

procedure RegisterSwaggerUIService;
begin
  RegisterServiceType(TSwaggerUIService);
end;

{ TSwaggerUIService }

const
  SwaggerUIHtml =
    '<!DOCTYPE html>                                                                                        ' + #13#10 +
    '<html lang="en">                                                                                       ' + #13#10 +
    '<head>                                                                                                 ' + #13#10 +
    '  <meta charset="UTF-8">                                                                               ' + #13#10 +
    '  <title>%TITLE%</title>                                                                               ' + #13#10 +
    '  <link rel="stylesheet" type="text/css" href="https://unpkg.com/swagger-ui-dist@3/swagger-ui.css" >   ' + #13#10 +
    '  <!-- <link rel="icon" type="image/png" href="./favicon-32x32.png" sizes="32x32" /> -->               ' + #13#10 +
    '  <!-- <link rel="icon" type="image/png" href="./favicon-16x16.png" sizes="16x16" /> -->               ' + #13#10 +
    '  <style>                                                                                              ' + #13#10 +
    '    html                                                                                               ' + #13#10 +
    '    {                                                                                                  ' + #13#10 +
    '        box-sizing: border-box;                                                                        ' + #13#10 +
    '        overflow: -moz-scrollbars-vertical;                                                            ' + #13#10 +
    '        overflow-y: scroll;                                                                            ' + #13#10 +
    '    }                                                                                                  ' + #13#10 +
    '    *,                                                                                                 ' + #13#10 +
    '    *:before,                                                                                          ' + #13#10 +
    '    *:after                                                                                            ' + #13#10 +
    '    {                                                                                                  ' + #13#10 +
    '        box-sizing: inherit;                                                                           ' + #13#10 +
    '    }                                                                                                  ' + #13#10 +
    '    body {                                                                                             ' + #13#10 +
    '      margin:0;                                                                                        ' + #13#10 +
    '      background: #fafafa;                                                                             ' + #13#10 +
    '    }                                                                                                  ' + #13#10 +
    '  </style>                                                                                             ' + #13#10 +
    '</head>                                                                                                ' + #13#10 +
    '                                                                                                       ' + #13#10 +
    '<body>                                                                                                 ' + #13#10 +
    '                                                                                                       ' + #13#10 +
    '<div id="swagger-ui"></div>                                                                            ' + #13#10 +
    '                                                                                                       ' + #13#10 +
    '<script src="https://unpkg.com/swagger-ui-dist@3/swagger-ui-bundle.js"> </script>                      ' + #13#10 +
    '<script src="https://unpkg.com/swagger-ui-dist@3/swagger-ui-standalone-preset.js"> </script>           ' + #13#10 +
    '<script>                                                                                               ' + #13#10 +
    '  %JSCRIPT%                                                                                            ' + #13#10 +
    '</script>                                                                                              ' + #13#10 +
    '</body>                                                                                                ' + #13#10 +
    '</html>                                                                                                ';

  SwaggerUICode =
    'window.onload = function() {                            ' + #13#10 +
    '  var url = "%URL%"                                     ' + #13#10 +
    '  var swaggerOptions = {                                ' + #13#10 +
    '    url: url,                                           ' + #13#10 +
    '    displayOperationId: true,                           ' + #13#10 +
    '    docExpansion: "%EXPANSION%",                        ' + #13#10 +
    '    filter: %FILTER%,                                   ' + #13#10 +
    '    dom_id: "#swagger-ui",                              ' + #13#10 +
    '    deepLinking: true,                                  ' + #13#10 +
    '    showExtensions: true,                               ' + #13#10 +
    '    showCommonExtensions: true,                         ' + #13#10 +
    '    presets: [                                          ' + #13#10 +
    '      SwaggerUIBundle.presets.apis                      ' + #13#10 +
    '    ]                                                   ' + #13#10 +
    '  }                                                     ' + #13#10 +
    '  var ui = SwaggerUIBundle(swaggerOptions)              ' + #13#10 +
    '                                                        ' + #13#10 +
    '  window.ui = ui                                        ' + #13#10 +
    '}                                                       ';

function TCustomSwaggerUIService.SwaggerUI: TStream;
var
  JS: string;
  Html: string;
  Resp: THttpServerResponse;
  SwaggerUrl: string;
  XModel: TXDataAureliusModel;
  Query: string;
  Options: TSwaggerUIOptions;
  OptValue: string;
begin
  XModel := TXDataOperationContext.Current.Handler.XModel;
  Options := TXDataOperationContext.Current.Handler.XModule.SwaggerUIOptions;
  Query := TXDataOperationContext.Current.Request.Uri.OriginalQuery;
  SwaggerUrl := TXDataOperationContext.Current.Handler.AbsoluteUrl('openapi/swagger.json') + Query;
  { ALE 20201109 fix URL for Reverse Proxy
  SwaggerUrl := StringReplace(SwaggerUrl, 'http://', 'https://', [rfReplaceAll, rfIgnoreCase]);
  }
  SwaggerUrl := 'https://eduassettracker.ynotwidgets.com/api/openapi/swagger.json';
  JS := SwaggerUICode;
  JS := StringReplace(JS, '%URL%', SwaggerUrl, []);

  // Filter parameter
  if Options.ShowFilter then
    OptValue := 'true'
  else
    OptValue := 'false';
  JS := StringReplace(JS, '%FILTER%', OptValue, []);

  // DocExpansion param
  case Options.DocExpansion of
    TSwaggerUIExpansion.None: OptValue := 'none';
    TSwaggerUIExpansion.Full: OptValue := 'full';
  else
    OptValue := 'list';
  end;
  JS := StringReplace(JS, '%EXPANSION%', OptValue, []);

  // Generate final HTML
  Html := SwaggerUIHtml;
  Html := StringReplace(Html, '%TITLE%', XModel.Title, []);
  Html := StringReplace(Html, '%JSCRIPT%', JS, []);

  // Send response
  Resp := TXDataOperationContext.Current.Response;
  Resp.Headers.SetValue('content-type', 'text/html');
  Result := TStringStream.Create(Html, TEncoding.UTF8, False);
end;

end.
