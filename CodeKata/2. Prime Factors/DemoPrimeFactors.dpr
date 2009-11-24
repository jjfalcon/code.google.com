program DemoPrimeFactors;

{$APPTYPE CONSOLE}
uses
  Forms,
  classes,
  sysutils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  PrimeFactors in 'PrimeFactors.pas',
  PrimeFactorsTest in 'PrimeFactorsTest.pas';

{$R *.res}

begin
  if FindCmdLineSwitch('h', ['-', '/'], true) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
  begin
    Application.Initialize;
    GUITestRunner.RunRegisteredTests;
  end;
end.

(*


uses
  SysUtils,

var
  i : integer;
  PrimeList : TStringList;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  with TPrimeFactors.Create do
  try
    PrimeList := Generate(0);
    for i:= 0 to PrimeList.Count-1 do
      writeln(PrimeList[i]);
    readln;
  finally
    PrimeList.Free;
    free;
  end;
end.
*)