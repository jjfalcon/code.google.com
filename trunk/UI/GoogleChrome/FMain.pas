unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Menus, Buttons, XPMan, ImgList;

type
  TFormMain = class(TForm)
    PanelTop: TPanel;
    PanelClient: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    PanelBody: TPanel;
    Image4: TImage;
    PanelUp: TPanel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image11: TImage;
    Image12: TImage;
    Image9: TImage;
    Image10: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList4: TImageList;
    ImageList5: TImageList;
    ImageList6: TImageList;
    ImageList7: TImageList;
    ImageList8: TImageList;
    Image22: TImage;
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image18MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image20MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image20MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image17MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image15MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image15MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image16MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image16MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image19MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image20MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image18MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    Funciona : boolean;
    Funciona2 : boolean;
    { Private declarations }

    AllButtonsDisabled : boolean;
    ImageOver : TImage;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.Image13MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList3.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList3.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image18MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList4.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image18MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList4.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image20MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList6.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image20MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList6.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image19MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList7.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image19MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList7.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image17MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList8.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image17MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList8.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image15MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Funciona = False then exit;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image15MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Funciona = False then exit;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image14MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Funciona2 = False then exit;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList2.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image14MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Funciona2 = False then exit;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList2.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image16MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    2: TImage(Sender).Tag := 0;
    5: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList5.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image16MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 5;
    3: TImage(Sender).Tag := 2;
    else TImage(Sender).Tag := 5;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList5.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image19MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList7, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ResetImages;
end;

procedure TFormMain.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
var
  index : integer;
begin
  if not img.enabled then exit;
  index := 2;
  if Selected then index := 1;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(index, img.Picture.Bitmap);
end;

procedure TFormMain.Image17MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList8, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image20MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList6, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image18MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList4, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image13MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList3, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image14MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList2, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Image15MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageList1, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.ResetImages;
begin
//  if AllButtonsDisabled then exit;
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Image17, ImageList8, False);
  ChangeImage(Image19, ImageList7, False);
  ChangeImage(Image15, ImageList1, False);
  ChangeImage(Image14, ImageList2, False);
  ChangeImage(Image13, ImageList3, False);
  ChangeImage(Image18, ImageList4, False);
  ChangeImage(Image20, ImageList6, False);
  //anotar que estan desmarcados
  ImageOver := nil;
//  AllButtonsDisabled := true;
end;

end.
