unit UClase_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting;

type

  TClase_Test = class(TGUITestCase)
  private
  protected
  published
    procedure Test1;
  end;


implementation

uses
  uClase;

procedure TClase_Test.Test1;
var
  FFixture : TClase;
begin
  FFixture := TClase.Create;
  CheckTrue(Assigned(FFixture), 'Clase no asignada creada');
end;

initialization
  TestFramework.RegisterTest('', TClase_Test.Suite);
end.
