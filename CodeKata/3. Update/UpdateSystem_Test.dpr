program UpdateSystem_Test;

{$APPTYPE CONSOLE}

uses
  Forms,
  sysutils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  UUpdateSytem_Test in 'UUpdateSytem_Test.pas',
  UUpdateSys in 'UUpdateSys.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.

 