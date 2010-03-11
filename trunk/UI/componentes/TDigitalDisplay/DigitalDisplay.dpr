program DigitalDisplay;

uses
  Forms,
  FMain in 'FMain.pas' {Form1},
  uDigitalDisplay in 'uDigitalDisplay.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
