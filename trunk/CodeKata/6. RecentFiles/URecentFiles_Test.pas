unit URecentFiles_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting;

type

  TRecentFiles_Test = class(TGUITestCase)
  private
  protected
  published
    procedure TheFirstTimeRecentFilesIsEmpty;
    procedure OpenenFileIsRecentFile;
  end;


implementation

uses
  uRecentFiles;

{ TRecentFiles_Test }

procedure TRecentFiles_Test.TheFirstTimeRecentFilesIsEmpty;
var
  RecentFiles : TRecentFiles;
begin
  RecentFiles := TRecentFiles.Create;
  CheckEquals(0, RecentFiles.Count, 'Al principio se crea vacio');
end;

procedure TRecentFiles_Test.OpenenFileIsRecentFile;
var
  RecentFiles : TRecentFiles;
begin
  RecentFiles := TRecentFiles.Create;
  RecentFiles.AddOpenFile('MyFile');
  CheckEquals(1, RecentFiles.Count, 'Al principio se crea vacio');
//  CheckEquals('MyFile', RecentFiles.MostRecentlyOpenedFile, 'El ultimo fichero abierto es el mas reciente');
end;


initialization
  TestFramework.RegisterTest('', TRecentFiles_Test.Suite);
end.
