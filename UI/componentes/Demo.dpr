program Demo;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  uDigitalDisplay in 'TDigitalDisplay\uDigitalDisplay.pas',
  uSpotifyTrackBar in 'TSpotifyProgressBar\uSpotifyTrackBar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
