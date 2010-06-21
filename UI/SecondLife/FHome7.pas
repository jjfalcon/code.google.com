unit FHome7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome7 = class(TForm)
    Panelhome7: TPanel;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image38MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome7: TFormHome7;

implementation

{$R *.dfm}

procedure TFormHome7.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

procedure TFormHome7.Image38MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

end.
