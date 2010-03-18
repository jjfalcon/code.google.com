program S3D;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  uImageButton in '..\componentes\TImageButton\uImageButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
