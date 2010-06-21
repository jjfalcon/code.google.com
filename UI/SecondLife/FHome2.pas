unit FHome2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome2 = class(TForm)
    PanelHome2: TPanel;
    Image15: TImage;
    Image18: TImage;
    Image19: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Image19MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome2: TFormHome2;

implementation

{$R *.dfm}

procedure TFormHome2.Image19MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

procedure TFormHome2.Im_BMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

end.
