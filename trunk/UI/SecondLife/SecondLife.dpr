program SecondLife;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  FHome in 'FHome.pas' {FormHome},
  FHome1 in 'FHome1.pas' {FormHome1},
  FHome2 in 'FHome2.pas' {FormHome2},
  FHome3 in 'FHome3.pas' {FormHome3},
  FHome4 in 'FHome4.pas' {FormHome4},
  FHome5 in 'FHome5.pas' {FormHome5},
  FHome6 in 'FHome6.pas' {FormHome6},
  FHome7 in 'FHome7.pas' {FormHome7},
  FHome8 in 'FHome8.pas' {FormHome8},
  FComprar in 'FComprar.pas' {FormComprar},
  FAyuda in 'FAyuda.pas' {FormAyuda},
  FGestos in 'FGestos.pas' {FormGestos},
  FPerfil in 'FPerfil.pas' {FormPerfil},
  FPeople in 'FPeople.pas' {FormPeople},
  FPlaces in 'FPlaces.pas' {FormPlaces},
  FInventory in 'FInventory.pas' {FormInventory},
  FAppea in 'FAppea.pas' {FormAppea},
  FHerramientas in 'FHerramientas.pas' {FormHerramientas},
  Menus2 in 'recursos\Menus2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Second Life - Viewer 2';
  Application.HelpFile := '';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TFormHome1, FormHome1);
  Application.CreateForm(TFormHome2, FormHome2);
  Application.CreateForm(TFormHome3, FormHome3);
  Application.CreateForm(TFormHome4, FormHome4);
  Application.CreateForm(TFormHome5, FormHome5);
  Application.CreateForm(TFormHome6, FormHome6);
  Application.CreateForm(TFormHome7, FormHome7);
  Application.CreateForm(TFormHome8, FormHome8);
  Application.CreateForm(TFormComprar, FormComprar);
  Application.CreateForm(TFormAyuda, FormAyuda);
  Application.CreateForm(TFormGestos, FormGestos);
  Application.CreateForm(TFormPerfil, FormPerfil);
  Application.CreateForm(TFormPeople, FormPeople);
  Application.CreateForm(TFormPlaces, FormPlaces);
  Application.CreateForm(TFormInventory, FormInventory);
  Application.CreateForm(TFormAppea, FormAppea);
  Application.CreateForm(TFormHerramientas, FormHerramientas);
  Application.Run;
end.
