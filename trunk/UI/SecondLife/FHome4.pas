unit FHome4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome4 = class(TForm)
    Panelhome4: TPanel;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Image30MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome4: TFormHome4;

implementation

{$R *.dfm}

procedure TFormHome4.Image30MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

procedure TFormHome4.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

end.
