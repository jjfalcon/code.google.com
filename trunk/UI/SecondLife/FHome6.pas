unit FHome6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome6 = class(TForm)
    Panelhome6: TPanel;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Image34MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome6: TFormHome6;

implementation

{$R *.dfm}

procedure TFormHome6.Image34MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

procedure TFormHome6.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

end.
