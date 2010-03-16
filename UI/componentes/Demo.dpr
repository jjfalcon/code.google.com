program Demo;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  uDigitalDisplay in 'TDigitalDisplay\uDigitalDisplay.pas',
  uSpotifyTrackBar in 'TSpotifyProgressBar\uSpotifyTrackBar.pas',
  uGradient in 'TGradient\uGradient.pas',
  uImageButton in 'TImageButton\uImageButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
