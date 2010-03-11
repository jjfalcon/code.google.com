unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uSpotifyTrackBar, uDigitalDisplay,
  Dialogs, ComCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
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
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  dd :=TDigitalDisplay.Create(self);
  with dd do
  begin
    parent := panel1;
    BringToFront;
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
    Anchors := [akLeft];

    BringToFront;
    left := 95;
    top := top+8;
//    top  := image1.Top + 20;
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

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  sb.position := trackbar1.position;
  dd.value := IntToStr(trackbar1.position);
end;

end.
