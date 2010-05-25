unit URecentFiles;

interface

uses
  classes,  //TStringList
  windows;

const
  DEFAULT_DURATION = 25;

type

  TRecentFiles = class
  private
    FRecentFiles : TStringList;
  public
    constructor Create; overload;
    destructor  Destroy; overload;
  published
    function Count: integer;
    procedure AddOpenFile(aFile: string);
    function MostRecentlyOpenedFile: string;
  end;

implementation

{ TRecentFiles }

constructor TRecentFiles.Create;
begin
  FRecentFiles := TStringList.Create;
end;

destructor TRecentFiles.Destroy;
begin
  FRecentFiles.Free;
end;

procedure TRecentFiles.AddOpenFile(aFile: string);
begin
  FRecentFiles.Add(aFile);
end;

function TRecentFiles.Count: integer;
begin
  Result := FRecentFiles.Count;
end;


function TRecentFiles.MostRecentlyOpenedFile: string;
begin
  if FRecentFiles.Count = 0
    then Result := ''
    else Result := FRecentFiles[0];
end;

end.
