{-------------------------------------------------------------------------------
Test

DESCRIPCION


USO

Para usar el sistema basta lanzar el ejecutable de los siguientes modos:
* Modo Consola que permite automatizar test en integracion continua
* Modo UI que permite controlar dunit

DESARROLLO


Plataforma  : Windows XP SP2 y Delphi 7 Enterprise

Historial   :
  - version 1.0 (01/07/2009)

TODO        : <tareas pendientes de realizar>

 Copyright 1996-2009 SOME Sistemas Informáticos, S.L.
-------------------------------------------------------------------------------}

{$APPTYPE CONSOLE}
program Test;

uses
  Forms,
  sysutils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  uImageButton in 'TImageButton\uImageButton.pas';

{$R *.res}

begin
  Application.Initialize;
  if FindCmdLineSwitch('h', ['-', '/'], true) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
    GUITestRunner.RunRegisteredTests;
end.

