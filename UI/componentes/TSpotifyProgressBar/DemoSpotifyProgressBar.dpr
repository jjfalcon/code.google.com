program DemoSpotifyProgressBar;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uSpotifyTrackBar in 'uSpotifyTrackBar.pas',
  uDigitalDisplay in '..\TDigitalDisplay\uDigitalDisplay.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
