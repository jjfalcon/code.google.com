unit FOpciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, ComCtrls, StdCtrls, FMain;

type
  TFormOpciones = class(TForm)
    Im_fondo: TImage;
    Im_aceptar: TImage;
    Im_cerrar: TImage;
    ImLst_cerrar: TImageList;
    ImLst_aceptar: TImageList;
    Image1: TImage;
    TabControl1: TTabControl;
    PanelCosas: TPanel;
    Image5: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Image6: TImage;
    Image7: TImage;
    RadioButton5: TRadioButton;
    RadioButton7: TRadioButton;
    Button6: TButton;
    Button7: TButton;
    Panel3: TPanel;
    Label14: TLabel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Button9: TButton;
    Button10: TButton;
    Label8: TLabel;
    Image8: TImage;
    Label11: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    PanelBasico: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Image3: TImage;
    Image4: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    RadioButton6: TRadioButton;
    RadioButton4: TRadioButton;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button4: TButton;
    Button5: TButton;
    PanelAvanzado: TPanel;
    Button8: TButton;
    Panel2: TPanel;
    ScrollBar1: TScrollBar;
    procedure Im_aceptarClick(Sender: TObject);
    procedure Im_aceptarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_aceptarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_aceptarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_fondoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure TabControl1Enter(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
  private
  ImageOver : TImage;
  seleccion : boolean;
  procedure ResetImages;
  procedure Check;
  procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpciones: TFormOpciones;

implementation

{$R *.dfm}

uses
  FSincroMarca,FAvanzado;

procedure TFormOpciones.Im_aceptarClick(Sender: TObject);
begin
  If checkbox1.Checked = True then
    seleccion := True
  else seleccion := False;
  FMain.FormMain.RadioButton1.Checked := seleccion;
  If CheckBox1.checked = True then begin
      FMain.FormMain.Im_inicio.visible := True;
      FMain.FormMain.Im_estrella.Left := 140;
      FMain.FormMain.panel_url.left := 169;
      FMain.FormMain.panel_url.width := FMain.FormMain.Im_play.left - FMain.FormMain.panel_url.left;
    end else begin
      FMain.FormMain.Im_inicio.visible := False;
      FMain.FormMain.Im_estrella.Left := 105;
      FMain.FormMain.panel_url.left := 134;
      FMain.FormMain.panel_url.width := FMain.FormMain.Im_play.left - FMain.FormMain.panel_url.left;
  end;
  Close;
end;

procedure TFormOpciones.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
begin
  if not img.enabled then exit;
  img.Tag := 2;
  if Selected then img.Tag := 1;
  img.Picture.Bitmap := nil;
  imgList.GetBitmap(img.Tag, img.Picture.Bitmap);
end;

procedure TFormOpciones.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_aceptar, ImLst_aceptar, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormOpciones.Im_aceptarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormOpciones.Im_aceptarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_aceptar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormOpciones.Im_aceptarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_aceptar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormOpciones.Im_fondoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormOpciones.Im_cerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormOpciones.Im_cerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormOpciones.Im_cerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormOpciones.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

Procedure TFormOpciones.Check;
begin
  If RadioButton3.checked = True then
  begin
    Edit1.enabled  := True;
    button1.Enabled := True;
    button2.enabled := True;
    button3.enabled := True;
  end else begin
    Edit1.enabled  := False;
    button1.Enabled := False;
    button2.enabled := False;
    button3.enabled := False;
  end;
end;

procedure TFormOpciones.RadioButton3Click(Sender: TObject);
begin
  Check;
end;

procedure TFormOpciones.FormCreate(Sender: TObject);
begin
  Check;
  seleccion := FMain.FormMain.RadioButton1.Checked;
  checkbox1.Checked := seleccion;
end;

procedure TFormOpciones.RadioButton4Click(Sender: TObject);
begin
  If RadioButton4.checked = True then
  begin
    Edit2.enabled  := true;
  end else begin
    Edit2.enabled  := False;
  end;
end;

procedure TFormOpciones.Button6Click(Sender: TObject);
begin
  Close;
  with FSincroMarca.TFormSincroMarca.Create(nil) do
  try
    Show;
  finally
  end;
end;

procedure TFormOpciones.TabControl1Enter(Sender: TObject);
begin
  If TabControl1.TabOrder = 0 then
  begin
    PanelBasico.visible := True;
    PanelCosas.visible := False;
    PanelAvanzado.Visible := False;
    TabControl1.TabIndex := 0;
  end;
  If TabControl1.TabOrder = 1 then
  begin
    PanelBasico.visible := False;
    PanelCosas.visible := True;
    PanelAvanzado.Visible := False;
    TabControl1.TabIndex := 1;
  end;
  If TabControl1.TabOrder = 2 then
  begin
    FAvanzado.TFormAvanzado.Create(Self);
    FormAvanzado.Parent := Panel2;
    FormAvanzado.Align := alClient;
    FormAvanzado.Show;
    PanelBasico.visible := False;
    PanelCosas.visible := False;
    PanelAvanzado.Visible := True;
    TabControl1.TabIndex := 2;
    Panel2.SetFocus;
  end;
end;

procedure TFormOpciones.TabControl1Change(Sender: TObject);
begin
  If TabControl1.TabIndex = 0 then
  begin
    PanelBasico.visible := True;
    PanelCosas.visible := False;
    PanelAvanzado.Visible := False;
    TabControl1.TabOrder := 0;
  end;
  If TabControl1.TabIndex = 1 then
  begin
    PanelBasico.visible := False;
    PanelCosas.visible := True;
    PanelAvanzado.Visible := False;
    TabControl1.TabOrder := 1;
  end;
  If TabControl1.TabIndex = 2 then
  begin
    PanelBasico.visible := False;
    PanelCosas.visible := False;
    PanelAvanzado.Visible := True;
    TabControl1.TabOrder := 2;
    Panel2.SetFocus;
    FAvanzado.TFormAvanzado.Create(Self);
    FormAvanzado.Parent := Panel2;
    FormAvanzado.Align := alClient;
    FormAvanzado.Show;
  end;
end;

procedure TFormOpciones.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  If Scrollbar1.Position > 523 then
  FormAvanzado.Panel1.Top := 0-523
  else
  FormAvanzado.Panel1.Top := 0 - Scrollbar1.Position;
end;

end.
