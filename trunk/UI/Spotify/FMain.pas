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
- PopupMenu enlazado a cada opcion
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
  Dentro de una lista de imágenes
  cambiar el tag dependiendo del caso

- slidebar (ImaLisBola,ImageBola,Image13)
   MouseDown, MouseMove, MouseUp. actualizar por UI
   OnMovePlay. notificar cambio de posicion en el label1
   Posicionamiento(X) Posicionarla en el lugar donde se ha hecho click.
   Movimiento() el movimiento de la bola

- scrollbar (PanelScroll) "igual que el slidebar"
  3 movimientos diferentes
    de 10 en 10 al pulsar la imagen de la flecha
    de 40 en 40 al pulsar en la barra negra
    arrastrar la barra gris al moverla
  timers diferentes para los clicks prolongados

- Barra del volumen
  MouseDown, MouseUp, MouseMove,... mismo mecanismo que slidebar
  cambio de imagenes de la lista, cuando el proceso OnMovePlay2 da los valores de (0-12-25-37-50-62-75-87-100)

- Apariencia e imagenes
  procesos lista1, lista2 y carga. Juegan solo con la visibilidad de las imagenes.

- Boton buscar, al darle click, aparecen las búsquedas en la lista de la izquierda
  mediante el proceso Actionbuscar.

- Boton para aparecer y desaparecer el disco
  Son 6 imágenes en total, 3 arriba y 3 abajo
  Al no tener el evento onMouseLeave y OnMouseEnter, he usado el evento MouseMove
  en el panel gris y en el botón para aparecer y desaparecer la imagen oscura.

- Boton + Para crear una nueva lista:
  Visibilizar un edit y una imagen

- Transparencias de las imagenes:
  el ultimo pixel de la esquina inferior izquierda del color que se quiera ser cambiado
*)

unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Menus, Buttons, XPMan, ImgList;

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
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
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
    Image21: TImage;
    LabelBuscar: TLabel;
    EditBuscar: TEdit;
    ImageBuscar: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image28: TImage;
    ImageList1: TImageList;
    Image26: TImage;
    Image38: TImage;
    Image27: TImage;
    Image54: TImage;
    Image55: TImage;
    Image56: TImage;
    Image5: TImage;
    Image30: TImage;
    Image32: TImage;
    Image33: TImage;
    Image60: TImage;
    Image61: TImage;
    Image63: TImage;
    Image64: TImage;
    Image65: TImage;
    Image66: TImage;
    Image67: TImage;
    Image31: TImage;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList4: TImageList;
    ImageList5: TImageList;
    Image25: TImage;
    Image29: TImage;
    ImageList6: TImageList;
    ImageList7: TImageList;
    ImageList8: TImageList;
    ImageList9: TImageList;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image39: TImage;
    Lbl_Inicio: TLabel;
    Lbl_Radio: TLabel;
    Lbl_cola: TLabel;
    Lbl_compras: TLabel;
    Image10: TImage;
    Panel1: TPanel;
    Image9: TImage;
    Image50: TImage;
    ImageBarLeft: TImage;
    ImageBarFondo: TImage;
    ImageBola: TImage;
    ImaLisBola: TImageList;
    Image40: TImage;
    Image41: TImage;
    ImageList10: TImageList;
    Image42: TImage;
    ImageList11: TImageList;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image46: TImage;
    Image47: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ImageList12: TImageList;
    ImageList13: TImageList;
    ImageList14: TImageList;
    ImageList15: TImageList;
    PanelScroll: TPanel;
    Isnegro: TImage;
    Image48: TImage;
    Image49: TImage;
    Image52: TImage;
    Image53: TImage;
    Image51: TImage;
    Image57: TImage;
    IInicio: TImage;
    ICola: TImage;
    Image34: TImage;
    IRadio: TImage;
    ILista: TImage;
    ICompras: TImage;
    Timer1: TTimer;
    Isalto: TImage;
    Ismedio: TImage;
    Isbajo: TImage;
    Timer2: TTimer;
    Timer4: TTimer;
    Edit1: TEdit;
    Image11: TImage;
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
    procedure Image31MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image31MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image26MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image26MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image38MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image38MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image50MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image50MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image61MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image61MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image64Click(Sender: TObject);
    procedure Image66Click(Sender: TObject);
    procedure Image55MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image55MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image56MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image56MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image29MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image29MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image25MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image25MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Lbl_InicioMouseLeave(Sender: TObject);
    procedure Image50MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure OnMovePlay(Pos: single);
    procedure OnMovePlay2(Pos: single);
    procedure Image13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBolaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageBolaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image20MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image20MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image20MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image41MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image41MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image48MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image48MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image52MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image52MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IsnegroMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    (*procedure IsnegroMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); *)
    procedure IsnegroMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IsmedioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IsmedioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IsmedioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Lbl_InicioClick(Sender: TObject);
    procedure Lbl_RadioClick(Sender: TObject);
    procedure Lbl_colaClick(Sender: TObject);
    procedure Lbl_comprasClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    FSMove : boolean;
    FSMove2 : boolean;
    FMove : boolean;
    FMove2 : boolean;
    VPLAY : boolean;
    BTN_OSC : boolean;
    conta : integer;
    { Private declarations }
    procedure WMNCHitTest( var Msg : TWMNCHitTest );  message wm_NCHitTest;
    procedure MenuReset;
    procedure ActionBuscar;
    procedure ActionExit;
    Procedure lista1;
    Procedure lista2;
    Procedure Movimiento(newX : integer ; X:integer);
    Procedure Posicionamiento(X:integer);
    Procedure carga(x : integer);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

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
  lista1;
  VPLAY := False;
  Posicionamiento(0);
  BTN_OSC :=False;
  conta := 0;
end;

procedure TFormMain.WMNCHitTest(var Msg: TWMNCHitTest );
begin
  inherited;

  if (Msg.Result = integer(PanelTop.handle))
  then Msg.Result := htCaption;
end;

procedure TFormMain.ButtonClick(Sender: TObject);
begin
  TPopupMenu(TControl(Sender).Tag).Popup(TControl(Sender).ClientOrigin.X+TControl(Sender).ClientWidth,
                               TControl(Sender).ClientOrigin.Y+TControl(Sender).ClientHeight);
  MenuReset;
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

// Poner las busquedas a la izquierda
procedure TFormMain.ActionBuscar;
begin
  Label7.caption := Label6.caption;
  Label6.caption := Label5.caption;
  Label5.caption := Label4.caption;
  Label4.caption := EditBuscar.text;
  If Label7.caption <> '' then
    Image47.visible := True;
  If Label6.caption <> '' then
    Image46.visible := True;
  If Label5.caption <> '' then
    Image45.visible := True;
  If Label4.caption <> '' then
    Image44.visible := True;
  EditBuscar.text := '';
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

// Botones Repetir y aleatorio

procedure TFormMain.Image31MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(TImage(Sender).Tag-1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image31MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //seleccionar el indice de la imagen a cargar en funcion de la imagen actual
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 3;
    3: TImage(Sender).Tag := 1;
    else TImage(Sender).Tag := 1;
  end;
  //cargar la imagen i de la ImageList()
  TImage(Sender).Picture.Bitmap := nil;
  ImageList1.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image26MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList2.GetBitmap(TImage(Sender).Tag-1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image26MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 3;
    3: TImage(Sender).Tag := 1;
    else TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList2.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

// Botones play, anterior y siguiente

procedure TFormMain.Image38MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList4.GetBitmap(TImage(Sender).Tag+1, TImage(Sender).Picture.Bitmap);
  Image25.Picture.Bitmap := nil;
  ImageList3.GetBitmap(1, Image25.Picture.Bitmap);
  Image29.Picture.Bitmap := nil;
  ImageList5.GetBitmap(1, Image29.Picture.Bitmap);
  VPLAY := True;
end;

procedure TFormMain.Image38MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 2;
    2: TImage(Sender).Tag := 0;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList4.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image29MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If VPLAY = True then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImageList5.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Image29MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If VPLAY = True then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImageList5.GetBitmap(1, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Image25MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If VPLAY = True then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImageList3.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Image25MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If VPLAY = True then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImageList3.GetBitmap(1, TImage(Sender).Picture.Bitmap);
  end;
end;

// Boton + para añadir nueva lista

procedure TFormMain.Image61MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList9.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  Edit1.Visible := True;
  Image11.Visible := True;
  Edit1.Color := clHighlightText;
  Edit1.Font.Color := clDefault;
end;

procedure TFormMain.Image61MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList9.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

// Novedades y listas de exito (Barra superior) (carga de imagenes)

procedure TFormMain.Image64Click(Sender: TObject);
begin
  Image55.visible := True;
  carga(IInicio.Height);
  IInicio.Visible := True;
  lista1;
end;

procedure TFormMain.Image66Click(Sender: TObject);
begin
  Image55.visible := True;
  carga(ILista.Height);
  ILista.Visible := True;
  lista2;
end;

Procedure TFormMain.carga(x : integer);
begin
  IInicio.visible := False;
  IRadio.visible := False;
  ILista.visible := False;
  ICola.visible := False;
  ICompras.visible := False;
end;

Procedure TFormMain.lista1;
begin
  Image64.visible := False;
  Image65.visible := True;
  Image66.visible := True;
  Image67.visible := False;
end;

Procedure TFormMain.lista2;
begin
  Image64.visible := True;
  Image65.visible := False;
  Image66.visible := False;
  Image67.visible := True;
end;

// Links de las páginas en los label laterales
procedure TFormMain.Lbl_InicioClick(Sender: TObject);
begin
  carga(IInicio.Height);
  IInicio.visible := True;
end;

procedure TFormMain.Lbl_RadioClick(Sender: TObject);
begin
  carga(IRadio.Height);
  IRadio.Visible := True;
end;

procedure TFormMain.Lbl_colaClick(Sender: TObject);
begin
  carga(ICola.Height);
  ICola.visible := True;
end;

procedure TFormMain.Lbl_comprasClick(Sender: TObject);
begin
  carga(ICompras.Height);
  ICompras.Visible := True;
end;

// Botones Atras y adelante

procedure TFormMain.Image55MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList8.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image55MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList8.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image56MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList7.GetBitmap(2, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Image56MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList7.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

// Lista de la izquierda

procedure TFormMain.Lbl_InicioMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clInactiveBorder;
end;

// Cambio de la imagen pequeña de subir y bajar:
//    Image9 y Image50 mouse move, para oscurecer o aclarar la imagen
//    MouseUp y Down para mover la barra gris visualizando o no el disco

procedure TFormMain.Image9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If BTN_OSC then
  begin
    Image50.Picture.Bitmap := nil;
    ImageList6.GetBitmap(Image50.tag-1, Image50.Picture.Bitmap);
    BTN_OSC :=False;
  end;
end;

procedure TFormMain.Image50MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 1;
    3: TImage(Sender).Tag := 4;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList6.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  BTN_OSC := True;
end;

procedure TFormMain.Image50MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 2;
    4: TImage(Sender).Tag := 5;
    else TImage(Sender).Tag := 2;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList6.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  BTN_OSC :=False;
end;

procedure TFormMain.Image50MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    2: TImage(Sender).Tag := 3;
    5: TImage(Sender).Tag := 0;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageList6.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  Image10.Visible := not Image10.visible;
// Cambio del panel1 (barra gris) porque al cambiar la visualizacion del disco,
// la barra gris quedaría abajo del todo.
  if Image10.visible then
  begin
    Panel1.Align := alNone;
    Panel1.Align := alBottom;
  end;
end;

//SLIDE BAR (ImaLisBola,ImageBola,Image13)
// MouseDown, MouseMove, MouseUp. actualizar por UI
// OnMovePlay. notificar cambio de posicion en el label1
// Posicionamiento(X) Posicionarla en el lugar donde se ha hecho click.
// Movimiento() el movimiento de la bola

procedure TFormMain.OnMovePlay(Pos: single);
begin
  Label1.caption := IntToStr(Round(Pos));
end;

Procedure TFormMain.Posicionamiento(X:integer);
begin
  If FMove = true then
  begin
    ImageBola.Picture.Bitmap := nil;
    ImaLisBola.GetBitmap(0, ImageBola.Picture.Bitmap);
  end;
  ImageBola.Left := Image13.Left+x-(ImageBola.Width div 2);
  //Para que lo escriba en el label
  OnMovePlay((ImageBola.Left-Image13.Left+3)/(Image13.Width-4)*100);
end;

Procedure TFormMain.Movimiento(newX : integer ;X:integer);
begin
  if not FMove then exit;
  newX := Image13.Left+x-(ImageBola.Width div 2);
  if newx < Image13.Left then newX := Image13.Left;
  if newx > (Image13.Left + Image13.Width-4) then newX := (Image13.Left + Image13.Width-4);
  ImageBola.Left := newx-3;
  ImageBarFondo.visible := true;
  ImageBarFondo.Width := ImageBola.Left - ImageBarFondo.Left;
  OnMovePlay((ImageBola.Left-Image13.Left+3)/(Image13.Width-4)*100);
end;

procedure TFormMain.Image13MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  FMove := true;
  newX := 0;
  Posicionamiento(X);
  Movimiento(newX,X);
end;

procedure TFormMain.Image13MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  newX := 0;
  Movimiento(newX,X);
end;

procedure TFormMain.Image13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove := false;
  ImageBola.Picture.Bitmap := nil;
  ImaLisBola.GetBitmap(1, ImageBola.Picture.Bitmap);
end;

procedure TFormMain.ImageBolaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMove := true;
  ImageBola.Picture.Bitmap := nil;
  ImaLisBola.GetBitmap(0, ImageBola.Picture.Bitmap);
  //Para que lo escriba en el label
  OnMovePlay((ImageBola.Left-Image13.Left+3)/(Image13.Width-4)*100);
end;

procedure TFormMain.ImageBolaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  if not FMove then exit;
  ImageBola.Picture.Bitmap := nil;
  ImaLisBola.GetBitmap(0, ImageBola.Picture.Bitmap);
  newX := ImageBola.Left+x;
  if newx < Image13.Left then newX := Image13.Left;
  if newx > (Image13.Left + Image13.Width-4) then newX := (Image13.Left + Image13.Width-4);
  ImageBola.Left := newx-3;
  ImageBarFondo.visible := true;
  ImageBarFondo.Width := ImageBola.Left - ImageBarFondo.Left;
  OnMovePlay((ImageBola.Left-Image13.Left+3)/(Image13.Width-4)*100);
end;

// Visualizacion de las barras del volumen (0,12,25,37,50,62,75,87,100)

procedure TFormMain.OnMovePlay2(Pos: single);
begin
  If Round(Pos) < 12 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(8, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 25 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(7, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 37 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(6, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 50 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(5, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 62 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(4, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 75 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(3, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 87 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(2, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) < 100 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(1, Image42.Picture.Bitmap);
    exit;
  end;
  If Round(Pos) = 100 then
  begin
    Image42.Picture.Bitmap := nil;
    ImageList11.GetBitmap(0, Image42.Picture.Bitmap);
    exit;
  end;
end;

//Barra del volumen
//  MouseDown, MouseUp, MouseMove,... mismo mecanismo que slidebar

procedure TFormMain.Image20MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  FMove2 := true;
  Image41.Picture.Bitmap := nil;
  ImageList10.GetBitmap(0, Image41.Picture.Bitmap);
  Image41.Left := Image20.Left+x-(Image41.Width div 2);
  newX := Image20.Left+x-(Image41.Width div 2);
  if newx < Image20.Left then newX := Image20.Left;
  if newx > (Image20.Left + Image20.Width-4) then newX := (Image20.Left + Image20.Width-4);
  Image41.Left := newx-3;
// Para que el tono de la barra corresponda con la intensidad del volumen
  OnMovePlay2((Image41.Left-Image20.Left+3)/(Image20.Width-4)*100);
end;

procedure TFormMain.Image20MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  if not FMove2 then exit;
  newX := Image20.Left+x-(Image41.Width div 2);
  if newx < Image20.Left then newX := Image20.Left;
  if newx > (Image20.Left + Image20.Width-4) then newX := (Image20.Left + Image20.Width-4);
  Image41.Left := newx-3;
  OnMovePlay2((Image41.Left-Image20.Left+3)/(Image20.Width-4)*100);
end;

procedure TFormMain.Image20MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove2 := false;
  Image41.Picture.Bitmap := nil;
  ImageList10.GetBitmap(1, Image41.Picture.Bitmap);
end;

procedure TFormMain.Image41MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove2 := true;
  Image41.Picture.Bitmap := nil;
  ImageList10.GetBitmap(0, Image41.Picture.Bitmap);
  OnMovePlay2((Image41.Left-Image20.Left+3)/(Image20.Width-4)*100);
end;

procedure TFormMain.Image41MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  if not FMove2 then exit;
  Image41.Picture.Bitmap := nil;
  ImageList10.GetBitmap(0, Image41.Picture.Bitmap);
  newX := Image41.Left+x;
  if newx < Image20.Left then newX := Image20.Left;
  if newx > (Image20.Left + Image20.Width-4) then newX := (Image20.Left + Image20.Width-4);
  Image41.Left := newx-3;
  OnMovePlay2((Image41.Left-Image20.Left+3)/(Image20.Width-4)*100);
end;

// Mover la bola del scroll bar arrastrandola

procedure TFormMain.IsmedioMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FSMove2 := true;
end;

procedure TFormMain.IsmedioMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FSMove2 := false;
end;

procedure TFormMain.IsmedioMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  if not FSMove2 then exit;
// Se pone PanelBar.Top tambien porque el "y" que te coge es el del ISmedio (0-57)
  newX := Isnegro.top+Isalto.Top+y+7-((Ismedio.height +10) div 2);
  if newx < (Isnegro.Top) then newX := Isnegro.Top-5;
  if newx > (Isnegro.Top + Isnegro.Height - (Ismedio.height +10)) then newX := (Isnegro.Top + Isnegro.Height - (Ismedio.height +10));
  Isalto.Top := newX;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
end;


// Movimiento de la barra negra de 40 en 40

procedure TFormMain.IsnegroMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  FSMove := true;
  newX := Isnegro.Top+y-((Ismedio.height +14) div 2);
  if newX < Isnegro.Top then newX := Isnegro.Top-5;
  if newX > (Isnegro.Top + Isnegro.Height -(Ismedio.height +10)) then newX := (Isnegro.Top + Isnegro.Height -(Ismedio.height +10));
  If  Isalto.Top < newX then
    If newX - Isalto.top <= 40 then
      Isalto.top := newX
    else
      Isalto.top := Isalto.top + 40
  else
    If Isalto.top - newX <= 40 then
      Isalto.top := newX
    else
      Isalto.top := Isalto.top - 40;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
  conta := y;
  Timer4.Enabled := True;
end;

procedure TFormMain.IsnegroMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FSMove := false;
  Timer4.Enabled := False;
end;

procedure TFormMain.Timer4Timer(Sender: TObject);
var
  newX : integer;
begin
  newX := Isnegro.Top+conta-((Ismedio.height +14) div 2);
  if newX < Isnegro.Top then newX := Isnegro.Top-5;
  if newX > (Isnegro.Top + Isnegro.Height -(Ismedio.height +10)) then newX := (Isnegro.Top + Isnegro.Height -(Ismedio.height +10));
  If  Isalto.Top < newX then
    If newX - Isalto.top <= 40 then
      Isalto.top := newX
    else
      Isalto.top := Isalto.top + 40
  else
    If Isalto.top - newX <= 40 then
      Isalto.top := newX
    else
      Isalto.top := Isalto.top - 40;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
end;

// Pulsar scrollbar y mover de 10 en 10

procedure TFormMain.Image48MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image48.Picture.Bitmap := nil;
  Image49.Picture.Bitmap := nil;
  ImageList12.GetBitmap(1, Image48.Picture.Bitmap);
  ImageList13.GetBitmap(1, Image49.Picture.Bitmap);
  if Isalto.top < Isnegro.Top + 10 then
  begin
    Isalto.top := Isnegro.Top-5;
    Ismedio.top := Isalto.top + 7;
    Isbajo.top := Ismedio.top + Ismedio.height;
    exit;
  end;
  Isalto.top := Isalto.top -10;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
  Timer1.Enabled := True;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  if Isalto.top < Isnegro.Top + 10 then
  begin
    Isalto.top := Isnegro.Top-5;
    Ismedio.top := Isalto.top + 7;
    Isbajo.top := Ismedio.top + Ismedio.height;
    exit;
  end;
  Isalto.top := Isalto.top -10;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
end;

procedure TFormMain.Image48MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image48.Picture.Bitmap := nil;
  Image49.Picture.Bitmap := nil;
  ImageList12.GetBitmap(0, Image48.Picture.Bitmap);
  ImageList13.GetBitmap(0, Image49.Picture.Bitmap);
  Timer1.Enabled := False;
end;

procedure TFormMain.Image52MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image53.Picture.Bitmap := nil;
  Image52.Picture.Bitmap := nil;
  ImageList14.GetBitmap(1, Image53.Picture.Bitmap);
  ImageList15.GetBitmap(1, Image52.Picture.Bitmap);
  if Isalto.top + (Ismedio.height +10) > (Isnegro.Top + Isnegro.Height - 10) then
  begin
    Isalto.top := (Isnegro.Top + Isnegro.Height -(Ismedio.height +10));
    Ismedio.top := Isalto.top + 7;
    Isbajo.top := Ismedio.top + Ismedio.height;
    exit;
  end;
  Isalto.top := Isalto.top + 10;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
  Timer2.Enabled := True;
end;

procedure TFormMain.Image52MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image53.Picture.Bitmap := nil;
  Image52.Picture.Bitmap := nil;
  ImageList14.GetBitmap(0, Image53.Picture.Bitmap);
  ImageList15.GetBitmap(0, Image52.Picture.Bitmap);
  Timer2.Enabled := False;
end;

procedure TFormMain.Timer2Timer(Sender: TObject);
begin
  if Isalto.top + (Ismedio.height +10) > (Isnegro.Top + Isnegro.Height - 10) then
  begin
    Isalto.top := (Isnegro.Top + Isnegro.Height -(Ismedio.height +10));
    Ismedio.top := Isalto.top + 7;
    Isbajo.top := Ismedio.top + Ismedio.height;
    exit;
  end;
  Isalto.top := Isalto.top + 10;
  Ismedio.top := Isalto.top + 7;
  Isbajo.top := Ismedio.top + Ismedio.height;
end;

end.

