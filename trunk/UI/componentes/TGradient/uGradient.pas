unit uGradient;

interface

uses
  Classes, Controls, Graphics, WinTypes, WinProcs;

type
  TDireccion = (dHorizontal, dVertical);  {Tipo de dirección del gradiente}
  TGradiente = class(TGraphicControl)
  private
    FDireccion : TDireccion;   {Dirección del gradiente}
    FColorDesde, FColorHasta : TColor;     {Color del gradiente}
    procedure SetDireccion(valor : TDireccion);
    procedure SetColorDesde(valor : TColor);
    procedure SetColorHasta(valor : TColor);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner : TComponent); override;
  published
    property Direccion : TDireccion read FDireccion write SetDireccion default dHorizontal;
    property ColorDesde : TColor read FColorDesde write SetColorDesde default clBlue;
    property ColorHasta : TColor read FColorHasta write SetColorHasta default clBlack;
    property Align;     {Redeclaración de la propiedad como publicada}
  end;

procedure Register;

implementation

constructor TGradiente.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);       {Siempre lo primero a hacer}
  FDireccion:=dHorizontal;        {Valores por defecto}
  FColorDesde:=clBlue;
  FColorHasta:=clBlack;
  Width:=100;
  Height:=100;
end;

procedure TGradiente.SetDireccion(Valor : TDireccion);
begin
  if FDireccion <> valor then
  begin
    FDireccion := Valor;
    Repaint;              {Fuerza redibujado del gradiente}
  end;
end;

procedure TGradiente.SetColorDesde(Valor : TColor);
begin
  if FColorDesde <> Valor then
  begin
    FColorDesde := Valor;
    Repaint;              {Fuerza redibujado del gradiente}
  end;
end;

procedure TGradiente.SetColorHasta(Valor : TColor);
begin
  if FColorHasta <> Valor then
  begin
    FColorHasta := Valor;
    Repaint;              {Fuerza redibujado del gradiente}
  end;
end;

procedure TGradiente.Paint;
var
  RGBDesde, RGBHasta, RGBDif : array[0..2] of byte;  {Colores inicial y final y diferencia de colores}
  contador, Rojo, Verde, Azul : integer;
  Banda : TRect;                                     {Coordenadas del recuadro a pintar}
  Factor : array[0..2] of shortint;                  {+1 si gradiente creciente o -1 en caso decreciente}
begin
  RGBDesde[0]:=GetRValue(ColorToRGB(FColorDesde));
  RGBDesde[1]:=GetGValue(ColorToRGB(FColorDesde));
  RGBDesde[2]:=GetBValue(ColorToRGB(FColorDesde));    {Se descomponen los colores en rojo, verde y azul}
  RGBHasta[0]:=GetRValue(ColorToRGB(FColorHasta));
  RGBHasta[1]:=GetGValue(ColorToRGB(FColorHasta));
  RGBHasta[2]:=GetBValue(ColorToRGB(FColorHasta));
  for contador:=0 to 2 do         {Calculo de RGBDif[] y factor[]}
  begin
    RGBDif[contador]:=Abs(RGBHasta[contador]-RGBDesde[contador]);
    If RGBHasta[contador]>RGBDesde[contador] then factor[contador]:=1 else factor[contador]:=-1;
  end;
  Canvas.Pen.Style:=psSolid;            {Asignamos el estilo del pen}
  Canvas.Pen.Mode:=pmCopy;              {Idem modo}
  if FDireccion = dHorizontal then      {Si el canvas es horizontal...}
  begin
    Banda.Left:=0;                      {Coordenadas recuadro}
    Banda.Right:=Width;
    for contador:=0 to 255 do
    begin
      Banda.Top:=MulDiv(contador,height,256);
      Banda.Bottom:=MulDIv(contador+1,height,256);
      Rojo:=RGBDesde[0]+factor[0]*MulDiv(contador,RGBDif[0],255);
      Verde:=RGBDesde[1]+factor[1]*MulDiv(contador,RGBDif[1],255);
      Azul:=RGBDesde[2]+factor[2]*MulDiv(contador,RGBDif[2],255);
      Canvas.Brush.Color:=RGB(Rojo,Verde,Azul);
      Canvas.FillRect(Banda);           {Pintamos el recuadro}
    end;
  end;
  if FDireccion = dVertical then         {Gradiente vertical}
  begin
    Banda.Top:=0;
    Banda.Bottom:=Height;
    for contador:=0 to 255 do
    begin
      Banda.Left:=MulDiv(contador,width,256);
      Banda.Right:=MulDIv(contador+1,width,256);
      Rojo:=RGBDesde[0]+factor[0]*MulDiv(contador,RGBDif[0],255);
      Verde:=RGBDesde[1]+factor[1]*MulDiv(contador,RGBDif[1],255);
      Azul:=RGBDesde[2]+factor[2]*MulDiv(contador,RGBDif[2],255);
      Canvas.Brush.Color:=RGB(Rojo,Verde,Azul);
      Canvas.FillRect(Banda);
    end;
  end;
end;

procedure Register;
begin
  RegisterComponents('Curso', [TGradiente]);
end;

end.

