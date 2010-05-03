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
    PanelUp: TPanel;
    Image5: TImage;
    Image6: TImage;
    Im_barrafondo: TImage;
    Image8: TImage;
    Image11: TImage;
    Image12: TImage;
    Image9: TImage;
    Im_fondopestana: TImage;
    Im_refresh: TImage;
    Im_adelante: TImage;
    Im_atras: TImage;
    Im_estrella: TImage;
    Im_Herramientas: TImage;
    Im_inicio: TImage;
    Im_pagina: TImage;
    Im_play: TImage;
    ImLst_atras: TImageList;
    ImLst_adelante: TImageList;
    ImLst_refresh: TImageList;
    ImLst_inicio: TImageList;
    ImLst_estrella: TImageList;
    ImLst_pagina: TImageList;
    ImLst_herramientas: TImageList;
    Im_pestanaleft: TImage;
    Im_cerrar: TImage;
    Im_maxi: TImage;
    Im_mini: TImage;
    Im_logosuperior: TImage;
    ImLst_mini: TImageList;
    ImLst_maxi: TImageList;
    ImLst_cerrar: TImageList;
    Im_cerrarpestana: TImage;
    Im_maspestana: TImage;
    ImLst_pestanacerrar: TImageList;
    ImLst_pestanamas: TImageList;
    Im_marc1: TImage;
    ImLst_marcgoogle: TImageList;
    Im_todosmarcadores: TImage;
    ImLst_marctodos: TImageList;
    ImLst_marchotmail: TImageList;
    ImLst_marcintranet: TImageList;
    Im_marc2: TImage;
    Im_marc3: TImage;
    Im_logopestana: TImage;
    Lbl_pestana: TLabel;
    Im_pestanamedio: TImage;
    Im_pestanaright: TImage;
    Timer1: TTimer;
    PUMenu_Pagina: TPopupMenu;
    PUMenu_Herramientas: TPopupMenu;
    CrearAccesoDirecto1: TMenuItem;
    N1: TMenuItem;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    N2: TMenuItem;
    Buscarenlapgina1: TMenuItem;
    Guardarpginacomo1: TMenuItem;
    Imprimir1: TMenuItem;
    N3: TMenuItem;
    amao1: TMenuItem;
    Codificacin1: TMenuItem;
    N4: TMenuItem;
    Opcionesparadesarrolladores1: TMenuItem;
    N5: TMenuItem;
    Comunicarerrorositiowebdefectuoso1: TMenuItem;
    Mayor1: TMenuItem;
    Normal1: TMenuItem;
    Menor1: TMenuItem;
    Deteccinautomtica1: TMenuItem;
    N6: TMenuItem;
    UnicodeUTF81: TMenuItem;
    EuropaOccidentalISO885911: TMenuItem;
    EuropaOccidentalWindows12521: TMenuItem;
    N7: TMenuItem;
    UnicodeUTF16LE1: TMenuItem;
    rabeWindows12561: TMenuItem;
    rabeISO885961: TMenuItem;
    BlticoISO885941: TMenuItem;
    BlticoISO8859131: TMenuItem;
    BlticoWindows12571: TMenuItem;
    CeltaISO8859141: TMenuItem;
    ChinosimplificadoGBK1: TMenuItem;
    Chinosimplificadogb180301: TMenuItem;
    ChinotradicionalBig51: TMenuItem;
    ChinotradicionalBig5HKSCS1: TMenuItem;
    CirlicoISO885951: TMenuItem;
    CirlicoWindows12511: TMenuItem;
    CirlicoKOI8R1: TMenuItem;
    CirlicoKOI8U1: TMenuItem;
    Coreano1: TMenuItem;
    EuropaCentralISO885921: TMenuItem;
    N8: TMenuItem;
    Vercdigofuente1: TMenuItem;
    Herramientasparadesarrolladores1: TMenuItem;
    ConsolaJavaScript1: TMenuItem;
    Administradordetareas1: TMenuItem;
    Nuevapestaa1: TMenuItem;
    Nuevaventana1: TMenuItem;
    Nuevaventanadeincgnito1: TMenuItem;
    N9: TMenuItem;
    Mostrarsiemprelabarrademarcadores1: TMenuItem;
    Pantallacompleta1: TMenuItem;
    N10: TMenuItem;
    Historial1: TMenuItem;
    Administradordemarcadores1: TMenuItem;
    Descargas1: TMenuItem;
    Extensiones1: TMenuItem;
    N11: TMenuItem;
    Sincronizarmismarcadores1: TMenuItem;
    N12: TMenuItem;
    Opciones1: TMenuItem;
    AcercadeGoogleChrome1: TMenuItem;
    Ayuda1: TMenuItem;
    N13: TMenuItem;
    Salir1: TMenuItem;
    EuropaOccidentalISO8859151: TMenuItem;
    EuropaOccidentalMacintosh1: TMenuItem;
    GriegoISO885971: TMenuItem;
    GriegoWindows12531: TMenuItem;
    HebreoWindows12551: TMenuItem;
    HebreoISO88598I1: TMenuItem;
    HebreoISO885981: TMenuItem;
    JaponsShiftJIS1: TMenuItem;
    JaponsEUCJP1: TMenuItem;
    JaponsISO2022JP1: TMenuItem;
    NrdicoISO8859101: TMenuItem;
    RumanoISO8859161: TMenuItem;
    SurdeEuropaISO885931: TMenuItem;
    ailands1: TMenuItem;
    urco1: TMenuItem;
    VietnamitaWindows12581: TMenuItem;
    ImLst_play: TImageList;
    Panel_URL: TPanel;
    Im_url: TImage;
    EditURL: TEdit;
    Lbl_consulta: TLabel;
    ImLst_pestanaleft: TImageList;
    ImLst_pestanamedio: TImageList;
    ImLst_pestanaright: TImageList;
    Im_pestanaleft2: TImage;
    Im_pestanamedio2: TImage;
    Im_pestanaright2: TImage;
    Im_logopestana2: TImage;
    Lbl_pestana2: TLabel;
    Im_cerrarpestana2: TImage;
    PanelBuscar: TPanel;
    Im_buscar: TImage;
    Im_buscarcerrar: TImage;
    Edit1: TEdit;
    ImLst_buscarcerrar: TImageList;
    Image4: TImage;
    Image7: TImage;
    PUMenu_marcadores: TPopupMenu;
    Busca71: TMenuItem;
    SitiosWebdeMicrosoft1: TMenuItem;
    WindowsuE1: TMenuItem;
    Marketplace1: TMenuItem;
    Microsoftencasa1: TMenuItem;
    PginaprincipaldeIE71: TMenuItem;
    SitiodeIEenMicrosoftcom1: TMenuItem;
    Blog1: TMenuItem;
    Foro1: TMenuItem;
    PrincipalWindowsuE1: TMenuItem;
    RadioButton1: TRadioButton;
    procedure Im_refreshMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_refreshMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_inicioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_inicioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_playMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_playMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_paginaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_paginaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_HerramientasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_HerramientasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_atrasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_atrasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_adelanteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_adelanteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_estrellaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_estrellaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_paginaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_barrafondoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_HerramientasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_playMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_inicioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_refreshMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_adelanteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_atrasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_estrellaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_miniMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_maxiMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_miniMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_miniMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maspestanaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maspestanaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarpestanaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarpestanaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maspestanaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_cerrarpestanaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_marc1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_marc1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_marc1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_todosmarcadoresMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_todosmarcadoresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_todosmarcadoresMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_marc3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_marc2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_marc2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_marc2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_marc3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_marc3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maxiClick(Sender: TObject);
    procedure Im_miniClick(Sender: TObject);
    procedure Im_cerrarClick(Sender: TObject);
    procedure EditURLKeyPress(Sender: TObject; var Key: Char);
    procedure Im_playClick(Sender: TObject);
    procedure ImagePanelTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanaleftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanaleftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanaleftMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EditURLChange(Sender: TObject);
    procedure Im_fondopestanaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Im_maspestanaClick(Sender: TObject);
    procedure Im_pestanamedio2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanamedio2MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanamedio2MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarpestana2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarpestana2MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cerrarpestana2MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_pestanamedioClick(Sender: TObject);
    procedure Im_pestanaleft2Click(Sender: TObject);
    procedure Im_cerrarpestana2Click(Sender: TObject);
    procedure AcercadeGoogleChrome1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Im_paginaClick(Sender: TObject);
    procedure Im_HerramientasClick(Sender: TObject);
    procedure Opciones1Click(Sender: TObject);
    procedure Sincronizarmismarcadores1Click(Sender: TObject);
    procedure Administradordemarcadores1Click(Sender: TObject);
    procedure Comunicarerrorositiowebdefectuoso1Click(Sender: TObject);
    procedure CrearAccesoDirecto1Click(Sender: TObject);
    procedure Herramientasparadesarrolladores1Click(Sender: TObject);
    procedure ConsolaJavaScript1Click(Sender: TObject);
    procedure Administradordetareas1Click(Sender: TObject);
    procedure Im_cerrarpestanaClick(Sender: TObject);
    procedure Im_buscarcerrarMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_buscarcerrarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_buscarcerrarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_buscarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Buscarenlapgina1Click(Sender: TObject);
    procedure Im_buscarcerrarClick(Sender: TObject);
    procedure Im_todosmarcadoresClick(Sender: TObject);
    procedure Im_fondopestanaDblClick(Sender: TObject);
    procedure Mostrarsiemprelabarrademarcadores1Click(Sender: TObject);
  private
    { Private declarations }
    ImageOver : TImage;
    FMove : boolean;
    FMove2 : boolean;
    primera : integer;
    npestana : integer;
    pestanas : boolean;
    LastX : integer;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
    procedure ResetImages2;
    procedure ResetImages3;
    Procedure ActionBuscar;
    Procedure Resetpestana;
    //procedure Change;
    procedure Pestana1(a:integer);
    procedure Pestana2(b:integer);
    procedure Change;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  FAcerca, FOpciones, FSincroMarca, FAdminMarc, FErrores, FGears, FDesarrollo, FConsole, FTareas;
// Apariencia

procedure TFormMain.FormCreate(Sender: TObject);
begin
  primera := 0;
  npestana := 0;
  pestanas := False;
  Im_maspestana.left := 207;
  Im_pestanamedio.width := 180;
end;

procedure TFormMain.Im_fondopestanaDblClick(Sender: TObject);
begin
  if WindowState = wsNormal then begin
  WindowState := wsMaximized;
  Im_maxi.Picture.Bitmap := nil;
  Im_maxi.Tag := 4;
  ImLst_maxi.GetBitmap(Im_maxi.Tag+1, Im_maxi.Picture.Bitmap);
  end
  else if WindowState = wsMaximized then begin
  WindowState := wsNormal;
  Im_maxi.Picture.Bitmap := nil;
  Im_maxi.Tag := 1;
  ImLst_maxi.GetBitmap(Im_maxi.Tag+1, Im_maxi.Picture.Bitmap);
  end;
  Im_pestanamedio.width := 180;
end;

procedure TFormMain.Im_maxiClick(Sender: TObject);
begin
  if WindowState = wsNormal then WindowState := wsMaximized
  else if WindowState = wsMaximized then WindowState := wsNormal;
  Im_pestanamedio.width := 180;
end;

procedure TFormMain.Im_miniClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFormMain.Im_cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.Im_cerrarpestanaClick(Sender: TObject);
begin
  If Im_cerrarpestana2.visible = True then begin
    //npestana := npestana - 1;
    Im_cerrarpestana.visible := False;
    Im_pestanaleft.visible := False;
    Im_pestanamedio.visible := False;
    Im_pestanaright.visible := False;
    Im_logopestana.visible := False;
    Lbl_pestana.visible := False;
    primera := 0;
    Pestana2(3);
    npestana := 1;
    Im_maspestana.left := 207;
    Resetpestana;
    pestanas := False;
  end else Close;
end;

procedure TFormMain.Im_cerrarpestana2Click(Sender: TObject);
begin
  If Im_cerrarpestana.visible = True then begin
    //npestana := npestana - 1;
    Im_cerrarpestana2.visible := False;
    Im_pestanaleft2.visible := False;
    Im_pestanamedio2.visible := False;
    Im_pestanaright2.visible := False;
    Im_logopestana2.visible := False;
    Lbl_pestana2.visible := False;
    primera := 0;
    npestana := 0;
    Pestana1(3);
    Im_maspestana.left := 207;
    Resetpestana;
    pestanas := False;
  end else Close;
end;

procedure TFormMain.ImagePanelTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0) ;
  PanelTop.SetFocus;
  Im_pestanamedio.width := 180;
end;
// Buscar

procedure TFormMain.Im_playClick(Sender: TObject);
begin
If Im_play.Tag = 0 then if EditURL.Text <> '' then ActionBuscar;
end;

procedure TFormMain.EditURLChange(Sender: TObject);
begin
  if primera = 0 then Editurl.Width := Im_url.width -10;
  If EditURL.text = '' then
  begin
    Lbl_consulta.visible := True;
    Editurl.Width := Im_url.Width - 10 - Lbl_consulta.Width - 5;
    primera := 1;
  end;
  If primera = 1 then
  begin
    Lbl_consulta.visible := (Length(EditURL.Text)*9 < (Im_url.Width - 10 - Lbl_consulta.Width - 5));
    If Lbl_consulta.visible = False then Editurl.Width := Im_url.width -10
    else Editurl.Width := Im_url.Width - 10 - Lbl_consulta.Width - 5;
  end;
end;

procedure TFormMain.EditURLKeyPress(Sender: TObject; var Key: Char);
begin
  if key = Char(13) then if EditURL.Text <> '' then ActionBuscar;
end;

Procedure TFormMain.ActionBuscar;
begin
  ShowMessage('Nueva Página');
end;

// Cambio de imágenes de cada botón

procedure TFormMain.Im_refreshMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_refresh.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_refreshMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_refresh.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_inicioMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_inicio.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_inicioMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_inicio.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_paginaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_pagina.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  ResetImages3;
end;

procedure TFormMain.Im_paginaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_pagina.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_HerramientasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_herramientas.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_HerramientasMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_herramientas.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_atrasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_atras.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_atrasMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_atras.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_adelanteMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_adelante.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_adelanteMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_adelante.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_estrellaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_estrella.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_estrellaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
    else TImage(Sender).Tag := 4;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_estrella.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_playMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_play.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_playMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
    else TImage(Sender).Tag := 4;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_play.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_cerrarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_cerrarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_cerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_maxiMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_maxi.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_maxiMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_maxi.GetBitmap(TImage(Sender).Tag+1, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_miniMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_miniMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_mini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_maspestanaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_pestanamas.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_maspestanaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_pestanamas.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_cerrarpestanaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If npestana = 0 then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  end
  else
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(3, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Im_cerrarpestanaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If npestana = 0 then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
  end
  else
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(4, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Im_cerrarpestana2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If npestana = 1 then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  end
  else
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(3, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Im_cerrarpestana2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If npestana = 1 then
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
  end
  else
  begin
    TImage(Sender).Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(4, TImage(Sender).Picture.Bitmap);
  end;
end;

procedure TFormMain.Im_marc1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marcgoogle.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_marc1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marcgoogle.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_todosmarcadoresMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marctodos.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_todosmarcadoresMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marctodos.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_marc2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marchotmail.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_marc2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marchotmail.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_marc3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marcintranet.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_marc3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_marcintranet.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_buscarcerrarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_buscarcerrar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_buscarcerrarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImLst_buscarcerrar.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

// IMAGEN BRILLANTE AL PASAR EL RATÓN POR ENCIMA
// Evento MouseMove
  // MouseMove7 en la imagen7 y la 21 para que resetee las imágenes al pasar por estas.
  // Demás eventos MouseMove para ir al proceso ChangeImage con todas las variables bien
// ImageOver
  // Variable la cual cerciora el haber pasado por el proceso ResetImages poniendo a la imagen con valor nulo.
// ChangeImage:
  // Proceso para cambiar la imagen
// img, imgList, Selected:
  //img: valor nil o el de la imagen a modificar
  //imgList: valor de la lista de imagenes a utilizar
  //Selected: Boolean que indica si toca poner la imagen brillante o no
// ResetImages:
  // Proceso para poner todas las imágenes sin brillo

procedure TFormMain.ResetImages;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_atras, ImLst_atras, False);
  ChangeImage(Im_adelante, ImLst_adelante, False);
  ChangeImage(Im_refresh, ImLst_refresh, False);
  ChangeImage(Im_inicio, ImLst_inicio, False);
  ChangeImage(Im_estrella, ImLst_estrella, False);
  ChangeImage(Im_play, ImLst_play, False);
  ChangeImage(Im_pagina, ImLst_pagina, False);
  ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  ChangeImage(Im_marc1, ImLst_marcgoogle, False);
  ChangeImage(Im_todosmarcadores, ImLst_marctodos, False);
  ChangeImage(Im_marc2, ImLst_marchotmail, False);
  ChangeImage(Im_marc3, ImLst_marcintranet, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

Procedure TFormMain.Resetpestana;
begin
  If npestana = 0 then begin
    Im_cerrarpestana.Picture.Bitmap := nil;
    Im_cerrarpestana.tag := 0;
    ImLst_pestanacerrar.GetBitmap(2, Im_cerrarpestana.Picture.Bitmap);
    Im_pestanaleft.Picture.Bitmap := nil;
    ImLst_pestanaleft.GetBitmap(0, Im_pestanaleft.Picture.Bitmap);
    Im_pestanamedio.Picture.Bitmap := nil;
    ImLst_pestanamedio.GetBitmap(0, Im_pestanamedio.Picture.Bitmap);
    Im_pestanaright.Picture.Bitmap := nil;
    ImLst_pestanaright.GetBitmap(0, Im_pestanaright.Picture.Bitmap);
    Im_pestanaright.BringToFront;
    Im_pestanaleft.BringToFront;
    Im_pestanamedio.BringToFront;
    Im_logopestana.BringToFront;
    Lbl_pestana.BringToFront;
    Im_cerrarpestana.BringToFront;
    Im_pestanaleft.transparent := True;
  end else begin
    Im_cerrarpestana2.Picture.Bitmap := nil;
    Im_cerrarpestana2.tag := 0;
    ImLst_pestanacerrar.GetBitmap(2, Im_cerrarpestana2.Picture.Bitmap);
    Im_pestanaleft2.Picture.Bitmap := nil;
    ImLst_pestanaleft.GetBitmap(0, Im_pestanaleft2.Picture.Bitmap);
    Im_pestanamedio2.Picture.Bitmap := nil;
    ImLst_pestanamedio.GetBitmap(0, Im_pestanamedio2.Picture.Bitmap);
    Im_pestanaright2.Picture.Bitmap := nil;
    ImLst_pestanaright.GetBitmap(0, Im_pestanaright2.Picture.Bitmap);
    Im_pestanaright2.BringToFront;
    Im_pestanaleft2.BringToFront;
    Im_pestanamedio2.BringToFront;
    Im_logopestana2.BringToFront;
    Lbl_pestana2.BringToFront;
    Im_cerrarpestana2.BringToFront;
    Im_pestanaleft2.transparent := True;
  end;
  ResetImages2;
end;

procedure TFormMain.ResetImages2;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_mini, ImLst_mini, False);
  ChangeImage(Im_maxi, ImLst_maxi, False);
  ChangeImage(Im_cerrar, ImLst_cerrar, False);
  ChangeImage(Im_maspestana, ImLst_pestanamas, False);
  If npestana = 1 then
  begin
    ChangeImage(Im_cerrarpestana2, ImLst_pestanacerrar, False);
    ChangeImage(Im_pestanaleft, ImLst_pestanaleft, False);
    ChangeImage(Im_pestanamedio, ImLst_pestanamedio, False);
    ChangeImage(Im_pestanaright, ImLst_pestanaright, False);
    Im_cerrarpestana.Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(6, Im_cerrarpestana.Picture.Bitmap);
  end else begin
    ChangeImage(Im_cerrarpestana, ImLst_pestanacerrar, False);
    If Im_pestanaleft2.Visible then
    begin
      ChangeImage(Im_pestanaleft2, ImLst_pestanaleft, False);
      ChangeImage(Im_pestanamedio2, ImLst_pestanamedio, False);
      ChangeImage(Im_pestanaright2, ImLst_pestanaright, False);
      Im_cerrarpestana2.Picture.Bitmap := nil;
      ImLst_pestanacerrar.GetBitmap(6, Im_cerrarpestana2.Picture.Bitmap);
    end;
  end;
  ImageOver := nil;
end;

procedure TFormMain.ResetImages3;
begin
  if ImageOver = nil then exit;
  //desmarcar iconos
  ChangeImage(Im_buscarcerrar, ImLst_buscarcerrar, False);
  //anotar que estan desmarcados
  ImageOver := nil;
end;

procedure TFormMain.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormMain.Im_barrafondoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = Im_pestanaleft then ResetImages2;
  ResetImages;
end;

procedure TFormMain.Im_fondopestanaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages2;
end;

procedure TFormMain.Im_buscarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages3;
end;

procedure TFormMain.Im_HerramientasMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_herramientas, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_paginaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_pagina, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_playMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_play, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_inicioMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_inicio, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_refreshMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_refresh, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_adelanteMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_adelante, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_atrasMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_atras, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_estrellaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_estrella, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_miniMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_mini, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_maxiMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_maxi, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_cerrarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_cerrar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_maspestanaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_pestanamas, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_marc1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_marcgoogle, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_todosmarcadoresMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_marctodos, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_marc3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_marcintranet, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_marc2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImLst_marchotmail, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_cerrarpestanaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If npestana <> 0 then
  begin
    Im_cerrarpestana.tag := 4;
    Im_cerrarpestana.Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(Im_cerrarpestana.tag, Im_cerrarpestana.Picture.Bitmap);
    ImageOver := Im_cerrarpestana;
  end
  else begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_pestanacerrar, True);
  ImageOver := TImage(Sender);
  end;
end;

procedure TFormMain.Im_cerrarpestana2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  If npestana <> 1 then
  begin
    Im_cerrarpestana2.tag := 4;
    Im_cerrarpestana2.Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(Im_cerrarpestana2.tag, Im_cerrarpestana2.Picture.Bitmap);
    ImageOver := Im_cerrarpestana2;
  end
  else begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImLst_pestanacerrar, True);
  ImageOver := TImage(Sender);
  end;
end;

procedure TFormMain.Im_buscarcerrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImLst_buscarcerrar, True);
  ImageOver := TImage(Sender);
end;

// Crear la nueva pestaña

procedure TFormMain.Im_maspestanaClick(Sender: TObject);
begin
  If pestanas = True then exit;
  pestanas := True;
  Im_maspestana.left := 404;
  If npestana = 0 then
  begin
  If Im_pestanaleft.Left = 3 then Pestana2(200) else Pestana2(3);
  Im_cerrarpestana.Picture.Bitmap := nil;
  Im_cerrarpestana.tag := 6;
  ImLst_pestanacerrar.GetBitmap(6, TImage(Sender).Picture.Bitmap);
  Im_pestanaleft.Picture.Bitmap := nil;
  ImLst_pestanaleft.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  Im_pestanamedio.Picture.Bitmap := nil;
  ImLst_pestanamedio.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  Im_pestanaright.Picture.Bitmap := nil;
  ImLst_pestanaright.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  npestana := 1;
  ResetImages2;
  Im_cerrarpestana2.visible := True;
  Im_pestanaleft2.visible := True;
  Im_pestanamedio2.visible := True;
  Im_pestanaright2.visible := True;
  Im_logopestana2.visible := True;
  Lbl_pestana2.visible := True;
  Resetpestana;
  end else begin
  If Im_pestanaleft2.Left = 3 then Pestana1(200) else Pestana1(3);
  Im_cerrarpestana2.Picture.Bitmap := nil;
  Im_cerrarpestana2.tag := 6;
  ImLst_pestanacerrar.GetBitmap(6, TImage(Sender).Picture.Bitmap);
  Im_pestanaleft2.Picture.Bitmap := nil;
  ImLst_pestanaleft.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  Im_pestanamedio2.Picture.Bitmap := nil;
  ImLst_pestanamedio.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  Im_pestanaright2.Picture.Bitmap := nil;
  ImLst_pestanaright.GetBitmap(2, TImage(Sender).Picture.Bitmap);
  npestana := 0;
  ResetImages2;
  Im_cerrarpestana.visible := True;
  Im_pestanaleft.visible := True;
  Im_pestanamedio.visible := True;
  Im_pestanaright.visible := True;
  Im_logopestana.visible := True;
  Lbl_pestana.visible := True;
  Resetpestana;
  end;
end;

// Efecto icono

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  Lbl_pestana.Visible := False;
  Im_cerrarpestana.visible := False;
  Im_pestanamedio.width := 24;
  Pestana1(Im_pestanaleft.Left);
end;

// Movimiento de la pestaña
// 1- Cambiar apariencia de pestaña en uso y avisar de que está activa

procedure TFormMain.Im_pestanamedioClick(Sender: TObject);
begin
  npestana := 0;
  Resetpestana;
end;

procedure TFormMain.Im_pestanaleft2Click(Sender: TObject);
begin
  npestana := 1;
  Resetpestana;
end;

procedure TFormMain.Im_pestanaleftMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove := true;
  LastX := X;
  npestana := 0;
  Resetpestana;
end;

procedure TFormMain.Im_pestanamedio2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FMove2 := true;
   LastX := X;
   npestana := 1;
   Resetpestana;
end;

// 2- Movimiento de la pestaña cuando se mueva el ratón

procedure TFormMain.Im_pestanaleftMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newX : integer;
begin
  If npestana <>0 then
  begin
    If ImageOver = Im_pestanaleft then if not FMove then exit;;
    ChangeImage(Im_maspestana, ImLst_pestanamas, False);
    ChangeImage(Im_pestanaleft, ImLst_pestanaleft, True);
    ChangeImage(Im_pestanaright, ImLst_pestanaright, True);
    ChangeImage(Im_pestanamedio, ImLst_pestanamedio, True);
    Im_cerrarpestana.Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(5, Im_cerrarpestana.Picture.Bitmap);
    ImageOver := Im_pestanaleft;
  end else ResetImages2;
  if not FMove then exit;
  newX := Im_pestanaleft.Left+x;
  if newx < Im_fondopestana.Left+LastX then begin
  newX := Im_fondopestana.Left+LastX;
  Pestana1(newx-LastX);
  exit;
  end;
  if newx > (Im_fondopestana.Left + Im_mini.Left - 217 + LastX) then begin
  newX := (Im_fondopestana.Left + Im_mini.Left - 217 + LastX);
  Pestana1(newx-LastX);
  exit;
  end;
  Pestana1(newx-LastX);
  If Im_fondopestana.Left = Im_pestanaLeft.Left then Timer1.Enabled := True else Timer1.Enabled := False;
  Change;
end;

procedure TFormMain.Im_pestanamedio2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  If npestana <> 1 then
  begin
    If ImageOver = Im_pestanaleft2 then if not FMove2 then exit;;
    ChangeImage(Im_maspestana, ImLst_pestanamas, False);
    ChangeImage(Im_pestanaleft2, ImLst_pestanaleft, True);
    ChangeImage(Im_pestanaright2, ImLst_pestanaright, True);
    ChangeImage(Im_pestanamedio2, ImLst_pestanamedio, True);
    Im_cerrarpestana2.Picture.Bitmap := nil;
    ImLst_pestanacerrar.GetBitmap(5, Im_cerrarpestana2.Picture.Bitmap);
    ImageOver := Im_pestanaleft2;
  end else ResetImages2;
  if not FMove2 then exit;
  newX := Im_pestanaleft2.Left+x;
  if newx < Im_fondopestana.Left+LastX then begin
  newX := Im_fondopestana.Left+LastX;
  end;
  if newx > (Im_fondopestana.Left + Im_mini.Left - 217 + LastX) then newX := (Im_fondopestana.Left + Im_mini.Left - 217 + LastX);
  Pestana2(newx-LastX);
  Change;
end;

// 3- Cambios cuando se suba el ratón

procedure TFormMain.Im_pestanaleftMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMove := False;
  If Timer1.Enabled = True then begin
  Timer1.Enabled := False;
  Lbl_pestana.Visible := True;
  Im_cerrarpestana.visible := True;
  Im_pestanamedio.width := 180;
  end;
  If pestanas = True then
  begin
  If Im_pestanaleft.Left < Im_pestanaleft2.left  then
  begin
  Pestana1(3);
  Pestana2(200);
  end;
  If Im_pestanaleft2.Left < Im_pestanaleft.left  then
  begin
  Pestana1(200);
  Pestana2(3);
  end;
  end else Pestana1(3);
end;

procedure TFormMain.Im_pestanamedio2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMove2 := False;
  If Im_pestanaleft.Left < Im_pestanaleft2.left  then
  begin
  Pestana1(3);
  Pestana2(200);
  end;
  If Im_pestanaleft2.Left < Im_pestanaleft.left  then
  begin
  Pestana1(200);
  Pestana2(3);
  end;
end;

// 4- Cambio de las pestañas

procedure TFormMain.Change;
begin
If pestanas = True then
begin
  If Im_pestanaleft.Left < Im_pestanaleft2.left  then
  begin
    If Im_pestanaleft2.Left < 100 then
      If Im_pestanaleft2.Left > 90 then
      begin
        Pestana1(200);
        Pestana2(3);
        exit;
      end;
    If Im_pestanaright.Left + 21 > 320 then
      If Im_pestanaright.Left + 21 < 330 then
      begin
        Pestana1(200);
        Pestana2(3);
        exit;
      end;
  end;
  If Im_pestanaleft2.Left < Im_pestanaleft.left  then
  begin
    If Im_pestanaleft.Left < 100 then
      If Im_pestanaleft.Left > 90 then
      begin
        Pestana1(3);
        Pestana2(200);
        exit;
      end;
    If Im_pestanaright2.Left + 21 > 320 then
      If Im_pestanaright2.Left + 21 < 330 then
      begin
        Pestana1(3);
        Pestana2(200);
        exit;
      end;
  end;
end;
end;

procedure TFormMain.Pestana1(a :integer );
begin
  Im_pestanaleft.Left := a;
  Im_pestanamedio.Left := Im_pestanaleft.Left + Im_pestanaleft.width;
  Im_pestanaright.Left := Im_pestanamedio.Left + Im_pestanamedio.width;
  Im_cerrarpestana.Left := Im_pestanaleft.Left + 187;
  Lbl_pestana.Left := Im_pestanaleft.Left + 40;
  Im_logopestana.Left := Im_pestanaleft.Left + 19;
end;

procedure TFormMain.Pestana2(b:integer);
begin
  Im_pestanaleft2.Left := b;
  Im_pestanamedio2.Left := Im_pestanaleft2.Left + Im_pestanaleft2.width;
  Im_pestanaright2.Left := Im_pestanamedio2.Left + Im_pestanamedio2.width;
  Im_cerrarpestana2.Left := Im_pestanaleft2.Left + 187;
  Lbl_pestana2.Left := Im_pestanaleft2.Left + 40;
  Im_logopestana2.Left := Im_pestanaleft2.Left + 19;
end;
// Para que aparezca el Menú

procedure TFormMain.Im_paginaClick(Sender: TObject);
begin
  ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  ChangeImage(Im_todosmarcadores, ImLst_marctodos, False);
  PUMenu_Pagina.Popup
  (TControl(Sender).ClientOrigin.X+TControl(Sender).Width,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height-5);
end;

procedure TFormMain.Im_todosmarcadoresClick(Sender: TObject);
begin
  ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  ChangeImage(Im_pagina, ImLst_pagina, False);
  PUMenu_Marcadores.Popup
  (TControl(Sender).ClientOrigin.X+TControl(Sender).Width,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_HerramientasClick(Sender: TObject);
begin
  ChangeImage(Im_pagina, ImLst_pagina, False);
  ChangeImage(Im_todosmarcadores, ImLst_marctodos, False);
  PUMenu_Herramientas.Popup
  (TControl(Sender).ClientOrigin.X+TControl(Sender).Width,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height-5);
end;

// Funcionalidades de los menús

procedure TFormMain.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.AcercadeGoogleChrome1Click(Sender: TObject);
begin
  //crear formulario ACERCA
  with FAcerca.TFormAcerca.Create(nil) do
  try
    ShowModal;
    ChangeImage(Im_Herramientas, ImLst_herramientas, False);
//    Show;
  finally
    Free;
  end;
end;

procedure TFormMain.Opciones1Click(Sender: TObject);
begin
  with FOpciones.TFormOpciones.Create(nil) do
  try
    Show;
    ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  finally
  end;
end;

procedure TFormMain.Sincronizarmismarcadores1Click(Sender: TObject);
begin
  with FSincroMarca.TFormSincroMarca.Create(nil) do
  try
    Show;
    ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  finally
  end;
end;

procedure TFormMain.Administradordemarcadores1Click(Sender: TObject);
begin
  with FAdminMarc.TFormAdminMarc.Create(nil) do
  try
    Show;
    ChangeImage(Im_Herramientas, ImLst_herramientas, False);
  finally
  end;
end;

procedure TFormMain.Comunicarerrorositiowebdefectuoso1Click(
  Sender: TObject);
begin
  with FErrores.TFormErrores.Create(nil) do
  try
    ShowModal;
    ChangeImage(Im_pagina, ImLst_pagina, False);
  finally
    Free;
  end;
end;

procedure TFormMain.CrearAccesoDirecto1Click(Sender: TObject);
begin
  with FGears.TFormGears.Create(nil) do
  try
    ShowModal;
    ChangeImage(Im_pagina, ImLst_pagina, False);
  finally
    Free;
  end;
end;

procedure TFormMain.Herramientasparadesarrolladores1Click(Sender: TObject);
begin
  with FDesarrollo.TFormDesarrollo.Create(nil) do
  try
    Show;
    ChangeImage(Im_pagina, ImLst_pagina, False);
  finally
  end;
end;

procedure TFormMain.ConsolaJavaScript1Click(Sender: TObject);
begin
  with FConsole.TFormConsole.Create(nil) do
  try
    Show;
    ChangeImage(Im_pagina, ImLst_pagina, False);
  finally
  end;
end;

procedure TFormMain.Administradordetareas1Click(Sender: TObject);
begin
  with FTareas.TFormTareas.Create(nil) do
  try
    Show;
    ChangeImage(Im_pagina, ImLst_pagina, False);
  finally
  end;
end;

procedure TFormMain.Buscarenlapgina1Click(Sender: TObject);
begin
  PanelBuscar.Visible := True;
  ChangeImage(Im_pagina, ImLst_pagina, False);
end;

procedure TFormMain.Im_buscarcerrarClick(Sender: TObject);
begin
  PanelBuscar.Visible := False;
end;

procedure TFormMain.Mostrarsiemprelabarrademarcadores1Click(
  Sender: TObject);
begin
  If Mostrarsiemprelabarrademarcadores1.Checked = True then
  Mostrarsiemprelabarrademarcadores1.Checked := False
  else Mostrarsiemprelabarrademarcadores1.Checked := True;
  If Mostrarsiemprelabarrademarcadores1.Checked = True then
  begin
    PanelUp.Height := 62;
    Im_marc1.Visible := True;
    Im_marc2.visible := True;
    Im_marc3.Visible := True;
    Im_todosmarcadores.visible := True;
  end
  else begin
    PanelUp.Height := 36;
    Im_marc1.Visible := False;
    Im_marc2.visible := False;
    Im_marc3.Visible := False;
    Im_todosmarcadores.visible := False;
  end;
end;


end.
