unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,MyListBox,Dialogs,
  StdCtrls,Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    MyListBox11: TMyListBox1;
    MyListBox12: TMyListBox1;
    MyListBox13: TMyListBox1;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var  FileName,filename1,filename2: string;
begin
     //FileName1:= 'C:\Documents and Settings\Administrador\Escritorio\Componente ListBox\años.log';
      FileName1:= 'C:\Documents and Settings\Administrador\Escritorio\Componente ListBox\años.log';
//      MyListBox12.LoadListFromFile(ExtractFilePath('años.log')));
     MyListBox12.LoadListFromFile(ExtractFilePath(Application.ExeName)+ '\' + 'años.log');

     FileName := 'C:\Documents and Settings\Administrador\Escritorio\Componente ListBox\meses.log';
     MyListBox11.LoadListFromFile(ExtractFilePath(Application.ExeName)+ '\' + 'meses.log');

     FileName2:= 'C:\Documents and Settings\Administrador\Escritorio\Componente ListBox\dias.log';
     MyListBox13.LoadListFromFile(ExtractFilePath(Application.ExeName)+ '\' + 'dias.log');

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  x:integer;
begin
     x:=strtoint(Edit1.Text);
     MyListBox11.cambiarVelocidad(x);
     MyListBox12.cambiarVelocidad(x);
     MyListBox13.cambiarVelocidad(x);
end;


end.
