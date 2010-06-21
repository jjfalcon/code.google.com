unit FHome1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, jpeg;

type
  TFormHome1 = class(TForm)
    Panelhome1: TPanel;
    Image14: TImage;
    Image16: TImage;
    Image17: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome1: TFormHome1;

implementation

{$R *.dfm}

procedure TFormHome1.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
 end;
end;

procedure TFormHome1.Image17MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
 end;
end;

end.

