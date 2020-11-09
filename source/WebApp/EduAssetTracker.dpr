program EduAssetTracker;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  uEduAssetTracker in 'uEduAssetTracker.pas' {frmEAT: TWebForm} {*.html},
  uDM in 'uDM.pas' {DataModule1: TWebDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEAT, frmEAT);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
