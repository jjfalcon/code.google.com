unit FErrores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls;

type
  TFormErrores = class(TForm)
    Im_fondo: TImage;
    Im_cancelar: TImage;
    Im_enviar: TImage;
    Im_cerrar: TImage;
    ImLst_cerrar: TImageList;
    ImLst_enviar: TImageList;
    ImLst_cancelar: TImageList;
    Image1: TImage;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    procedure Im_cerrarClick(Sender: TObject);
    procedure Im_fondoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cancelarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cancelarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_enviarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_enviarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_enviarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
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
  FormErrores: TFormErrores;

implementation

{$R *.dfm}

procedure TFormErrores.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormErrores.Im_fondoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormErrores.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
  img.Tag := 2;
  if Selected then img.Tag := 1;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(img.Tag, img.Picture.Bitmap);
end;

procedure TFormErrores.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_enviar, ImLst_enviar, False);
  ChangeImage(Im_cancelar, ImLst_cancelar, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormErrores.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_cancelarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cancelar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_cancelarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cancelar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_enviarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_enviar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_enviarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_enviar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormErrores.Im_enviarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_enviar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormErrores.Im_cancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cancelar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormErrores.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormErrores.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

end.
