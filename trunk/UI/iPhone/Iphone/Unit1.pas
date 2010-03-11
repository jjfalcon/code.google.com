unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,Keyboard1, Myboton1, Calendar, ExtCtrls;


type
  TForm1 = class(TForm)
    Keyboard1: TKeyboard;
    Edit1: TEdit;
    Memo1: TMemo;

    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Text:='';
  Memo1.Text:='';
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  Keyboard1.Visible:=false;
end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
    Keyboard1.Visible:=true;
    Keyboard1.Output := TMemo(sender);
end;  

procedure TForm1.Edit1Click(Sender: TObject);
begin
    Keyboard1.Visible:=true;
    Keyboard1.Output := TEdit(sender);
end;

end.
 