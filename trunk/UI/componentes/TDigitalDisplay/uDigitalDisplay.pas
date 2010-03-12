unit uDigitalDisplay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  {Tipo para el evento OnDigitClick}
  TOnDigitClick = procedure(Sender : TObject; Digit : integer) of object;

  TDigitalDisplay = class(TGraphicControl)
  private
    FBitmap : TBitmap;             {Bitmap oculto (off-screen) para el dibujo del display}
    FDigits : byte;                {Número de digitos a representar}
    FValue : string;               {Valor a arepresentar}
    FTransparent : boolean;
    FBckgndColor, FDigitOnColor, FDigitOffColor : TColor;   {Colores}
    FAlignment : TAlignment;       {Alineación horizontal}
    FLeadingZeros : boolean;       {Rellenar con ceros}
    FOnDigitClick : TOnDigitClick; {Campo para el evento OnDigitClick}

    procedure DrawDot(index : byte;x,y : integer;ex,ey : single);
    procedure DrawDigit(Digit : byte; x,y : integer;ex,ey : single);
    procedure SetDigits(Value:byte);
    procedure SetValue(Value:String);
    procedure SetTransparent(Value : Boolean);
    procedure SetBckgndColor(Value : TColor);
    procedure SetDigitOnColor(Value : TColor);
    procedure SetDigitOffColor(Value : TColor);
    procedure SetAlignment(Value : TAlignment);
    procedure SetLeadingZeros(Value : boolean);
    function GetNumberOfDigits : byte;
  protected
    procedure Paint; override;
    procedure MouseDown(Button : TMouseButton; Shift : TShiftState; X,Y : Integer); override;
    procedure DigitClick(Digit : integer); dynamic;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property LeadingZeros : boolean read FLeadingZeros write SetLeadingZeros default False;
    property Alignment : TAlignment read FAlignment write SetAlignment default taRightjustify;
    property Digits : byte read FDigits write SetDigits default 4;
    property Value : string read FValue write SetValue;
    property Transparent : boolean read FTransparent write SetTransparent;
    property BckgndColor : TColor read FBckgndColor write SetBckgndColor;
    property DigitOnColor : TColor read FDigitOnColor write SetDigitOnColor;
    property DigitOffColor : TColor read FDigitOffColor write SetDigitOffColor;
    property OnDigitClick : TOnDigitClick read FOnDigitClick write FOnDigitClick;
    property Visible;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

Const
  {Coordenadas de los puntos}
  {Coordenadas de los 10 (1..10) segmentos posibles: 7 segmentos + 1 punto decimal (.), 2 puntos de hora (:)
   Cada segmento tiene 6 (0..5) vértices}
  {     _   }
  {  . |_|  }
  {  : |_|  }
  Px : Array[1..10,0..5] of integer = ((9,9,24,24,20,13),(26,26,26,24,22,22),(26,26,26,22,22,24),
                                      (24,24,9,9,13,20),(7,7,7,9,11,11),(7,7,7,11,11,9),
                                      (11,13,20,22,20,13),(2,2,5,5,5,2),(2,2,5,5,5,2),(2,2,5,5,5,2)) ;
  Py : Array[1..10,0..5] of integer = ((0,0,0,0,4,4),(2,2,14,16,14,6),(20,20,32,28,20,18),
                                      (34,34,34,34,30,30),(32,32,20,18,20,28),(14,14,2,6,14,16),
                                      (17,15,15,17,19,19),(32,32,32,32,34,34),(22,22,22,22,25,25),(10,10,10,10,13,13));

  {Para cada digito del 1 al 9, 1 representa segmento encendido, 0 apagado}
  DigitsArray : Array[0..9] of string = ('1111110','0110000','1101101','1111001','0110011','1011011',
    '1011111','1110000','1111111','1111011');

  Seg_dot = 8;     {Segmento correspondiente al .}
  Seg_DotDown = 9; {Segmento correspondiente al punto inferior de :}
  Seg_DotUp = 10;  {Segmento correspondiente al punto superior de :}

constructor TDigitalDisplay.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  ControlStyle:=ControlStyle+[csOpaque];  {Necesario para evitar el parpadeo}
  FBitmap:=TBitmap.Create;                {Creamos el bitmap que no servirá para dibujar el display off-screen}

  {Valores por defecto}
  FDigits:=4;
  FValue:='1997';
  FTransparent := true;
  FBckgndColor:=clBlack;
  FDigitOnColor:=clLime;
  FDigitOffColor:=$4000;
  FAlignment:=taRightJustify;
  Width:=108;
  Height:=35;
end;

destructor TDigitalDisplay.Destroy;
begin
  inherited Destroy;
  FBitmap.Free;        {Liberamos el bitmap off-screen}
end;

procedure TDigitalDisplay.SetAlignment(Value : TAlignment);
begin
  if Value<>FAlignment then
  begin
    FAlignment:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetDigits(Value : byte);
begin
  if Value<>FDigits then
  begin
    FDigits:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetLeadingZeros(Value : boolean);
begin
  if Value<>FLeadingZeros then
  begin
    FLeadingZeros:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetValue(Value : string);
begin
  if Value<>FValue then
  begin
    FValue:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetTransparent(Value : boolean);
begin
  if Value<>FTransparent then
  begin
    FTransparent:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetBckgndColor(Value : TColor);
begin
  if FBckgndColor<>Value then
  begin
    FBckgndColor:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetDigitOnColor(Value : TColor);
begin
  if FDigitOnColor<>Value then
  begin
    FDigitOnColor:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.SetDigitOffColor(Value : TColor);
begin
  if FDigitOffColor<>Value then
  begin
    FDigitOffColor:=Value;
    repaint;
  end;
end;

procedure TDigitalDisplay.Paint;
Var
  ex, ey : single;   {Escala a la que dibujar el display}
  i, Digito : byte;
  Incx, x,y, offsetx, offsety :integer;
  DigitSpace : integer;
  SrcRect : TRect;
  Digitos : byte;
  Caracter : char;
  FillString : string;
begin
  SrcRect:=Rect(0,0,Width,Height);   {Obtenemos el rectángulo del componente}
  FBitmap.Width:=Width;              {Ajustamos nuestro bitmap}
  FBitmap.Height:=Height;
  {Cálculo del offset a dejar alrededor}
  offsetx:=Trunc(0.2*width);
  offsety:=trunc(0.2*height);
  {Calculamos el espacio disponible para cada dígito}
  DigitSpace:=Trunc((Width-offsetx) / FDigits);
  {Posicionamos la x e y}
  x:=offsetx div 2;
  y:=offsety div 2;
  {Cálculo de la escala}
  ex:=DigitSpace/27;
  ey:=(Height-offsety)/35;
  {Inicializamos el nº de digitos dibujados}
  Digitos:=0;
  {Asignamos colores}
  FBitmap.Canvas.Brush.Color:=FBckgndColor;
  FBitmap.Canvas.FillRect(SrcRect);
  {Asignamos a la variable text el valor a representar}
  Text:=FValue;
  {Creamos una cadena auxiliar de relleno por la izquierda}
  if FLeadingZeros then
    FillString:='000000000000000000000000000000'
  else
    FillString:='                              ';
  {Rellenar la variable text con ceros o espacios (FillString) según sea la alineación}
  case FAlignment of
    taRightJustify : Text:=Copy(FillString,1,FDigits-GetNumberOfDigits)+FValue;
    taCenter : Text:=Copy(FillString,1,(FDigits-GetNumberOfDigits) div 2)+FValue;
  end;
  {Bucle para el dibujo de cada dígito}
  for i:=1 to Length(Text) do
  begin
    Caracter:=Copy(Text,i,1)[1];   {Caracter a dibujar}
    Case caracter of
      '0'..'9': begin
                  Digito:=StrToInt(Caracter);
                  DrawDigit(Digito,x,y,ex,ey);
                  x:=x+DigitSpace;
                  Inc(Digitos);
                  if Digitos = FDigits then break;
                end;
      ':' : begin
              DrawDot(seg_DotUp,x,y,ex,ey);
              DrawDot(seg_DotDown,x,y,ex,ey);
            end;
      '.',',': DrawDot(seg_Dot,x,y,ex,ey);
      ' ':     x:=x+DigitSpace;
    end;
  end;
  {Una vez dibujado totalmente el display en el bitmap off-screen, lo volcamos
   al canvas del componente. Resultado ¡No hay parpadeo!}
  FBitmap.Transparent := FTransparent;
  Canvas.Draw(0,0,FBitmap);
end;

procedure TDigitalDisplay.DrawDot(index : byte;x,y : integer;ex,ey : single);
{Dibuja un punto en la posición x,y con la escala determinada por ex y ey}
Var
  j : byte;
  Puntos : array[0..5] of TPoint;
begin
  FBitmap.Canvas.Pen.Color:=DigitOnColor;
  FBitmap.Canvas.Brush.Color:=DigitOnColor;
  for j:=0 to 5 do
    Puntos[j]:=Point(x+Trunc(Px[index,j]*ex),y+Trunc(Py[index,j]*ey));
  FBitmap.Canvas.Polygon([Puntos[0],Puntos[1],Puntos[2],
                  Puntos[3],Puntos[4],Puntos[5]]);
end;

procedure TDigitalDisplay.DrawDigit(Digit : byte; x,y : integer;ex,ey : single);
{Dibuja el dígito (0..9) pasado en la posición x,y con la escala determinada por ex y ey}
Var
  i, j : byte;
  Puntos : array[0..5] of TPoint;
begin
  for i:=1 to 7 do
  begin
    if Copy(DigitsArray[Digit],i,1) = '0' then
    begin
      FBitmap.Canvas.Pen.Color:=FDigitOffColor;
      FBitmap.Canvas.Brush.Color:=FDigitOffColor;
    end
    else
    begin
      FBitmap.Canvas.Pen.Color:=FDigitOnColor;
      FBitmap.Canvas.Brush.Color:=FDigitOnColor;
    end;
    for j:=0 to 5 do
        Puntos[j]:=Point(x+Trunc(Px[i,j]*ex),y+Trunc(Py[i,j]*ey));
    FBitmap.Canvas.Polygon([Puntos[0],Puntos[1],Puntos[2],
                      Puntos[3],Puntos[4],Puntos[5]]);
  end;
end;

function TDigitalDisplay.GetNumberOfDigits : byte;
{Devuelve el número de digitos numéricos de la propiedad Value}
Var
  i : byte;
begin
  Result:=0;
  for i:=1 to Length(FValue) do
    if Copy(FValue,i,1)[1] in ['0'..'9'] then
      Inc(Result);
end;

procedure TDigitalDisplay.MouseDown(Button : TMouseButton; Shift : TShiftState; X,Y : Integer);
{Método que se encarga de determinar si se ha pulsado con el ratón sobre un dígito del display.
 En caso afirmativo se dispara el evento correspondiente}
var
  i, xt, xoff, yoff, DigitSpace : integer;
begin
  inherited MouseDown(Button,Shift,X,Y);
  {Cálculo del offset horizontal}
  xoff:=Trunc(0.2*width);
  xt:=Trunc(0.2*width) div 2;
  {Cálculo del espacio ocupado por un dígito}
  DigitSpace:=Trunc((Width-xoff) / FDigits);
  {Vamos comprobando si el click se ha ha hecho sobre el dígito (i)}
  for i:=1 to FDigits do
  begin
    if (x>=xt) AND (x<=xt+DigitSpace) then
      DigitClick(i);
    xt:=xt+DigitSpace;
  end;
end;

procedure TDigitalDisplay.DigitClick(Digit : integer);
{Método que dispara el evento OnDigitClick}
begin
  if Assigned(FOnDigitClick) then
    FOnDigitClick(Self,Digit);
end;

procedure Register;
begin
  RegisterComponents('Curso', [TDigitalDisplay]);
end;


end.

