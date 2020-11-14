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

procedure HTTPReserveURL(lURL: String);
procedure HTTPUnReserveURL(lURL: String);

implementation

uses
  System.IOUtils;



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

end.
