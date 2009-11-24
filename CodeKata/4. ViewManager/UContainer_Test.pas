unit UContainer_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting,
  UContainer;

type

  TContainer_ATest = class(TGUITestCase)
  private
  protected
  published
  end;

  TContainer_BTest = class(TGUITestCase)
  private
  protected
  published
    procedure Add;
    procedure Get;
    procedure Upd;
    procedure Del;
  end;

  TContainer_DTest = class(TGUITestCase)
  private
  protected
  published
    procedure GivenNonFull_WhenAdd_ThenPutInContainer;
    procedure GivenFull_WhenAdd_ThenThrowException;
    procedure GivenKnownId_WhenGet_ThenReturnObject;
    procedure GivenUnknownId_WhenGet_ThenNull;
    procedure GivenKnownId_WhenUpd_ThenRemoveAndAdd;
    procedure GivenUnknownId_WhenUpd_ThenAdd;
    procedure GivenKnownId_WhenDel_ThenRemove;
    procedure GivenUnknownId_WhenDel_ThenThrowException;
  end;

  TContainer_GTest = class(TGUITestCase)
  private
  protected
  published
    procedure WhenAdd_GivenNonFull_ThenPutInContainer;
    procedure WhenAdd_GivenFull_ThenThrowException;
    procedure WhenGet_GivenKnownId_ThenReturnObject;
    procedure WhenGet_GivenUnknownId_ThenNull;
    procedure WhenUpd_GivenKnownId_ThenRemoveAndAdd;
    procedure WhenUpd_GivenUnknownId_ThenAdd;
    procedure WhenDel_GivenKnownId_ThenRemove;
    procedure WhenDel_GivenUnknownId_ThenThrowException;
  end;

  WhenAdd = class(TGUITestCase)
  private
  protected
  published
    procedure GivenNonFull_ThenPutInContainer;
    procedure GivenFull_ThenThrowException;
  end;

  WhenGet = class(TGUITestCase)
  private
  protected
  published
    procedure GivenKnownId_ThenReturnObject;
    procedure GivenUnknownId_ThenNull;
  end;

  WhenUpd = class(TGUITestCase)
  private
  protected
  published
    procedure GivenKnownId_ThenRemoveAndAdd;
    procedure GivenUnknownId_ThenAdd;
  end;

  WhenDel = class(TGUITestCase)
  private
  protected
  published
    procedure GivenKnownId_ThenRemove;
    procedure GivenUnknownId_ThenThrowException;
  end;

implementation

{ TContainer_Test }

procedure TContainer_BTest.Add;
begin
  // Given Non-Full Container - Then Put in Container
  // Given Full Container - Then Throw Exception
end;

procedure TContainer_BTest.Get;
begin
  // Given Known Id - Then Return Object
  // Given Unknown Id - Then Return Null
end;

procedure TContainer_BTest.Upd;
begin
  // Given Known Id - Then Remove and Add
  // Given Unknown Id - Then Add
end;

procedure TContainer_BTest.Del;
begin
  // Given Known Id - Then Remove
  // Given Unknown Id - Then Throw Exception
end;


procedure WhenAdd.GivenFull_ThenThrowException;
begin

end;

procedure WhenAdd.GivenNonFull_ThenPutInContainer;
begin

end;

procedure TContainer_GTest.WhenDel_GivenKnownId_ThenRemove;
begin

end;

procedure TContainer_GTest.WhenDel_GivenUnknownId_ThenThrowException;
begin

end;

procedure TContainer_GTest.WhenGet_GivenKnownId_ThenReturnObject;
begin

end;

procedure TContainer_GTest.WhenGet_GivenUnknownId_ThenNull;
begin

end;

procedure TContainer_GTest.WhenUpd_GivenKnownId_ThenRemoveAndAdd;
begin

end;

procedure TContainer_GTest.WhenUpd_GivenUnknownId_ThenAdd;
begin

end;

procedure TContainer_GTest.WhenAdd_GivenFull_ThenThrowException;
begin

end;

procedure TContainer_GTest.WhenAdd_GivenNonFull_ThenPutInContainer;
begin

end;

{ TContainer_DTest }

procedure TContainer_DTest.GivenFull_WhenAdd_ThenThrowException;
begin

end;

procedure TContainer_DTest.GivenKnownId_WhenDel_ThenRemove;
begin

end;

procedure TContainer_DTest.GivenKnownId_WhenGet_ThenReturnObject;
begin

end;

procedure TContainer_DTest.GivenKnownId_WhenUpd_ThenRemoveAndAdd;
begin

end;

procedure TContainer_DTest.GivenNonFull_WhenAdd_ThenPutInContainer;
begin

end;

procedure TContainer_DTest.GivenUnknownId_WhenDel_ThenThrowException;
begin

end;

procedure TContainer_DTest.GivenUnknownId_WhenGet_ThenNull;
begin

end;

procedure TContainer_DTest.GivenUnknownId_WhenUpd_ThenAdd;
begin

end;

{ WhenGet }

procedure WhenGet.GivenKnownId_ThenReturnObject;
begin

end;

procedure WhenGet.GivenUnknownId_ThenNull;
begin

end;

{ WhenUpd }

procedure WhenUpd.GivenKnownId_ThenRemoveAndAdd;
begin

end;

procedure WhenUpd.GivenUnknownId_ThenAdd;
begin

end;

{ WhenDel }

procedure WhenDel.GivenKnownId_ThenRemove;
begin

end;

procedure WhenDel.GivenUnknownId_ThenThrowException;
begin

end;

initialization
  //Aceptance Test
  if FindCmdLineSwitch('A', ['-', '/'], true) then
    TestFramework.RegisterTest('Aceptacion'         , TContainer_ATest.Suite);

  //Unitary Test
  TestFramework.RegisterTest('Unitaria'           , TContainer_BTest.Suite);
  TestFramework.RegisterTest('Unitaria'           , TContainer_DTest.Suite);
  TestFramework.RegisterTest('Unitaria'           , TContainer_GTest.Suite);
  TestFramework.RegisterTest('Unitaria/Container' , WhenAdd.Suite);
  TestFramework.RegisterTest('Unitaria/Container' , WhenGet.Suite);
  TestFramework.RegisterTest('Unitaria/Container' , WhenUpd.Suite);
  TestFramework.RegisterTest('Unitaria/Container' , WhenDel.Suite);
end.
