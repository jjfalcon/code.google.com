unit FComprar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList;

type
  TFormComprar = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Edit1: TEdit;
    Image4: TImage;
    Im_cerrar: TImage;
    Im_ayuda: TImage;
    Label1: TLabel;
    Image7: TImage;
    Image8: TImage;
    ImageListayuda: TImageList;
    ImageListcerrar: TImageList;
    Image5: TImage;
    Image6: TImage;
    ImageListcomprar: TImageList;
    ImageListcancelar: TImageList;
    procedure Edit1Change(Sender: TObject);
    procedure Im_cerrarClick(Sender: TObject);
    procedure Im_ayudaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_ayudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ayudaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Im_ayudaClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
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
  FormComprar: TFormComprar;

implementation

uses FAyuda;
{$R *.dfm}

procedure TFormComprar.Edit1Change(Sender: TObject);
begin
  Label1.Caption := Edit1.Text + ' L$';
  Edit1.MaxLength := 15;
end;

procedure TFormComprar.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormComprar.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormComprar.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_ayuda, ImageListayuda, False);
  ChangeImage(Im_cerrar, ImageListcerrar, False);
  ChangeImage(Image5, ImageListcancelar, False);
  ChangeImage(Image6, ImageListcomprar, False);
  ImageOver := nil;
end;

procedure TFormComprar.Im_ayudaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(0, TImage(Sender).Picture.Bitmap)
end;

procedure TFormComprar.Im_ayudaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListayuda, True);
  ImageOver := TImage(Sender);
end;

procedure TFormComprar.Im_ayudaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormComprar.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormComprar.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Image6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcomprar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Image6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcomprar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormComprar.Image6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcomprar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Image5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcancelar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Image5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcancelar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormComprar.Image5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcancelar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormComprar.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Invalid key');
    Key := #0;
  end;
end;

procedure TFormComprar.Im_ayudaClick(Sender: TObject);
begin
with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
end;
end;



procedure TFormComprar.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

end.
