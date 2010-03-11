unit uSpotifyTrackBar;

interface

uses
  Classes, Controls, WinTypes, WinProcs, ComCtrls, Graphics,
  Messages;            //TMessage

type

{ TSlideBar }

  TSlideBarKind = (sbVertical, sbHorizontal);
  TDrawState = set of (dsDisabled, dsPressed, dsHot, dsFocused, dsChecked,
  	dsExpanded, dsDefaulted, dsThin, dsFlat);

  TCustomSlideBar = class(TGraphicControl)
  private
    FBitmap : TBitmap;             //Bitmap oculto (off-screen) para el dibujo del display
  	FKind: TSlideBarKind;
    FMin: Double;
    FMax: Double;
    FStep: Double;
    FPosition: Double;
    FAssociate: TControl;
    FDrawState: TDrawState;
    FOnDraw: TNotifyEvent;
    FOnChange: TNotifyEvent;
    procedure SetMax(const Value: Double);
    procedure SetMin(const Value: Double);
    procedure SetPosition(Value: Double);
    procedure SetKind(Value: TSlideBarKind);
    procedure SetDrawState(Value: TDrawState);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    function GetGripRect: TRect;
    procedure Change; dynamic;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    property DrawState: TDrawState read FDrawState write SetDrawState;
    property Associate: TControl read FAssociate write FAssociate;
    property Kind: TSlideBarKind read FKind write SetKind;
    property Min: Double read FMin write SetMin;
    property Max: Double read FMax write SetMax;
    property Step: Double read FStep write FStep;
    property Position: Double read FPosition write SetPosition;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDraw: TNotifyEvent read FOnDraw write FOnDraw;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TSlideBar = class(TCustomSlideBar)
  public
    property Canvas;
  published
    property Align;
    property Associate;
    property Anchors;
    property Enabled;
    property Kind;
    property Min;
    property Max;
    property Step;
    property Position;
    property OnChange;
    property OnDraw;
  end;

  TSpotifySlideBar = class(TSlideBar)
  protected
  end;


procedure Register;

implementation

uses
  sysutils;

(*
function Divide(const Quotient, Divisor: Single): Single;
begin
  if Divisor = 0 then
    Result := 0
  else
    Result := Round(Quotient / Divisor) * Divisor;
end;
*)

{ TCustomSlideBar }

constructor TCustomSlideBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle+[csOpaque];     //Necesario para evitar el parpadeo
  FBitmap := TBitmap.Create;

  Height := 100;
  Width  := 50;
  FMax   := 100;
  FMin   := 0;
  FStep  := 1;
  if not Enabled then
	  FDrawState := [dsDisabled];
end;

destructor TCustomSlideBar.Destroy;
begin
  inherited Destroy;
  FBitmap.Free;
end;

function TCustomSlideBar.GetGripRect: TRect;
var
  X, Y: Integer;
begin

	if FKind = sbVertical then
  begin
    X := Width div 2;
    Y := Height - (System.Round(Abs(Position - Min) * ((Height - 10) / (FMax - FMin))) + 5);
    Result := ClientRect;
    Result.Left := X - 5;
    Result.Right := X + 5;
    Result.Top := Y - 5;
    Result.Bottom := Y + 5;
    InflateRect(Result, 4, 8);
	end
  else
  begin
    X := (System.Round(Abs(Position - Min) * ((Width - 10) / (FMax - FMin))) + 5);
    Y := Height div 2;
    Result := ClientRect;
    Result.Left := X - 5;
    Result.Right := X + 5;
    Result.Top := Y - 5;
    Result.Bottom := Y + 5;
    InflateRect(Result, 4, 8);
  end;
end;

procedure TCustomSlideBar.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomSlideBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
	Range, Delta: Single;
begin

  inherited MouseMove(Shift, X, Y);
  if not PtInRect(ClientRect, Point(X, Y)) then exit;

  if PtInRect(GetGripRect, Point(X, Y)) then
  if PtInRect(ClientRect, Point(X, Y)) then
		DrawState := DrawState + [dsHot]
  else
		DrawState := DrawState - [dsHot];

  if FKind = sbVertical then
  begin
  	Range := Height;
    Delta := Y;
  end
  else
  begin
  	Range := Width;
    Delta := X;
  end;
  if Range = 0 then
  	Range := 0.000001;
  if (dsFocused in DrawState)and (FMax > FMin) then
	  if FKind = sbVertical then
  	  Position := (Range - Delta) / (Range / (FMax - FMin)) + FMin
    else
  	  Position := (Delta / Range) * (FMax - FMin) + FMin;
end;

procedure TCustomSlideBar.MouseDown(Button: TMouseButton; Shift: TShiftState;
	X, Y: Integer);
begin
	inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
	begin
    DrawState := DrawState + [dsFocused];
    MouseMove(Shift, X, Y);
  end;
end;

procedure TCustomSlideBar.MouseUp(Button: TMouseButton; Shift: TShiftState;
	X, Y: Integer);
begin
	inherited MouseUp(Button, Shift, X, Y);
  if Button = mbLeft then
	  DrawState := DrawState - [dsFocused];
end;

procedure TCustomSlideBar.Paint;
Var
  x,y :integer;
  Rect : TRect;
begin
  Rect           := ClientRect;
  FBitmap.Width  := ClientRect.Right;
  FBitmap.Height := ClientRect.Bottom;
  FBitmap.Canvas.Brush.Color:= clRed;
  FBitmap.Canvas.FillRect(Rect);

  X := (System.Round(Abs(Position - Min) * ((Width - 10) / (FMax - FMin))) + 5);
  Y := Height div 2;
  Rect.Top := Y - 5;
  Rect.Bottom := Y + 5;

  if true then
  begin
    FBitmap.Canvas.Brush.color := clGray;
    FBitmap.Canvas.RoundRect(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, Rect.Bottom div 2, Rect.Bottom div 2);
  end;

  Rect.Left  := X - 5;
  Rect.Right := X + 5;

  FBitmap.Canvas.Brush.color := clWhite;
  FBitmap.Canvas.Ellipse(Rect);
  if (dsFocused in DrawState) then
  begin
    InflateRect(Rect, -3, -3);
    FBitmap.Canvas.Brush.color := clBlack;
    FBitmap.Canvas.Ellipse(Rect);
  end;

  FBitmap.Transparent := true;
  Canvas.Draw(0,0,FBitmap);
end;

procedure TCustomSlideBar.SetDrawState(Value: TDrawState);
begin
	if Value <> FDrawState then
  begin
		FDrawState := Value;
    Repaint;
  end;
end;

procedure TCustomSlideBar.SetKind(Value: TSlideBarKind);
var
	I: Integer;
begin

	if Value <> FKind then
  begin
  	FKind := Value;
    if csLoading in ComponentState then Exit;
    I := Width;
    Width := Height;
    Height := I;
    Invalidate;
  end;
end;

procedure TCustomSlideBar.SetMax(const Value: Double);
begin
  if Value <> FMax then
  begin
    if Value < FMin then
      FMax := FMin
    else
      FMax := Value;
    Invalidate;
  end;
end;

procedure TCustomSlideBar.SetMin(const Value: Double);
begin
  if Value <> FMin then
  begin
    if FMax < Value then
      FMin := FMax
    else
      FMin := Value;
    Invalidate;
  end;
end;
(*
procedure InvalidateControlRect(Control: TControl; Rect: TRect);
var
	WinControl: TWinControl absolute Control;
begin
	if csDesigning in Control.ComponentState then
  	Control.Invalidate
	else if not Control.Visible then
  	Exit
	else if (Control is TGraphicControl) and
  	(Control.Parent <> nil) and	Control.Parent.HandleAllocated then
  begin
  	with Control.BoundsRect do
			OffsetRect(Rect, Left, Top);
    InvalidateRect(Control.Parent.Handle, @Rect, True)
  end
  else if (Control is TWinControl) and (WinControl.HandleAllocated) then
    InvalidateRect(WinControl.Handle, @Rect, False)
end;
*)

procedure TCustomSlideBar.SetPosition(Value: Double);
begin
  if Value <> FPosition then
  begin
    FPosition := Value;
    Invalidate;
  end;

(*
  if Value < FMin then
    Value := FMin
  else if Value > FMax then
    Value := FMax;
  if Value <> FPosition then
  begin
  	InvalidateControlRect(Self, GetGripRect);
    if FStep > 0 then
      FPosition := Divide(Value, FStep)
    else
      FPosition := Value;
    Change;
    if FAssociate <> nil then
      TCustomSlideBar(FAssociate).Text := FloatToStr(FPosition);
  	InvalidateControlRect(Self, GetGripRect);
  end;
*)
end;

procedure TCustomSlideBar.CMEnabledChanged(var Message: TMessage);
begin
	inherited;
  if Enabled then
	  DrawState := DrawState - [dsDisabled]
  else
	  DrawState := DrawState + [dsDisabled];
end;

procedure TCustomSlideBar.CMMouseLeave(var Message: TMessage);
begin
	inherited;
  DrawState := DrawState - [dsHot];
end;

procedure Register;
begin
  RegisterComponents('Spotify', [TSpotifySlideBar]);
end;

end.

