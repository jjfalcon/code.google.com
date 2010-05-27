program OpenERP6;

uses
  Forms,
  FOpenERP6 in 'FOpenERP6.pas' {FormOpenERP6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormOpenERP6, FormOpenERP6);
  Application.Run;
end.
