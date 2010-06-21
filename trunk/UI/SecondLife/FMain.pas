unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, Menus;

type
  TFormMain = class(TForm)
    PanelTop: TPanel;
    PanelRight: TPanel;
    PanelClient: TPanel;
    Im_fondotop1: TImage;
    Im_fondotop2: TImage;
    PanelRightBottom: TPanel;
    Im_fondorightclient: TImage;
    PanelClientBottom: TPanel;
    Im_fondoclient: TImage;
    Im_fondorightbottom: TImage;
    Im_barrarightbottom: TImage;
    Im_panel: TImage;
    Im_mapa: TImage;
    Im_guia: TImage;
    Im_fondoclientbottom: TImage;
    Im_yo: TImage;
    Im_comunicarse: TImage;
    Im_mundo: TImage;
    Im_construir: TImage;
    Im_barayuda: TImage;
    ImageListYo: TImageList;
    ImageListComunicarse: TImageList;
    ImageListMundo: TImageList;
    ImageListConstruir: TImageList;
    ImageListBarayuda: TImageList;
    ImageListPanel: TImageList;
    ImageListMapa: TImageList;
    ImageListguia: TImageList;
    Im_atras: TImage;
    Im_adelante: TImage;
    Im_inicio: TImage;
    Im_favoritos: TImage;
    Im_0L: TImage;
    Im_comprarL: TImage;
    Im_volumen: TImage;
    Im_pause: TImage;
    ImageListinicio: TImageList;
    ImageList0L: TImageList;
    ImageListcomprarL: TImageList;
    ImageListvolum: TImageList;
    Im_bolamundo: TImage;
    Im_flechas: TImage;
    Im_maleta: TImage;
    Im_gente: TImage;
    Im_carnet: TImage;
    Im_camiseta: TImage;
    Im_mano: TImage;
    ImageListflechas: TImageList;
    ImageListmano: TImageList;
    ImageListcarnet: TImageList;
    ImageListgente: TImageList;
    ImageListbolamundo: TImageList;
    ImageListmaleta: TImageList;
    ImageListcamiseta: TImageList;
    Im_buscar: TImage;
    ImageListBuscar: TImageList;
    EditBuscar: TEdit;
    PanelVolumen: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Im_volumebar: TImage;
    Im_volumebola: TImage;
    Im_herramientas: TImage;
    ImageListherramientas: TImageList;
    Label1: TLabel;
    Timer1: TTimer;
    TimerBuscar1: TTimer;
    Im_barlefttop: TImage;
    Im_bartop: TImage;
    Im_btnbartop: TImage;
    Edit1: TEdit;
    ImageListurlL: TImageList;
    ImageListurlR: TImageList;
    ImageListurlC: TImageList;
    Im_inf: TImage;
    Im_est: TImage;
    Shape1: TShape;
    Image10: TImage;
    Im_ayuda_inv: TImage;
    Im_mini_inv: TImage;
    Im_esq: TImage;
    ImageListayuda: TImageList;
    ImageListmini: TImageList;
    Im_barchat: TImage;
    Im_btnchat: TImage;
    ImageListbarrachat: TImageList;
    Edit2: TEdit;
    ImageListbtnchat: TImageList;
    Lbl_chat: TLabel;
    Im_chat: TImage;
    Im_btnhablar: TImage;
    Im_hablar: TImage;
    Im_off2: TImage;
    Im_off1: TImage;
    Im_gestos: TImage;
    Im_mover: TImage;
    Im_vision: TImage;
    ImageListhablar: TImageList;
    ImageListbtnhablar: TImageList;
    ImageListgestionar: TImageList;
    ImageListmoverme: TImageList;
    ImageListvision: TImageList;
    Im_panthablar: TImage;
    Im_hmini: TImage;
    Im_hayuda: TImage;
    PUMenu_Yo: TPopupMenu;
    Preferencias1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Mipaneldecontrol1: TMenuItem;
    ComprarL1: TMenuItem;
    N3: TMenuItem;
    Miperfil1: TMenuItem;
    Miapariencia1: TMenuItem;
    Miinventario1: TMenuItem;
    Misgestos1: TMenuItem;
    Miestado1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Pasaralestadoausente1: TMenuItem;
    N6: TMenuItem;
    Pasaralestadoocupado1: TMenuItem;
    N7: TMenuItem;
    SalirdeSecondLife1: TMenuItem;
    PUMenu_Comunicarse: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    Misamigos1: TMenuItem;
    Misgrupos1: TMenuItem;
    N10: TMenuItem;
    Chat1: TMenuItem;
    Gentecerca1: TMenuItem;
    Im_foto: TImage;
    ImageListfoto: TImageList;
    ImageListinf: TImageList;
    ImageListestrella: TImageList;
    Im_caminar: TImage;
    Im_orbital: TImage;
    Im_vision1: TImage;
    Im_vision2: TImage;
    Im_vision3: TImage;
    Im_vision4: TImage;
    ImageListvision1: TImageList;
    ImageListvision2: TImageList;
    ImageListvision3: TImageList;
    ImageListvision4: TImageList;
    Im_omini: TImage;
    Im_oayuda: TImage;
    Im_cmini: TImage;
    Im_cayuda: TImage;
    PUMenu_Mundo: TPopupMenu;
    Minimapa1: TMenuItem;
    Mapadelmundo1: TMenuItem;
    Foto1: TMenuItem;
    Crearunhitodeestesitio1: TMenuItem;
    Perfildellugar1: TMenuItem;
    N13: TMenuItem;
    Compraresteterreno1: TMenuItem;
    Miterreno1: TMenuItem;
    Mostrar1: TMenuItem;
    N14: TMenuItem;
    eleportaralaBase1: TMenuItem;
    FijarmiBaseaqu1: TMenuItem;
    N15: TMenuItem;
    Sol1: TMenuItem;
    Acercadelterreno1: TMenuItem;
    ReginEstado1: TMenuItem;
    Controlesdelmovimiento1: TMenuItem;
    Controlesdelacmara1: TMenuItem;
    Lneasdeprohibicin1: TMenuItem;
    Balizas1: TMenuItem;
    Lmitesdelasparcelas1: TMenuItem;
    Propietariosdelterreno1: TMenuItem;
    Coordenadas1: TMenuItem;
    Propiedadesdelaparcela1: TMenuItem;
    Amanecer1: TMenuItem;
    Medioda1: TMenuItem;
    Atardecer1: TMenuItem;
    Medianoche1: TMenuItem;
    HoradelEstado1: TMenuItem;
    PUMenu_Ayuda: TPopupMenu;
    ayudadeSecondLife1: TMenuItem;
    N16: TMenuItem;
    Denunciarunainfraccin1: TMenuItem;
    Informardeunfallo1: TMenuItem;
    N17: TMenuItem;
    AboutSecondLife1: TMenuItem;
    PUMenu_Gestos: TPopupMenu;
    Gestos1: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Vertodos1: TMenuItem;
    PUMenu_Construir: TPopupMenu;
    Construir1: TMenuItem;
    Seleccionarlaherramientadeconstruccin1: TMenuItem;
    Editar1: TMenuItem;
    N20: TMenuItem;
    Enlazar1: TMenuItem;
    Desenlazar1: TMenuItem;
    Editarlaspartesenlazadas1: TMenuItem;
    N21: TMenuItem;
    Visinenlosseleccionado1: TMenuItem;
    Zoomenloseleccionado1: TMenuItem;
    N22: TMenuItem;
    Objeto1: TMenuItem;
    Scripts1: TMenuItem;
    N23: TMenuItem;
    Opciones1: TMenuItem;
    Seleccionarlaspartesenlazadas1: TMenuItem;
    HerramientaVisin1: TMenuItem;
    HerramientaMover1: TMenuItem;
    HerramientaEditar1: TMenuItem;
    HerramientaCrear1: TMenuItem;
    HerramientaTerreno1: TMenuItem;
    Deshacer1: TMenuItem;
    Rehacer1: TMenuItem;
    N24: TMenuItem;
    Cortar1: TMenuItem;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    Elimira1: TMenuItem;
    Duplicar1: TMenuItem;
    N25: TMenuItem;
    Seleccionartodo1: TMenuItem;
    Deseleccionar1: TMenuItem;
    Seleccionarlapartesiguiente1: TMenuItem;
    Seleccionarlaparteprevia1: TMenuItem;
    Incluirlapartesiguiente1: TMenuItem;
    incluirlaparteprevia1: TMenuItem;
    procedure Im_inicioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_inicioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_0LMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_0LMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_comprarLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_comprarLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_volumenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_volumenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_panelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_panelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_mapaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_mapaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_guiaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_guiaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_yoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_comunicarseMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_mundoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_construirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_barayudaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_inicioMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_volumenMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_panelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_mapaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_guiaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_fondotop1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_fondorightbottomMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_flechasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_flechasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_flechasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_manoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_manoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_manoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_carnetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_carnetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_carnetMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_genteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_genteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_genteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_bolamundoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_bolamundoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_bolamundoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maletaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_maletaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_maletaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_camisetaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_camisetaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_camisetaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_fondoclientMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_buscarClick(Sender: TObject);
    procedure Im_flechasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Im_herramientasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Im_herramientasMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_herramientasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_volumebolaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_volumebolaMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_volumebolaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_0LClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditBuscarChange(Sender: TObject);
    procedure TimerBuscar1Timer(Sender: TObject);
    procedure EditBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Im_ayuda_invMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_ayuda_invMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ayuda_invMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_mini_invMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_mini_invMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_mini_invMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_barchatClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Im_btnchatMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_btnchatMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ayuda_invClick(Sender: TObject);
    procedure Im_hablarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_hablarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_hablarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_btnhablarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_btnhablarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_btnhablarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_hminiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_hminiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_panthablarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Im_gestosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_gestosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_gestosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_moverMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_moverMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_moverMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_visionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_visionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_visionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_yoClick(Sender: TObject);
    procedure Im_comunicarseClick(Sender: TObject);
    procedure Im_fotoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_fotoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_fotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_infMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_infMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_infMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_bartopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_estMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_estMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_estMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_vision1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_vision2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_vision3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_vision4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_vision4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_orbitalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Im_ominiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_cminiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Im_mundoClick(Sender: TObject);
    procedure Im_barayudaClick(Sender: TObject);
    procedure Im_gestosClick(Sender: TObject);
    procedure Vertodos1Click(Sender: TObject);
    procedure Im_construirClick(Sender: TObject);
    procedure Im_herramientasClick(Sender: TObject);
    procedure ayudadeSecondLife1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure ndadeSecondLife1MeasureItem(Sender: TObject;
      ACanvas: TCanvas; var Width, Height: Integer);
    procedure Construir1MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
//    procedure N11MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width,
//      Height: Integer);
    procedure Minimapa1MeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
  private
    ImageOver : TImage;
    selec : boolean;
    FSMove : boolean;
    a : integer;
    procedure ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
    procedure ResetImages;
    procedure ResetImages2;
    procedure ResetImages4;
    procedure ResetImages5;
    procedure ResetImages6;
    procedure FormCrear;
    procedure FormCrear2;
    procedure FormCrear3;
    procedure FormCrear4;
    procedure FormCrear5;
    procedure FormCrear6;
    procedure ResetPestana(img: TImage);
    procedure ResetBotons2(img: TImage);
    procedure Hablar(x : integer);
    procedure Chat(x : integer);
    procedure Gestos(x : integer);
    procedure Mover(x : integer);
    procedure Vision(x : integer);
    procedure ResetPantallas(a,b,c,d,e : TImage);
    { Private declarations }
  public
    procedure ResetImages3;
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses FHome,FComprar,FAyuda,FGestos, FPerfil, FPeople, FPlaces, FHerramientas, FInventory, FAppea;

{$R *.dfm}

// Al inicio

procedure TFormMain.Hablar(x : integer);
begin
If x = 0 then begin
Im_panthablar.Visible := True;
Im_hmini.visible := True;
Im_hayuda.visible := True;
end else if x = 1 then begin
Im_panthablar.Visible := False;
Im_hmini.visible := False;
Im_hayuda.visible := False;
end;
end;

procedure TFormMain.Gestos(x : integer);
begin
If x = 0 then begin

end else if x = 1 then begin

end;
end;

procedure TFormMain.Mover(x : integer);
begin
If x = 0 then begin
Im_caminar.visible := True;
Im_cmini.visible := true;
Im_cayuda.visible := true;
end else if x = 1 then begin
Im_caminar.visible := False;
Im_cmini.visible := False;
Im_cayuda.visible := False;
end;
end;

procedure TFormMain.Vision(x : integer);
begin
If x = 0 then begin
Im_orbital.Visible := True;
Im_omini.visible := True;
Im_oayuda.visible := True;
Im_vision1.visible := True;
Im_vision2.visible := True;
Im_vision3.visible := True;
Im_vision4.visible := True;
end else if x = 1 then begin
Im_orbital.Visible := False;
Im_omini.visible := False;
Im_oayuda.visible := False;
Im_vision1.visible := False;
Im_vision2.visible := False;
Im_vision3.visible := False;
Im_vision4.visible := False;
end;
end;

procedure TFormMain.Chat(x : integer);
begin
If x = 0 then begin
  Im_mini_inv.visible := True;
  Im_ayuda_inv.visible := True;
  Im_esq.visible := True;
  Image10.visible := True;
  Lbl_chat.visible := True;
  Im_chat.visible := True;
  Image10.Width := 223;
  Image10.Height := 164;
end else if x = 1 then begin
  Im_mini_inv.visible := False;
  Im_ayuda_inv.visible := False;
  Im_esq.visible := False;
  Image10.visible := False;
  Lbl_chat.visible := False;
  Im_chat.visible := False;
end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  selec := False;
  Panelright.Visible := False;
  Timer1.Enabled := True;
  Label1.Caption := DateToStr(Now) + ' ' + TimeToStr(Time);
  Edit1.Color := clSilver;
  Edit1.Font.Color := clnone;
  Edit1.ReadOnly := True;
  Shape1.visible := False;
  a := 1;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := DateToStr(Now) + ' ' + TimeToStr(Time);
end;

procedure TFormMain.EditBuscarChange(Sender: TObject);
begin
TimerBuscar1.Enabled := False;
If editbuscar.Text = '' then begin
  TimerBuscar1.Enabled := True;
end;
end;

procedure TFormMain.TimerBuscar1Timer(Sender: TObject);
begin
If editbuscar.Text = '' then begin
  Im_buscar.Picture.Bitmap := nil;
  ImageListBuscar.GetBitmap(1, Im_buscar.Picture.Bitmap);
  EditBuscar.Visible := False;
end;
end;

procedure TFormMain.EditBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = Char(13) then if editbuscar.Text = '' then begin
    Im_buscar.Picture.Bitmap := nil;
    ImageListBuscar.GetBitmap(1, Im_buscar.Picture.Bitmap);
    EditBuscar.Visible := False;
  end;
end;

procedure TFormMain.Im_buscarClick(Sender: TObject);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListBuscar.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  EditBuscar.Visible := True;
  EditBuscar.SetFocus;
end;

procedure TFormMain.Edit1Click(Sender: TObject);
begin
  Edit1.ReadOnly := False;
  Edit1.Color := $0099C409;
  Shape1.visible := True;
  Edit1.Font.Color := clWindow;
  Im_barlefttop.Picture.Bitmap := nil;
  ImageListurlL.GetBitmap(0, Im_barlefttop.Picture.Bitmap);
  Im_bartop.Picture.Bitmap := nil;
  ImageListurlC.GetBitmap(0, Im_bartop.Picture.Bitmap);
  Im_btnbartop.Picture.Bitmap := nil;
  ImageListurlR.GetBitmap(0, Im_btnbartop.Picture.Bitmap);
end;

procedure TFormMain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
If Key = Char(13) then begin
  Edit1.ReadOnly := True;
  Edit1.Color := clSilver;
  Edit1.Font.Color := clNone;
  Im_barlefttop.Picture.Bitmap := nil;
  ImageListurlL.GetBitmap(1, Im_barlefttop.Picture.Bitmap);
  Im_bartop.Picture.Bitmap := nil;
  ImageListurlC.GetBitmap(1, Im_bartop.Picture.Bitmap);
  Im_btnbartop.Picture.Bitmap := nil;
  ImageListurlR.GetBitmap(1, Im_btnbartop.Picture.Bitmap);
  Shape1.visible := False;
end;
end;

procedure TFormMain.Im_0LClick(Sender: TObject);
begin
with FComprar.TFormComprar.Create(nil) do
try
  ShowModal;
finally
  Free;
end;
end;

// Cambiar a la imagen brillante cuando pase el ratón

procedure TFormMain.ChangeImage(img: TImage; imgList: TImageList; Selected: boolean);
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

procedure TFormMain.ResetImages;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_yo, ImageListyo, False);
  ChangeImage(Im_comunicarse, ImageListcomunicarse, False);
  ChangeImage(Im_mundo, ImageListmundo, False);
  ChangeImage(Im_construir, ImageListconstruir, False);
  ChangeImage(Im_barayuda, ImageListbarayuda, False);
  ChangeImage(Im_inicio, ImageListinicio, False);
  ChangeImage(Im_volumen, ImageListvolum, False);
  ImageOver := nil;
end;

procedure TFormMain.ResetImages2;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_panel, ImageListpanel, False);
  ChangeImage(Im_mapa, ImageListmapa, False);
  ChangeImage(Im_guia, ImageListguia, False);
  ImageOver := nil;
end;

procedure TFormMain.ResetImages3;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_flechas, ImageListflechas, False);
  ChangeImage(Im_mano, ImageListmano, False);
  ChangeImage(Im_bolamundo, ImageListbolamundo, False);
  ChangeImage(Im_carnet, ImageListcarnet, False);
  ChangeImage(Im_maleta, ImageListmaleta, False);
  ChangeImage(Im_camiseta, ImageListcamiseta, False);
  ChangeImage(Im_gente, ImageListgente, False);
  ImageOver := nil;
end;

procedure TFormMain.ResetImages4;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_ayuda_inv, ImageListayuda, False);
  ChangeImage(Im_mini_inv, ImageListmini, False);
  ChangeImage(Im_hayuda, ImageListayuda, False);
  ChangeImage(Im_hmini, ImageListmini, False);
  ChangeImage(Im_btnchat, ImageListbtnchat, False);
  ChangeImage(Im_hablar, ImageListhablar, False);
  ChangeImage(Im_btnhablar, ImageListbtnhablar, False);
  ChangeImage(Im_gestos, ImageListgestionar, False);
  ChangeImage(Im_mover, ImageListmoverme, False);
  ChangeImage(Im_vision, ImageListvision, False);
  ChangeImage(Im_foto, ImageListfoto, False);
  ImageOver := nil;
end;

procedure TFormMain.ResetImages5;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_inf, ImageListinf, False);
  ChangeImage(Im_est, ImageListestrella, False);
  ImageOver := nil;
end;

procedure TFormMain.ResetImages6;
begin
  if ImageOver = nil then exit;
  ChangeImage(Im_vision1, ImageListvision1, False);
  ChangeImage(Im_vision2, ImageListvision2, False);
  ChangeImage(Im_vision3, ImageListvision3, False);
  ChangeImage(Im_vision4, ImageListvision4, False);
  ChangeImage(Im_omini, ImageListmini, False);
  ChangeImage(Im_oayuda, ImageListayuda, False);
  ImageOver := nil;
end;

procedure TFormMain.Im_fondotop1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages;
end;

procedure TFormMain.Im_fondorightbottomMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages2;
end;

procedure TFormMain.Image10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  If a = 2 then begin
  Image10.visible := False;
  a := 3;
  end;
  ResetImages4;
end;

procedure TFormMain.Im_yoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListyo, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_comunicarseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListcomunicarse, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_ayuda_invMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(TImage(Sender), ImageListayuda, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_mini_invMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(TImage(Sender), ImageListmini, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_mundoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListmundo, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_construirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListconstruir, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_barayudaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListbarayuda, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_inicioMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListinicio, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_volumenMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages;
  ChangeImage(TImage(Sender), ImageListvolum, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_panelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImageListpanel, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_mapaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImageListmapa, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_guiaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages2;
  ChangeImage(TImage(Sender), ImageListguia, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_flechasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListflechas, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_manoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListmano, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_carnetMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListcarnet, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_genteMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListgente, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_bolamundoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListbolamundo, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_estMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages5;
  ChangeImage(TImage(Sender), ImageListestrella, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_maletaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListmaleta, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_camisetaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListcamiseta, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_infMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages5;
  ChangeImage(TImage(Sender), ImageListinf, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_herramientasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages3;
  ChangeImage(TImage(Sender), ImageListherramientas, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_fondoclientMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages3;
  ResetImages4;
  PanelVolumen.Visible := False;
end;

// Cuando se hace click en cada imagen

procedure TFormMain.Im_btnhablarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbtnhablar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_btnhablarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_btnhablar, ImageListbtnhablar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_btnhablarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbtnhablar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 1 then begin
  ResetPantallas(Im_btnchat,Im_btnhablar,Im_gestos,Im_mover,Im_vision);
  Hablar(0);
  end else Hablar(1);
end;

procedure TFormMain.Im_hablarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListhablar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_hablarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_hablar, ImageListhablar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_hablarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListhablar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_inicioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListinicio.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_inicioMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListinicio.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_herramientasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListherramientas.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_herramientasMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListherramientas.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_infMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListinf.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_infMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListinf.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_ayuda_invMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_ayuda_invMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListayuda.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_0LMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList0L.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_0LMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageList0L.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_cminiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  Mover(1);
  Im_mover.Tag := 5;
  Im_mover.Picture.Bitmap := nil;
  ImageListmoverme.GetBitmap(Im_mover.Tag, Im_mover.Picture.Bitmap);
end;

procedure TFormMain.Im_mini_invMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  Chat(1);
  Im_btnchat.tag := 4;
  Im_btnchat.Picture.Bitmap := nil;
  ImageListbtnchat.GetBitmap(5, Im_btnchat.Picture.Bitmap);
end;

procedure TFormMain.Im_mini_invMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_comprarLMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcomprarL.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_estMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListestrella.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_estMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListestrella.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_comprarLMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcomprarL.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_volumenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvolum.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  PanelVolumen.Visible := TRue;
end;

procedure TFormMain.Im_volumenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvolum.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_panelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListpanel.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_panelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListpanel.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_mapaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmapa.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_mapaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmapa.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_guiaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListguia.GetBitmap(0, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_guiaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListguia.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

//Pestañas Down y Up

procedure TFormMain.Im_flechasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_manoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmano.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_carnetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcarnet.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_genteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListgente.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_bolamundoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbolamundo.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_maletaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmaleta.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_camisetaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  If selec = True then ResetPestana(TImage(Sender)) else selec := False;
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
    else TImage(Sender).Tag := 0;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcamiseta.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
end;

// Botones de la pestaña de vision, para que siempre esté uno seleccionado

procedure TFormMain.Im_vision1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ResetBotons2(TImage(Sender));
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision1.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages6;
  ChangeImage(Im_vision1, ImageListvision1, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 1;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision1.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ResetBotons2(TImage(Sender));
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision2.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages6;
  ChangeImage(Im_vision2, ImageListvision2, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 1;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision2.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ResetBotons2(TImage(Sender));
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision3.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages6;
  ChangeImage(Im_vision3, ImageListvision3, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 1;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision3.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ResetBotons2(TImage(Sender));
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision4.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages6;
  ChangeImage(Im_vision4, ImageListvision4, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_vision4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 1;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision4.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_orbitalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages6;
end;

procedure TFormMain.ResetBotons2(img: TImage);
begin
If img.tag = 4 then
begin
  Im_vision1.tag := 4;
  Im_vision2.tag := 4;
  Im_vision3.tag := 4;
  Im_vision4.tag := 4;
  Im_vision1.Picture.Bitmap := nil;
  ImageListvision1.GetBitmap(Im_vision1.Tag+1, Im_vision1.Picture.Bitmap);
  Im_vision2.Picture.Bitmap := nil;
  ImageListvision2.GetBitmap(Im_vision2.Tag+1, Im_vision2.Picture.Bitmap);
  Im_vision3.Picture.Bitmap := nil;
  ImageListvision3.GetBitmap(Im_vision3.Tag+1, Im_vision3.Picture.Bitmap);
  Im_vision4.Picture.Bitmap := nil;
  ImageListvision4.GetBitmap(Im_vision4.Tag+1, Im_vision4.Picture.Bitmap);
end;
end;

// UP

procedure TFormMain.Im_flechasMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If selec = False then begin
  FormCrear;
  Formperfil.close;
  Im_mano.Tag := 4;
  Im_mano.Picture.Bitmap := nil;
  ImageListmano.GetBitmap(Im_mano.Tag, Im_mano.Picture.Bitmap);
  selec := True;
  end;
end;

procedure TFormMain.Im_manoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmano.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormCrear;
  Formperfil.close;
  end;
end;

 procedure TFormMain.FormCrear;
begin
  FHome.TFormHome.Create(Self);
  FormHome.Parent := PanelRight;
  FormHome.Align := alClient;
  FormHome.Show;
end;

procedure TFormMain.FormCrear2;
begin
  FPerfil.TFormPerfil.Create(Self);
  FormPerfil.Parent := PanelRight;
  FormPerfil.Align := alClient;
  FormPerfil.Show;
end;

procedure TFormMain.FormCrear3;
begin
  FPeople.TFormPeople.Create(Self);
  FormPeople.Parent := PanelRight;
  FormPeople.Align := alClient;
  FormPeople.Show;
end;

procedure TFormMain.FormCrear4;
begin
  FPlaces.TFormPlaces.Create(Self);
  FormPlaces.Parent := PanelRight;
  FormPlaces.Align := alClient;
  FormPlaces.Show;
end;

procedure TFormMain.FormCrear5;
begin
  FInventory.TFormInventory.Create(Self);
  FormInventory.Parent := PanelRight;
  FormInventory.Align := alClient;
  FormInventory.Show;
end;

procedure TFormMain.FormCrear6;
begin
  FAppea.TFormAppea.Create(Self);
  FormAppea.Parent := PanelRight;
  FormAppea.Align := alClient;
  FormAppea.Show;
end;
procedure TFormMain.Im_carnetMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcarnet.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormHome.Close;
  FormCrear2;
  FormPeople.Close;
  FormPlaces.Close;
  FormInventory.Close;
  FormAppea.Close;
  end;
end;

procedure TFormMain.Im_genteMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListgente.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormHome.Close;
  FormPerfil.Close;
  FormCrear3;
  FormPlaces.Close;
  FormInventory.Close;
  FormAppea.Close;
  end;
end;

procedure TFormMain.Im_bolamundoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbolamundo.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormHome.Close;
  FormPerfil.Close;
  FormPeople.Close;
  FormCrear4;
  FormInventory.Close;
  FormAppea.Close;
  end;
end;

procedure TFormMain.Im_maletaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmaleta.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormHome.Close;
  FormPerfil.Close;
  FormPeople.Close;
  FormPlaces.Close;
  FormCrear5;
  FormAppea.Close;
  end;
end;

procedure TFormMain.Im_camisetaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListcamiseta.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 4 then
  begin
  Panelright.Visible := True;
  Im_flechas.Tag := 5;
  selec := True;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
  FormHome.Close;
  FormPerfil.Close;
  FormPeople.Close;
  FormPlaces.Close;
  FormInventory.Close;
  FormCrear6;
  end;
end;

procedure TFormMain.ResetPestana(img: TImage);
begin
If img.tag = 4 then
begin
  selec := False;
  Panelright.Visible := False;
  Im_flechas.Tag := 2;
  Im_flechas.Picture.Bitmap := nil;
  ImageListflechas.GetBitmap(Im_flechas.Tag, Im_flechas.Picture.Bitmap);
end;
If img.tag = 1 then
begin
  selec := True;
  Im_mano.tag := 1;
  Im_carnet.tag := 1;
  Im_gente.tag := 1;
  Im_bolamundo.tag := 1;
  Im_maleta.tag := 1;
  Im_camiseta.tag := 1;
  Im_mano.Picture.Bitmap := nil;
  ImageListmano.GetBitmap(Im_mano.Tag+1, Im_mano.Picture.Bitmap);
  Im_carnet.Picture.Bitmap := nil;
  ImageListcarnet.GetBitmap(Im_carnet.Tag+1, Im_carnet.Picture.Bitmap);
  Im_gente.Picture.Bitmap := nil;
  ImageListgente.GetBitmap(Im_gente.Tag+1, Im_gente.Picture.Bitmap);
  Im_bolamundo.Picture.Bitmap := nil;
  ImageListbolamundo.GetBitmap(Im_bolamundo.Tag+1, Im_bolamundo.Picture.Bitmap);
  Im_maleta.Picture.Bitmap := nil;
  ImageListmaleta.GetBitmap(Im_maleta.Tag+1, Im_maleta.Picture.Bitmap);
  Im_camiseta.Picture.Bitmap := nil;
  ImageListcamiseta.GetBitmap(Im_camiseta.Tag+1, Im_camiseta.Picture.Bitmap);
end;
end;

procedure TFormMain.Im_flechasClick(Sender: TObject);
begin
  If Im_flechas.tag < 2 then PanelRight.Visible := True else PanelRight.Visible := False;
end;

// Movimiento del volumen

procedure TFormMain.Im_volumebolaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FSMove := true;
end;

procedure TFormMain.Im_volumebolaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  newX : integer;
begin
  if not FSMove then exit;
  newX := Im_volumebola.top+y;
  if newx < (Im_volumebar.Top+1) then newX := Im_volumebar.Top;
  if newx > (Im_volumebar.Top + Im_volumebar.Height - Im_volumebola.height) then newX := (Im_volumebar.Top + Im_volumebar.Height - Im_volumebola.height);
  Im_volumebola.top := newX;
end;

procedure TFormMain.Im_volumebolaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FSMove := false;
end;

procedure TFormMain.Im_barchatClick(Sender: TObject);
begin
  Im_barchat.Picture.Bitmap := nil;
  ImageListbarrachat.GetBitmap(1, Im_barchat.Picture.Bitmap);
  Edit2.Visible := True;
  Edit2.SetFocus;
end;

procedure TFormMain.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = Char(13) then begin
  Edit2.visible := False;
  Im_barchat.Picture.Bitmap := nil;
  ImageListbarrachat.GetBitmap(0, Im_barchat.Picture.Bitmap);
  Lbl_chat.caption := Lbl_chat.caption +  #13#10 + Edit2.text;
end;
end;



procedure TFormMain.Im_btnchatMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 4;
    4: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListbtnchat.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 1 then begin
  ResetPantallas(Im_btnchat,Im_btnhablar,Im_gestos,Im_mover,Im_vision);
  Chat(0);
  end else Chat(1);
  a := 3;
end;

procedure TFormMain.Im_btnchatMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  If a = 1 then begin
  Image10.visible := True;
  a := 2;
  end;
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(TImage(Sender), ImageListbtnchat, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_ayuda_invClick(Sender: TObject);
begin
with FAyuda.TFormAyuda.Create(nil) do
  try
    ShowModal;
  finally
    Free;
end;
end;

procedure TFormMain.Im_ominiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  Vision(1);
  Im_vision.Tag := 5;
  Im_vision.Picture.Bitmap := nil;
  ImageListvision.GetBitmap(Im_vision.Tag, Im_vision.Picture.Bitmap);
end;

procedure TFormMain.Im_hminiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(0, TImage(Sender).Picture.Bitmap);
  Hablar(1);
  Im_btnhablar.Tag := 5;
  Im_btnhablar.Picture.Bitmap := nil;
  ImageListbtnhablar.GetBitmap(Im_btnhablar.Tag, Im_btnhablar.Picture.Bitmap);
end;

procedure TFormMain.Im_hminiMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmini.GetBitmap(1, TImage(Sender).Picture.Bitmap);
end;

procedure TFormMain.Im_panthablarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ResetImages4;
end;

procedure TFormMain.Im_gestosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListgestionar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_gestosMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_gestos, ImageListgestionar, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_gestosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListgestionar.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 1 then begin
  ResetPantallas(Im_btnchat,Im_btnhablar,Im_gestos,Im_mover,Im_vision);
  Gestos(0);
  end else Gestos(1);
end;

procedure TFormMain.Im_moverMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmoverme.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_moverMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_mover, ImageListmoverme, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_moverMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListmoverme.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 1 then begin
  ResetPantallas(Im_btnchat,Im_btnhablar,Im_gestos,Im_mover,Im_vision);
  Mover(0);
  end else Mover(1);
end;

procedure TFormMain.Im_visionMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_visionMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_vision, ImageListvision, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_visionMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListvision.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
  If TImage(Sender).Tag = 1 then begin
  ResetPantallas(Im_btnchat,Im_btnhablar,Im_gestos,Im_mover,Im_vision);
  Vision(0);
  end else Vision(1);
end;

Procedure TFormMain.ResetPantallas(a,b,c,d,e :TImage);
begin
If a.Tag = 2 then begin
  Chat(1);
  Im_btnchat.Tag := 4;
  Im_btnchat.Picture.Bitmap := nil;
  ImageListbtnchat.GetBitmap(Im_btnchat.Tag, Im_btnchat.Picture.Bitmap);
end;
If b.Tag = 2 then begin
  Hablar(1);
  Im_btnhablar.Tag := 4;
  Im_btnhablar.Picture.Bitmap := nil;
  ImageListbtnhablar.GetBitmap(Im_btnhablar.Tag, Im_btnhablar.Picture.Bitmap);
end;
If c.tag = 2 then begin
  Gestos(1);
  Im_Gestos.Tag := 4;
  Im_Gestos.Picture.Bitmap := nil;
  ImageListgestionar.GetBitmap(Im_Gestos.Tag, Im_Gestos.Picture.Bitmap);
end;
If d.tag = 2 then begin
  Mover(1);
  Im_mover.Tag := 4;
  Im_mover.Picture.Bitmap := nil;
  ImageListmoverme.GetBitmap(Im_mover.Tag, Im_mover.Picture.Bitmap);
end;
If e.tag = 2 then begin
  vision(1);
  Im_vision.Tag := 4;
  Im_vision.Picture.Bitmap := nil;
  ImageListvision.GetBitmap(Im_vision.Tag, Im_vision.Picture.Bitmap);
end;
end;

//Menús

procedure TFormMain.Im_yoClick(Sender: TObject);
begin
  ChangeImage(Im_yo, ImageListyo, False);
  PUMenu_Yo.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_comunicarseClick(Sender: TObject);
begin
  ChangeImage(Im_comunicarse, ImageListcomunicarse, False);
  PUMenu_Comunicarse.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_fotoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    1: TImage(Sender).Tag := 0;
    4: TImage(Sender).Tag := 3;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListfoto.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_fotoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ImageOver = TImage(Sender) then exit;
  if ImageOver <> nil then ResetImages4;
  ChangeImage(Im_foto, ImageListfoto, True);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_fotoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case TImage(Sender).Tag of
    0: TImage(Sender).Tag := 4;
    3: TImage(Sender).Tag := 1;
  end;
  TImage(Sender).Picture.Bitmap := nil;
  ImageListfoto.GetBitmap(TImage(Sender).Tag, TImage(Sender).Picture.Bitmap);
  ImageOver := TImage(Sender);
end;

procedure TFormMain.Im_bartopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ResetImages5;
end;

procedure TFormMain.Im_mundoClick(Sender: TObject);
begin
  ChangeImage(Im_mundo, ImageListmundo, False);
  PUMenu_Mundo.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_barayudaClick(Sender: TObject);
begin
  ChangeImage(Im_barayuda, ImageListbarayuda, False);
  PUMenu_Ayuda.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_gestosClick(Sender: TObject);
begin
  PUMenu_Gestos.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y - 65);
end;

procedure TFormMain.Vertodos1Click(Sender: TObject);
begin
  with FGestos.TFormGestos.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFormMain.Im_construirClick(Sender: TObject);
begin
  ChangeImage(Im_construir, ImageListconstruir, False);
  PUMenu_Construir.Popup
  (TControl(Sender).ClientOrigin.X,
  TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFormMain.Im_herramientasClick(Sender: TObject);
begin
with FHerramientas.TFormHerramientas.Create(nil) do
  try
    ShowModal;
  finally
    Free;
end;
end;

procedure TFormMain.ayudadeSecondLife1DrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
with ACanvas do
begin
  If TMenuItem(sender).caption = 'a' then begin
    Brush.Color := $002A2A2A;
    Pen.Color := $00BCBCBC;
    FillRect(ARect);
    MoveTo(Arect.Left, ARect.Top);
    LineTo(Arect.Right, Arect.top);
    exit;
  end;
  If TMenuItem(sender).enabled = False then begin
    Brush.Color := $002A2A2A;
    Font.Color := $006F6F6F;
  if Selected then begin
    Brush.Color := $004E593C;
    Font.Color := $006F6F6F;
  end;
  end;
  If TMenuItem(sender).enabled = True then
  if Selected then begin
    Brush.Color := $004E593C;
    Font.Color := $00F4F4F4;
  end else begin
    Brush.Color := $002A2A2A;
    Font.Color := $00BCBCBC;
  end;
  FillRect(ARect);
  DrawText(Handle, PChar(TMenuItem(Sender).Caption), -1, ARect, DT_LEFT);
end;
end;

procedure TFormMain.ndadeSecondLife1MeasureItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
  Width:=180;
end;

procedure TFormMain.Construir1MeasureItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
  Width:=280;
end;

procedure TFormMain.Minimapa1MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width:=200;
end;

end.

