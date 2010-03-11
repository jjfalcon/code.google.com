unit uMyClass;

interface

type

  TMyClass = class
  private
    procedure DoItNow;
  public
    function  DoSomething(Msg: string): boolean;
  end;

implementation

uses
  MessageServices;

{ TMyClass }

procedure TMyClass.DoItNow;
begin
  //do something now;
end;

function TMyClass.DoSomething(Msg: string): boolean;
begin
  Result := MessageServices.SendAMessage(Msg);
  if Result then DoItNow;
end;

end.
 