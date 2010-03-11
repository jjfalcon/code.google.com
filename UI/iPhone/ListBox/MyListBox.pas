unit MyListBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,dialogs,Controls, StdCtrls, ExtCtrls,ImgList,VectorGeometry;

type
  TBarStyle = (tbsLowered, tbsRaised, tbsColor);
  TImagePos = (ipLeft, ipRight);
  TAHGetIndexEvent = procedure(Sender: TObject; const ItemIndex: Integer; var idx: integer) of object;

  enum_typemove = (tm_none,tm_onclick,tm_ondownup,tm_ondown);

  TMyListBox1 = class(TCustomListBox)
  private
    { Private declarations }
    vary:integer;
    posy:integer;
    posicion:integer;
    nfila:integer;
    mdown : boolean;
    StopOn: boolean;
    velocidad:integer;
    speed:integer;
    bmove: boolean;
    continuarCambiando :boolean;
    FMoveItems : boolean;
    FNoEntrarEnMove:boolean;


    FTimer : TTimer;
    t1,varT:cardinal;
    FSigno            : integer;
    FTypeMove         : enum_typemove;
    FNumTotalMovs     : integer;
    FNMovs            : integer;
    abiadura          : cardinal;

    FBarFont:         TFont;
    FBarColor:        TColor;
    FOffset:          Byte;
    FBarStyle:        TBarStyle;
    FImagePos:        TImagePos;
    FAlignment:       TAlignment;
    FImages:          TImageList;
    FImageChangeLink: TChangeLink;
    FOnGetImageIndex: TAHGetIndexEvent;
    FOddEvenColors:   Boolean;
    FOddColor:        TColor;
    FEvenColor:       TColor;
    FOnDrawItem:      TDrawItemEvent;
    ListaString:      TStringList;
    
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure SetBarFont( F: TFont );
    procedure SetBarColor( C: TColor );
    procedure SetOffset( b: Byte );
    procedure SetBarStyle( S: TBarStyle );
    procedure SetAlignment(Value : TAlignment);
    procedure SetImagePos( ip: TImagePos );
    procedure BarFontChange( Sender: TObject );
    procedure ImageListChange (Sender: TObject);
    procedure SetImages (Value: TImageList);
    procedure CalcHeight;
    //-
    procedure SetOddEvenColors( b: Boolean );
    procedure SetOddColor( C: TColor );
    procedure SetEvenColor( C: TColor );
    procedure mymousedown(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mymouseup(Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure mymousemove(Sender: TObject; Shift: TShiftState;
          X, Y: Integer);
    procedure MovimientoClick(Sender: TObject);
    procedure MyOnTimer(Sender: TObject);
    procedure stop(Sender: TObject);
    procedure MovimientoRuleta(npos:integer);
    procedure RealizarMovimiento;
    procedure PintarCuadrado;

    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;

    //Procedure ReordenarMyListBox;
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    Procedure LoadListFromFile(filename : string);
    procedure cambiarVelocidad(x:integer);
  published
    { Published declarations }
    property Align;
    //-
    property Alignment : TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property BarColor: TColor    read FBarColor write SetBarColor;
    property BarFont:  TFont     read FBarFont  write SetBarFont;
    property BarStyle: TBarStyle read FBarStyle write SetBarStyle;
    //-
    property BorderStyle;
    property Color;
    property Columns;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    //-
    property EvenColor: TColor read FEvenColor write SetEvenColor;
    //-
    property ExtendedSelect;
    property Font;
    //-
    property Images: TImageList read FImages write SetImages;
    property ImagePos: TImagePos read FImagePos write SetImagePos default ipLeft;
    //-
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property MultiSelect;
    //-
    property OddEvenColors:  Boolean read FOddEvenColors  write SetOddEvenColors  default false;
    property OddColor:       TColor  read FOddColor       write SetOddColor;
    property Offset:         Byte    read FOffset         write SetOffset         default 3;
    //-
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabWidth;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    //-
    property OnGetImageIndex: TAHGetIndexEvent read FOnGetImageIndex write FOnGetImageIndex;
    //-
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

const V_OFFSET = 5;
     // speed=350;

procedure Register;

implementation

uses
  Forms,xprocs;

function Max( a, b: Integer ): Integer;
begin
  Result := a;
  if b > a then result := b;
end;

Constructor TMyListBox1.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 //PaintWindow(canvas.Handle);
 Style          := lbOwnerDrawFixed;
 ItemHeight     := 20;
 //Color          := clAqua;
 FBarColor      := $00D6E9D7;
 FBarStyle      := tbsLowered;
 FBarFont       := TFont.Create;
 FBarFont.Name  := Font.Name;
 FBarFont.Size  := 10;
 FBarFont.Color := clgreen;
 FOffset        := 3;
 FAlignment     := taLeftJustify;
 FImagePos      := ipLeft;

 //-
 FOddEvenColors := False;
 FOddColor      := $00d1d1d1;
 FEvenColor     := $00e1e1e1;
 //-

 FBarFont.OnChange         := BarFontChange;
 FImageChangeLink          := TChangeLink.Create;
 FTimer                    := TTimer.Create(aowner);
 FTimer.Interval           := 100;
 FImageChangeLink.OnChange := ImageListChange;
 OnDblClick                := movimientoClick;
 onClick                   := stop;
 OnMouseDown               := mymousedown;
 OnMouseMove               := mymousemove;
 OnMouseUp                 := mymouseup;
 ListaString               := TStringList.Create;
 mdown                     := false;
 StopOn                    := true;
 velocidad                 := 500;
 speed                     := 500;
 bmove                     := false;
 FTimer.OnTimer            := MyOnTimer;
 continuarCambiando        := true;
 FMoveItems                := false;
 FNoEntrarEnMove           := false;

 vart := 0;
 FTypeMove := tm_none;
end;

destructor TMyListBox1.Destroy;
begin
 FBarFont.Free;
 inherited Destroy;
end;

procedure TMyListBox1.CalcHeight;
var h: Integer;
begin
  Canvas.Font := Font;
   if Assigned(FImages) then
     h := Max( Canvas.TextHeight( 'Íy' ), FImages.Height )
 else
     h := Canvas.TextHeight('Íy');

 Canvas.Font := FBarFont;
 h := Max( h, Canvas.TextHeight( 'Íy' ) ) + V_OFFSET;
 if ItemHeight <> h then ItemHeight := h;
 Canvas.Font := Font;
end;

procedure TMyListBox1.CMFontChanged(var Message: TMessage);
begin
 inherited;
 Canvas.Font := Font;
 CalcHeight;
end;

procedure TMyListBox1.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = Images then Images := nil;
  end;
end;

procedure TMyListBox1.ImageListChange(Sender: TObject);
begin
  CalcHeight;
end;

procedure TMyListBox1.SetImages (Value: TImageList);
begin
  if Assigned (FImages) then
    Images.UnRegisterChanges(FImageChangeLink);

  FImages := Value;

  if Assigned (FImages) then
     Images.RegisterChanges (FImageChangeLink);

  CalcHeight;
  Invalidate;
end;

procedure TMyListBox1.SetImagePos( ip: TImagePos );
begin
  if ip <> FImagePos then begin
    FImagePos := ip;
    if Assigned(FImages) then Invalidate;
  end;
end;

procedure TMyListBox1.SetAlignment(Value : TAlignment);
begin

  if value <> FAlignment then
  begin
    FAlignment := Value;
    Invalidate;
  end;

end;

procedure TMyListBox1.SetBarFont( F: TFont );
begin
 if FBarFont <> F then begin
    FBarFont.Assign( F );
    CalcHeight;
 end;
end;

procedure TMyListBox1.BarFontChange(Sender: TObject);
var r: TRect;
begin
  CalcHeight;
  if ItemIndex > -1 then begin
     if MultiSelect and (SelCount > 1) then invalidate
     else begin
       r := ItemRect( ItemIndex );
       InvalidateRect( Handle, @r, false );
     end;
   end;
end;

procedure TMyListBox1.SetBarColor( C: TColor );
var r: TRect;
begin
  if c <> FBarColor then begin
     FBarColor := c;
     if ItemIndex > -1 then begin
        if MultiSelect and (SelCount > 1) then invalidate
        else begin
          r := ItemRect( ItemIndex );
          InvalidateRect( Handle, @r, false );
        end;
     end;
  end;
end;

procedure TMyListBox1.SetOffset( b: Byte );
begin
    if b <> FOffset then begin
      FOffset := b;
      invalidate;
    end;
end;

procedure TMyListBox1.SetBarStyle( S: TBarStyle );
var r: TRect;
begin
   if s <> FBarStyle then begin
     FBarStyle := S;
     if ItemIndex > -1 then begin
        if MultiSelect and (SelCount > 1) then invalidate
        else begin
          r := ItemRect( ItemIndex );
          InvalidateRect( Handle, @r, false );
        end;
     end;
   end;
end;
//-
procedure TMyListBox1.SetOddEvenColors( B: Boolean );
begin
   if b <> FOddEvenColors then begin
      FOddEvenColors := b;
      Invalidate;
   end;
end;

procedure TMyListBox1.SetOddColor( C: TColor );
begin
   if c <> FOddColor then begin
      FOddColor := C;
      Invalidate;
   end;
end;

procedure TMyListBox1.SetEvenColor( C: TColor );
begin
   if c <> FEvenColor then begin
      FEvenColor := C;
      Invalidate;
   end;
end;

//-
procedure TMyListBox1.DrawItem( Index: Integer; Rect: TRect; State: TOwnerDrawState);
Const
  TextAlignments : Array[TAlignment] of Word = (dt_Left, dt_Right, dt_Center);

var XR     : Trect;
   opcions : integer;
   ImgIdx  : Integer;
begin
 if Assigned(FOnDrawItem) then
    FOnDrawItem( Self, Index, Rect, State );
  ImgIdx := -1;

  if Assigned(FImages) then
    if Assigned(FOnGetImageIndex) then
        FOngetImageIndex(Self, Index, ImgIdx );

  With Canvas do Begin
    if (odSelected in State) then
      Brush.Color := FBarColor
    else
      if FOddEvenColors then
        if odd(Index) then
          Brush.Color := FOddColor
        else
          Brush.Color := FEvenColor
      else
        Brush.Color := Color;

   // fillRect(rect); // el rectangulo del elemento seleccionado

    Pen.Mode := pmCopy;
    Pen.Width := 1;
    Pen.Style := psSolid;

    xr := Rect;

    if FImages <> nil then
    begin
      if (ImgIdx > 0) then
        if FImagePos = ipLeft then
        begin
         FImages.Draw(Canvas, Rect.Left + FOffset, Rect.Top +
                      ((Rect.Bottom - Rect.Top) div 2) - FImages.Height div 2,
                      ImgIdx );
         Rect.Left := Rect.Left + FOffset + FImages.Width + 3;
        end
        else
        begin
         FImages.Draw(Canvas, Rect.Right - FOffset - FImages.Width, Rect.Top +
                    ((Rect.Bottom - Rect.Top) div 2) - FImages.Height div 2,
                      ImgIdx);
         Rect.Right := Rect.Right - FOffset - FImages.Width - 3;
        end;
        if (FAlignment = taLeftJustify) and (FImagePos = ipRight) then
            inc(Rect.Left, FOffset)
        else inc(Rect.Left, 3);
        if (FAlignment = taRightJustify) and (FImagePos = ipLeft) then
            dec(Rect.Right, FOffset)
        else dec(Rect.Right, 3);
    end
    else
    begin
      if FAlignment = taLeftJustify then  Rect.Left := Rect.Left + FOffset;

      if FAlignment = taRightJustify then Rect.Right := Rect.Right - FOffset - 1
      else Dec(Rect.Right); 

    end;

    Dec(Rect.Bottom);
     Font:= FBarFont;
    If (odSelected in State) or(odFocused in State) then
    begin
      Font.color   := clblue;
      if (Self.ItemIndex = nfila div 2) then
        PintarCuadrado;//color de la letra del elemento seleccionado
    end
    else
      Font:=fbarfont;

    If not(odSelected in State) then
    begin
        Brush.Color  := clsilver;                //or(odFocused in State) then
        Pen.Color    := clblack;
        Font.color   := clblack;
    end;

    //if not (odFocused in State) then  //  PINTAR EN AZUL SOLO EL ELEMENTO DEL MEDIO
      //Font:=fbarfont;                 //  DEL LISTBOX SELECCIONADO

   opcions := TextAlignments[FAlignment] or DT_SINGLELINE or DT_VCENTER;

   setbkMode(Canvas.Handle, Transparent);     // el klikado no seleccionado
   DrawText(Canvas.Handle, PChar(Items[Index]),-1, Rect, opcions); //opcions= alignment 0izk,1center,2dere

  if (odFocused in State) and (odselected in state) then
     DrawFocusRect(xr);

  if not (odFocused in State) and not(odSelected in State) then
      Font:=fbarfont;

 end;
end;

procedure Register;
begin
  RegisterComponents('Calendario', [TMyListBox1]);
end;

procedure TMyListBox1.RealizarMovimiento;
var
  PosActual,contador,ItemDelMedio,aux:integer;
begin
      nfila:=trunc(self.Height/Self.ItemHeight);  // SABER KUANTAS FILAS TENEMOS
      ItemDelMedio:=nfila div 2;  //   PARA SABER CUANTOS FILAS POR ARRIBA DEL NUMERO SELECCIONADO TENEMOS
    if(posicion<0) then
      posicion:=ListaString.Count+posicion;
    if(velocidad=0) then
      velocidad:=speed;

    PosActual:=posicion mod ListaString.Count;   //  SABER EN K POSICION TENEMOS EL CURSOR//el puntero

    if StopOn then
      Self.Items.Clear;

    contador:=0;

    while (contador<nfila) and StopOn do
    begin
       if(PosActual-ItemDelMedio+contador<0) then
        aux:=ListaString.Count+PosActual-ItemDelMedio+contador
       else
        if(PosActual-ItemDelMedio+contador=ListaString.Count) then
            aux:=0
        else
          if(PosActual-ItemDelMedio+contador > ListaString.Count) then
            aux:=(PosActual-ItemDelMedio+contador) mod ListaString.Count
          else
          begin
            aux:=PosActual-ItemDelMedio+contador;
          end;
        self.Items.Add(ListaString[aux]);
        contador:=contador+1;
    end;
    Self.Selected[ItemDelMedio]:=TRUE;
    if StopOn=false then         //si stop velocidad 0
       velocidad:=0;
end;

procedure TMyListBox1.mymousedown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mdown      := true;
  posy       := Y;
  bmove      := true;
  FMoveItems := true;
  t1:=GetTickCount;
  Invalidate;
end;

procedure TMyListBox1.mymousemove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  varpos,pos : integer;
begin
  if not mdown then exit;
  if FNoEntrarEnMove then begin
  FNoEntrarEnMove:=false;
  exit;      
  end;

  pos:=Self.ItemIndex;

  if (pos= Self.Items.Count-1) or (pos=0) then
  begin
     vary := Y - 2*posy;
     if (Abs(vary) = 0)then exit;

     varpos := trunc(vary / (self.ItemHeight));
     if (Abs(varpos) = 0)then exit;
     posy := Y;
      MovimientoRuleta(varpos);
  end;
  FNoEntrarEnMove:=false;
end;

procedure TMyListBox1.mymouseup(Sender: TObject; Button: TMouseButton;
                                  Shift: TShiftState; X, Y: Integer);
begin
  mdown := false;
end;

procedure TMyListBox1.MovimientoClick(Sender: TObject);
var
   PosActual,ItemDelMedio:integer;
begin
if not StopOn then  Stopon:=true;
  FNoEntrarEnMove:=true;
  ItemDelMedio:=nfila div 2;

  PosActual:= self.itemIndex;
  FNumTotalMovs := Abs(ItemDelMedio - PosActual);
  FNMovs := 0;
  if (ItemDelMedio = PosActual) then exit;

  FTypeMove := tm_onclick;
  FSigno := Sign(PosActual - ItemDelMedio);
  vart := 0;
end;

procedure TMyListBox1.MovimientoRuleta(npos:integer);
var
   PosActual,ItemDelMedio:integer;
   t2:cardinal;
begin
  if not StopOn then  Stopon:=true;
  FNoEntrarEnMove:=false;
  t2:= GetTickCount;
  t2:=t2-t1;
  PosActual:=Self.ItemIndex;
  ItemDelMedio:=nfila div 2;

  FNumTotalMovs := abs(npos);//  npos=y  variacion de la posicion
  FNMovs := 0;
  abiadura:=10000*abs(npos) div t2;

  if (ItemDelMedio = PosActual) then exit;

  FTypeMove := tm_ondownup;
  FSigno := Sign(ItemDelMedio-PosActual);
  vart := 0;
end;


procedure TMyListBox1.Stop(Sender: TObject);//evento que realiza el stop con el doble click
var
   ItemDelMedio:integer;
begin
    ItemDelMedio:=nfila div 2;
    if ( Self.ItemIndex = ItemDelMedio) then
      StopOn:=false
end;

procedure TMyListBox1.cambiarVelocidad(x:integer);
begin
        velocidad:=x;
        speed:=velocidad;
end;

procedure TMyListBox1.LoadListFromFile(filename: string);
begin
  ListaString.LoadFromFile(filename);
  RealizarMovimiento;

{  numero:=Self.Count div 2;
  for x:=0 to nfila -1 do
  begin
     Flista[x]:= 0;
     if (x= numero) then
       Flista[x]:= 1;
  end;
  SetLength(Flista,self.count);  }
end;

procedure TMyListBox1.WMPaint(var Message: TWMPaint);
  procedure PaintListBox;
  var
    DrawItemMsg: TWMDrawItem;
    MeasureItemMsg: TWMMeasureItem;
    DrawItemStruct: TDrawItemStruct;
    MeasureItemStruct: TMeasureItemStruct;
    R: TRect;
    Y, I, H, W: Integer;
  begin
    { Initialize drawing records }
    DrawItemMsg.Msg := CN_DRAWITEM;
    DrawItemMsg.DrawItemStruct := @DrawItemStruct;
    DrawItemMsg.Ctl := Handle;
    DrawItemStruct.CtlType := ODT_LISTBOX;
    DrawItemStruct.itemAction := ODA_DRAWENTIRE;
    DrawItemStruct.itemState := 0;
    DrawItemStruct.hDC := Message.DC;
    DrawItemStruct.CtlID := Handle;
    DrawItemStruct.hwndItem := Handle;   

    { Intialize measure records }
    MeasureItemMsg.Msg := CN_MEASUREITEM;
    MeasureItemMsg.IDCtl := Handle;
    MeasureItemMsg.MeasureItemStruct := @MeasureItemStruct;
    MeasureItemStruct.CtlType := ODT_LISTBOX;
    MeasureItemStruct.CtlID := Handle;

    { Draw the listbox }
    Y := 0;
    I := TopIndex;
    GetClipBox(Message.DC, R);
    H := Height;
    W := Width;
    while Y < H do
    begin
      MeasureItemStruct.itemID := I;
      if I < Items.Count then
        MeasureItemStruct.itemData := Longint(Pointer(Items.Objects[I]));
      MeasureItemStruct.itemWidth := W;
      MeasureItemStruct.itemHeight := ItemHeight;
      DrawItemStruct.itemData := MeasureItemStruct.itemData;
      DrawItemStruct.itemID := I;
      Dispatch(MeasureItemMsg);
      DrawItemStruct.rcItem := Rect(0, Y, MeasureItemStruct.itemWidth,
        Y + Integer(MeasureItemStruct.itemHeight));
      Dispatch(DrawItemMsg);
      Inc(Y, MeasureItemStruct.itemHeight);
      Inc(I);
      if I >= Items.Count then break;
    end;
  end;

begin
  if Message.DC <> 0 then
    { Listboxes don't allow paint "sub-classing" like the other windows controls
      so we have to do it ourselves. }
    PaintListBox
  else
   inherited;
end;

procedure TMyListBox1.MyOnTimer(Sender:Tobject);
begin
  if FTypeMove = tm_none then exit;
  if not StopOn          then exit;

  case FTypeMove of
   tm_onclick  : begin
                    vart := vart + FTimer.Interval;
                    if (vart > velocidad) then begin
                      vart := 0;
                      posicion:=posicion + FSigno;//FSigno 1 ó -1
                      RealizarMovimiento;
                      Inc(FNMovs);
                      if (FNMovs = FNumTotalMovs) then
                        FTypeMove := tm_none;
                    end;
                 end;

   tm_ondownup : begin
                    vart := vart + FTimer.Interval;//abiadura;//
                    if (vart > abiadura) then begin
                      vart := 0;
                      posicion:=posicion + FSigno;//FSigno 1 ó -1
                      RealizarMovimiento;
                      Inc(FNMovs);
                      if (FNMovs = abs(FNumTotalMovs)) then
                        FTypeMove := tm_none;
                    end;
                 end;
  end;
  
end;

procedure TMyListBox1.PintarCuadrado;
var
   AlturaInicialRect,AlturaFinalRect:integer;
begin
        ///***********HACER MI RECTANGULO CENTRAL******************///////////
   With Canvas do Begin
   Self.FBarColor:=FBarColor;
   AlturaInicialRect := (Self.Height div 2) mod Self.ItemHeight; //- Self.ItemHeight div 2;
   AlturaInicialRect:= (Self.Height div 2)-AlturaInicialRect;
   AlturafinalRect := AlturaInicialRect + Self.ItemHeight;//Self.Height div 2 + Self.ItemHeight div 2;
  Rectangle(0,AlturaInicialRect,self.width,AlturafinalRect);
  //DrawItem(index,rect,state);
   //Rectangle(0,0,30,30);
  Visible:=true;
/////////////***************************//////////////////////////////////
  end;
end;

end.

