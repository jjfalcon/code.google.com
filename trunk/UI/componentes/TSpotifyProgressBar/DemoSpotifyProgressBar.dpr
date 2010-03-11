program DemoSpotifyProgressBar;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uSpotifyTrackBar in 'uSpotifyTrackBar.pas',
  GraphTools in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\GraphTools.pas',
  GraphThemes in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\GraphThemes.pas',
  StrTools in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\StrTools.pas',
  MathTools in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\MathTools.pas',
  WinTools in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\WinTools.pas',
  StrConst in '..\..\..\..\..\..\..\..\datos\programacion\delphi\Suite CodeBot\code\StrConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
