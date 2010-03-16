unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uSpotifyTrackBar, uDigitalDisplay,
  Dialogs, ComCtrls, ExtCtrls, jpeg, Buttons, StdCtrls;

type
  TFormMain = class(TForm)
    TrackBar1: TTrackBar;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
    sb : TSlideBar;
    dd : TDigitalDisplay;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses

  uImageButton,
  uGradient;

procedure TFormMain.FormCreate(Sender: TObject);
begin
(*
  mg := TMultiGauge.Create(self);
  mg.Parent := self;
*)

  with TImageButton.Create(self) do
  try
    parent  := panel1;//self;
    left    := 360;
    width   := 200;
    height  := 50;
    onoff   := false;
    enabled := true;
    Transparent := true;
    Autosize := true;
    Hint := 'otra prueba';

    BitmapUp.LoadFromFile(ExtractFilePath(Application.ExeName)      +'bmp1.bmp');
    BitmapDown.LoadFromFile(ExtractFilePath(Application.ExeName)    +'bmp2.bmp');
    BitmapOver.LoadFromFile(ExtractFilePath(Application.ExeName)    +'bmp3.bmp');
    BitmapDisabled.LoadFromFile(ExtractFilePath(Application.ExeName)+'bmp4.bmp');
  finally
  end;
(*
  with TGradiente.Create(self) do
  try
    //crear
    parent := self;
    top    := 0;
    top    := 0;
    width  := 100;
    height := 100;

    //configurar
    Direccion  := dVertical;
    ColorDesde := clWhite;
    ColorHasta := clBlack;
//    Align      := alClient;
  finally
  end;
*)
  dd :=TDigitalDisplay.Create(self);
  with dd do
  begin
    parent := panel1;
//    BringToFront;
    Transparent := true;
    top    := 5;
    left   := 400;
    width  := 200;
    height := 30;
  end;

  sb := TSpotifySlideBar.Create(self);
  with sb do
  begin
    //crear
    parent := panel1;
//    BringToFront;

    Anchors := [akLeft];
    left := 95;
    top := top+8;
    Height := 70;
    Width  := 26;
//    Align := alClient;
    kind := sbHorizontal;
(*
    top    := 0;
    left   := 0;
    width  := 40;
    height := 400;

    //configurar
    kind := sbHorizontal;
    Min := 0;
    Max := 100;
    Step := 1;
    Position := 0;
*)
  end;
end;

procedure TFormMain.TrackBar1Change(Sender: TObject);
begin
//  mg.Valor := trackbar1.position;
  sb.position := trackbar1.position;
  dd.value := IntToStr(trackbar1.position);
end;

end.
