unit UFib;

interface

uses
  Classes;

type

  TFib = class(TObject)
  private
    { Private declarations }
  public
    { Public declarations }
    function Calc(n: integer): longint;
  end;


implementation

uses
  math;

function TFib.Calc(n: integer): longint;
begin
  if n < 0 then
  begin
    Result := -1;
    exit;
  end;
  Result := Trunc((1 / sqrt(5))*( Power( ((1+sqrt(5))/2), n) - Power( ((1-sqrt(5))/2),n)));
exit;
  Result := 0;
  if n < 0 then Result := -1;
  if n = 1 then Result := 1;
  if n > 1 then Result := Calc(n-1) + Calc(n-2);
end;

end.


(*
  if n < 0 then
  begin
    Result := -1;
    exit;
  end;
  Result := Trunc((1 / sqrt(5))*( Power( ((1+sqrt(5))/2), n) - Power( ((1-sqrt(5))/2),n)));
exit;
*)
