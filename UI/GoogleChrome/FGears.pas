unit FGears;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls;

type
  TFormGears = class(TForm)
    Im_fondo: TImage;
    Im_aceptar: TImage;
    Im_cancelar: TImage;
    Im_cerrar: TImage;
    ImLst_aceptar: TImageList;
    ImLst_cancelar: TImageList;
    ImLst_cerrar: TImageList;
    Image1: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure Im_aceptarClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_aceptarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_aceptarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cancelarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cancelarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_aceptarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
  ImageOver : TImage;
  procedure ResetImages;
  procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGears: TFormGears;

implementation

{$R *.dfm}

procedure TFormGears.Im_aceptarClick(Sender: TObject);
begin
  close;
end;

procedure TFormGears.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TFormGears.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormGears.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
  img.Tag := 2;
  if Selected then img.Tag := 1;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(img.Tag, img.Picture.Bitmap);
end;

procedure TFormGears.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_aceptar, ImLst_aceptar, False);
  ChangeImage(Im_cancelar, ImLst_cancelar, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormGears.Im_aceptarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_aceptarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_cancelarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cancelar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_cancelarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cancelar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormGears.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormGears.Im_cancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cancelar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormGears.Im_aceptarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_aceptar, True);
  ImageOver := TImage(Sender);
end;

end.
