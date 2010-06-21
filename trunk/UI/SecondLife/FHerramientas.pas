unit FHerramientas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList;

type
  TFormHerramientas = class(TForm)
    Image1: TImage;
    Im_cerrar: TImage;
    Im_ayuda: TImage;
    ImageListayuda: TImageList;
    ImageListcerrar: TImageList;
    Im_ok: TImage;
    Im_cancelar: TImage;
    ImageListok: TImageList;
    ImageListcancel: TImageList;
    Image2: TImage;
    ImageListcheck: TImageList;
    Image3: TImage;
    Image4: TImage;
    Im_barra: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    ImageListbola: TImageList;
    Image12: TImage;
    procedure Im_cerrarClick(Sender: TObject);
    procedure Im_ayudaClick(Sender: TObject);
    procedure Im_ayudaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_ayudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ayudaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cancelarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cancelarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_okMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_okMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_okMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image11MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  FSMove : boolean;
  ImageOver : TImage;
  procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
  procedure ResetImages;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHerramientas: TFormHerramientas;

implementation

{$R *.dfm}
uses FAyuda;

procedure TFormHerramientas.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormHerramientas.Im_ayudaClick(Sender: TObject);
begin
   with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
end;
end;

procedure TFormHerramientas.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormHerramientas.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_cerrar, ImageListcerrar, False);
  ChangeImage(Im_ayuda, ImageListayuda, False);
  ChangeImage(Im_cancelar, ImageListcancel, False);
  ChangeImage(Im_ok, ImageListok, False);
  ImageOver := nil;
end;

procedure TFormHerramientas.Im_ayudaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_ayudaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListayuda, True);
  ImageOver := TImage(Sender)
end;

procedure TFormHerramientas.Im_ayudaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormHerramientas.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;



procedure TFormHerramientas.Im_cancelarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcancel.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_cancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcancel, True);
  ImageOver := TImage(Sender);
end;

procedure TFormHerramientas.Im_cancelarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcancel.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_okMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListok.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Im_okMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListok, True);
  ImageOver := TImage(Sender);
end;

procedure TFormHerramientas.Im_okMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListok.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Image2Click(Sender: TObject);
begin
If TImage(Sender).tag = 1 then TImage(Sender).tag := 0 else TImage(Sender).Tag := 1;
TImage(Sender).Picture.Bitmap := nil;
ImageListcheck.GetBitmap(TImage(Sender).tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Image11MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FSMove := true;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbola.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Image11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  if not FSMove then exit;
  newX := Image11.left+x;
  if newx < (Image7.left+1) then newX := Image7.left;
  if newx > (Image7.left + Image7.width - Image11.width) then newX := (Image7.left + Image7.width - Image11.width);
  Image11.left := newX;
end;

procedure TFormHerramientas.Image11MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FSMove := false;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbola.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHerramientas.Image12MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

end.
