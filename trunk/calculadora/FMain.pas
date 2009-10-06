unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, UCalculator, Menus, ActnList, XPMan,
  Buttons;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    mnuEdicion: TMenuItem;
    mnuVer: TMenuItem;
    mnuAyuda: TMenuItem;
    mnuCopiar: TMenuItem;
    mnuPegar: TMenuItem;
    mnuEstandar: TMenuItem;
    mnuCientifica: TMenuItem;
    mnuConversion: TMenuItem;
    N1: TMenuItem;
    mnuNumeroDigitos: TMenuItem;
    mnuVistaClsica: TMenuItem;
    mnuTemasAyuda: TMenuItem;
    mnuAcerca: TMenuItem;
    N2: TMenuItem;
    imgC: TImage;
    ActionList: TActionList;
    actAbout: TAction;
    actHelp: TAction;
    btnHelp: TButton;
    btnAbout: TButton;
    imgCE: TImage;
    ImgBack: TImage;
    XPManifest1: TXPManifest;
    btn9: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    Shape1: TShape;
    lblResult: TLabel;
    Panel1: TPanel;
    procedure img7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgCClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure imgMAClick(Sender: TObject);
    procedure imgMSClick(Sender: TObject);
    procedure imgMRClick(Sender: TObject);
    procedure imgMCClick(Sender: TObject);
    procedure imgCEClick(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure ImgBackClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure img0Click(Sender: TObject);
    procedure imgSumarClick(Sender: TObject);
    procedure imgCalcularClick(Sender: TObject);
    procedure imgRestarClick(Sender: TObject);
    procedure imgSQRTClick(Sender: TObject);
    procedure imgInversoClick(Sender: TObject);
    procedure imgSignoClick(Sender: TObject);
  private
    { Private declarations }
    Calculator : TCalculator;
    procedure UpdateVisor(str: string);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  FAbout,
  ShellApi;


procedure TFormMain.FormCreate(Sender: TObject);
begin
  Calculator := TCalculator.Create(self);
  Calculator.OnVisor := UpdateVisor;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Calculator.Free;
end;

procedure TFormMain.UpdateVisor(str: string);
begin
  lblResult.caption := str;
end;

procedure TFormMain.imgCClick(Sender: TObject);
begin
  Calculator.Clear
end;

procedure TFormMain.actAboutExecute(Sender: TObject);
begin
  FAbout.AboutShow(false);
end;

procedure TFormMain.actHelpExecute(Sender: TObject);
var
  HelpFile: array[0..255] of Char;
begin
  StrPCopy(HelpFile, ExtractFilePath(Application.ExeName)+'calc.chm');
  ShellExecute(Handle, 'open', HelpFile, nil, nil, SW_SHOWNORMAL) ;
end;

procedure TFormMain.imgMAClick(Sender: TObject);
begin
  Calculator.MA;
end;

procedure TFormMain.imgMSClick(Sender: TObject);
begin
  Calculator.MS;
end;

procedure TFormMain.imgMRClick(Sender: TObject);
begin
  Calculator.MR;
end;

procedure TFormMain.imgMCClick(Sender: TObject);
begin
  Calculator.MR;
end;

procedure TFormMain.imgCEClick(Sender: TObject);
begin
  Calculator.ClearOperando;
end;

procedure TFormMain.img4Click(Sender: TObject);
begin
  Calculator.EnterChar('4');
end;

procedure TFormMain.img7Click(Sender: TObject);
begin
  Calculator.EnterChar('7');
end;

procedure TFormMain.ImgBackClick(Sender: TObject);
begin
  Calculator.EnterChar(char(VK_BACK));
end;

procedure TFormMain.img1Click(Sender: TObject);
begin
  Calculator.EnterChar('1');
end;

procedure TFormMain.img0Click(Sender: TObject);
begin
  Calculator.EnterChar('0');
end;

procedure TFormMain.imgSumarClick(Sender: TObject);
begin
  Calculator.Sumar;
end;

procedure TFormMain.imgCalcularClick(Sender: TObject);
begin
  Calculator.Calcular;
end;

procedure TFormMain.imgRestarClick(Sender: TObject);
begin
  Calculator.Restar;
end;

procedure TFormMain.imgSQRTClick(Sender: TObject);
begin
  Calculator.Sqrt;
end;

procedure TFormMain.imgInversoClick(Sender: TObject);
begin
  Calculator.Inverso;
end;

procedure TFormMain.imgSignoClick(Sender: TObject);
begin
  Calculator.Signo;
end;

end.
