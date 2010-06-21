unit FHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls;

type
  TFormHome = class(TForm)
    ImageListayuda: TImageList;
    PanelFondo: TPanel;
    PanelTop: TPanel;
    Image1: TImage;
    Image2: TImage;
    Im_ayuda: TImage;
    PanelTop2: TPanel;
    Image3: TImage;
    Im_atras: TImage;
    Im_h1: TImage;
    Splitter1: TSplitter;
    Im_h2: TImage;
    Im_h3: TImage;
    Im_h4: TImage;
    Im_h5: TImage;
    Im_h6: TImage;
    Im_h7: TImage;
    Im_h8: TImage;
    PanelClient1: TPanel;
    Image13: TImage;
    Panelclient: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image14: TImage;
    ImageListH1: TImageList;
    ImageListH2: TImageList;
    Image15: TImage;
    Image16: TImage;
    ImageListH3: TImageList;
    ImageListH4: TImageList;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    ImageListH5: TImageList;
    ImageListH6: TImageList;
    ImageListH7: TImageList;
    ImageListH8: TImageList;
    ImageListatras: TImageList;
    procedure Im_ayudaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_ayudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ayudaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Im_atrasClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_atrasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_atrasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_atrasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_ayudaClick(Sender: TObject);
  private
    ImageOver : TImage;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
    procedure ResetImages2;
    procedure ResetTitles;
    procedure ResetPanel;
    procedure Forhome1;
    procedure Forhome2;
    procedure Forhome3;
    procedure Forhome4;
    procedure Forhome5;
    procedure Forhome6;
    procedure Forhome7;
    procedure Forhome8;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

uses FMain, FHome1, FHome2, FHome3, FHome4, FHome5, FHome6, FHome7, FHome8, FAyuda;

{$R *.dfm}

procedure TFormHome.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormHome.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_ayuda, ImageListayuda, False);
  ChangeImage(Im_atras, ImageListatras, False);
  ImageOver := nil;
end;

procedure TFormHome.ResetImages2;
begin
  if ImageOver = nil then exit;
  ChangeImage(Image14, ImageListH1, False);
  ChangeImage(Image6, ImageListH2, False);
  ChangeImage(Image7, ImageListH3, False);
  ChangeImage(Image8, ImageListH4, False);
  ChangeImage(Image9, ImageListH5, False);
  ChangeImage(Image10, ImageListH6, False);
  ChangeImage(Image11, ImageListH7, False);
  ChangeImage(Image12, ImageListH8, False);
  ImageOver := nil;
end;

procedure TFormHome.ResetTitles;
begin
  Im_h1.visible := False;
  Im_h2.visible := False;
  Im_h3.visible := False;
  Im_h4.visible := False;
  Im_h5.visible := False;
  Im_h6.visible := False;
  Im_h7.visible := False;
  Im_h8.visible := False;
end;

procedure TFormHome.ResetPanel;
begin
  PanelClient.visible := False;
  PanelClient1.visible := False;
  PanelClient1.SendToBack;
  FormHome1.Close;
  FormHome2.Close;
  FormHome3.Close;
  FormHome4.Close;
  FormHome5.Close;
  FormHome6.Close;
  FormHome7.Close;
  FormHome8.Close;
end;

procedure TFormHome.Im_ayudaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHome.Im_ayudaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListayuda, True);
  ImageOver := TImage(Sender);
end;

procedure TFormHome.Im_ayudaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHome.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ResetImages;
  FormMain.ResetImages3;
end;

procedure TFormHome.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ResetImages2;
  FormMain.ResetImages3;
end;

procedure TFormHome.Image14MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = Image14 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image14, ImageListH1, True);
  ImageOver := Image14;
end;

procedure TFormHome.Image6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = Image6 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image6, ImageListH2, True);
  ImageOver := Image6;
end;

procedure TFormHome.Image7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = Image7 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image7, ImageListH3, True);
  ImageOver := Image7;
end;

procedure TFormHome.Image8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = Image8 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image8, ImageListH4, True);
  ImageOver := Image8;
end;

procedure TFormHome.Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = Image9 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image9, ImageListH5, True);
  ImageOver := Image9;
end;

procedure TFormHome.Image10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = Image10 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image10, ImageListH6, True);
  ImageOver := Image10;
end;

procedure TFormHome.Image11MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = Image11 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image11, ImageListH7, True);
  ImageOver := Image11;
end;

procedure TFormHome.Image12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = Image12 then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(Image12, ImageListH8, True);
  ImageOver := Image12;
end;

procedure TFormHome.FormCreate(Sender: TObject);
begin
  PanelTop2.Visible := False;
  Panelclient.Visible := true;
end;

procedure TFormHome.Image5Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome1;
  ResetTitles;
  Im_h1.visible := True;
end;

procedure TFormHome.Image6Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome2;
  ResetTitles;
  Im_h2.visible := True;
end;

procedure TFormHome.Image7Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome3;
  ResetTitles;
  Im_h3.visible := True;
end;

procedure TFormHome.Image8Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome4;
  ResetTitles;
  Im_h4.visible := True;
end;

procedure TFormHome.Image9Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome5;
  ResetTitles;
  Im_h5.visible := True;
end;

procedure TFormHome.Image10Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome6;
  ResetTitles;
  Im_h6.visible := True;
end;

procedure TFormHome.Image11Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  ForHome7;
  ResetTitles;
  Im_h7.visible := True;
end;

procedure TFormHome.Image12Click(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := True;
  PanelClient1.Visible := True;
  PanelClient1.BringToFront;
  forHome8;
  ResetTitles;
  Im_h8.visible := True;
end;

procedure TFormHome.Im_atrasClick(Sender: TObject);
begin
  ResetPanel;
  PanelTop2.Visible := False;
  PanelClient.Visible := True;
end;

procedure TFormHome.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMain.ResetImages3;
end;

procedure TFormHome.Forhome1;
begin
  FHome1.TFormHome1.Create(Self);
  FormHome1.Parent := PanelClient1;
  FormHome1.Align := alNone;
  FormHome1.Visible := True;
  FormHome1.Top := 0;
  FormHome1.Left := 11;
  FormHome1.Show;
end;

procedure TFormHome.Forhome2;
begin
  FHome2.TFormHome2.Create(Self);
  FormHome2.Parent := PanelClient1;
  FormHome2.Align := alNone;
  FormHome2.Visible := True;
  FormHome2.Top := 0;
  FormHome2.Left := 11;
  FormHome2.Show;
end;

procedure TFormHome.Forhome3;
begin
  FHome3.TFormHome3.Create(Self);
  FormHome3.Parent := PanelClient1;
  FormHome3.Align := alNone;
  FormHome3.Visible := True;
  FormHome3.Top := 0;
  FormHome3.Left := 11;
  FormHome3.Show;
end;

procedure TFormHome.Forhome4;
begin
  FHome4.TFormHome4.Create(Self);
  FormHome4.Parent := PanelClient1;
  FormHome4.Align := alNone;
  FormHome4.Visible := True;
  FormHome4.Top := 0;
  FormHome4.Left := 11;
  FormHome4.Show;
end;

procedure TFormHome.Forhome5;
begin
  FHome5.TFormHome5.Create(Self);
  FormHome5.Parent := PanelClient1;
  FormHome5.Align := alNone;
  FormHome5.Visible := True;
  FormHome5.Top := 0;
  FormHome5.Left := 11;
  FormHome5.Show;
end;

procedure TFormHome.Forhome6;
begin
  FHome6.TFormHome6.Create(Self);
  FormHome6.Parent := PanelClient1;
  FormHome6.Align := alNone;
  FormHome6.Visible := True;
  FormHome6.Top := 0;
  FormHome6.Left := 11;
  FormHome6.Show;
end;

procedure TFormHome.Forhome7;
begin
  FHome7.TFormHome7.Create(Self);
  FormHome7.Parent := PanelClient1;
  FormHome7.Align := alNone;
  FormHome7.Visible := True;
  FormHome7.Top := 0;
  FormHome7.Left := 11;
  FormHome7.Show;
end;

procedure TFormHome.Forhome8;
begin
  FHome8.TFormHome8.Create(Self);
  FormHome8.Parent := PanelClient1;
  FormHome8.Align := alNone;
  FormHome8.Visible := True;
  FormHome8.Top := 0;
  FormHome8.Left := 11;
  FormHome8.Show;
end;

procedure TFormHome.Im_atrasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListatras.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHome.Im_atrasMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = Im_atras then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(Im_atras, ImageListatras, True);
  ImageOver := Im_atras;
end;

procedure TFormHome.Im_atrasMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListatras.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormHome.Im_ayudaClick(Sender: TObject);
begin
  with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
