program Calculator;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  UCalculator in 'UCalculator.pas',
  FAbout in 'FAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
