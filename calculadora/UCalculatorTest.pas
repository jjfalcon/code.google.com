unit UCalculatorTest;

interface

uses
  TestFramework,
  UCalculator;

type

  //tests a realizar sobre formulario a testear
  TCalculadora = class(TTestCase)
  private
    FFixture: TCalculator;
    FVisor  : string;
    procedure UpdateVisor(str: string);
  public
    procedure Setup; override;
    procedure TearDown; override;

    class function Suite: ITestSuite; override;
  published
    procedure Clear;
    procedure ClearOperando;
    procedure Calcular;

    procedure SetOperando;
    procedure SetChar;

    procedure Signo;
    procedure Sqrt;
    procedure Inverso;

    procedure Sumar;
    procedure Restar;
    procedure Multiplicar;
    procedure Dividir;

    procedure M;
  end;

implementation

uses
  windows,     //VK_BACK
  sysutils;    //class exception: EZeroDivide

class function TCalculadora.Suite: ITestSuite;
begin
  Result := TTestSuite.Create(self);
end;

procedure TCalculadora.UpdateVisor(str: string);
begin
  FVisor := str;
end;

//inicializar formulario a testear
procedure TCalculadora.SetUp;
begin
  inherited;
  FFixture := TCalculator.Create(nil);
  FFixture.OnVisor := UpdateVisor;
end;

//finalizar formulario a testear
procedure TCalculadora.TearDown;
begin
  FFixture.Free;
  inherited;
end;

procedure TCalculadora.SetOperando;
begin
  FFixture.Operando := 5.0;
  CheckEquals(0.0, FFixture.Resultado, 0.0001);
  CheckEquals(5.0, FFixture.Operando, 0.0001);
  CheckEquals(FloatToStr(5.0)+',', FVisor);
  FFixture.Operando := 5.1;
  CheckEquals(FloatToStr(5.1)+',', FVisor);
end;

procedure TCalculadora.SetChar;
begin
  FFixture.EnterChar('5');
  CheckEquals('5,', FVisor);
  FFixture.EnterChar('2');
  CheckEquals('52,', FVisor);
  FFixture.EnterChar(chr(VK_BACK));
  CheckEquals('5,', FVisor);
end;

procedure TCalculadora.Clear;
begin
  CheckEquals(0.0, FFixture.Resultado, 0.0001);
  FFixture.Clear;
  CheckEquals(0.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.ClearOperando;
begin
  FFixture.Operando := 5.0;
  FFixture.Sumar;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 2.0;
  FFixture.ClearOperando;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 4.0;
  FFixture.Calcular;
  CheckEquals(9.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.Calcular;
begin
  CheckEquals(0.0, FFixture.Resultado, 0.0001);
  FFixture.Calcular;
  CheckEquals(0.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 5.0;
  FFixture.Calcular;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.Signo;
begin
  FFixture.Operando := 5.0;
  FFixture.Signo;
  CheckEquals(-5.0, FFixture.Resultado, 0.0001);

  FFixture.Signo;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Signo;
  CheckEquals(-5.0, FFixture.Resultado, 0.0001);
end;


procedure TCalculadora.Inverso;
begin
  FFixture.Operando := 5.0;
  FFixture.Inverso;
  CheckEquals(0.2, FFixture.Resultado, 0.0001);

  FFixture.Inverso;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Clear;
  CheckException(FFixture.Inverso, EZeroDivide);
end;

procedure TCalculadora.Sqrt;
begin
  FFixture.Operando := 0.0;
  FFixture.Sqrt;
  CheckEquals(0.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 9.0;
  FFixture.Sqrt;
  CheckEquals(3.0, FFixture.Resultado, 0.0001);
end;


procedure TCalculadora.Sumar;
begin
  FFixture.Operando := 5.0;
  FFixture.Sumar;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 2.0;
  FFixture.Calcular;
  CheckEquals(7.0, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(9.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.Restar;
begin
  FFixture.Operando := 5.0;
  FFixture.Restar;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 2.0;
  FFixture.Calcular;
  CheckEquals(3.0, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(1.0, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(-1.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.Multiplicar;
begin
  FFixture.Operando := 5.0;
  FFixture.Multiplicar;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 2.0;
  FFixture.Calcular;
  CheckEquals(10.0, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(20.0, FFixture.Resultado, 0.0001);
end;

procedure TCalculadora.Dividir;
begin
  //dividir numeros positivos
  FFixture.Operando := 5.0;
  FFixture.Dividir;
  CheckEquals(5.0, FFixture.Resultado, 0.0001);

  FFixture.Operando := 2.0;
  FFixture.Calcular;
  CheckEquals(2.5, FFixture.Resultado, 0.0001);

  FFixture.Calcular;
  CheckEquals(1.25, FFixture.Resultado, 0.0001);

  //dividir numeros negativos
  FFixture.Clear;
  FFixture.Operando := 5.0;
  FFixture.Dividir;
  FFixture.Operando := -2.0;
  FFixture.Calcular;
  CheckEquals(-2.5, FFixture.Resultado, 0.0001);

  //dividir por cero
  FFixture.Clear;
  FFixture.Operando := 1.0;
  FFixture.Dividir;
  FFixture.Operando := 0.0;
  CheckException(FFixture.Calcular, EZeroDivide);
end;

procedure TCalculadora.M;
(*******************************************************************************
Para trabajar con números almacenados en memoria
  - Para almacenar el número mostrado, haga clic en MS.
  - Para recuperar un número almacenado, haga clic en MR.
  - Para borrar la memoria, haga clic en MC.
  - Para sumar el número mostrado al número ya almacenado en memoria,
    haga clic en MA. Para ver el nuevo número, haga clic en MR.
Nota
  Al almacenar un número, aparece una M en el cuadro situado encima de las
  opciones de memoria. Si almacena otro número, éste reemplazará al almacenado
  actualmente en memoria.
*******************************************************************************)
begin
  //para almacenar numero mostrado, haga click en MS
  //..despues de una operacion
  FFixture.Operando := 2.0;
  FFixture.Restar;
  FFixture.Operando := 2.0;
  FFixture.Calcular;
  CheckEquals(0.0, FFixture.Resultado);
  FFixture.MS;
  CheckEquals(0.0, FFixture.M);

  FFixture.Clear;
  FFixture.Operando := 5.0;
  FFixture.Inverso;
  CheckEquals(0.2, FFixture.Resultado, 0.0001);
  FFixture.MS;
  CheckEquals(0.2, FFixture.M, 0.0001);

  //..antes de operacion
  FFixture.Clear;
  FFixture.Operando := 5.0;
  FFixture.MS;
  CheckEquals(5.0, FFixture.M);

  //recuperar numero guardado
  FFixture.Clear;
  FFixture.MR;
  CheckEquals(5.0, FFixture.Resultado);
  CheckEquals(5.0, FFixture.M);

  //sumar a memoria guadada pero no al resultado
  FFixture.Clear;
  FFixture.MC;
  FFixture.Operando := 4.0;
  FFixture.MS;
  CheckEquals(0.0, FFixture.Resultado);
  FFixture.Operando := 6.0;
  FFixture.MA;
  CheckEquals(0.0, FFixture.Resultado);
  CheckEquals(10.0, FFixture.M);              //sumar memoria
  FFixture.MR;
  CheckEquals(10.0, FFixture.Resultado);      //recuperar en resultado

  //borrar memoria
  FFixture.MC;
  CheckEquals(0.0, FFixture.M);
end;


initialization
  RegisterTest('Pruebas Unitarias', TCalculadora.Suite);
end.
