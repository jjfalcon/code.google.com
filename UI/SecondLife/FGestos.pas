unit FGestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList;

type
  TFormGestos = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ImageListayuda: TImageList;
    ImageListcerrar: TImageList;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    ImageOver : TImage;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGestos: TFormGestos;

implementation

{$R *.dfm}
uses FAyuda, FMain;

procedure TFormGestos.Image2Click(Sender: TObject);
begin
  FormMain.Im_gestos.Tag := 5;
  FormMain.Im_gestos.Picture.Bitmap := nil;
  FormMain.ImageListgestionar.GetBitmap(FormMain.Im_gestos.Tag, FormMain.Im_gestos.Picture.Bitmap);
  Close;
end;

procedure TFormGestos.Image3Click(Sender: TObject);
begin
  with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFormGestos.Image3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGestos.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormGestos.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
  If img.Tag = 2 then if selected = False then exit;
  If img.Tag = 5 then if selected = False then exit;
  if img.Tag > 2 then img.Tag := 5
  else img.Tag := 2;
  if Selected then
  begin
    if img.Tag > 2 then img.Tag := 4
    else img.Tag := 1;
  end;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(img.Tag, img.Picture.Bitmap);
end;

procedure TFormGestos.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Image3, ImageListayuda, False);
  ChangeImage(Image2, ImageListcerrar, False);
  ImageOver := nil;
end;

procedure TFormGestos.Image3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListayuda, True);
  ImageOver := TImage(Sender);
end;

procedure TFormGestos.Image3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGestos.Image2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGestos.Image2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormGestos.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

end.
