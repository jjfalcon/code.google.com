unit Keyboard1;

interface

uses
  SysUtils, Classes,Controls,myboton1,Messages, Windows, Graphics,forms,dialogs,
  ExtCtrls;

type
  //TonPulsarboton = procedure ( cadena : string ) of object;
  TonPulsarShift= procedure of object;
  TKeyboard = class(TPanel)
  private
    FOutput: TComponent;
    FreeBoton2 : array[0..30] of TFreeBoton;
  protected

  Procedure MyResize(Sender : TObject);
  public
    mayus:integer;
    //onPulsarBoton : TonPulsarBoton;
    onPulsarShift:TonPulsarShift;
    constructor Create(AOwner:TComponent); override;
    procedure WriteEvent( Sender : Tobject);
    procedure SpecialEvent(Sender:Tobject);

  published
    property output:TComponent read Foutput write FOutput;
    //property OnResize;
    { Published declarations }
  end;


const letras : array[0..30] of String= ('Q','W','E','R','T','Y','U','I','O','P','A','S','D',
'F','G','H','J','K','L','ñ','Z','X','C','V','B','N','M','M/m',' ','Del','Enter');//,'.',',');

procedure Register;

implementation

//{$R Res.RES}

uses
  stdctrls;

procedure Register;
begin
 RegisterComponents('IPhone', [TKeyboard]);
end;


constructor TKeyboard.Create(AOwner: TComponent);
var
  i,left,top:integer;
begin

  inherited create(AOwner);
  Self.Width := 250;
  Self.Height := 250;

 // Self.CanAutoSize(210,50);
  Visible:=false;
  mayus:=1;
  left:=-25;
  top:=0;
     for i := 0 to  30 do
     begin
       freeboton2[i] := TFreeBoton.Create(nil);
       freeboton2[i].Parent := TWinControl(self);
       FreeBoton2[i].Caption:= letras[i];
       left:=left+25;
       if(i=10) then
       begin
        top:=top+25;
        left:=0;
       end;
        if(i=20) then
        begin
          top:=top+25;
          left:=15;
        end;
        /////
 {       if(i=31) then
        begin
          left:=left-200;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=20;
        end;

        if(i=32) then
        begin
          left:=left-60;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=20;
        end;}
        ////

        if(i=27) then   //MAYUSCULAS
        begin
          top:=top+25;
          left:=0;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=75;
          freeboton2[i].onClick:= SpecialEvent;
        end
        else
          freeboton2[i].onClick:= WriteEvent;

        if(i=28) then
        begin
          left:=65;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=70;
        end;
        if(i=29) then
        begin
          left:=left+40;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=50;
          FreeBoton2[i].DrawColor:=clmedGray;
        end;
        if(i=30) then
        begin
          left:=left+20;
          FreeBoton2[i].Height:=25;
          FreeBoton2[i].Width:=70;
        end;
        freeboton2[i].Top:=top;
        freeboton2[i].left:=left;

    end;
    Output := nil;
    OnResize := MyResize;
end;

procedure TKeyboard.WriteEvent(Sender: Tobject);
var
  i,posicion:integer;
  str1,str2:string;
begin
 // if assigned (OnPulsarboton ) then
 // begin
 //   if(mayus=1) then
 //     OnPulsarBoton(TFreeBoton(Sender).Caption)
 //   else
 //     OnPulsarBoton(LowerCase(TFreeBoton(Sender).Caption));
 // end;

  if not Assigned(Output) then exit;

  if Output.ClassType = TEdit then
  begin
    if(TFreeBoton(Sender).Caption='Del')then
    begin
        i := TEdit(Output).SelStart;
        posicion := TEdit(Output).SelStart;
        Str1 := Copy(TEdit(Output).Text, 1, posicion - 1);
        Str2 := Copy(TEdit(Output).Text, posicion + 1, Length(TEdit(Output).Text));
        TEdit(Output).Text := Str1 + Str2;
        TEdit(Output).SelStart := i - 1;
    end
    else
    if(TFreeBoton(Sender).Caption = 'Enter')then
    begin
        TEdit(output).Text := TEdit(output).Text + '';
    end
    else
    begin
      i:=TEdit(Output).SelStart;
      posicion:=TEdit(Output).SelStart;
      Str1 := Copy(TEdit(Output).Text, 1, posicion);
      Str2 := Copy(TEdit(Output).Text, posicion + 1, Length(TEdit(Output).Text));
      if(mayus=1) then
        TEdit(Output).Text := Str1 + TFreeBoton(Sender).Caption + str2
      else
        TEdit(Output).Text := Str1 + Lowercase(TFreeBoton(Sender).Caption) + str2;
      TEdit(Output).SelStart := i + 1;
    end;
  end
  else
  if Output.ClassType = TMemo then
  begin
    //
    TMemo(output).SetFocus;
    TMemo(output).ScrollBy(TMemo(output).Width,TMemo(output).Height);
    //
    if(TFreeBoton(Sender).Caption='Del')then
    begin
        i := TMemo(Output).SelStart;
        posicion := TMemo(Output).SelStart;
        Str1 := Copy(TMemo(Output).Text, 1, posicion - 1);
        Str2 := Copy(TMemo(Output).Text, posicion + 1, Length(TMemo(Output).Text));
        TMemo(Output).Text := Str1 + Str2;
        TMemo(Output).SelStart := i - 1;
    end
    else
    if(TFreeBoton(Sender).Caption = 'Enter')then
    begin
       //salto de linea
       TMemo(Output).Lines.add('');
       //TMemo(Output).Lines.Text :=
   end
   else
   begin
      TMemo(output).SetFocus;
      i:=TMemo(Output).SelStart;
      posicion:=TMemo(Output).SelStart;
      Str1 := Copy(TMemo(Output).Text, 1, posicion);
      Str2 := Copy(TMemo(Output).Text, posicion + 1, Length(TMemo(Output).Text));
      if(mayus=1) then
        TMemo(Output).Text := Str1 + TFreeBoton(Sender).Caption + str2
      else
        TMemo(Output).Text := Str1 + Lowercase(TFreeBoton(Sender).Caption) + str2;
      TMemo(Output).SelStart := i + 1;
   end;
 end;
end;

procedure TKeyboard.SpecialEvent(Sender: Tobject);
begin
    if(mayus=1) then
    begin
      FreeBoton2[27].DrawColor:=clmedGray;
      mayus:=0;
    end
    else
    begin
      FreeBoton2[27].DrawColor:=clsilver;
      mayus:=1;
    end;
    if assigned (OnPulsarShift) then
      OnPulsarShift;
end;

procedure TKeyboard.MyResize(Sender: TObject);
var
  i,
  dimX,
  dimY,
  sumDimX   : integer;
begin
  dimX:= round(Self.Width / 10);
  dimY:= round(Self.Height / 4);
  //primera fila
  for i := 0 to 9 do begin
    FreeBoton2[i].Width  := dimX;
    FreeBoton2[i].Height := dimY;
    FreeBoton2[i].Top    := 0;
    FreeBoton2[i].Left   := DimX * i;
  end;
  sumDimX := 0;
  //segunda fila
  for i := 10 to 19 do begin
    FreeBoton2[i].Width  := dimX;
    FreeBoton2[i].Height := dimY;
    FreeBoton2[i].Top    := dimY;
    FreeBoton2[i].Left   := sumDimX;
    Inc(sumDimX,dimX);
  end;
  sumDimX := 10;
  //tercera fila
  for i := 20 to 27 do begin
    FreeBoton2[i].Width  := dimX;
    FreeBoton2[i].Height := dimY;
    FreeBoton2[i].Top    := 2*dimY;
    FreeBoton2[i].Left   := sumDimX;
    Inc(sumDimX,dimX);
  end;
   {for i := 30 to 32 do begin
    FreeBoton2[i].Width  := dimX;
    FreeBoton2[i].Height := dimY;
    FreeBoton2[i].Top    := 2*dimY;
    FreeBoton2[i].Left   := sumDimX;
    Inc(sumDimX,dimX);
  end;}
  sumDimX := 20;
  //cuarta fila
  for i := 27 to 30 do begin
  if (i=28) then
    FreeBoton2[i].Width  := dimX*4
  else
    FreeBoton2[i].Width  := dimX*2;
    FreeBoton2[i].Height := dimY;
    FreeBoton2[i].Top    := 3*dimY;
    FreeBoton2[i].Left   := sumDimX;
    Inc(sumDimX,dimX*2);
  end;

end;

end.
