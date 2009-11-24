unit UUpdateSytem_Test;

interface

Uses
  TestFramework, TestExtensions, GUITesting,UUpdateSys;

type

  TUpdateSystem_Test = class(TGUITestCase)
  private
    FFixture : TUpdateSys;
    FPercent : integer;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
    Procedure GetDownloadPercent(percent : integer);

  published
    Procedure testUpdateVersionServidorMayor;
    Procedure testUpdateVersionServidorIgual;
    Procedure testUpdateVersionServidorMenor;
    Procedure testUpdateDownloadBroken;
    Procedure testUpdateDownloadOKInstalledWrong;
    Procedure testUpdateAndGetDownloadPercent;
  end;

implementation

{ TUpdateSystem_Test }

procedure TUpdateSystem_Test.GetDownloadPercent(percent: integer);
begin
  CheckTrue(Fpercent < Percent ,'Porcentaje menor que anterior');
  CheckTrue((percent >=0) and (percent <=100) ,'Porcentaje no valido');
  FPercent := Percent;
end;

procedure TUpdateSystem_Test.SetUp;
begin
  inherited;
  FFixture := TUpdateSys.Create;
  FFixture.OnGetDownloadPercent := GetDownloadPercent;
  Fpercent:=-1;
end;

procedure TUpdateSystem_Test.TearDown;
begin
  inherited;
  FFixture.Free;
end;

procedure TUpdateSystem_Test.testUpdateAndGetDownloadPercent;
begin
  FFixture.LocalVersion := 1;
  FFixture.ServerVersion := 2;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion = FFixture.ServerVersion,'No se ha completado la descarga');
end;

procedure TUpdateSystem_Test.testUpdateDownloadBroken;
begin
  FFixture.LocalVersion := 1;
  FFixture.ServerVersion := 2;
  FFixture.IsDownloaded := false;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion = 1,'No se ha completado la descarga');
end;

procedure TUpdateSystem_Test.testUpdateDownloadOKInstalledWrong;
begin
  FFixture.IsDownloaded := true;
  FFixture.IsInstalled  := false;

  FFixture.LocalVersion := 1;
  FFixture.ServerVersion := 2;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion = 1,'LocalVersion < ServerVersion ; Se ha actualizado la versión');
end;

procedure TUpdateSystem_Test.testUpdateVersionServidorIgual;
begin
  FFixture.IsDownloaded := true;

  FFixture.LocalVersion := 1;
  FFixture.ServerVersion := 1;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion = FFixture.ServerVersion,'LocalVersion = ServerVersion ; No se ha actualizado la versión');
  CheckTrue(FPercent = -1,'Ha comenzado la descarga cuando no habría que descargar nada');
end;

procedure TUpdateSystem_Test.testUpdateVersionServidorMayor;
begin
  FFixture.IsDownloaded := true;

  FFixture.LocalVersion := 1;
  FFixture.ServerVersion := 2;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion = FFixture.ServerVersion,'LocalVersion < ServerVersion ; Se ha actualizado la versión');
  CheckTrue(FPercent = 100,'No se ha realizado la descarga completa');
end;

procedure TUpdateSystem_Test.testUpdateVersionServidorMenor;
begin
  FFixture.IsDownloaded := true;

  FFixture.LocalVersion := 2;
  FFixture.ServerVersion := 1;
  FFixture.Update;
  CheckTrue(FFixture.LocalVersion > FFixture.ServerVersion,'LocalVersion > ServerVersion ; No se ha actualizado la versión');
  CheckTrue(FPercent = -1,'Ha comenzado la descarga cuando no habría que descargar nada');
end;

initialization
  TestFramework.RegisterTest('Pruebas Unitarias', TUpdateSystem_Test.Suite);
end.
