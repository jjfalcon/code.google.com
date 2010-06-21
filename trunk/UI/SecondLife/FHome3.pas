unit FHome3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormHome3 = class(TForm)
    PanelHome3: TPanel;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Im_A: TImage;
    Im_B: TImage;
    procedure Image22MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_AMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome3: TFormHome3;

implementation

{$R *.dfm}

procedure TFormHome3.Image22MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = False then begin
  Im_A.Visible := True;
  Im_B.Visible := False;
  end;
end;

procedure TFormHome3.Im_AMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If Im_A.Visible = True then begin
  Im_A.Visible := False;
  Im_B.Visible := True;
  end;
end;

end.
