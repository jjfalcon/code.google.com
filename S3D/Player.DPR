program Player;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  UPlayer in 'UPlayer.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
