program GoogleChrome;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  FAcerca in 'FAcerca.pas' {FormAcerca},
  FOpciones in 'FOpciones.pas' {FormOpciones},
  FSincroMarca in 'FSincroMarca.pas' {FormSincroMarca},
  FAdminMarc in 'FAdminMarc.pas' {FormAdminMarc},
  FErrores in 'FErrores.pas' {FormErrores},
  FGears in 'FGears.pas' {FormGears},
  FDesarrollo in 'FDesarrollo.pas' {FormDesarrollo},
  FConsole in 'FConsole.pas' {FormConsole},
  FTareas in 'FTareas.pas' {FormTareas},
  FAvanzado in 'FAvanzado.pas' {FormAvanzado};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Google - Google Chrome';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormOpciones, FormOpciones);
  Application.CreateForm(TFormSincroMarca, FormSincroMarca);
  Application.CreateForm(TFormAdminMarc, FormAdminMarc);
  Application.CreateForm(TFormErrores, FormErrores);
  Application.CreateForm(TFormGears, FormGears);
  Application.CreateForm(TFormDesarrollo, FormDesarrollo);
  Application.CreateForm(TFormConsole, FormConsole);
  Application.CreateForm(TFormTareas, FormTareas);
  Application.CreateForm(TFormAvanzado, FormAvanzado);
  Application.Run;
end.
