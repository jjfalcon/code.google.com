program Fibonacci;

{$APPTYPE CONSOLE}

uses
  Math,
  SysUtils;

var
  i, cantidad: integer;


function Fib_Recursiva(num: integer): integer;
begin
  if num = 1 then Result := 1;
  if num = 0 then Result := 0;
  if num >= 2 then Result := Fib_Recursiva(num-1) + Fib_Recursiva(num-2);
end;

function Fib_Iterativa(num: integer): integer;
var
  i, j, k : integer;
begin
  i := 1;
  j := 0;
  for k:=1 to num do
  begin
    result := i+j;
    i := j;
    j := Result;
  end;
end;

function Fib_Divide(num: integer): integer;
begin
//  n := num;
  Result := Trunc((1 / sqrt(5))*( Power( ((1+sqrt(5))/2), num) - Power( ((1-sqrt(5))/2),num)));
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  Write('Cantidad de Valores: '); Readln(cantidad);
  for i:=1 to cantidad do
    Write(Fib_Divide(i),', ');
  ReadLn;
end.
