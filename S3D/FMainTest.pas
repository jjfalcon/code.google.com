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
//    FFix  : TFormMain;
//    procedure CheckWindowByTitle(WindowTitle: string);
//    procedure CheckResult(value: string);
//    procedure ClickImg(value: string);
//  protected
//    procedure SetUp; override;
//    procedure TearDown; override;
  public
  published
    //comprobar interface
    procedure CheckElements;
    procedure CheckPlacement;
    procedure CheckLanguaje;
    procedure CheckTheme;
    procedure CheckAccess;
    procedure CheckActions;

    //comprobar rendimiento
    procedure CheckMemoryLeak;
    procedure CheckChargeTime;

    //comprobar funcionalidad
    procedure Check__;
    procedure FileOpen_IfAccept_ThenLoadFile;
    procedure FileOpen_IfCancel_ThenNone;

(*
    procedure TestEnterNumber;
    procedure Sumar;
    procedure Restar;
    procedure Sqrt;
    procedure Signo;
    procedure Inverso;
    procedure Calcular;
    procedure TestHelp;
    procedure TestAbout;
*)
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

procedure FormSetUp.SetUp;
begin
  FForm := TFormMain.Create(Application);
  FForm.Show;
  inherited;
end;

//finalizar formulario a testear
procedure FormSetUp.TearDown;
begin
//  Application.OnHint := nil;
  FForm.Release;
  FForm.Free;
  inherited
end;



(*
//inicializar formulario a testear
procedure FormMain.SetUp;
begin
//exit;
//  inherited;
  FFix := TFormMain.Create(Application);
  FFix.Show;
end;

//finalizar formulario a testear
procedure FormMain.TearDown;
begin
//exit;
//  inherited;
  FFix.Release;
  FFix.Free;
end;
*)
{ MainFormMain }

procedure FormMain.CheckElements;
begin
  // comprobar que existen los elementos nombrados

end;

procedure FormMain.CheckPlacement;
begin
  //comprobar que tiene la posicion, medidas y estado definido

  //comprobar que al cambiar alguna lo recuerda

end;

procedure FormMain.CheckLanguaje;
begin
  //comprobar que existen los elementos definidos

  //comprobar que no hay * delante de cualquier string

  //comprobar que ha cargado el idioma definido

  //
end;

procedure FormMain.CheckTheme;
begin
  //comprobar que esta cargado el tema definido

  //..fuentes de textos

  //..dimensiones de textos

  //..colores

  //..iconos e imagenes
end;

procedure FormMain.CheckAccess;
begin
  //comprobar que estan los estados de elementos segun accedos definidos
  //.. visible, enable, checked

end;

procedure FormMain.CheckActions;
begin
  //comprobar que todos los componentes visuales estan enlazados a TAction
end;

procedure FormMain.Check__;
begin
  //probar logica de la UI MOCKEANDO  modulos externos

  //probar funcionamiento  UTILIZANDO modulos externos
end;

procedure FormMain.FileOpen_IfAccept_ThenLoadFile;
begin

end;

procedure FormMain.FileOpen_IfCancel_ThenNone;
begin

end;

(*
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
*)

initialization
//una unica creacion de formulario para todos los tests
  RegisterTest('Pruebas Formularios',FormSetUp.Create(FormMain.Suite));
//cada test crea y cierra un formulario
//  RegisterTest('Pruebas Formularios', FormMain.Suite);
end.
