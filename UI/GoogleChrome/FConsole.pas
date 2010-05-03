unit FConsole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList;

type
  TFormConsole = class(TForm)
    PanelTop: TPanel;
    Image7: TImage;
    Image5: TImage;
    Image6: TImage;
    Image12: TImage;
    Im_cerrar: TImage;
    Im_maxi: TImage;
    Im_mini: TImage;
    Edit1: TEdit;
    PanelRight: TPanel;
    Image4: TImage;
    Image3: TImage;
    PanelTopTop: TPanel;
    PanelDown: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Panelclient: TPanel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    ImLst_mini: TImageList;
    ImLst_maxi: TImageList;
    ImLst_cerrar: TImageList;
    procedure Image12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_miniMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_miniMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_maxiMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_miniMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarClick(Sender: TObject);
    procedure Im_miniClick(Sender: TObject);
    procedure Im_maxiClick(Sender: TObject);
  private
  ImageOver : TImage;
  procedure ResetImages;
  procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsole: TFormConsole;

implementation

{$R *.dfm}

procedure TFormConsole.Image12MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TFormConsole.Im_miniMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormConsole.Im_miniMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormConsole.Im_maxiMouseDown(Sender: TObject;
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

procedure TFormConsole.Im_maxiMouseUp(Sender: TObject;
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

procedure TFormConsole.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormConsole.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormConsole.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormConsole.Im_maxiMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_maxi, True);
  ImageOver := TImage(Sender);
end;

procedure TFormConsole.Im_miniMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_mini, True);
  ImageOver := TImage(Sender);
end;

procedure TFormConsole.Image6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormConsole.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormConsole.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_maxi, ImLst_maxi, False);
  ChangeImage(Im_mini, ImLst_mini, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormConsole.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormConsole.Im_miniClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFormConsole.Im_maxiClick(Sender: TObject);
begin
  if WindowState = wsNormal then WindowState := wsMaximized
  else if WindowState = wsMaximized then WindowState := wsNormal;
end;

end.
