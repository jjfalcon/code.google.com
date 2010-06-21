unit FPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList;

type
  TFormPerfil = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Image3: TImage;
    Panel3: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Im_destacados: TImage;
    Im_perfil: TImage;
    ImageListPerfil: TImageList;
    ImageListdestacados: TImageList;
    procedure Im_destacadosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_destacadosMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_destacadosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_perfilMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_perfilMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_perfilMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image7Click(Sender: TObject);
  private
  ImageOver : Timage;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPerfil: TFormPerfil;

implementation

uses FAyuda;

{$R *.dfm}

procedure TFormPerfil.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormPerfil.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_Destacados, ImageListdestacados, False);
  ChangeImage(Im_perfil, ImageListperfil, False);
  ImageOver := nil;
end;

procedure TFormPerfil.Im_destacadosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListdestacados.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormPerfil.Im_destacadosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListdestacados, True);
  ImageOver := TImage(Sender);
end;

procedure TFormPerfil.Im_destacadosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListdestacados.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If Im_destacados.tag = 4 then begin
  panel3.visible := False;
  end else
  begin
  panel2.Visible := False;
  Panel3.visible := True;
  Im_perfil.tag := 4;
  Im_perfil.Picture.Bitmap := nil;
  ImageListperfil.GetBitmap(Im_perfil.Tag+1, Im_perfil.Picture.Bitmap);
  end;
end;

procedure TFormPerfil.Im_perfilMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListperfil.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormPerfil.Im_perfilMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListperfil, True);
  ImageOver := TImage(Sender);
end;

procedure TFormPerfil.Im_perfilMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListperfil.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If Im_perfil.tag = 4 then begin
  panel2.Visible := False;
  end else
  begin
  panel2.Visible := True;
  Panel3.visible := False;
  Im_destacados.tag := 4;
  Im_destacados.Picture.Bitmap := nil;
  ImageListdestacados.GetBitmap(Im_destacados.Tag+1, Im_destacados.Picture.Bitmap);
  end;
end;

procedure TFormPerfil.Image4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormPerfil.Image7Click(Sender: TObject);
begin
with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
end;
end;

end.
