unit Main;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, XPMan,
  ActnList, StdActns;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FileExitItem: TMenuItem;
    HelpContentsItem: TMenuItem;
    HelpSearchItem: TMenuItem;
    HelpHowToUseItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    StatusLine: TStatusBar;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    PrintSetupDialog: TPrinterSetupDialog;
    SpeedBar: TPanel;
    SpeedButton1: TSpeedButton;  { &Open... }
    SpeedButton2: TSpeedButton;  { &Save }
    SpeedButton3: TSpeedButton;
    FileReopen: TMenuItem;
    XPManifest1: TXPManifest;
    ActionList1: TActionList;
    taFileOpen: TFileOpen;
    taFileClose: TAction;
    taHelpAbout: TAction;
    taViewPreferences: TAction;
    View1: TMenuItem;
    Pre1: TMenuItem;
    Action1: TAction;
    N2: TMenuItem;
    oolbars1: TMenuItem;
    Operations1: TMenuItem;
    Navegation1: TMenuItem;
    Record1: TMenuItem;
    N4: TMenuItem;
    Customize1: TMenuItem;
    N6: TMenuItem;
    ree2: TMenuItem;
    Console2: TMenuItem;
    Close1: TMenuItem;
    N5: TMenuItem;
    Viewers1: TMenuItem;
    x11: TMenuItem;
    x21: TMenuItem;
    x31: TMenuItem;
    x41: TMenuItem;
    Scenes1: TMenuItem;
    Viewer1: TMenuItem;
    Plugins1: TMenuItem;
    Assistant1: TMenuItem;
    UserManual1: TMenuItem;
    HelpOnInternet1: TMenuItem;
    N7: TMenuItem;
    utorials1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    AutoUpdate1: TMenuItem;
    Recorder1: TMenuItem;
    PlayPause1: TMenuItem;
    Reset1: TMenuItem;
    RecordStop1: TMenuItem;
    N11: TMenuItem;
    SpeedUp1: TMenuItem;
    SpeedDown1: TMenuItem;
    Speed1: TMenuItem;
    Edit1: TMenuItem;
    Mount1: TMenuItem;
    UnMount1: TMenuItem;
    Open1: TMenuItem;
    Close2: TMenuItem;
    Left1: TMenuItem;
    Right1: TMenuItem;
    N10: TMenuItem;
    PremountExit1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Navigate1: TMenuItem;
    Demo1: TMenuItem;
    N14: TMenuItem;
    FullScreen1: TMenuItem;
    N15: TMenuItem;
    CurrentMode1: TMenuItem;
    Default1: TMenuItem;
    Selection1: TMenuItem;
    Rotate1: TMenuItem;
    Move1: TMenuItem;
    Zoom1: TMenuItem;
    Goto1: TMenuItem;
    ViewInitial1: TMenuItem;
    Initial1: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    n18: TMenuItem;
    N19: TMenuItem;  { &About... }
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FilePrintSetup(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure HelpContents(Sender: TObject);
    procedure HelpSearch(Sender: TObject);
    procedure HelpHowToUse(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure taHelpAboutExecute(Sender: TObject);
    procedure taViewPreferencesExecute(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$r *.dfm}

uses
  UPlayer;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusLine.SimpleText := Application.Hint;
end;

procedure TMainForm.FileNew(Sender: TObject);
begin
  { Add code to create a new file }
end;

procedure TMainForm.FileOpen(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    { Add code to open OpenDialog.FileName }
  end;
end;

procedure TMainForm.FileSave(Sender: TObject);
begin
   { Add code to save current file under current name }
end;

procedure TMainForm.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    { Add code to save current file under SaveDialog.FileName }
  end;
end;

procedure TMainForm.FilePrint(Sender: TObject);
begin
  if PrintDialog.Execute then
  begin
    { Add code to print current file }
  end;
end;

procedure TMainForm.FilePrintSetup(Sender: TObject);
begin
  PrintSetupDialog.Execute;
end;

procedure TMainForm.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.HelpContents(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.HelpSearch(Sender: TObject);
const
  EmptyString: PChar = '';
begin
  Application.HelpCommand(HELP_PARTIALKEY, Longint(EmptyString));
end;

procedure TMainForm.HelpHowToUse(Sender: TObject);
begin
  Application.HelpCommand(HELP_HELPONHELP, 0);
end;

procedure TMainForm.HelpAbout(Sender: TObject);
begin
  { Add code to show program's About Box }
end;

procedure TMainForm.taHelpAboutExecute(Sender: TObject);
begin
  UPlayer.ShowAbout;
end;

procedure TMainForm.taViewPreferencesExecute(Sender: TObject);
begin
  UPlayer.ShowPreferences;
end;

end.
