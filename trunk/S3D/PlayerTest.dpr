{-------------------------------------------------------------------------------
CALCULATORTEST

DESCRIPCION

Proyecto que centraliza la ejecucion de tests de CALCULATOR:
* Test Funcionales o de Aceptacion del Sistema (casos de usuario)
* Test Unitarios para cada modulo o clase

USO

Para usar el sistema basta lanzar el ejecutable de los siguientes modos:
* Modo UI que permite 
 Desarrollo  : En este fichero se inicializan los módulos y formularios de inicio de la aplicacion:
                  - Primeramente se generan y se inicializan los modulos de datos
                    - UDatamodule: Modulo de Datos de Catalogo Facilon
                    - UDMInformes: Modulo de datos de para la generación de informes
                  - Posteriormente se crea el formulario principal de la aplicacion
                    - FormMain: Formulario principal

               A través del formulario Principal podemos acceder a diferentes Formularios:
                  - FormPrefInstalacion: Formulario donde se definen las preferencias de instalacion:
                      - Datos de la instalacion.
                      - Datos del Autor.
                      - Señales de entrada de la instalacion.
                  - FormPrefUsuario: Formulario donde se definen las preferencias del usuario:
                      - Materiales de trabajo (cables, derivadores, distribuidores, paus y tomas)
                      - Niveles de trabajo
                      - Configuracion visual
                      - Configuracion del cajetin
                      - Configuracion general
                  - FormAsistenteInstalacion: Formulario que representa el asistente de la instalacion
                  - FormAcercaDe:Formulario que presenta información acerca de la aplicación, Información de la versión del catálogo,el modo de usuario en el caso de que sea avanzado
                        - FormRegistrar: Formulario de registro

               A partir del formulario principal se pueden generar diferentes Instalaciones de Facilon, de modo libre o
               utilizando el asistente. Cada instalación se Gestiona con un Objeto (En adelante InstalacionFacilon)
               que ereda de la clase TInstalacionFacilon y es donde se encuentra prácticamente toda la lógica del programa,
               exceptuando los informes.

               Para obtener datos de catalogo de la base de datos de FACILON existe un modulo llamado Udatamodule, que es donde
               se estan todas las funciones y procedimientos que interactuan con la base de datos facilon.mdb. Gracias a este
               modulo se alimenta toda la InstalacionFacilon.

               La estructura de InstalacionFacilon es la siguiente:
                  +InstalacionFacilon
                      |___cabecera:     Objeto que ereda de TCabecera donde se guardan los datos de la cabecera
                      |___distribucion: Objeto que ereda de la clase TEsquema donde se guarda toda la estructura esquemática
                      |                 en forma de arbol de la instalación
                      |___presupuesto:  Objeto que ereda de la clase TPresupuesto donde se guarda toda la informacion de presupuesto.
                      |___configuracion:Objeto que ereda de la clase TConfiguracion donde se guarda toda la informacion de configuracion.

               Existe un modulo para alimentar la base de datos de los informes para posteriormente poder previsualizarlos.
               Este modulo se llama UDMInformes, el cual contiene funciones y procedimientos para poder interactuar con
               la base de datos datainf.mdb


 Plataforma  : Windows XP SP2 y Delphi 7 Enterprise

 Historial   :
   - version 1.0 (16/04/2009)

 TODO        : <tareas pendientes de realizar>
   - Realizar Test Funcionales con teclas
   - Realizar Test Unitarios

 Copyright 1996-2009 SOME Sistemas Informáticos, S.L.
-------------------------------------------------------------------------------}

{$APPTYPE CONSOLE}
program PlayerTest;

uses
  Forms,
  sysutils,
  TextTestRunner,
  GUITestRunner,
  TestFramework,
  FMainTest in 'FMainTest.pas';

begin
  if FindCmdLineSwitch('h', ['-', '/'], true) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
  begin
    Application.Initialize;
    GUITestRunner.RunRegisteredTests;
  end;
end.

