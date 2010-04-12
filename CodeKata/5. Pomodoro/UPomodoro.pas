unit UPomodoro;

interface

uses
  windows;

const
  DEFAULT_DURATION = 25;

type

  TPomodoro = class
  private
    Fduration : integer;
    FnumberOfInterruptions : integer;
    Fstarted  : boolean;
    FstartTimeStamp : DWORD;
    function millisLeft: longint;
  public
    constructor Create; overload;
    constructor Create(NumberOfMinutes: integer); overload;
    function  minutesLeft: integer;
    function  hasStarted: boolean;
    function  isFinished: boolean;
    function  numberOfInterruptions: integer;
    procedure Start;
    procedure Interrupt;
  published
  end;

implementation

constructor TPomodoro.Create;
begin
  Fduration := DEFAULT_DURATION;
  Fstarted  := false;
  FnumberOfInterruptions  := 0;
end;

constructor TPomodoro.Create(NumberOfMinutes: integer);
begin
  Fduration := NumberOfMinutes;
  Fstarted  := false;
  FnumberOfInterruptions  := 0;

  if NumberOfMinutes < 0
  then Fduration := DEFAULT_DURATION;
end;

function TPomodoro.MinutesLeft: integer;
begin
  if not HasStarted
  then result := Fduration
  else result := (millisLeft div 60000);
end;

function TPomodoro.millisLeft: longint;
var
  msAvailable, msPassed: longint;
begin
  msAvailable := Fduration * 60000;
  msPassed    := windows.GetTickCount - FstartTimeStamp;
  result      := msAvailable - msPassed;
end;

function TPomodoro.hasStarted: boolean;
begin
  result := Fstarted;
end;

function TPomodoro.isFinished: boolean;
begin
  result := hasStarted and (millisLeft <= 0);
end;

procedure TPomodoro.Start;
begin
  Fstarted := true;
  FnumberOfInterruptions := 0;
  FstartTimeStamp := windows.GetTickCount;
end;

function TPomodoro.numberOfInterruptions: integer;
begin
  result := FnumberOfInterruptions;
end;

procedure TPomodoro.Interrupt;
begin
  if not hasStarted then exit;
  Inc(FnumberOfInterruptions);
end;

end.
