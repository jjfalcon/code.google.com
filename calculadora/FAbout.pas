unit FAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AboutShow(modal: boolean): TForm;

implementation

{$R *.dfm}


function AboutShow(modal: boolean): TForm;
begin
  Result := nil;
  //modal
  if modal then
  begin
    with TFormAbout.Create(application) do
    try
      ShowModal;
    finally
      free;
    end;
    exit;
  end;

  //no modal
  Result := TFormAbout.Create(application);
  Result.Show;

end;



end.
