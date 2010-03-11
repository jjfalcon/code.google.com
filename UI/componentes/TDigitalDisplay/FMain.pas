unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  uDigitalDisplay;

procedure TForm1.Button1Click(Sender: TObject);
var
  contador : integer;
begin
  with TDigitalDisplay.Create(self) do
  try
    parent := self;
    top    := 0;
    top    := 0;
    width  := 400;
    height := 100;

    for contador:=0 to 1000 do
    begin
      Value:=IntToStr(Contador);
      sleep(10);
      Application.ProcessMessages;
    end;
  finally
    Free;
  end;
end;


end.
