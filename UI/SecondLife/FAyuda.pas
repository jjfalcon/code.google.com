unit FAyuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, GLMisc, GLTexture, GLBumpShader;

type
  TFormAyuda = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Im_medio: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Im_cerrar: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    ImageListcerrar: TImageList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList4: TImageList;
    Image7: TImage;
    Shape1: TShape;
    Edit1: TEdit;
    ImageListmini: TImageList;
    Image13: TImage;
    procedure Im_cerrarClick(Sender: TObject);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
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
  FormAyuda: TFormAyuda;

implementation

{$R *.dfm}

procedure TFormAyuda.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAyuda.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormAyuda.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_cerrar, ImageListcerrar, False);
  ChangeImage(Image8, ImageListmini, False);
  ChangeImage(Image9, ImageList1, False);
  ChangeImage(Image12, ImageList2, False);
  ChangeImage(Image11, ImageList3, False);
  ChangeImage(Image10, ImageList4, False);
  ImageOver := nil;
end;

procedure TFormAyuda.Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAyuda.Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAyuda.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormAyuda.Image8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAyuda.Image8MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListmini, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Image8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAyuda.Image9MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(Image9, ImageList1, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Image12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(Image12, ImageList2, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Image11MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(Image11, ImageList3, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Image10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(Image10, ImageList4, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAyuda.Image13MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

end.
