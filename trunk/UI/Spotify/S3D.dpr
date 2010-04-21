program S3D;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  FGoogle in '..\GoogleChrome\FGoogle.pas' {Form1};

//uImageButton in '..\componentes\TImageButton\uImageButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
