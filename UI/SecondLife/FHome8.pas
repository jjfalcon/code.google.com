unit FHome8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome8 = class(TForm)
    Panelhome8: TPanel;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image42MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome8: TFormHome8;

implementation

{$R *.dfm}

procedure TFormHome8.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

procedure TFormHome8.Image42MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

end.
