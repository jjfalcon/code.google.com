unit FAdminMarc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, Menus;

type
  TFormAdminMarc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Panel4: TPanel;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Im_mini: TImage;
    Im_maxi: TImage;
    Im_cerrar: TImage;
    Image13: TImage;
    ImLst_mini: TImageList;
    ImLst_maxi: TImageList;
    ImLst_cerrar: TImageList;
    Edit1: TEdit;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    ImLst_orga: TImageList;
    ImLst_herra: TImageList;
    ImLst_sincro: TImageList;
    PUMenu_herra: TPopupMenu;
    PUMenu_orga: TPopupMenu;
    Cambiarnombre1: TMenuItem;
    Eliminar1: TMenuItem;
    Mostrarenlacarpeta1: TMenuItem;
    N1: TMenuItem;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    N2: TMenuItem;
    Reordenarporttulo1: TMenuItem;
    N3: TMenuItem;
    Aadirpgina1: TMenuItem;
    Aadircarpeta1: TMenuItem;
    Importarmarcadores1: TMenuItem;
    Exportarmarcadores1: TMenuItem;
    procedure Im_miniMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_miniMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ResetImages;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure Im_miniMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_maxiMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_miniClick(Sender: TObject);
    procedure Im_maxiClick(Sender: TObject);
    procedure Im_cerrarClick(Sender: TObject);
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image15MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image15MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image16Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
  private
  ImageOver : TImage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdminMarc: TFormAdminMarc;

implementation

{$R *.dfm}

uses
  FSincroMarca;

procedure TFormAdminMarc.Im_miniMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Im_miniMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Im_maxiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
    else TImage(Sender).Tag := 4;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_maxi.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Im_maxiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_maxi.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
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

procedure TFormAdminMarc.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_maxi, ImLst_maxi, False);
  ChangeImage(Im_mini, ImLst_mini, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  ChangeImage(Image15, ImLst_orga, False);
  ChangeImage(Image14, ImLst_herra, False);
  ChangeImage(Image16, ImLst_sincro, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormAdminMarc.Im_miniMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_mini, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Im_maxiMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_maxi, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Im_miniClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFormAdminMarc.Im_maxiClick(Sender: TObject);
begin
  if WindowState = wsNormal then WindowState := wsMaximized
  else if WindowState = wsMaximized then WindowState := wsNormal;
end;

procedure TFormAdminMarc.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAdminMarc.Image13MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TFormAdminMarc.Image8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormAdminMarc.Image15MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_orga.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Image15MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_orga.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Image14MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_herra.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormAdminMarc.Image14MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_herra.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;


procedure TFormAdminMarc.Image15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_orga, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Image14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_herra, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Image16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_sincro, True);
  ImageOver := TImage(Sender);
end;

procedure TFormAdminMarc.Image16Click(Sender: TObject);
begin
  Close;
  with FSincroMarca.TFormSincroMarca.Create(nil) do
  try
    Show;
    ChangeImage(Image16, ImLst_sincro, False);
  finally
  end;
end;

procedure TFormAdminMarc.Image15Click(Sender: TObject);
begin
  ChangeImage(Image15, ImLst_orga, False);
  ChangeImage(Image14, ImLst_herra, False);
  PUMenu_orga.Popup
  (TControl(Sender).ClientOrigin.X+TControl(Sender).Width,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height-5);
end;

procedure TFormAdminMarc.Image14Click(Sender: TObject);
begin
  ChangeImage(Image15, ImLst_orga, False);
  ChangeImage(Image14, ImLst_herra, False);
  PUMenu_herra.Popup
  (TControl(Sender).ClientOrigin.X+TControl(Sender).Width,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height-5);
end;

end.
