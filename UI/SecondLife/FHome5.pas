unit FHome5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome5 = class(TForm)
    Panelhome5: TPanel;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Im_AMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image26MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome5: TFormHome5;

implementation

{$R *.dfm}

procedure TFormHome5.Im_AMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

procedure TFormHome5.Image26MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

end.
