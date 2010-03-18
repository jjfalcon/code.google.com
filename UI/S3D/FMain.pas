(*
Distribuir Formulario
- PanelTop.
- PanelBottom.
- PanelLeft.
- PanelClient

Formulario sin bordes
- FormCreate ocultar la barra de titulo
- procedure WMNCHitTest e ImagePanelTopMouseDown para mover desde PanelTop
   ReleaseCapture;
   SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
-

PanelTop -> Menu Principal
- Etiquetas
- PopupMenu enlazado a cada opcion mediante tag y configurar alineacion menu

PanelTop -> Barra de Herramientas
- Botones estilo Chrome
- PopuMenu enlazado a opciones de abrir recientes, vistas y escenarios

PanelBottom -> Pestaña de Reproduccion
PanelBottom -> Pestaña de Log
PanelBottom -> Barra de estado

PanelLeft -> Pestaña de Arbol de Elementos (jerarquia, elemento seleccionado)
- Caja de Busqueda (imagen, etiqueta, edit, grafico)
-- imagen de fondo de la caja
-- etiqueta con texto de ayuda visible por defecto
-- caja de texto invisible, al seleccionar visualizar y coger el foco
-- al introducir texto se activa la imagen de ayuda
-- al pulsar imagen de ayuda o pulsar RETURN activar accion
-- pulsar fuera pasar el foco a algun panel
- Lista de elementos seleccionados
PanelLeft -> Pestaña de Armario de Elementos (grupo, elemento seleccionado)

Botones de Sistema
- imagenes
-
SlideBar
- utilizar imagen de fondo e imagen de parte movil encima
- imagen movil enabled=false para que no coja foco
- en imagen_fondo mouse_down activar flag FMove y posicionar
- en imagen_fondo mouse_move posicionar parte movil encima
- en imagen_fondo mouse_up desactivar flag FMove

Texto diseñador
- si el texto no tiene que ser traducido usar una imagen y no depende de fonts

Botones multiestado
- usar TImageList con distintas imagenes del boton
- cambiar imagen en MouseDown, MouseUp
- para imagen over usar MouseMove y timer o derivar imagen con Enter/Leave
*)

unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Menus, Buttons, XPMan, ComCtrls;

type
  TFormMain = class(TForm)
    PanelTop: TPanel;
    PanelLeft: TPanel;
    PanelBottom: TPanel;
    PanelClient: TPanel;
    ImagePanelTop: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image1: TImage;
    Image5: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Splitter1: TSplitter;
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
    Repetir1: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    BajarVolumen1: TMenuItem;
    Silencio1: TMenuItem;
    PopupMenuAyuda: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    LabelArchivo: TLabel;
    LabelModificar: TLabel;
    LabelReproduccion: TLabel;
    LabelAyuda: TLabel;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Label3: TLabel;
    PopupMenuVistas: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem13: TMenuItem;
    PopupMenuEscenarios: TPopupMenu;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem27: TMenuItem;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    act_delete: TImage;
    act_rec: TImage;
    act_Stop: TImage;
    act_Play: TImage;
    act_19: TImage;
    act_18: TImage;
    ImageVistas: TImage;
    ImageEscenarios: TImage;
    Image21: TImage;
    EditBuscar: TEdit;
    ImageBuscar: TImage;
    act_5: TImage;
    act_1: TImage;
    act_2: TImage;
    act_3: TImage;
    act_4_A: TImage;
    act_7: TImage;
    act_8: TImage;
    LabelBuscar: TLabel;
    TreeViewScenes: TTreeView;
    Shape1: TShape;
    procedure LabelArchivoMouseEnter(Sender: TObject);
    procedure LabelArchivoMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabelArchivoClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure Image21Click(Sender: TObject);
    procedure EditBuscarChange(Sender: TObject);
    procedure ImageBuscarClick(Sender: TObject);
    procedure EditBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure Salir1Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure ImagePanelTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditBuscarExit(Sender: TObject);
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FMove : boolean;
    procedure WMNCHitTest( var Msg : TWMNCHitTest );  message wm_NCHitTest;

    procedure MenuReset;
    procedure ActionBuscar;
    procedure ActionExit;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  uImageButton;

const
  COLOR_MENU_ENTER = 255 or (255 Shl 8) or (255 Shl 16); //RGB
  COLOR_MENU_LEAVE = 210 or (210 Shl 8) or (210 Shl 16); //RGB


procedure TFormMain.ActionExit;
begin
  Close;
end;

procedure TFormMain.MenuReset;
begin
  LabelArchivo.Font.color := COLOR_MENU_LEAVE;
  LabelModificar.Font.color := COLOR_MENU_LEAVE;
  LabelReproduccion.font.color := COLOR_MENU_LEAVE;
  LabelAyuda.Font.color := COLOR_MENU_LEAVE;
end;

procedure TFormMain.LabelArchivoMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := COLOR_MENU_ENTER;
end;


procedure TFormMain.LabelArchivoMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := COLOR_MENU_LEAVE;
end;

procedure TFormMain.FormCreate(Sender: TObject);
//var
//  NewRgn : HRGN;
begin
  //ocultar barra de titulo
  SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION );
  ClientHeight := Height;

//  NewRgn := CreateRoundRectRgn(0,0,width,height,20,20);
//  SetWindowRgn(handle,NewRgn,false);


  //BOTONES
(*
  with TImageButton.Create(self) do
  begin
    parent := PanelClient;
    BringToFront;
    left    := 400;
    top     := 20;
    height   := 50;
    onoff   := true;
    Enabled := true;
    Autosize := true;
    Transparent := true;
    Hint := 'Vistas';

    BitmapUp.LoadFromFile(ExtractFilePath(Application.ExeName)      +'ch_archivo_up.bmp');
    BitmapDown.LoadFromFile(ExtractFilePath(Application.ExeName)    +'ch_archivo_down.bmp');
    BitmapOver.LoadFromFile(ExtractFilePath(Application.ExeName)    +'ch_archivo_over.bmp');
    BitmapDisabled.LoadFromFile(ExtractFilePath(Application.ExeName)+'ch_archivo_over.bmp');
    Tag := integer(PopupMenuVistas);
    OnClick := LabelArchivoClick;
  end;
*)
  //MENU
  MenuReset;
  LabelArchivo.Tag      := integer(PopupMenuArchivo);
  LabelModificar.Tag    := integer(PopupMenuModificar);
  LabelReproduccion.Tag := integer(PopupMenuReproduccion);
  LabelAyuda.Tag        := integer(PopupMenuAyuda);
  ImageVistas.Tag       := integer(PopupMenuVistas);
  ImageEscenarios.Tag   := integer(PopupMenuEscenarios);
end;

procedure TFormMain.WMNCHitTest(var Msg: TWMNCHitTest );
begin
  inherited;

  if (Msg.Result = PanelTop.handle)
  then Msg.Result := htCaption;
end;

procedure TFormMain.ButtonClick(Sender: TObject);
begin
  TPopupMenu(TControl(Sender).Tag).Popup(TControl(Sender).ClientOrigin.X++TControl(Sender).ClientWidth,
                               TControl(Sender).ClientOrigin.Y+TControl(Sender).ClientHeight);
end;

procedure TFormMain.LabelArchivoClick(Sender: TObject);
begin
  TPopupMenu(TLabel(Sender).Tag).Popup(TLabel(Sender).ClientOrigin.X,
                               TLabel(Sender).ClientOrigin.Y+TLabel(Sender).ClientHeight);
  MenuReset;
end;

procedure TFormMain.Image21Click(Sender: TObject);
begin
  //visualizar y activar EditBuscar
  EditBuscar.Visible := true;
  EditBuscar.SetFocus;
end;

procedure TFormMain.EditBuscarChange(Sender: TObject);
begin
  imageBuscar.visible := TEdit(Sender).Text <> '';
end;

procedure TFormMain.ActionBuscar;
begin
  ShowMessage('Comando Buscar');
end;

procedure TFormMain.ImageBuscarClick(Sender: TObject);
begin
  ActionBuscar;
end;

procedure TFormMain.EditBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = Char(13) then ActionBuscar;
end;

procedure TFormMain.Salir1Click(Sender: TObject);
begin
  ActionExit;
end;

procedure TFormMain.Image23Click(Sender: TObject);
begin
  if WindowState = wsNormal then WindowState := wsMaximized
  else if WindowState = wsMaximized then WindowState := wsNormal;
end;

procedure TFormMain.Image24Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFormMain.ImagePanelTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;

  PanelTop.SetFocus;
end;

procedure TFormMain.EditBuscarExit(Sender: TObject);
begin
  EditBuscar.Visible := EditBuscar.Text <> '';
end;

procedure TFormMain.Image13MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove := true;
  Shape1.Left := Image13.Left+x-(Shape1.Width div 2);
end;

procedure TFormMain.Image13MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  if not FMove then exit;
  newX := Image13.Left+x-(Shape1.Width div 2);
  if newx < Image13.Left then exit;
  if newx > (Image13.Left + Image13.Width) then exit;

  Shape1.Left := newx-5;
end;

procedure TFormMain.Image13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove := false;
end;

end.
