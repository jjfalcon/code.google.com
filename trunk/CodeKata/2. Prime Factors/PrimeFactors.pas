unit PrimeFactors;

interface

uses
  classes;

type

  TPrimeFactors = class(TObject)
  private
    { Private declarations }
  public
    { Public declarations }
    function Generate(n: integer): string;
  end;

implementation

uses
  sysutils;

function TPrimeFactors.Generate(n: integer): string;
var
  iCandidate : integer;
begin
  result := '';
  iCandidate := 2;
  while (n > 1) do begin
    while (n mod iCandidate) = 0 do
    begin
      result := result + ','+IntToStr(iCandidate);
      n := n div iCandidate;
    end;
    Inc(iCandidate);
  end;
end;

end.
