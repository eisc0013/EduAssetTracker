unit Server;

interface

uses 
  ConnectionModule, 
  XData.Server.Module,
  XData.Comp.Server,
  XData.OpenApi.Service,
  XData.SwaggerUI.Service,
  System.SysUtils,
  Sparkle.Middleware.Cors,
  Sparkle.Middleware.Compress,
  Sparkle.HttpSys.Server,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module,
  Sparkle.HttpSys.Config;

procedure StartServer(lURL: String);
procedure StopServer;
procedure HTTPReserveURL(lURL: String);
procedure HTTPUnReserveURL(lURL: String);

implementation

uses
  System.IOUtils;

var
  SparkleServer: THttpSysServer;

procedure StartServer(lURL: String);
var
  XDataSrv: TXDataServer;
  Module : TXDataServerModule;
  lSwaggerOptions: TSwaggerOptions;
begin
  if Assigned(SparkleServer) then
     Exit;

  SparkleServer := THttpSysServer.Create;

  Module := TXDataServerModule.Create(
    lURL,
    TSQLiteConnection.CreatePool(20)
  );

  {
  XDataSrv := TXDataServer.Create(nil);
  XDataSrv.BaseUrl := lURL;
  //XDataSrv.Pool := TSQLiteConnection.CreatePool(20);
  XDataSrv.SwaggerOptions.Enabled := True;
  XDataSrv.SwaggerUIOptions.Enabled := True;
  }

  RegisterSwaggerUIService;
  RegisterOpenAPIService;

  // Uncomment line below to enable CORS in the server
  //Module.AddMiddleware(TCorsMiddleware.Create);

  // Uncomment line below to allow compressed responses from server
  //Module.AddMiddleware(TCompressMiddleware.Create);

  SparkleServer.AddModule(Module);

  SparkleServer.Start;
end;

procedure StopServer;
begin
  FreeAndNil(SparkleServer);
end;

procedure HTTPReserveURL(lURL: String);
var
  Config: THttpSysServerConfig;
begin
  Config := THttpSysServerConfig.Create;
  try
    if not Config.IsUrlReserved(lURL) then
      Config.ReserveUrl(lURL, [TSidType.CurrentUser, TSidType.NetworkService]);
  finally
    Config.Free;
  end;
end;

procedure HTTPUnReserveURL(lURL: String);
var
  Config: THttpSysServerConfig;
begin
  Config := THttpSysServerConfig.Create;
  try
    if not Config.IsUrlReserved(lURL) then
      Config.RemoveUrl(lURL);
  finally
    Config.Free;
  end;
end;

initialization
  SparkleServer := nil;
finalization
  StopServer;
end.
