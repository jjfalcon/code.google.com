unit uUtils;

interface

uses
  Forms, Classes, Windows, Graphics;

type
  TDataType    = (dtInteger,dtBoolean,dtString,dtDate,dtTime,
                  dtFloat,dtCurrency);

  TTipoMaquina = (tmNada,tmFresa,tmTorno);
  TModoEntrada = (TmeWUS,TmeCMA,tmeBASICO);
  TEstadoCMA   = (TCMASimulado,TCMAAutomatico,TCMAManual);
  TModo        = (TmConfigurador,TmEvaluador,TmNormal);

  TParametros= record
                 Acceso      : boolean;{Diferencia entre usuario y Profesor}{/sat}
                 ProjectName : string; {si se ha de abrir un proyecto al entrar /F:}
                 CurrentName : string; {El proyecto activo para la maquina}
                 ModoEntrada : TModoEntrada; {TWUS.-WinUnisoft cliente o TCMA.-Simulacion de control de maquina}
                 EstadoCMA   : TEstadoCMA; {TCMASimulado,TCMAAutomatico,TCMAManual}
                 strMaquina  : string; {Nombre del fichero *.mch del directorio LIB}
                 PathControl : string; {Path del directorio de controls activo por la maquina}
                 TipoMaquina : TTipoMaquina;
                 TipoTorno   : byte;
		 Modo        : TModo;
               end;

  {Registro para almacenar informacion del panel de estado}
  regEstado = record
    Bloque,
    X,
    Y,
    Z,
    HomeX,
    HomeY,
    HomeZ,
    OrigenX,
    OrigenY,
    OrigenZ,
    F,
    FUnid,
    S,
    SUnid,
    T,
    M1,
    M2,
    M3,
    G : string;
  end;

  regCadenas= record
    {Estado del panel Estado del Simulador}
    Interrunpido,
    EnPosicion,
    Ejecutando    : string;
    {F del panel Estado del Simulador}
    Fmm_min,
    Fmm_rev        : string;
    {S del panel Estado del Simulador}
    Sm_min,
    Srev_min       : string;
    {Maquina}
    AvanceMaxMM,
    AvanceMaxInch,
    AvanceG00MM,
    AvanceG00Inch : string;
    {Bruto}
    XMin,
    YMin,
    ZMin,
    LongX,
    LongY,
    LongZ         : string;
    Longitud,
    Diametro      : string;
    ZCotaMin,
    ZCotaMax,
    DBruto,
    LongBrutoTal,
    DiamBrutoTal,
    Nada     :string;
  end;

var
  PrinterIndex : integer;
  LogEnabled: Boolean;


function  fileCopy(const SourceFile, TargetFile: String): Boolean;
function  fileShortName(const fileName:string):string;
function  fileSize (const fileName:string): longint;

function  iniReadValue(const aFile, aSection, aEntry: string; aDefault: Variant;
                       Typ: TDataType): Variant;
procedure iniWriteValue(const aFile, aSection, aEntry, aValue: Variant;
                        Typ: TDataType);
{Función que dado un string S y un caracter Seperator, separa S en dos substrings. Devuelve
 como resultado la parte anterior a Seperator y en el string S la parte posterior}
function  strToken(var S: String; Seperator: Char): String;
// Sonia 01.06.2005
{Función que dado un string S y otro string Seperator, separa S en dos substrings. Devuelve
 como resultado la parte anterior a Seperator y en el string S la parte posterior}
function strTokenString(var S: String; Seperator: String): String;
// Fin Sonia 01.06.2005
{Procedimiento que dado un string S, un carácter Seperator y un lista List, separa el string S
 por el Seperator y devuelve todos los substrings en la lista List}
procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
function  strReplace(const S, Srch, Replace: string): string;
function  strReplaceChar(const S: String; C: Char; const Replace: String): String;
function  strRight(const S: String; Len: Integer): String;

procedure sysAppWait(h: THandle);
function  sysAppRun(const AppName, Params: string; WaitEnd: boolean): THandle;

        {PROCEDIMIENTOS DE ESCRITURA DE LAS ACCIONES EN EL FICHERO .LOG}
procedure strLogFich(aLogFile, aStr: String);
{logWriteStr. Este procedimiento se usa para escribir acciones en fichero LOG con un la fecha y la hora}
{Próximamente: Quitar una de las dos definiciones de logWriteStr. Puesto que el Sender sólo lo usamos
 para coger su nombre que es un texto, utilizaremos la definición en la que le pasamos un texto y le
 pasaremos el nombre en los casos que utilizábamos la primera definición}
procedure logWriteStr(NomApp    : String;
                      NomForm   : String;
                      Sender    : TObject;
                      Comentario: String;
                      NomFichero: String;
                      Escribir  : boolean );overload;
procedure logWriteStr(NomApp    : string;
                      NomForm   : string;
                      NomAction : string;
                      Comentario: string;
                      NomFichero: string;
                      Escribir  : boolean );overload;

                {PROCEDIMIENTOS DE ACCESOS}
{Procedimiento que añade al fichero de acceso las propiedades Visible y ReadOnly de todos los componentes
 de la aplicación}
procedure accApplicationComponentsToFile(unFichero: string);
{Procedimiento que establece los valores de las propiedades Visible y ReadOnly de los componentes del Form
 según el fichero de accesos}
procedure accFormConfigurar(MiForm : TForm; unFicheroAcceso: string);
function IsAppRunning(strApp: string): boolean;
function EstaEjecutandose (ExeFile:string): boolean;
Procedure ResetFile(aLogFile:String);

// Sonia 07.06.2005
{Procedimiento que gira un BitMap}
procedure Girar(BitmapSrc:TBitmap; BitmapDst:TBitmap);
// Fin Sonia 07.06.2005

implementation

uses
  (*variants,*) sysutils,
  inifiles,                                                           //TIniFile
  typInfo;
(*
uses
  sysutils,
  inifiles,                                                           //TIniFile
  typInfo,
  Dialogs;
*)


function EstaEjecutandose (ExeFile:string): boolean;
var H:word;
begin
  H := CreateFile(PChar(ExeFile), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
  Result := (H >= 65535);
  CloseHandle(H);
end;

function IsAppRunning(strApp: string): boolean;
var
  hMutex : Thandle;
begin
  hMutex:= CreateMutex(nil,true,PChar(strApp));
  if hMutex=0 then Exception.Create('Error creando mutex');
  result := (GetLastError=ERROR_ALREADY_EXISTS);
end;

function  iniReadValue(const aFile, aSection, aEntry: string; aDefault: Variant;
                       Typ: TDataType): Variant;
begin
  with TIniFile.Create(aFile) do
  try
    case Typ of
      dtInteger:  Result := ReadInteger(aSection, aEntry, aDefault);
      dtBoolean:  Result := ReadBool   (aSection, aEntry, aDefault);
      dtString:   Result := ReadString (aSection, aEntry, aDefault);
      dtDate:     Result := ReadDate   (aSection, aEntry, aDefault);
      dtFloat:    Result := ReadFloat  (aSection, aEntry, aDefault);
      dtTime:     Result := ReadTime   (aSection, aEntry, aDefault);
    end;
  finally
    Free;
  end;
end;

procedure iniWriteValue(const aFile, aSection, aEntry, aValue: Variant;
                        Typ: TDataType);
begin
  with TIniFile.Create(aFile) do
  try
    case Typ of
      dtInteger: WriteInteger(aSection, aEntry, aValue);
      dtBoolean: WriteBool   (aSection, aEntry, aValue);
      dtString:  WriteString (aSection, aEntry, aValue);
      dtDate:    WriteDate   (aSection, aEntry, aValue);
      dtFloat:   WriteFloat  (aSection, aEntry, aValue);
      dtTime:    WriteTime   (aSection, aEntry, aValue);
    end
  finally
    Free;
  end;
end;

{Parámetros
        S : String que queremos separar en dos partes hasta el carácter Seperator
        Seperator : Carácter hasta el que queremos separar el string S
 Algoritmo
        - Obtener la primera posición de Seperator en S
        - Si Seperator está en S, devuelve la parte anterior y borra de S hasta el Seperator
        - Si Seperator no está en S, devuelve S y deja S vacío
 Resultado : Devuelve un string con la parte de S anterior al separador}
function strToken(var S: String; Seperator: Char): String;
var
  I : Word;
begin
  I:=Pos(Seperator,S);
  if I<>0 then
  begin
    Result:=System.Copy(S,1,I-1);
    System.Delete(S,1,I);
  end else
  begin
    Result:=S;
    S:='';
  end;
end;

// Sonia 01.06.2005
{Parámetros
        S : String que queremos separar en dos partes hasta el carácter Seperator
        Seperator : String hasta el que queremos separar el string S
 Algoritmo
        - Obtener la primera posición de Seperator en S
        - Si Seperator está en S, devuelve la parte anterior y borra de S hasta el Seperator
        - Si Seperator no está en S, devuelve S y deja S vacío
 Resultado : Devuelve un string con la parte de S anterior al separador}
function strTokenString(var S: String; Seperator: String): String;
var
  I: Word;
begin
  I:=Pos(Seperator, S);
  if I<>0 then
  begin
    Result:=System.Copy(S, 1, I-1);
    System.Delete(S, 1, I+Length(Seperator)-1);
  end
  else
  begin
    Result:=S;
    S:='';
  end;
end;
// Fin Sonia 01.06.2005

{Parámetros
        S : String que queremos separar en dos partes hasta el carácter Seperator
        Seperator : Carácter hasta el que queremos separar el string S
        List : Lista de substrings en los que se ha separado el string S
 Algoritmo
        - Borrar la lista
        - Obtener el primer substring de S separado por Seperator
        - Mientras el substring no sea vacío
                - Añadir el substring a la lista
                - Obtener el siguiente substring de S}
procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
var
  Token: String;
begin
  List.Clear;
  Token:=strToken(S,Seperator);
  while Token<>'' do
  begin
    List.Add(Token);
    Token:=strToken(S,Seperator);
  end;
end;

(*******************************************************************************
strReplaceChar
  Reemplaza en una cadena <S> un caracter <C> con cadena <Replace>
Parametros
  S       : cadena a reemplazar
  C       : caracter a reemplazar en cadena <S>
  Replace : cadena a sustituir por caracter <C>
  Result  : cadena reemplazada
Ejemplos
  strReplaceChar('abc','b','123') = 'a123c'
*******************************************************************************)
function strReplaceChar(const S: String; C: Char; const Replace: String): String;
var
  i : Integer;
begin
  Result:='';
  for i:=Length(S) downto 1 do
    if S[i]=C then Result:=Replace+Result
              else Result:=S[i]+Result;
end;

(*******************************************************************************
strReplaceStr
  Reemplaza en una cadena <S> una subcadena <Srch> con subcadena <Replace>
Parametros
  S       : cadena a reemplazar
  Srch    : subcadena a reemplazar en cadena <S>
  Replace : subcadena a sustituir por subcadena <Srch>
  Result  : cadena reemplazada
Ejemplos
  strReplaceStr('abcde','bc','123') = 'a123de'
  strReplaceStr('abcde','bd','123') = 'abcde'
*******************************************************************************)
function strReplace(const S, Srch, Replace: string): string;
var
  i      : integer;
  Source : string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;


function strRight(const S: String; Len: Integer): String;
begin
  if Len>=Length(S) then
    Result:=S
  else
    Result:=Copy(S,Succ(Length(S))-Len,Len);
end;

function fileCopy(const SourceFile, TargetFile: String): Boolean;
const
  BlockSize = 1024 * 16;
var
  FSource,FTarget : Integer;
  BRead,Bwrite    : Word;
  Buffer          : Pointer;
begin
  Result:=False;
  FSource:=FileOpen(SourceFile,fmOpenRead+fmShareDenyNone);  { Open Source }
  if FSource>=0 then
  try
    FTarget:=FileCreate(TargetFile);            { Open Target }
    try
      getmem(Buffer,BlockSize);
      try
        FileSeek(FSource,0,soFromBeginning);
        repeat
          BRead:=FileRead(FSource,Buffer^,BlockSize);
          BWrite:=FileWrite(FTarget,Buffer^,Bread);
        until (Bread=0) or (Bread<>BWrite);
        if Bread=Bwrite then
           Result:=True;
      finally
        freemem(Buffer,BlockSize);
      end;
      FileSetDate(FTarget, FileGetDate(FSource));
    finally
      FileClose(FTarget);
    end;
  finally
    FileClose(FSource);
  end;
end;

procedure sysAppWait(h: THandle);
begin
  while WINDOWS.WaitForSingleObject(H, 100) = WAIT_TIMEOUT do
  begin
    FORMS.Application.ProcessMessages;
    if FORMS.Application.Terminated then break;
  end;
end;

function sysAppRun(const AppName, Params: string; WaitEnd: boolean): THandle;
var
  ProcInfo : TProcessInformation;
  Info     : TStartupInfo;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cb := SizeOf(Info);
  Info.dwFlags := STARTF_USESHOWWINDOW;
  Info.wShowWindow := SW_NORMAL;
  if not CreateProcess(nil, PChar(AppName + ' ' + Params), nil, nil, False, 0,
                       nil, nil, Info, ProcInfo)
  then raise Exception.Create('No se puede inicializar la aplicacion');
  Result := ProcInfo.hProcess;
  if WaitEnd then sysAppWait(Result);
end;

{---RUTINA--------------------------------------------------------------------
 Acorta los nombres que tienen un path muy largo con puntos suspensivos.
 c:\..\..\RUN\demo.prj
-----------------------------------------------------------------------------}
//function AcortarNombre(Name:string):String;
function fileShortName(const fileName:string):string;
const
  LNGNAME=50;
var
  i,
  Cnt    : integer;
  Buf    : string;
  Lista  : TStringList;
begin
  Buf:=fileName;
  Lista:=TStringList.Create;
  StrTokenToStrings(Buf,'\',Lista);
  cnt:=2;
  While (Length(buf)>LNGNAME) and (cnt<Lista.Count) do
  begin
    Buf:=Lista[0];
    For i:=2 to cnt do Buf:=Buf+'\..';

    For i:=cnt to Lista.count-1 do Buf:=Buf+'\'+Lista[i];
    inc(cnt);
  end;
  result:=Buf;
end;

function fileSize (const fileName:string): longint;
var
  SearchRec:TSearchRec;
begin
  result:=0;
  if FindFirst(fileName, faAnyFile, SearchRec)<>0 then exit;
  result:=SearchRec.Size;
end;

{ PROCEDIMIENTOS DE ESCRITURA DE LAS ACCIONES EN EL FICHERO .LOG }

{strLogFich. Este procedimiento se usa para escribir mensajes en fichero LOG}
procedure strLogFich(aLogFile, aStr: String);
var
  LogFile: Text;
begin
  if aLogFile = '' then Exit;
  aLogFile := ChangeFileExt(aLogFile, '.rec');
  AssignFile(LogFile, aLogFile);
  if FileExists(aLogFile)
  then Append(LogFile)
  else Rewrite(LogFile);

  Writeln(LogFile, aStr);
  Flush(LogFile);
  CloseFile(LogFile);
end;

{logWriteStr. Este procedimiento se usa para escribir acciones en fichero LOG con un la fecha y la hora}
{Próximamente: Quitar una de las dos definiciones de logWriteStr. Puesto que el Sender sólo lo usamos
 para coger su nombre que es un texto, utilizaremos la definición en la que le pasamos un texto y le
 pasaremos el nombre en los casos que utilizábamos la primera definición}
procedure logWriteStr(NomApp    : String;
                      NomForm   : String;
                      Sender    : TObject;
                      Comentario: String;
                      NomFichero: String;
                      Escribir  : boolean );
var
  FilaAccion: String;
begin
  {Impedir registro en las siguientes condiciones}
  if (not Escribir) or (not LogEnabled) then exit;
  if (Sender = nil) then exit;
  if (NomFichero='')then exit;

  FilaAccion := FormatDateTime('dd/mm/yyyy', Date) + ';   ' + FormatDateTime('hh:mm:ss', Now) + ';   ' +
                NomApp + ';   ' + NomForm + ';   ' + TComponent(Sender).Name + ';   ' + Comentario;
  strLogFich(NomFichero, FilaAccion);
end;

{logWriteStr. Este procedimiento se usa para escribir acciones en fichero LOG con un la fecha y la hora}
procedure logWriteStr(NomApp    : string;
                      NomForm   : string;
                      NomAction : string;
                      Comentario: string;
                      NomFichero: string;
                      Escribir  : boolean );
var
  FilaAccion: String;
begin
  {Impedir registro en las siguientes condiciones}
  if (not Escribir) or (not LogEnabled) then exit;
  if (NomFichero='')then exit;

  FilaAccion := FormatDateTime('dd/mm/yyyy', Date) + ';   ' + FormatDateTime('hh:mm:ss', Now) + ';   ' +
                NomApp + ';   ' + NomForm + ';   ' + NomAction + ';   ' + Comentario;
  strLogFich(NomFichero, FilaAccion);
end;

Procedure ResetFile(aLogFile:String);
var
  LogFile: Text;
Begin
  if aLogFile = '' then Exit;
  AssignFile(LogFile, aLogFile);
  if FileExists(aLogFile) then
  begin
    Rewrite(LogFile);
    CloseFile(LogFile);
  end;
End;

{PROCEDIMIENTOS DE ACCESOS}

{Procedimiento que escribe una línea en un fichero}
procedure WriteFich(var MiFichero: TextFile; aStr: String);
begin
  Writeln(MiFichero, aStr);
  Flush(MiFichero);
end;

{Procedimiento que añade al fichero de acceso las propiedades Visible y ReadOnly de todos los componentes
 del Form}
Procedure IntroducirComponentesUnForm (Form : TComponent; var MiFichero: TextFile);
Var
  FList : PPropList;
  i, j, FCount, FSize : Integer;
  FilaAcceso: String;
Begin
  {Propiedades del form}
  FCount := GetPropList(Form.ClassInfo, tkProperties, nil);
  FSize := FCount * SizeOf(Pointer);
  GetMem(FList, FSize);
  try
    GetPropList(Form.ClassInfo, tkProperties, FList);
    For j := 0 to FCount-1 do
    Begin
      If (FList[j].Name = 'Visible') or (FList[j].Name = 'ReadOnly') or (FList[j].Name = 'Enabled') then
      begin
        FilaAcceso := Application.Title + ';   ' + Form.Name + ';   ' + Form.Name + ';   ' + FList[j].Name + ';   ' + IntToStr(1) + ';   ' + IntToStr(100);
        WriteFich(MiFichero, FilaAcceso);
      end;
    End;
  finally
    FreeMem(FList, FSize);
  end;

  {Propiedades de los componentes del form}
  For i := 0 to Form.ComponentCount-1 do
  Begin
    {If (Form.Components[i] is TQuery) or (Form.Components[i] is TField) or (Form.Components[i] is TDataSource) then Continue;}
    FCount := GetPropList(Form.Components[i].ClassInfo, tkProperties, nil);
    FSize := FCount * SizeOf(Pointer);
    GetMem(FList, FSize);
    try
      GetPropList(Form.Components[i].ClassInfo, tkProperties, FList);
      For j := 0 to FCount-1 do
      Begin
        If (FList[j].Name = 'Visible') or (FList[j].Name = 'ReadOnly') then
        begin
          FilaAcceso := Application.Title + ';   ' + Form.Name + ';   ' + Form.Components[i].Name + ';   ' + FList[j].Name + ';   ' + IntToStr(1) + ';   ' + IntToStr(200);
          WriteFich(MiFichero, FilaAcceso);
        end;
      End;
    finally
      FreeMem(FList, FSize);
    End;
  End;
End;

{Procedimiento que añade al fichero de acceso las propiedades Visible y ReadOnly de todos los componentes
 de la aplicación}
procedure accApplicationComponentsToFile(unFichero: string);
Var
 i : Integer;
 FichAccesos: TextFile;
begin
    // Borrar el fichero
    AssignFile(FichAccesos, unFichero);
    Rewrite(FichAccesos);

    // Recorrer los Forms de la aplicación
    For i := 1 to Application.ComponentCount-1 do
    Begin
      If Application.Components[i] is TForm then
      Begin
        // Introducir los componentes de ese Form en el fichero
        IntroducirComponentesUnForm(Application.Components[i], FichAccesos);
      End;
    End;

    // Cerrar el fichero
    CloseFile(FichAccesos);
end;

{Función que, dados la aplicación y el Form, devuelve un string con el componente, la propiedad, el valor
 de esa propiedad para ese proyecto y un número}
function BuscarCadenaAccesos(App: String; Form: String; var f:TextFile):String;
var
  iPos    : Integer;
  Buffer  : String;
  NomApp  : String;
  NomForm : String;
begin
  result:='';
  Buffer := '';
  //saltar lineas vacia y comentarios
  repeat
    //leer linea actual
    Readln(F,Buffer);
    //leer el nombre de la aplicación
    iPos:=Pos(';',Buffer);
    NomApp:=Trim(Copy(Buffer,1,iPos-1));
    Buffer:=Trim(Copy(Buffer, iPos+1, Length(Buffer)));
    //leer el nombre de la aplicación
    iPos:=Pos(';',Buffer);
    NomForm:=Trim(Copy(Buffer,1,iPos-1));
  until EOF(f) or ((NomApp = App) and (NomForm = Form));
  //devolver el resultado dependiendo de la condición por la que haya salido del bucle
  if EOF(f) then
    result := ''
  else
    result := Trim(Copy(Buffer,iPos+1,Length(Buffer)));
end;

{Procedimiento que establece los accesos dando permisos a todo}
Procedure accConfigurarTrue(Obj: TObject);
Var
  i:Integer;
  Valor: Variant;
Begin
  if Obj.ClassName='TTimer' then exit;
  if Obj is TComponent then
  begin
    {Recorre todos los componentes que contiene Obj y llama recursivamente a la función:
     Caso base: Obj no contiene ningún componente}
    For i:=1 to (Obj as TComponent).ComponentCount do
      accConfigurarTrue((Obj as TComponent).Components[i-1]);
  end;
  {Mira si Obj tiene la propiedad Action y si tiene valor en esa propiedad. En ese caso, como
   automicamente toma el valor de su Action correspondiente, no se lo vamos a cambiar aqu }
  Valor:=GetPropValue(Obj, 'Action', False);
  if (Valor) or (Valor=0) then
  begin
    {Si no tiene asignado un Action, mira a ver si Obj tiene propiedad Enabled}
    Valor:=GetPropValue(Obj, 'Enabled', False);
    if not (Valor) then
    begin
      {Si Obj tiene propiedad Enabled, establece los valores de las propiedades Enabled y Tag de Obj}
      SetOrdProp(Obj, 'Enabled', 1);
      SetOrdProp(Obj, 'Tag', 1);
    end;
  end;
End;

{Procedimiento que establece los valores de las propiedades Visible, ReadOnly y Enabled de los
 componentes del Form según el fichero de accesos}
Procedure accFormConfigurar(MiForm : TForm; unFicheroAcceso: string);
var
  NombreAplicacion: String;
  NombreForm: String;
  NombreComponente: String;
  NombrePropiedad: String;
  Estado: Integer;
  MiFichero: TextFile;

  Aux : TComponent;
  Prop : PPropInfo;

  Cadena: String;
  iPos: Integer;

  appFicheroAcceso: String;
Begin
  if not FileExists(unFicheroAcceso) then
  begin
    {Si no existe el fichero de acceso que le hemos pasado, intentamos aplicar los accesos de
     la aplicación}
    appFicheroAcceso:=ChangeFileExt(Application.ExeName, '.cfg');
    if not FileExists(appFicheroAcceso) then
    begin
      {Si tampoco existe el fichero de acceso de la aplicación, damos permiso a todo}
      accConfigurarTrue(MiForm);
      exit;
    end
    else
      unFicheroAcceso:=appFicheroAcceso;
  end;

  // Si nos ha creado el Form con otro nombre
  NombreAplicacion := Application.Title;
  NombreForm := Copy(MiForm.ClassName, 2, Length(MiForm.ClassName) - 1);
  //Abrir el fichero
  Assign(MiFichero, unFicheroAcceso);
  Reset(MiFichero);

  // Encontrar los componentes de ese Form
  Cadena := BuscarCadenaAccesos(NombreAplicacion, NombreForm, MiFichero);

  {Si no hay accesos para el formulario actual, configurar todos los accesos a habilitados}
  if Cadena='' then
  begin
    accConfigurarTrue(MiForm);
    CloseFile(MiFichero);
    exit;
  end;

  {Recorre el Query de accesos}
  While Cadena <> '' do
  Begin
    // Obtener el nombre del componente
    iPos := Pos(';', Cadena);
    NombreComponente := Trim(Copy(Cadena,1,iPos-1));
    Cadena:=Trim(Copy(Cadena, iPos+1, Length(Cadena)));
    // Obtener el nombre de la propiedad
    iPos := Pos(';', Cadena);
    NombrePropiedad := Trim(Copy(Cadena,1,iPos-1));
    Cadena:=Trim(Copy(Cadena, iPos+1, Length(Cadena)));
    // Obtener el estado
    iPos := Pos(';', Cadena);
    Estado := StrToInt(Trim(Copy(Cadena,1,iPos-1)));

    Aux := TForm(MiForm).FindComponent(NombreComponente);
    If Aux <> Nil then
    Begin
      try
        Prop := GetPropInfo(Aux.ClassInfo, NombrePropiedad);
        If Prop <> Nil then
        begin
          SetOrdProp(Aux, Prop, Ord(Estado > 0));
          SetOrdProp(Aux, 'Tag', Estado);
        end;
      except end;
    End;

    Cadena := BuscarCadenaAccesos(NombreAplicacion, NombreForm, MiFichero)
  End;

  // Cerrar el fichero
  CloseFile(MiFichero);
End;

// Sonia 07.06.2005
{Procedimiento que gira un BitMap}
procedure Girar(BitmapSrc:TBitmap; BitmapDst:TBitmap);
var
  Row,Col: integer;
begin
  BitmapDst.Width:=BitmapSrc.Height;
  BitmapDst.Height:=BitmapSrc.Width;
  For Row:=0 to BitmapSrc.Height-1 do
  begin
    For Col:=0 to BitmapSrc.Width-1 do
    begin
      BitmapDst.Canvas.Pixels[Row,BitmapSrc.Width-Col]:=BitmapSrc.Canvas.Pixels[Col,Row];
    end;
  end;
end;
// Fin Sonia 07.06.2005


initialization
  LogEnabled:=True;

end.

