unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.SQLite, 
  System.SysUtils, System.Classes, Aurelius.Comp.Connection,
  XData.Server.Module, Sparkle.HttpServer.Module, Sparkle.HttpServer.Context,
  XData.Comp.ConnectionPool, Sparkle.Comp.Server, XData.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher;

type
  TSQLiteConnection = class(TDataModule)
    AureliusConnection1: TAureliusConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
     
    class function CreatePool(APoolSize: Integer): IDBConnectionPool;
  end;

var
  SQLiteConnection: TSQLiteConnection;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses  
  XData.Aurelius.ConnectionPool,
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TSQLiteConnection.CreateConnection: IDBConnection;
begin 
  Result := SQLiteConnection.AureliusConnection1.CreateConnection; 
end;

class function TSQLiteConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;

class function TSQLiteConnection.CreatePool(APoolSize: Integer): IDBConnectionPool;
begin
  Result := TDBConnectionPool.Create(APoolSize, CreateFactory);
end;

end.
