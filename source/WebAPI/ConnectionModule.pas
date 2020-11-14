unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.SQLite,
  Aurelius.Engine.DatabaseManager,
  System.SysUtils, System.Classes, Aurelius.Comp.Connection,
  XData.Server.Module, Sparkle.HttpServer.Module, Sparkle.HttpServer.Context,
  XData.Comp.ConnectionPool, Sparkle.Comp.Server, XData.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher;

type
  TSQLiteConnection = class(TDataModule)
    AureliusConn: TAureliusConnection;
    SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    XDataConnectionPool: TXDataConnectionPool;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure UpdateDatabase(Conn: IDBConnection);
  public
    procedure StartServer(lURL: String);
    procedure StopServer;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  XData.Aurelius.ConnectionPool,
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

procedure TSQLiteConnection.DataModuleCreate(Sender: TObject);
var
  Conn: IDBConnection;
begin
  Conn := XDataConnectionPool.GetPoolInterface.GetConnection;
  UpdateDatabase(Conn);
end;

procedure TSQLiteConnection.StartServer(lURL: String);
begin
  XDataServer.BaseUrl := lURL;
  SparkleHttpSysDispatcher.Start;
  //WriteLn(Format('Module listening at "%s"', [ABaseUrl]));
end;

procedure TSQLiteConnection.StopServer;
begin
  SparkleHttpSysDispatcher.Stop;
end;

procedure TSQLiteConnection.UpdateDatabase(Conn: IDBConnection);
var
  DB: TDatabaseManager;
begin
  DB := TDatabaseManager.Create(Conn);
  try
    DB.UpdateDatabase;
  finally
    DB.Free;
  end;
end;
end.
