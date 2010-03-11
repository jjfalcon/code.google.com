unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uGradient;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with TGradiente.Create(self) do
  try
    //crear
    parent := self;
    top    := 0;
    top    := 0;
    width  := 400;
    height := 100;

    //configurar
    Direccion  := dVertical;
    ColorDesde := clWhite;
    ColorHasta := clBlack;
    Align      := alClient;
  finally
  end;
end;

end.
