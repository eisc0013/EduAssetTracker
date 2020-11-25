program EduAssetTracker;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  uEduAssetTracker in 'uEduAssetTracker.pas' {frmEAT: TWebForm} {*.html},
  uDM in 'uDM.pas' {dm: TWebDataModule},
  uTEATTag in 'uTEATTag.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEAT, frmEAT);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
