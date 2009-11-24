unit PrimeFactorsTest;

interface

uses
  classes,
  TestFramework,
  PrimeFactors;

type

  TPrimeFactorsTest = class(TTestCase)
  private
    List : TList;
    FFixture: TPrimeFactors;
  public
  published
    procedure TestOne;
    procedure TestTwo;
    procedure TestThree;
    procedure TestFour;
    procedure TestFive;
    procedure TestSix;
    procedure TestEight;
    procedure TestNine;
    procedure TestTen;
  end;

implementation

uses
  windows;

procedure TPrimeFactorsTest.TestOne;
begin
  CheckEquals('', FFixture.Generate(1));
end;

procedure TPrimeFactorsTest.TestTwo;
begin
  CheckEquals(',2', FFixture.Generate(2));
end;

procedure TPrimeFactorsTest.TestThree;
begin
  CheckEquals(',3', FFixture.Generate(3));
end;

procedure TPrimeFactorsTest.TestFour;
begin
  CheckEquals(',2,2', FFixture.Generate(4));
end;

procedure TPrimeFactorsTest.TestFive;
begin
  CheckEquals(',5', FFixture.Generate(5));
end;

procedure TPrimeFactorsTest.TestSix;
begin
  CheckEquals(',2,3', FFixture.Generate(6));
end;

procedure TPrimeFactorsTest.TestEight;
begin
  CheckEquals(',2,2,2', FFixture.Generate(8));
end;

procedure TPrimeFactorsTest.TestNine;
begin
  CheckEquals(',3,3', FFixture.Generate(9));
end;

procedure TPrimeFactorsTest.TestTen;
begin
  CheckEquals(',2,5', FFixture.Generate(10));
end;

initialization
  RegisterTest('Pruebas Unitarias', TPrimeFactorsTest.Suite);
end.
