unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Menus;

type
  TFormMain = class(TForm)
    PanelTop: TPanel;
    PanelBottom: TPanel;
    Panel1: TPanel;
    LabelArchivo: TLabel;
    LabelModificar: TLabel;
    LabelReproduccion: TLabel;
    LabelAyuda: TLabel;
    PanelMsg: TPanel;
    Image9: TImage;
    Label5: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    PopupMenuArchivo: TPopupMenu;
    Nuevo1: TMenuItem;
    Cerrar1: TMenuItem;
    Salir1: TMenuItem;
    PopupMenuModificar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    Eliminar1: TMenuItem;
    N1: TMenuItem;
    Seleccionartodo1: TMenuItem;
    Noseleccionarnada1: TMenuItem;
    N2: TMenuItem;
    Buscar1: TMenuItem;
    N3: TMenuItem;
    Preferencias1: TMenuItem;
    PopupMenuReproduccion: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    PopupMenuAyuda: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    Repetir1: TMenuItem;
    Silencio1: TMenuItem;
    BajarVolumen1: TMenuItem;
    Splitter1: TSplitter;
    Image7: TImage;
    Label1: TLabel;
    Image1: TImage;
    procedure LabelArchivoMouseEnter(Sender: TObject);
    procedure LabelArchivoMouseLeave(Sender: TObject);
    procedure LabelAyudaClick(Sender: TObject);
    procedure LabelArchivoClick(Sender: TObject);
    procedure LabelModificarClick(Sender: TObject);
    procedure LabelReproduccionClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

    { Private declarations }
    //mover formulario sin titulo
    procedure WMNCHitTest( var Msg : TWMNCHitTest );  message wm_NCHitTest;
//    procedure CreateParams(var Params: TCreateParams);

    procedure ResetMenu;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}
(*
procedure TFormMain.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style:=(Style or WS_POPUP) and (not WS_DLGFRAME);
end;
*)

procedure TFormMain.LabelArchivoMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWhite;
end;

procedure TFormMain.LabelArchivoMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clGrayText;
end;

procedure TFormMain.LabelAyudaClick(Sender: TObject);
begin
  PopupMenuAyuda.Popup(LabelAyuda.ClientOrigin.X,
                       LabelAyuda.ClientOrigin.Y+LabelAyuda.ClientHeight);
  ResetMenu;
end;

procedure TFormMain.LabelArchivoClick(Sender: TObject);
begin
  PopupMenuArchivo.Popup(LabelArchivo.ClientOrigin.X,
                         LabelArchivo.ClientOrigin.Y+LabelArchivo.ClientHeight);
  ResetMenu;
end;

procedure TFormMain.LabelModificarClick(Sender: TObject);
begin
  PopupMenuModificar.Popup(LabelModificar.ClientOrigin.X,
                           LabelModificar.ClientOrigin.Y+LabelModificar.ClientHeight);
  ResetMenu;
end;

procedure TFormMain.LabelReproduccionClick(Sender: TObject);
begin
  PopupMenuReproduccion.Popup(LabelReproduccion.ClientOrigin.X,
                              LabelReproduccion.ClientOrigin.Y+LabelReproduccion.ClientHeight);
  ResetMenu;
end;

procedure TFormMain.ResetMenu;
begin
  LabelArchivo.Font.Color      := clGrayText;
  LabelModificar.Font.Color    := clGrayText;
  LabelReproduccion.Font.Color := clGrayText;
  LabelAyuda.Font.Color        := clGrayText;
end;

procedure TFormMain.Image7Click(Sender: TObject);
begin
  PanelMsg.visible := false;
end;

procedure TFormMain.MenuItem19Click(Sender: TObject);
begin
  PanelMsg.visible := not PanelMsg.visible;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  //ocultar barra de titulo
  SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION );
  ClientHeight := Height;
end;

procedure TFormMain.WMNCHitTest(var Msg: TWMNCHitTest );
begin

  inherited;
  label1.Caption := IntToStr(Msg.Result) +'='+IntToStr(PanelTop.handle);
  if (Msg.Result = htClient)
//  if (Msg.Result = PanelTop.handle)
  then Msg.Result := htCaption;
end;

procedure TFormMain.PanelTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture;
   SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

procedure TFormMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(application.exename)+'/recursos/btnRepeat-Gray.bmp');
end;

procedure TFormMain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if TComponent(Sender).tag <> 0
  then
  begin
    Image1.Picture.LoadFromFile(ExtractFilePath(application.exename)+'/recursos/btnRepeat-White.bmp');
    TComponent(Sender).tag := 0;
  end
  else
  begin
    Image1.Picture.LoadFromFile(ExtractFilePath(application.exename)+'/recursos/btnRepeat-Black.bmp');
    TComponent(Sender).tag := 1;
  end;
end;



end.
