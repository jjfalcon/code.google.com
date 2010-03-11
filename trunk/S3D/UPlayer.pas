unit UPlayer;

interface

function ShowSplashON: boolean;
function ShowSplashOFF: boolean;
function ShowAbout: boolean;
function ShowPreferences: boolean;
function ShowTest(aFileName: string): boolean;

implementation

uses
  dialogs;

function ShowSplashOn: boolean;
begin
  Result := true;
  ShowMessage('Splash ON');
end;

function ShowSplashOFF: boolean;
begin
  Result := true;
  ShowMessage('Splash OFF');
end;

function ShowAbout: boolean;
begin
  Result := true;
  ShowMessage('Acerca de...');
end;

function ShowPreferences: boolean;
begin
  Result := true;
  ShowMessage('Preferences...');
end;

function ShowTest(aFileName: string): boolean;
begin
  Result := true;
  ShowMessage('Tests '+ aFileName);
end;


end.
