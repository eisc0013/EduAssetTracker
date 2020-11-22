unit uDM;

interface

uses
  System.SysUtils, System.Classes, XData.Web.Connection, WEBLib.Modules;

type
  TDataModule1 = class(TWebDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
