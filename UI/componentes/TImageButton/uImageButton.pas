unit uImageButton;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TestFramework, TestExtensions, GUITesting;

type

  TImageButton = class(TGraphicControl)
  private
    FAutosize: boolean;
    FTransparent : boolean;
    FOnOff   : boolean;
    FOver    : boolean;
    FDown    : boolean;
    MOver    : TBitmap;
    MDown    : TBitmap;
    MUp      : TBitmap;
    MDisable : TBitmap;
    BtnClick : TNotifyEvent;
    OnMDown  : TMouseEvent;
    OnMUp    : TMouseEvent;
    OnMEnter : TNotifyEvent;
    OnMLeave : TNotifyEvent;
    procedure SetTransparent(Value: Boolean);
    procedure SetOnOff(Value: Boolean);
    procedure SetDown(Value: Boolean);
    procedure SetMOver(Value: TBitmap);
    procedure SetMDown(Value: TBitmap);
    procedure SetMUp(Value: TBitmap);
    procedure SetMDisable(Value: TBitmap);
  protected
    procedure SetAutosize(Value: Boolean);override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure MouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property OnOff: Boolean read FDown write SetOnOff default False;
    property Down: Boolean read FDown write SetDown default False;
    property Autosize;

    property ShowHint;
    property ParentShowHint;

    property Transparent: Boolean read FTransparent write SetTransparent default False;
    property BitmapOver: TBitmap read MOver write SetMOver;
    property BitmapDown: TBitmap read MDown write SetMDown;
    property BitmapUp: TBitmap read MUp write SetMUp;
    property BitmapDisabled: TBitmap read MDisable write SetMDisable;

    property OnClick: TNotifyEvent read BtnClick write BtnClick;
    property OnMouseDown: TMouseEvent read OnMDown write OnMDown;
    property OnMouseUp: TMouseEvent read OnMUp write OnMUp;
    property OnMouseEnter: TNotifyEvent read OnMEnter write OnMEnter;
    property OnMouseLeave: TNotifyEvent read OnMLeave write OnMLeave;
  end;

  TImageButtonTest = class(TGUITestCase)
  private
    FFixture: TImageButton;

  protected
    procedure SetUp; override;
    procedure TearDown;override;
  published
    procedure EnabledFalse_GivenUp_WhenClickDownUp_ThenUp;
    procedure EnabledFalse_GivenDown_WhenClickDownUp_ThenDown;
    procedure OnOffTrue_GivenDown_WhenClickDownUp_ThenUp;
    procedure OnOffTrue_GivenUp_WhenClickDownUp_ThenDown;
    procedure OnOffFalse_GivenUp_WhenClickDown_ThenDown;
    procedure OnOffFalse_GivenDown_WhenClickUp_ThenUp;
    procedure Autosize_GivenTrue_WhenLoadBitmap_ThenAutosize;
    procedure Autosize_GivenFalse_WhenLoadBitmap_ThenNone;
//    procedure if_OnOff_WhenDownAndUp_ThenChangeDown;
  end;

procedure Register;

implementation

constructor TImageButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle:=ControlStyle+[csOpaque];               //evitar parpadeo

  MOver    := TBitmap.Create;
  MDown    := TBitmap.Create;
  MUp      := TBitmap.Create;
  MDisable := TBitmap.Create;

  Width    := 50;
  Height   := 50;
  FAutosize := false;
  FTransparent := false;
  FOnOff   := false;
  FDown    := false;
  FOver    := false;
  ShowHint := true;
  Canvas.Brush.Color := clBtnFace;
end;

destructor TImageButton.Destroy;
begin
  inherited Destroy;
  MOver.Free;
  MDown.Free;
  MUp.Free;
  MDisable.Free;
end;

procedure TImageButton.SetAutosize(Value: boolean);
begin
  if Value <> FAutosize then
  begin
    FAutosize := Value;
    Paint;
  end;
end;

procedure TImageButton.SetTransparent(Value: boolean);
begin
  if Value <> FTransparent then
  begin
    FTransparent := Value;
    Paint;
  end;
end;

procedure TImageButton.SetOnOff(Value: boolean);
begin
  if Value <> FOnOff then
  begin
    FOnOff := Value;
    Paint;
  end;
end;

procedure TImageButton.SetDown(Value: boolean);
begin
  if Value <> FDown then
  begin
    FDown := Value;
    Paint;
  end;
end;

procedure TImageButton.Paint;
var
  img : TBitmap;
begin
  if not Assigned(Parent) then exit;
  inherited Paint;

  if not enabled
  then img := MDisable
  else if FOver then img := MOver
  else if FDown then img := MDown
  else img := MUp;

  if img <> nil then
  begin

    if Autosize then
    begin
      Width  := img.Width;
      Height := img.Height;
    end;

    img.TransparentColor := img.Canvas.Pixels[0,0];
    img.Transparent := FTransparent;
    Canvas.Draw(0,0,img);
  end;
end;

procedure TImageButton.Click;
begin
  inherited Click;
  if Enabled then if Assigned(BtnClick) then BtnClick(Self);
end;

procedure TImageButton.SetMOver(Value: TBitmap);
begin
  MOver.Assign(Value);
  Paint;
end;

procedure TImageButton.SetMDown(Value: TBitmap);
begin
  MDown.Assign(Value);
  Width := Value.Width;
  Height := Value.Height;
  Paint;
end;

procedure TImageButton.SetMUp(Value: TBitmap);
begin
  MUp.Assign(Value);
  Width := Value.Width;
  Height := Value.Height;
  Paint;
end;

procedure TImageButton.SetMDisable(Value: TBitmap);
begin
  MDisable.Assign(Value);
  Width := Value.Width;
  Height := Value.Height;
  Paint;
end;

procedure TImageButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);

  if Enabled then
  begin
    FDown := not FDown;
    FOver := false;
    Paint;
  end;
end;

procedure TImageButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);

  if Enabled and (not FOnOff) then
  begin
    FDown := False;
    Paint;
  end;
end;

procedure TImageButton.MouseEnter(var Message: TMessage);
begin
  if Enabled and (not FOver) and (MOver.Width > 0) then
  begin
    FOver := true;
    Paint;
  end;
end;

procedure TImageButton.MouseLeave(var Message: TMessage);
begin
  if Enabled and (MOver.Width > 0) then
  begin
    FOver := false;
    Paint;
  end;
end;


//TEST
procedure TImageButtonTest.SetUp;
begin
  inherited;

  FFixture := TImageButton.Create(application);
  FFixture.Parent := application.MainForm;
end;

procedure TImageButtonTest.TearDown;
begin
  FFixture.Free;
  inherited;
end;

procedure TImageButtonTest.EnabledFalse_GivenUp_WhenClickDownUp_ThenUp;
begin
  FFixture.Enabled := false;
  FFixture.OnOff := false;
  FFixture.Down  := false;

  FFixture.MouseDown(TMouseButton(FFixture), [], 0, 0);;
  Check(not FFixture.Down);
  FFixture.MouseUp(TMouseButton(FFixture), [], 0, 0);;
  Check(not FFixture.Down);
end;

procedure TImageButtonTest.EnabledFalse_GivenDown_WhenClickDownUp_ThenDown;
begin
  FFixture.Enabled := false;
  FFixture.OnOff := false;
  FFixture.Down  := true;

  FFixture.MouseDown(TMouseButton(FFixture), [], 0, 0);;
  Check(FFixture.Down);
  FFixture.MouseUp(TMouseButton(FFixture), [], 0, 0);;
  Check(FFixture.Down);
end;

procedure TImageButtonTest.OnOffFalse_GivenUp_WhenClickDown_ThenDown;
begin
  FFixture.OnOff := false;
  FFixture.Down  := false;
  //action
  FFixture.MouseDown(TMouseButton(FFixture), [], 0, 0);;
  //assert
  Check(FFixture.Down);
end;

procedure TImageButtonTest.OnOffFalse_GivenDown_WhenClickUp_ThenUp;
begin
  FFixture.OnOff := false;
  FFixture.Down  := true;
  //action
  FFixture.MouseUp(TMouseButton(FFixture), [], 0, 0);;
  //assert
  Check(not FFixture.Down);
end;

procedure TImageButtonTest.OnOffTrue_GivenDown_WhenClickDownUp_ThenUp;
begin
  FFixture.OnOff := true;
  FFixture.Down  := true;
  //action
  FFixture.MouseDown(TMouseButton(FFixture), [], 0, 0);;
  FFixture.MouseUp(TMouseButton(FFixture), [], 0, 0);;
  //assert
  Check(not FFixture.Down);
end;

procedure TImageButtonTest.OnOffTrue_GivenUp_WhenClickDownUp_ThenDown;
begin
  //init
  FFixture.OnOff := true;
  FFixture.Down  := false;
  //action
  FFixture.MouseDown(TMouseButton(FFixture), [], 0, 0);;
  FFixture.MouseUp(TMouseButton(FFixture), [], 0, 0);;
  //assert
  Check(FFixture.Down);
end;

procedure TImageButtonTest.Autosize_GivenTrue_WhenLoadBitmap_ThenAutosize;
var
  img : TBitmap;
begin
  FFixture.Autosize := true;
  FFixture.width := 200;
  img := Tbitmap.Create;
  try
    img.width := 100;
    img.height:= 100;
    FFixture.BitmapUp := img;
    Check(FFixture.width=img.width);
  finally
    img.Free;
  end;

end;

procedure TImageButtonTest.Autosize_GivenFalse_WhenLoadBitmap_ThenNone;
var
  img : TBitmap;
begin
  FFixture.Autosize := false;
  FFixture.width := 200;
  img := Tbitmap.Create;
  try
    img.width := 100;
    img.height:= 100;
    FFixture.MUp := img;
//    Check(FFixture.width<>img.width);
    Check(FFixture.width = 200);
    FFixture.MUp := nil;
  finally
    img.Free;
  end;

end;

procedure Register;
begin
  RegisterComponents('Buttons', [TImageButton]);
end;

initialization
  TestFramework.RegisterTest('', TImageButtonTest.Suite);
end.
