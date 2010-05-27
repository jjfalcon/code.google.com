(*
MENU DESPLEGABLE ESTILO OUTLOOK PANEL IZQUIERDO

[Grupo]  boton personalizado (imagen, label, icono)
[Panel]  panel que contiene cada lista de opciones de un [Grupo]
[Modulo] boton personalizado (imagen, label)

Al pulsar sobre cualquier elemento del grupo se abren sus opciones
(panel asociado visible con lista de botones) y se oculta si hay panel
de otro grupo

PESTAÑAS

[Opcion]   label
[Marcador] imagen

Al pulsar cada opcion se logra el efecto pestaña de la siguiente forma:
  - resetear colores de todas las opciones
  - remarcar color de opcion seleccionada
  - posicionar marcador en opcion seleccionada
  - realizar accione correspondiente para refrescar contenido opcion
*)

unit FOpenERP6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFormOpenERP6 = class(TForm)
    PanelTop: TPanel;
    PanelBottom: TPanel;
    PanelLeft: TPanel;
    PanelClient: TPanel;
    PanelTopCaption: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image2: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    PanelClientRight: TPanel;
    Image9: TImage;
    Label1: TLabel;
    Image10: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image11: TImage;
    Image12: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Bevel1: TBevel;
    Label11: TLabel;
    Image17: TImage;
    Label12: TLabel;
    Image18: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ImageMarker: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Label16: TLabel;
    Image23: TImage;
    Image24: TImage;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Image25: TImage;
    Image26: TImage;
    Bevel2: TBevel;
    Image27: TImage;
    Label24: TLabel;
    ImageSubmenu: TImage;
    Panel2: TPanel;
    Image30: TImage;
    Image31: TImage;
    Image28: TImage;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label10: TLabel;
    Image19: TImage;
    procedure Image25Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpenERP6: TFormOpenERP6;

implementation

{$R *.dfm}

procedure TFormOpenERP6.Image25Click(Sender: TObject);
begin
  PanelClient.visible := false;
end;

procedure TFormOpenERP6.Image26Click(Sender: TObject);
begin
  PanelClient.visible := true;
end;

procedure TFormOpenERP6.Image5Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOpenERP6.Label13Click(Sender: TObject);
begin
  ImageMarker.Left := TControl(Sender).Left;
  Label13.Font.color := clSilver;
  Label14.Font.color := clSilver;
  Label15.Font.color := clSilver;
  TLabel(Sender).Font.Color := $00464646;

end;

procedure TFormOpenERP6.Label25Click(Sender: TObject);
begin
  ImageSubmenu.visible := false;
  PanelClient.visible  := false;
end;

procedure TFormOpenERP6.Label1Click(Sender: TObject);
begin
  ImageSubmenu.visible := true;
  PanelClient.visible  := true;
end;

end.
