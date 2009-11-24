unit UUpdateSys;

interface

type
  TOnUpdatePercent = Procedure(Percent:integer) of Object;
  TUpdateSys = class
    private
      FOnUpdatePercent:TOnUpdatePercent;
      Function Download:boolean;
      Function Install:boolean;
    public
      LocalVersion,
      ServerVersion : integer;

      IsDownloaded : boolean;
      IsInstalled  : boolean;

      constructor Create;

      Function Update:boolean;
    published
      property OnGetDownloadPercent :TOnUpdatePercent read FOnUpdatePercent write FOnUpdatePercent;
  end;

implementation

{ TUpdateSys }

constructor TUpdateSys.Create;
begin
  IsDownloaded := true;
  IsInstalled  := true;
end;

function TUpdateSys.Download: boolean;
var
  i,percent:integer;
begin
  for i:=0 to 4 do
  begin
    percent:=25*i;
    if assigned(OnGetDownloadPercent) then
     OnGetDownloadPercent(percent);
  end;


  Result := IsDownloaded;
end;

function TUpdateSys.Install: boolean;
begin
  Result := IsInstalled;
end;

function TUpdateSys.Update: boolean;
begin
  Result := false;
  if LocalVersion < ServerVersion then begin
    Result := Download and Install;
    if Result then LocalVersion := ServerVersion;
  end;
end;

end.
