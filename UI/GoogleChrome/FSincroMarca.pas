unit FSincroMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls;

type
  TFormSincroMarca = class(TForm)
    Im_fondo: TImage;
    Im_aceptar: TImage;
    Im_cerrar: TImage;
    ImLst_cerrar: TImageList;
    ImLst_aceptar: TImageList;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Image2: TImage;
    Image3: TImage;
    ImLst_txt: TImageList;
    ImageList1: TImageList;
    Image4: TImage;
    procedure Im_aceptarClick(Sender: TObject);
    procedure Im_fondoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_aceptarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_aceptarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_aceptarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  ImageOver : TImage;
  procedure ResetImages;
  procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSincroMarca: TFormSincroMarca;

implementation

{$R *.dfm}

procedure TFormSincroMarca.Im_aceptarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSincroMarca.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
  img.Tag := 2;
  if Selected then img.Tag := 1;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(img.Tag, img.Picture.Bitmap);
end;

procedure TFormSincroMarca.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_aceptar, ImLst_aceptar, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  ChangeImage(Image4, ImageList1, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormSincroMarca.Im_aceptarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormSincroMarca.Im_aceptarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_aceptar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormSincroMarca.Im_aceptarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormSincroMarca.Im_fondoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormSincroMarca.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormSincroMarca.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormSincroMarca.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormSincroMarca.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TFormSincroMarca.Edit1Enter(Sender: TObject);
begin
  Image3.Picture.Bitmap := nil;
  ImLst_txt.GetBitmap(0, Image3.Picture.Bitmap);
end;

procedure TFormSincroMarca.Edit2Enter(Sender: TObject);
begin
  Image2.Picture.Bitmap := nil;
  ImLst_txt.GetBitmap(0, Image2.Picture.Bitmap);
end;

procedure TFormSincroMarca.Edit2Exit(Sender: TObject);
begin
  Image2.Picture.Bitmap := nil;
  ImLst_txt.GetBitmap(1, Image2.Picture.Bitmap);
end;

procedure TFormSincroMarca.Edit1Exit(Sender: TObject);
begin
  Image3.Picture.Bitmap := nil;
  ImLst_txt.GetBitmap(1, Image3.Picture.Bitmap);
end;

procedure TFormSincroMarca.Image4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormSincroMarca.Image4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList1, True);
  ImageOver := TImage(Sender);
end;

procedure TFormSincroMarca.Image4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

end.
