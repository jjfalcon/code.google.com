unit UPomodoro_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting;

type

  TPomodoro_Test = class(TGUITestCase)
  private
    procedure WaitAMoment;
  protected
  published
    procedure testCreation;
    procedure testStartAndCount;
    procedure testEnd;
    procedure testInterruptions;
    procedure testRestart;
  end;



implementation

uses
  uPomodoro;

const
  DEFAULT_DURATION     = 25;
  NON_DEFAULT_DURATION = 38;

procedure TPomodoro_Test.testCreation;
var
  Pomodoro : TPomodoro;
begin
  Pomodoro := TPomodoro.Create;
  CheckNotNull(Pomodoro);
  CheckEquals(DEFAULT_DURATION, Pomodoro.MinutesLeft, 'Duracion por defecto, 25 min');

  Pomodoro := TPomodoro.Create(NON_DEFAULT_DURATION);
  CheckEquals(NON_DEFAULT_DURATION, Pomodoro.MinutesLeft, 'Puedo crear Pomodoros de cualquier duracion');

  Pomodoro := TPomodoro.Create(-1);
  CheckEquals(DEFAULT_DURATION, Pomodoro.MinutesLeft, 'Duracion negativa, pomodoro por defecto');

  Pomodoro := TPomodoro.Create(0);
  CheckEquals(0, Pomodoro.MinutesLeft, 'Tambien permitir pomodoros de duracion cero');
end;

procedure TPomodoro_Test.testStartAndCount;
var
  Pomodoro : TPomodoro;
begin
  Pomodoro := TPomodoro.Create;
  CheckFalse(Pomodoro.HasStarted, 'Pomodoro recien creado esta parado');
  Pomodoro.Start;
  CheckTrue(Pomodoro.HasStarted, 'Los pomodoros los arrancan los usuarios');
  WaitAMoment;
  CheckTrue(DEFAULT_DURATION > Pomodoro.MinutesLeft, 'Comienza la cuenta atras');
end;

procedure TPomodoro_Test.testEnd;
var
  Pomodoro : TPomodoro;
begin
  Pomodoro := TPomodoro.Create(0);
  CheckFalse(Pomodoro.isFinished, 'No termina si no ha sido arrancado');
  Pomodoro.Start;
  WaitAMoment;
  CheckTrue(Pomodoro.isFinished, 'Acaba cuando se acaba el tiempo');
  Pomodoro := TPomodoro.Create(1);
  Pomodoro.Start;
  WaitAMoment;
  CheckFalse(Pomodoro.isFinished, 'No se acaba mientras no acabe su tiempo');
end;


procedure TPomodoro_Test.testInterruptions;
var
  Pomodoro : TPomodoro;
begin
  Pomodoro := TPomodoro.Create;
  CheckEquals(0, Pomodoro.numberOfInterruptions, 'Se inicia sin interrupciones');
  Pomodoro.Interrupt;
  CheckEquals(0, Pomodoro.numberOfInterruptions, 'Si no esta arrancado no se puede interrumpir');
  Pomodoro.Start;
  Pomodoro.Interrupt;
  Pomodoro.Interrupt;
  CheckEquals(2, Pomodoro.numberOfInterruptions, 'El pomodoro cuenta las interrupciones');
end;

procedure TPomodoro_Test.testRestart;
var
  Pomodoro : TPomodoro;
begin
  Pomodoro := TPomodoro.Create(NON_DEFAULT_DURATION);
  Pomodoro.Start;
  Pomodoro.Interrupt;
  WaitAMoment;
  Pomodoro.start;
  CheckEquals(NON_DEFAULT_DURATION, Pomodoro.MinutesLeft, 'Un pomodoro arrancado se resetea al arrancarlo de nuevo');
  CheckEquals(0, Pomodoro.numberOfInterruptions, 'Un pomodoro se resetea sin interrupciones');
end;


procedure TPomodoro_Test.WaitAMoment;
begin
  sleep(123);
end;

initialization
  TestFramework.RegisterTest('', TPomodoro_Test.Suite);
end.
