unit FMainTest;

interface

uses
  stdctrls, forms,
  TestFramework, TestExtensions, GUITesting,
  FMain;

type

  //inicializar y finalizar formulario a testear
  FormSetup = class(TTestSetup)
  private
    FForm     : TFormMain;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  end;

  //tests a realizar sobre formulario a testear
  FormMain = class(TGUITestCase)
  private
    procedure CheckWindowByTitle(WindowTitle: string);
    procedure CheckResult(value: string);
    procedure ClickImg(value: string);
  public
  published
    procedure TestEnterNumber;
    procedure Sumar;
    procedure Restar;
    procedure Sqrt;
    procedure Signo;
    procedure Inverso;
    procedure Calcular;
    procedure TestHelp;
    procedure TestAbout;
  end;

implementation

uses
  sysutils,
  windows,
  classes,
  ActnList,
  Menus,        //TMenuItem
  ExtCtrls,     //TImage
  dialogs;      //Application

//inicializar formulario a testear
procedure FormSetUp.SetUp;
begin
  FForm := TFormMain.Create(Application);
  FForm.Show;
  inherited;
end;

//finalizar formulario a testear
procedure FormSetUp.TearDown;
begin
  FForm.Release;
  FForm.Free;
  inherited
end;

{ MainFormMain }

procedure FormMain.ClickImg(value: string);
var
  img: TImage;
begin
  img:= FindControl(value) as TImage;
  img.OnClick(nil);
end;

procedure FormMain.CheckResult(value: string);
var
  lbl: TLabel;
begin
  lbl := FindControl('lblResult') as TLabel;
  CheckEquals(value, lbl.Caption);
end;

procedure FormMain.TestEnterNumber;
var
  lbl: TLabel;
  img: TImage;
begin
  //valor inicial 0
  CheckResult('0,');

  //tecla 7
  ClickImg('img7');
  CheckResult('7,');

  //tecla 4
  ClickImg('img4');
  CheckResult('74,');

  //tecla BACK
  ClickImg('imgBack');
  CheckResult('7,');

  //tecla BACK
  ClickImg('imgBack');
  CheckResult('0,');

  //tecla BACK
  ClickImg('imgBack');
  CheckResult('0,');
end;

procedure FormMain.Sumar;
begin
  ClickImg('img4');
  ClickImg('imgSumar');
  CheckResult('4,');
  ClickImg('img1');
  CheckResult('1,');
  ClickImg('imgCalcular');
  CheckResult('5,');
end;

procedure FormMain.Restar;
begin
  ClickImg('imgC');
  ClickImg('img4');
  ClickImg('imgRestar');
  CheckResult('4,');
  ClickImg('img1');
  CheckResult('1,');
  ClickImg('imgCalcular');
  CheckResult('3,');
end;

procedure FormMain.Sqrt;
begin
  ClickImg('imgC');
  ClickImg('img4');
  ClickImg('imgSQRT');
  CheckResult('2,');
end;

procedure FormMain.Signo;
begin
  ClickImg('imgC');
  ClickImg('img4');
  ClickImg('imgSigno');
  CheckResult('-4,');
  ClickImg('imgSigno');
  CheckResult('4,');
end;

procedure FormMain.Inverso;
begin
  ClickImg('imgC');
  ClickImg('img4');
  ClickImg('imgInverso');
  CheckResult('0,25');
end;

procedure FormMain.Calcular;
begin
  ClickImg('imgC');
  CheckResult('0,');
  ClickImg('imgCalcular');
  CheckResult('0,');

  ClickImg('img1');
  ClickImg('imgCalcular');
  CheckResult('1,');
end;

function EnumWindowsFunc(Handle: THandle; List: TStringList) : boolean ; stdcall;
var
  caption: array[0..256] of Char;
begin
  if GetWindowText (Handle, Caption, SizeOf(Caption)-1) <> 0 then
  begin
   List.Add(Caption) ;
  end;

  result :=True;
end;

procedure FormMain.CheckWindowByTitle(WindowTitle: string);
var
  i      : integer;
  Result : boolean;
  strl   : TStringList;
begin
  Result := false;

  //chequear existe ventana ayuda
  strl := TStringList.Create;
  try
    strl.Clear;
    EnumWindows(@EnumWindowsFunc, LParam(strl)) ;
    for i:= 0 to strl.Count-1 do
    begin
      if strl[i] = WindowTitle then
      begin
        Result := true;
        break
      end;
    end;
  finally
    strl.free;
  end;

  Check(Result);
end;

procedure FormMain.TestHelp;
begin
  Click('btnHelp');
  sleep(1000);     //esperar para crear ventana
  CheckWindowByTitle('HTML Help');
  Check(False, 'Cerrar ventana de ayuda abierta previamente');
end;

procedure FormMain.TestAbout;
begin
  //al ser modal pausa ejecucion hasta que usuario cierre ventana
  //pasar ventana a no modal
  Click('btnAbout');
  CheckEquals('FormAbout', Application.Components[2].Name);
  //liberar ventana para dejarlo como esta
  Application.Components[2].Free;
end;

initialization
  RegisterTest('Pruebas Formularios',FormSetUp.Create(FormMain.Suite));
end.
