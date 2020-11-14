program EduAssetTracker_WebAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Server in 'Server.pas',
  ConnectionModule in 'ConnectionModule.pas' {SQLiteConnection: TDataModule},
  TGPQRCodeSheetService in 'TGPQRCodeSheetService.pas',
  TGPQRCodeSheetServiceImplementation in 'TGPQRCodeSheetServiceImplementation.pas',
  uTGPQRCodePDF in 'uTGPQRCodePDF.pas',
  XData.SwaggerUI.Service in 'XData.SwaggerUI.Service.pas',
  TGPQRCodeSheetJSONService in 'TGPQRCodeSheetJSONService.pas',
  TGPQRCodeSheetJSONServiceImplementation in 'TGPQRCodeSheetJSONServiceImplementation.pas',
  uEATDataModel in '..\DataModel\uEATDataModel.pas';

const
  BASEURL = 'http://+:8081/api';

var
  InputText : string;
  ServerModule: TSQLiteConnection;

begin
  try
    ServerModule := TSQLiteConnection.Create(nil);
    WriteLn('Registering server.');
    HTTPReserveUrl(BASEURL);
    Write('Starting server... ');
    ServerModule.StartServer(BASEURL);
    WriteLn('done.');
    WriteLn('');

    Write('Press ENTER to stop the server and quit.');
    ReadLn(InputText);

    WriteLn('');
    Write('Stopping server... ');
    ServerModule.StopServer;
    WriteLn('Unregistering server.');
    HTTPUnReserveUrl(BASEURL);
    WriteLn('done.');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  if ServerModule <> nil then
    ServerModule.Free;
end.
