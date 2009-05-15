unit UCalculator;

interface

uses
  Classes;

type

  TOperacion = (toNada, toSumar, toRestar, toMultiplicar, toDividir,
                toSigno);
  TNumber    = real;
  TOnVisor   = procedure(str: string) of object;

  TCalculator = class(TComponent)
  private
    { Private declarations }
    FMemory      : TNumber;
    FResultado   : TNumber;
    bResultado   : boolean;      //indica si FResultado es valido
    FOperando    : TNumber;
    FOperacion   : TOperacion;
    FVisor       : string;

    procedure SetOperando(const Value: TNumber);
    procedure SetVisor(const Value: TNumber);
  public
    { Public declarations }
    OnVisor : TOnVisor;

    procedure Signo;
    procedure Sqrt;
    procedure Inverso;

    procedure Sumar;
    procedure Restar;
    procedure Multiplicar;
    procedure Dividir;

    procedure Clear;
    procedure ClearOperando;
    procedure Calcular;

    procedure MS;            //salvar en memoria
    procedure MR;            //recuperar de memoria
    procedure MC;            //borrar memoria
    procedure MA;            //sumar a resultado memoria

    procedure EnterChar(chr: char);

    property  Operando : TNumber read FOperando write SetOperando;
    property  Resultado: TNumber read FResultado;
    property  M: TNumber read FMemory;
  end;

implementation

uses
  sysutils,    //FloarToStr
  windows;     //VK_BACK

procedure TCalculator.EnterChar(chr: char);
begin
  if byte(chr) = VK_BACK then
  begin
    SetLength(FVisor, Length(FVisor)-1)
  end else if chr = '.' then
  begin
    ;
  end
  else
  begin
    FVisor := FVisor + chr;
  end;

  if not Assigned(OnVisor) then exit;

  if FVisor = ''
  then OnVisor('0,')
  else OnVisor(FVisor+',');
end;

procedure TCalculator.SetVisor(const Value: TNumber);
begin
//  FVisor    := FloatToStr(FOperando);
  if Assigned(OnVisor) then OnVisor(FloatToStr(Value)+',');
end;

procedure TCalculator.SetOperando(const Value: TNumber);
begin
  FOperando := Value;
  SetVisor(FOperando);
end;

procedure TCalculator.MS;
begin
  if bResultado
  then FMemory := FResultado
  else FMemory := FOperando;
end;

procedure TCalculator.MR;
begin
  FResultado := FMemory;
  bResultado := True;
end;

procedure TCalculator.MC;
begin
  FMemory := 0;
end;

procedure TCalculator.MA;
begin
  if bResultado
  then FMemory := FResultado + FMemory
  else FMemory := FOperando  + FMemory;

  bResultado := True;
end;

procedure TCalculator.Signo;
begin
  Calcular;
  FOperando  := FOperando * -1;
  FResultado := FOperando;
  bResultado := True;
  SetVisor(FResultado);
end;

procedure TCalculator.Sqrt;
begin
  Calcular;
  FResultado := FOperando;
  FResultado := system.sqrt(FResultado);
  bResultado := True;
  SetVisor(FResultado);
end;

procedure TCalculator.Inverso;
begin
  Calcular;
  FResultado := FOperando;
  FResultado := 1/FResultado;
  FOperando  := Resultado;
  bResultado := True;
  SetVisor(FResultado);
end;

procedure TCalculator.Sumar;
begin
  Calcular;
  FOperacion := toSumar;
end;

procedure TCalculator.Restar;
begin
  Calcular;
  FOperacion := toRestar;
end;

procedure TCalculator.Multiplicar;
begin
  Calcular;
  FOperacion := toMultiplicar;
end;

procedure TCalculator.Dividir;
begin
  Calcular;
  FOperacion := toDividir;
end;

procedure TCalculator.Clear;
begin
  FOperando  := 0;
  FOperacion := toNada;
  FVisor     := '';
  Calcular;
  bResultado := false;
end;

procedure TCalculator.ClearOperando;
begin
  FOperando  := 0;
  FVisor     := '';
  Calcular;
end;

procedure TCalculator.Calcular;
begin
  if FVisor <> '' then
  begin
    FOperando := StrToFloat(FVisor);
    FVisor := '';
  end;
  case FOperacion of
    toSumar         : FResultado := FResultado + FOperando;
    toRestar        : FResultado := FResultado - FOperando;
    toMultiplicar   : FResultado := FResultado * FOperando;
    toDividir       : FResultado := FResultado / FOperando;
    toNada          : FResultado := FOperando;
  end;
  bResultado := true;
  SetVisor(FResultado);
end;


end.
