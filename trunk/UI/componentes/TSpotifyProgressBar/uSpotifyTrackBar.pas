unit uSpotifyTrackBar;

interface

uses
  Classes, Controls, Graphics, WinTypes, WinProcs, ComCtrls,
  GraphTools,
  Messages;            //TMessage

type

{ TSlideBar }

  TSlideBarKind = (sbVertical, sbHorizontal);

  TCustomSlideBar = class(TGraphicControl)
  private
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
    procedure Paint; override;
  end;


procedure Register;

implementation

uses
  sysutils;

{ TCustomSlideBar }

constructor TCustomSlideBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 100;
  Width := 50;
  FMax := 100;
  FMin := 0;
  FStep := 1;
  if not Enabled then
	  FDrawState := [dsDisabled];
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
    InflateRect(Result, 8, 4);
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
  if PtInRect(GetGripRect, Point(X, Y)) then
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
  if (dsFocused in DrawState) and (FMax > FMin) then
	  if FKind = sbVertical then
  	  Position := (Range - Delta) / (Range / (FMax - FMin)) + FMin
    else
  	  Position := (Delta / Range) * (FMax - FMin) + FMin;
end;

procedure TCustomSlideBar.MouseDown(Button: TMouseButton; Shift: TShiftState;
	X, Y: Integer);
begin
	inherited MouseDown(Button, Shift, X, Y);
//  if Button = mbLeft then
//	  DrawState := DrawState + [dsFocused];
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
var
  DC: HDC;
  Rect: TRect;
  X, Y: Integer;
begin
  if Assigned(FOnDraw) then
    FOnDraw(Self)
  else
  begin
    DC := Canvas.Handle;
    Rect := ClientRect;
    if FKind = sbVertical then
    begin
      X := Width div 2;
      Y := Height - (System.Round(Abs(Position - Min) * ((Height - 10) / (FMax - FMin))) + 5);
      Rect.Left := X - 1;
      Rect.Right := X + 1;
      DrawThemeHorzSplit(DC, Rect, FDrawState);
      Rect.Top := Y - 1;
      Rect.Bottom := Y + 1;
      InflateRect(Rect, 8, 4);
      FillRect(DC, Rect, COLOR_BTNFACE + 1);
      DrawThemeVertThumb(DC, Rect, FDrawState);
    end
    else
    begin
      X := (System.Round(Abs(Position - Min) * ((Width - 10) / (FMax - FMin))) + 5);
      Y := Height div 2;
      Rect.Top := Y - 1;
      Rect.Bottom := Y + 1;
      DrawThemeVertSplit(DC, Rect, FDrawState);
      Rect.Left := X - 1;
      Rect.Right := X + 1;
      InflateRect(Rect, 4, 8);
      FillRect(DC, Rect, COLOR_BTNFACE + 1);
      DrawThemeHorzThumb(DC, Rect, FDrawState);
    end;
  end;
end;

procedure TCustomSlideBar.SetDrawState(Value: TDrawState);
begin
	if Value <> FDrawState then
  begin
		FDrawState := Value;
    Invalidate;
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

function Divide(const Quotient, Divisor: Single): Single;
begin
  if Divisor = 0 then
    Result := 0
  else
    Result := Round(Quotient / Divisor) * Divisor;
end;

procedure TCustomSlideBar.SetPosition(Value: Double);
begin
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

{ TColorClideBar }

procedure TSpotifySlideBar.Paint;
var
  x,y : integer;
begin
  inherited;
exit;

  Canvas.Pen.Style:=psSolid;            {Asignamos el estilo del pen}
  Canvas.Pen.Mode:=pmCopy;              {Idem modo}
  Canvas.Pen.Color:=clBlack;
  Canvas.Brush.Color:=clGray;
  Canvas.Ellipse(ClientRect);                              //pintar recuadro
//  Canvas.Rectangle(ClientRect);
  Canvas.Brush.Color:=clWhite;
  x := Round(Position);
  y := 0;
  Canvas.Ellipse(x, y, x+ClientRect.Bottom,ClientRect.Bottom);
end;


procedure Register;
begin
  RegisterComponents('Curso', [TSpotifySlideBar]);
end;

end.

