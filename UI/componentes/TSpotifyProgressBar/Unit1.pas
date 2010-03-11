unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uSpotifyTrackBar,
  Dialogs, ComCtrls;

type
  TForm1 = class(TForm)
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
    sb : TSlideBar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  sb := TSpotifySlideBar.Create(self);
  with sb do
  begin
    //crear
    parent := self;
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
end;

end.
