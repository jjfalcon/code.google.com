unit teclado1;

interface

uses
  SysUtils, Classes,Controls,myboton1,Messages, Windows, Graphics,forms,dialogs;

type
  TonPulsarboton = procedure ( cadena : string ) of object;
  escribir = procedure (letra: Tobject)of object;
  TTeclado = class(TGraphicControl)


  private
      mayus:integer;
   //procedure escribir(letra: string);
   { Private declarations }

  protected
    { Protected declarations }

  public
    evento : escribir;
    textua : string;
    onPulsarBoton : TonPulsarBoton;
    constructor Create(Form1: TForm);
    procedure idatzi ( objeto : Tobject);
  //  procedure llamarCreate(Sender:Tobject);

  published
    { Published declarations }
    property onClick;
    property onDblClick;
  end;

procedure Register;

var
FreeBoton2 : array[0..28] of TFreeBoton;
letras : array[0..28] of String= ('Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G',
'H','J','K','L','Ñ','Z','X','C','V','B','N','M',' ','M/m');
implementation

procedure Register;
begin
  RegisterComponents('IPhone', [TTeclado]);
end;

constructor TTeclado.Create(Form1: TForm);
var
  i,j,left,top:integer;
begin
//inherited; llamar Create
 // Create(TGraphicControl);
  mayus:=0;
  left:=50;
  top:=50;
     for i := 0 to  28 do
     begin
       freeboton2[i] := TFreeBoton.Create(self);
//    FreeBoton2[i].Parent := self;
       freeboton2[i].Parent := Form1;
       FreeBoton2[i].Caption:= letras[i];
       left:=left+20;
       if(i=10) then
       begin
        top:=top+25;
        left:=50;
       end;
        if(i=18) then
        begin
          top:=top+25;
          left:=50;
        end;
        freeboton2[i].Top:=top;
        freeboton2[i].left:=left;
        freeboton2[i].onClick:= idatzi;

      end;
end;

{procedure TTeclado.escribir(letra:string);
begin
    if(mayus=0) then
    Text:= Text+ letra

    else
    Text:= Text+'a' ;//mirar lod e minuscula y mayuscula
end;}

procedure TTeclado.idatzi(objeto: Tobject);
begin
 // if(mayus=0) then
  if assigned (OnPulsarboton ) then
    OnPulsarBoton(TFreeBoton(objeto).Caption);
end;

{procedure TTeclado.llamarCreate(Sender: Tobject);
begin
      Sender.Create();
end;
}
end.
