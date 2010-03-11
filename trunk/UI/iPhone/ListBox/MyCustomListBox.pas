unit MyCustomListBox;

interface

uses
  Messages, Windows, SysUtils, Classes, StdCtrls, Controls, Forms,
  Menus, Graphics,Consts, RTLConsts, ActnList, Themes;

type
  TMyCustomListBox = class(TCustomMultiSelectListControl)

  private
    FAutoComplete: Boolean;
    FCount: Integer;
    FItems: TStrings;
    FFilter: String;
    FLastTime: Cardinal;
    FBorderStyle: TBorderStyle;
    FCanvas: TCanvas;
    FColumns: Integer;
    FItemHeight: Integer;
    FOldCount: Integer;
    FStyle: TListBoxStyle;
    FIntegralHeight: Boolean;
    FSorted: Boolean;
    FExtendedSelect: Boolean;
    FTabWidth: Integer;
    FSaveItems: TStringList;
    FSaveTopIndex: Integer;
    FSaveItemIndex: Integer;
    FOnDrawItem: TDrawItemEvent;
    FOnMeasureItem: TMeasureItemEvent;
    FOnData: TLBGetDataEvent;
    FOnDataFind: TLBFindDataEvent;
    FOnDataObject: TLBGetDataObjectEvent;
    function GetItemHeight: Integer;
    function GetTopIndex: Integer;
    procedure LBGetText(var Message: TMessage); message LB_GETTEXT;
    procedure LBGetTextLen(var Message: TMessage); message LB_GETTEXTLEN;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetColumnWidth;
    procedure SetColumns(Value: Integer);
    procedure SetCount(const Value: Integer);
    procedure SetExtendedSelect(Value: Boolean);
    procedure SetIntegralHeight(Value: Boolean);
    procedure SetItemHeight(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetSelected(Index: Integer; Value: Boolean);
    procedure SetSorted(Value: Boolean);
    procedure SetStyle(Value: TListBoxStyle);
    procedure SetTabWidth(Value: Integer);
    procedure SetTopIndex(Value: Integer);
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNMeasureItem(var Message: TWMMeasureItem); message CN_MEASUREITEM;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
  protected
    FMoving: Boolean;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function DoGetData(const Index: Integer): String;
    function DoGetDataObject(const Index: Integer): TObject;
    function DoFindData(const Data: String): Integer;
    procedure WndProc(var Message: TMessage); override;
    procedure DragCanceled; override;
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); virtual;
    function GetCount: Integer; override;
    function GetSelCount: Integer; override;
    procedure MeasureItem(Index: Integer; var Height: Integer); virtual;
    function InternalGetItemData(Index: Integer): Longint; dynamic;
    procedure InternalSetItemData(Index: Integer; AData: Longint); dynamic;
    function GetItemData(Index: Integer): LongInt; dynamic;
    function GetItemIndex: Integer; override;
   function GetSelected(Index: Integer): Boolean;
    procedure KeyPress(var Key: Char); override;
    procedure SetItemData(Index: Integer; AData: LongInt); dynamic;
    procedure ResetContent; dynamic;
    procedure DeleteString(Index: Integer); dynamic;
    procedure SetMultiSelect(Value: Boolean); override;
    procedure SetItemIndex(const Value: Integer); override;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Columns: Integer read FColumns write SetColumns default 0;
    property ExtendedSelect: Boolean read FExtendedSelect write SetExtendedSelect default True;
    property IntegralHeight: Boolean read FIntegralHeight write SetIntegralHeight default False;
    property ItemHeight: Integer read GetItemHeight write SetItemHeight;
    property ParentColor default False;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property Style: TListBoxStyle read FStyle write SetStyle default lbStandard;
    property TabWidth: Integer read FTabWidth write SetTabWidth default 0;
    property OnDrawItem: TDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem;
    property OnData: TLBGetDataEvent read FOnData write FOnData;
    property OnDataObject: TLBGetDataObjectEvent read FOnDataObject write FOnDataObject;
    property OnDataFind: TLBFindDataEvent read FOnDataFind write FOnDataFind;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddItem(Item: String; AObject: TObject); override;
    procedure Clear; override;
    procedure ClearSelection; override;
    procedure CopySelection(Destination: TCustomListControl); override;
    procedure DeleteSelected; override;
    function ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
    function ItemRect(Index: Integer): TRect;
    procedure SelectAll; override;
    property AutoComplete: Boolean read FAutoComplete write FAutoComplete default True;
    property Canvas: TCanvas read FCanvas;
    property Count: Integer read GetCount write SetCount;
    property Items: TStrings read FItems write SetItems;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;

    property TopIndex: Integer read GetTopIndex write SetTopIndex;
  published
    property TabStop default True;
  end;

implementation

{ TCustomListBox }

constructor TMyCustomListBox.Create(AOwner: TComponent);
const
  ListBoxStyle = [csSetCaption, csDoubleClicks, csOpaque];
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := ListBoxStyle else
    ControlStyle := ListBoxStyle + [csFramed];
  Width := 121;
  Height := 97;
  TabStop := True;
  ParentColor := False;
  FAutoComplete := True;
  FItems := TStrings.create;//TListBoxStrings.Create;
  //TListBoxStrings(FItems).ListBox := Self;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FItemHeight := 16;
  FBorderStyle := bsSingle;
  FExtendedSelect := True;
  FOldCount := -1;
end;

destructor TMyCustomListBox.Destroy;
begin
  inherited Destroy;
  FCanvas.Free;
  FItems.Free;
  FSaveItems.Free;
end;

procedure TMyCustomListBox.AddItem(Item: String; AObject: TObject);
var
  S: String;
begin
  SetString(S, PChar(Item), StrLen(PChar(Item)));
  Items.AddObject(S, AObject);
end;

function TMyCustomListBox.GetItemData(Index: Integer): LongInt;
begin
  Result := SendMessage(Handle, LB_GETITEMDATA, Index, 0);
end;

procedure TMyCustomListBox.SetItemData(Index: Integer; AData: LongInt);
begin
  SendMessage(Handle, LB_SETITEMDATA, Index, AData);
end;

function TMyCustomListBox.InternalGetItemData(Index: Integer): LongInt;
begin
  Result := GetItemData(Index);
end;

procedure TMyCustomListBox.InternalSetItemData(Index: Integer; AData: LongInt);
begin
  SetItemData(Index, AData);
end;

procedure TMyCustomListBox.DeleteString( Index: Integer );
begin
  SendMessage(Handle, LB_DELETESTRING, Index, 0);
end;

procedure TMyCustomListBox.ResetContent;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then exit;
  SendMessage(Handle, LB_RESETCONTENT, 0, 0);
end;

procedure TMyCustomListBox.Clear;
begin
  FItems.Clear;
end;

procedure TMyCustomListBox.ClearSelection;
var
  I: Integer;
begin
  if MultiSelect then
    for I := 0 to Items.Count - 1 do
      Selected[I] := False
  else
    ItemIndex := -1;
end;

procedure TMyCustomListBox.CopySelection(Destination: TCustomListControl);
var
  I: Integer;
begin
  if MultiSelect then
  begin
    for I := 0 to Items.Count - 1 do
      if Selected[I] then
        Destination.AddItem(PChar(Items[I]), Items.Objects[I]);
  end
  else
    if ItemIndex <> -1 then
      Destination.AddItem(PChar(Items[ItemIndex]), Items.Objects[ItemIndex]);
end;

procedure TMyCustomListBox.DeleteSelected;
var
  I: Integer;
begin
  if MultiSelect then
  begin
    for I := Items.Count - 1 downto 0 do
      if Selected[I] then
        Items.Delete(I);
  end
  else
    if ItemIndex <> -1 then
      Items.Delete(ItemIndex);
end;

procedure TMyCustomListBox.SetColumnWidth;
var
  ColWidth: Integer;
begin
  if (FColumns > 0) and (Width > 0) then
  begin
    ColWidth := Trunc(ClientWidth / FColumns);
    if ColWidth < 1 then ColWidth := 1;
    SendMessage(Handle, LB_SETCOLUMNWIDTH, ColWidth, 0);
  end;
end;

procedure TMyCustomListBox.SetColumns(Value: Integer);
begin
  if FColumns <> Value then
    if (FColumns = 0) or (Value = 0) then
    begin
      FColumns := Value;
      RecreateWnd;
    end else
    begin
      FColumns := Value;
      if HandleAllocated then SetColumnWidth;
    end;
end;

function TMyCustomListBox.GetItemIndex: Integer;
begin
  if MultiSelect then
    Result := SendMessage(Handle, LB_GETCARETINDEX, 0, 0)
  else
    Result := SendMessage(Handle, LB_GETCURSEL, 0, 0);
end;

function TMyCustomListBox.GetCount: Integer;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
    Result := FCount
  else
    Result := Items.Count;
end;

function TMyCustomListBox.GetSelCount: Integer;
begin
  Result := SendMessage(Handle, LB_GETSELCOUNT, 0, 0);
end;

procedure TMyCustomListBox.SetItemIndex(const Value: Integer);
begin
  if GetItemIndex <> Value then
    if MultiSelect then SendMessage(Handle, LB_SETCARETINDEX, Value, 0)
    else SendMessage(Handle, LB_SETCURSEL, Value, 0);
end;

procedure TMyCustomListBox.SetExtendedSelect(Value: Boolean);
begin
  if Value <> FExtendedSelect then
  begin
    FExtendedSelect := Value;
    RecreateWnd;
  end;
end;

procedure TMyCustomListBox.SetIntegralHeight(Value: Boolean);
begin
  if Value <> FIntegralHeight then
  begin
    FIntegralHeight := Value;
    RecreateWnd;
    RequestAlign;
  end;
end;

function TMyCustomListBox.GetItemHeight: Integer;
var
  R: TRect;
begin
  Result := FItemHeight;
  if HandleAllocated and (FStyle = lbStandard) then
  begin
    Perform(LB_GETITEMRECT, 0, Longint(@R));
    Result := R.Bottom - R.Top;
  end;
end;

procedure TMyCustomListBox.SetItemHeight(Value: Integer);
begin
  if (FItemHeight <> Value) and (Value > 0) then
  begin
    FItemHeight := Value;
    RecreateWnd;
  end;
end;

procedure TMyCustomListBox.SetTabWidth(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if FTabWidth <> Value then
  begin
    FTabWidth := Value;
    RecreateWnd;
  end;
end;

procedure TMyCustomListBox.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    RecreateWnd;
  end;
end;

function TMyCustomListBox.GetSelected(Index: Integer): Boolean;
var
  R: Longint;
begin
  R := SendMessage(Handle, LB_GETSEL, Index, 0);
  if R = LB_ERR then
    raise EListError.CreateResFmt(@SListIndexError, [Index]);
  Result := LongBool(R);
end;

procedure TMyCustomListBox.SetSelected(Index: Integer; Value: Boolean);
begin
  if FMultiSelect then
  begin
    if SendMessage(Handle, LB_SETSEL, Longint(Value), Index) = LB_ERR then
      raise EListError.CreateResFmt(@SListIndexError, [Index]);
  end
  else
    if Value then
    begin
      if SendMessage(Handle, LB_SETCURSEL, Index, 0) = LB_ERR then
        raise EListError.CreateResFmt(@SListIndexError, [Index])
    end
    else
      SendMessage(Handle, LB_SETCURSEL, -1, 0);
end;

procedure TMyCustomListBox.SetSorted(Value: Boolean);
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then exit;
  if FSorted <> Value then
  begin
    FSorted := Value;
    RecreateWnd;
  end;
end;

procedure TMyCustomListBox.SetStyle(Value: TListBoxStyle);
begin
  if FStyle <> Value then
  begin
    if Value in [lbVirtual, lbVirtualOwnerDraw] then
    begin
      Items.Clear;
      Sorted := False;
    end;
    FStyle := Value;
    RecreateWnd;
  end;
end;

function TMyCustomListBox.GetTopIndex: Integer;
begin
  Result := SendMessage(Handle, LB_GETTOPINDEX, 0, 0);
end;

procedure TMyCustomListBox.LBGetText(var Message: TMessage);
var
  S: string;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
  begin
    if Assigned(FOnData) and (Message.WParam > -1) and (Message.WParam < Count) then
    begin
      S := '';
      OnData(Self, Message.wParam, S);
      StrCopy(PChar(Message.lParam), PChar(S));
      Message.Result := Length(S);
    end
    else
      Message.Result := LB_ERR;
  end
  else
    inherited;
end;

procedure TMyCustomListBox.LBGetTextLen(var Message: TMessage);
var
  S: string;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
  begin
    if Assigned(FOnData) and (Message.WParam > -1) and (Message.WParam < Count) then
    begin
      S := '';
      OnData(Self, Message.wParam, S);
      Message.Result := Length(S);
    end
    else
      Message.Result := LB_ERR;
  end
  else
    inherited;
end;

procedure TMyCustomListBox.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TMyCustomListBox.SetTopIndex(Value: Integer);
begin
  if GetTopIndex <> Value then
    SendMessage(Handle, LB_SETTOPINDEX, Value, 0);
end;

procedure TMyCustomListBox.SetItems(Value: TStrings);
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
    case Style of
      lbVirtual: Style := lbStandard;
      lbVirtualOwnerDraw: Style := lbOwnerDrawFixed;
    end;
  Items.Assign(Value);
end;

function TMyCustomListBox.ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
var
  Count: Integer;
  ItemRect: TRect;
begin
  if PtInRect(ClientRect, Pos) then
  begin
    Result := TopIndex;
    Count := Items.Count;
    while Result < Count do
    begin
      Perform(LB_GETITEMRECT, Result, Longint(@ItemRect));
      if PtInRect(ItemRect, Pos) then Exit;
      Inc(Result);
    end;
    if not Existing then Exit;
  end;
  Result := -1;
end;

function TMyCustomListBox.ItemRect(Index: Integer): TRect;
var
  Count: Integer;
begin
  Count := Items.Count;
  if (Index = 0) or (Index < Count) then
    Perform(LB_GETITEMRECT, Index, Longint(@Result))
  else if Index = Count then
  begin
    Perform(LB_GETITEMRECT, Index - 1, Longint(@Result));
    OffsetRect(Result, 0, Result.Bottom - Result.Top);
  end else FillChar(Result, SizeOf(Result), 0);
end;

procedure TMyCustomListBox.CreateParams(var Params: TCreateParams);
type
  PSelects = ^TSelects;
  TSelects = array[Boolean] of DWORD;
const
  Styles: array[TListBoxStyle] of DWORD =
    (0, LBS_OWNERDRAWFIXED, LBS_OWNERDRAWVARIABLE, LBS_OWNERDRAWFIXED,
     LBS_OWNERDRAWFIXED);
  Sorteds: array[Boolean] of DWORD = (0, LBS_SORT);
  MultiSelects: array[Boolean] of DWORD = (0, LBS_MULTIPLESEL);
  ExtendSelects: array[Boolean] of DWORD = (0, LBS_EXTENDEDSEL);
  IntegralHeights: array[Boolean] of DWORD = (LBS_NOINTEGRALHEIGHT, 0);
  MultiColumns: array[Boolean] of DWORD = (0, LBS_MULTICOLUMN);
  TabStops: array[Boolean] of DWORD = (0, LBS_USETABSTOPS);
  CSHREDRAW: array[Boolean] of DWORD = (CS_HREDRAW, 0);
  Data: array[Boolean] of DWORD = (LBS_HASSTRINGS, LBS_NODATA);
var
  Selects: PSelects;
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'LISTBOX');
  with Params do
  begin
    Selects := @MultiSelects;
    //if FExtendedSelect then Selects := @ExtendSelects;
    //Style := Style or (WS_HSCROLL or WS_VSCROLL or
    ////  Data[Self.Style in [lbVirtual, lbVirtualOwnerDraw]] or
    //  LBS_NOTIFY) or Styles[FStyle] or Sorteds[FSorted] or
   //   Selects^[FMultiSelect] or IntegralHeights[FIntegralHeight] or
   //   MultiColumns[FColumns <> 0] or BorderStyles[FBorderStyle] or
   //   TabStops[FTabWidth <> 0];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
    WindowClass.style := WindowClass.style and not (CSHREDRAW[UseRightToLeftAlignment] or CS_VREDRAW);
  end;
end;

procedure TMyCustomListBox.CreateWnd;
var
  W, H: Integer;
begin
  W := Width;
  H := Height;
  inherited CreateWnd;
  SetWindowPos(Handle, 0, Left, Top, W, H, SWP_NOZORDER or SWP_NOACTIVATE);
  if FTabWidth <> 0 then
    SendMessage(Handle, LB_SETTABSTOPS, 1, Longint(@FTabWidth));
  SetColumnWidth;
  if (FOldCount <> -1) or Assigned(FSaveItems) then
  begin
    if (Style in [lbVirtual, lbVirtualOwnerDraw]) then
      Count := FOldCount;
    if FSaveItems <> nil then
    begin
      FItems.Assign(FSaveItems);
      FreeAndNil(FSaveItems);
    end;
    SetTopIndex(FSaveTopIndex);
    SetItemIndex(FSaveItemIndex);
    FOldCount := -1;
  end;
end;

procedure TMyCustomListBox.DestroyWnd;
begin
  if (FItems.Count > 0) then
  begin
    if (Style in [lbVirtual, lbVirtualOwnerDraw]) then
      FOldCount := FItems.Count
    else
    begin
      FSaveItems := TStringList.Create;
      FSaveItems.Assign(FItems);
    end;
    FSaveTopIndex := GetTopIndex;
    FSaveItemIndex := GetItemIndex;
  end;
  inherited DestroyWnd;
end;

procedure TMyCustomListBox.WndProc(var Message: TMessage);
begin
  {for auto drag mode, let listbox handle itself, instead of TControl}
  if not (csDesigning in ComponentState) and ((Message.Msg = WM_LBUTTONDOWN) or
    (Message.Msg = WM_LBUTTONDBLCLK)) and not Dragging then
  begin
    if DragMode = dmAutomatic then
    begin
      if IsControlMouseMsg(TWMMouse(Message)) then
        Exit;
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);  {overrides TControl's BeginDrag}
      Exit;
    end;
  end;
  inherited WndProc(Message);
end;

procedure TMyCustomListBox.WMLButtonDown(var Message: TWMLButtonDown);
var
  ItemNo : Integer;
  ShiftState: TShiftState;
begin
  ShiftState := KeysToShiftState(Message.Keys);
  if (DragMode = dmAutomatic) and FMultiSelect then
  begin
    if not (ssShift in ShiftState) or (ssCtrl in ShiftState) then
    begin
      ItemNo := ItemAtPos(SmallPointToPoint(Message.Pos), True);
      if (ItemNo >= 0) and (Selected[ItemNo]) then
      begin
        BeginDrag (False);
        Exit;
      end;
    end;
  end;
  inherited;
  if (DragMode = dmAutomatic) and not (FMultiSelect and
    ((ssCtrl in ShiftState) or (ssShift in ShiftState))) then
    BeginDrag(False);
end;

procedure TMyCustomListBox.CNCommand(var Message: TWMCommand);
begin
  case Message.NotifyCode of
    LBN_SELCHANGE:
      begin
        inherited Changed;
        Click;
      end;
    LBN_DBLCLK: DblClick;
  end;
end;

procedure TMyCustomListBox.WMPaint(var Message: TWMPaint);

  procedure PaintListBox;
  var
    DrawItemMsg: TWMDrawItem;
    MeasureItemMsg: TWMMeasureItem;
    DrawItemStruct: TDrawItemStruct;
    MeasureItemStruct: TMeasureItemStruct;
    R: TRect;
    Y, I, H, W: Integer;
  begin
    { Initialize drawing records }
    DrawItemMsg.Msg := CN_DRAWITEM;
    DrawItemMsg.DrawItemStruct := @DrawItemStruct;
    DrawItemMsg.Ctl := Handle;
    DrawItemStruct.CtlType := ODT_LISTBOX;
    DrawItemStruct.itemAction := ODA_DRAWENTIRE;
    DrawItemStruct.itemState := 0;
    DrawItemStruct.hDC := Message.DC;
    DrawItemStruct.CtlID := Handle;
    DrawItemStruct.hwndItem := Handle;

    { Intialize measure records }
    MeasureItemMsg.Msg := CN_MEASUREITEM;
    MeasureItemMsg.IDCtl := Handle;
    MeasureItemMsg.MeasureItemStruct := @MeasureItemStruct;
    MeasureItemStruct.CtlType := ODT_LISTBOX;
    MeasureItemStruct.CtlID := Handle;

    { Draw the listbox }
    Y := 0;
    I := TopIndex;
    GetClipBox(Message.DC, R);
    H := Height;
    W := Width;
    while Y < H do
    begin
      MeasureItemStruct.itemID := I;
      if I < Items.Count then
        MeasureItemStruct.itemData := Longint(Pointer(Items.Objects[I]));
      MeasureItemStruct.itemWidth := W;
      MeasureItemStruct.itemHeight := FItemHeight;
      DrawItemStruct.itemData := MeasureItemStruct.itemData;
      DrawItemStruct.itemID := I;
      Dispatch(MeasureItemMsg);
      DrawItemStruct.rcItem := Rect(0, Y, MeasureItemStruct.itemWidth,
        Y + Integer(MeasureItemStruct.itemHeight));
      Dispatch(DrawItemMsg);
      Inc(Y, MeasureItemStruct.itemHeight);
      Inc(I);
      if I >= Items.Count then break;
    end;
  end;

begin
  if Message.DC <> 0 then
    { Listboxes don't allow paint "sub-classing" like the other windows controls
      so we have to do it ourselves. }
    PaintListBox
  else inherited;
end;

procedure TMyCustomListBox.WMSize(var Message: TWMSize);
begin
  inherited;
  SetColumnWidth;
end;

procedure TMyCustomListBox.DragCanceled;
var
  M: TWMMouse;
  MousePos: TPoint;
begin
  with M do
  begin
    Msg := WM_LBUTTONDOWN;
    GetCursorPos(MousePos);
    Pos := PointToSmallPoint(ScreenToClient(MousePos));
    Keys := 0;
    Result := 0;
  end;
  DefaultHandler(M);
  M.Msg := WM_LBUTTONUP;
  DefaultHandler(M);
end;

procedure TMyCustomListBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  Flags: Longint;
  Data: String;
begin
  if Assigned(FOnDrawItem) then FOnDrawItem(Self, Index, Rect, State) else
  begin
    FCanvas.FillRect(Rect);
    if Index < Count then
    begin
      Flags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
      if not UseRightToLeftAlignment then
        Inc(Rect.Left, 2)
      else
        Dec(Rect.Right, 2);
      Data := '';
      if (Style in [lbVirtual, lbVirtualOwnerDraw]) then
        Data := DoGetData(Index)
      else
        Data := Items[Index];
      DrawText(FCanvas.Handle, PChar(Data), Length(Data), Rect, Flags);
    end;
  end;
end;

procedure TMyCustomListBox.MeasureItem(Index: Integer; var Height: Integer);
begin
  if Assigned(FOnMeasureItem) then FOnMeasureItem(Self, Index, Height)
end;

procedure TMyCustomListBox.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
begin
  with Message.DrawItemStruct^ do
  begin
    State := TOwnerDrawState(LongRec(itemState).Lo);
    FCanvas.Handle := hDC;
    FCanvas.Font := Font;
    FCanvas.Brush := Brush;
    if (Integer(itemID) >= 0) and (odSelected in State) then
    begin
      FCanvas.Brush.Color := clHighlight;
      FCanvas.Font.Color := clHighlightText
    end;
    if Integer(itemID) >= 0 then
      DrawItem(itemID, rcItem, State) else
      FCanvas.FillRect(rcItem);
    if odFocused in State then DrawFocusRect(hDC, rcItem);
    FCanvas.Handle := 0;
  end;
end;

procedure TMyCustomListBox.CNMeasureItem(var Message: TWMMeasureItem);
begin
  with Message.MeasureItemStruct^ do
  begin
    itemHeight := FItemHeight;
    if FStyle = lbOwnerDrawVariable then
      MeasureItem(itemID, Integer(itemHeight));
  end;
end;

procedure TMyCustomListBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then RecreateWnd;
  inherited;
end;

procedure TMyCustomListBox.SelectAll;
var
  I: Integer;
begin
  if FMultiSelect then
    for I := 0 to Items.Count - 1 do
      Selected[I] := True;
end;

procedure TMyCustomListBox.KeyPress(var Key: Char);

  procedure FindString;
  var
    Idx: Integer;
  begin
    if Style in [lbVirtual, lbVirtualOwnerDraw] then
      Idx := DoFindData(FFilter)
    else
      Idx := SendMessage(Handle, LB_FINDSTRING, -1, LongInt(PChar(FFilter)));
    if Idx <> LB_ERR then
    begin
      if MultiSelect then
      begin
        ClearSelection;
        SendMessage(Handle, LB_SELITEMRANGE, 1, MakeLParam(Idx, Idx))
      end;
      ItemIndex := Idx;
      Click;
    end;
    if not (Ord(Key) in [VK_RETURN, VK_BACK, VK_ESCAPE]) then
      Key := #0;  // Clear so that the listbox's default search mechanism is disabled
  end;

var
  Msg: TMsg;
begin
  inherited KeyPress(Key);
  if not FAutoComplete then exit;
  if GetTickCount - FLastTime >= 500 then
    FFilter := '';
  FLastTime := GetTickCount;

  if Ord(Key) <> VK_BACK then
  begin
    if Key in LeadBytes then
    begin
      if PeekMessage(Msg, Handle, WM_CHAR, WM_CHAR, PM_REMOVE) then
      begin
        FFilter := FFilter + Key + Chr(Msg.wParam);
        Key := #0;
      end;
    end
    else
      FFilter := FFilter + Key;
  end
  else
  begin
    while ByteType(FFilter, Length(FFilter)) = mbTrailByte do
      Delete(FFilter, Length(FFilter), 1);
    Delete(FFilter, Length(FFilter), 1);
  end;

  if Length(FFilter) > 0 then
    FindString
  else
  begin
    ItemIndex := 0;
    Click;
  end;
end;

procedure TMyCustomListBox.SetCount(const Value: Integer);
var
  Error: Integer;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
  begin
    // Limited to 32767 on Win95/98 as per Win32 SDK
    Error := SendMessage(Handle, LB_SETCOUNT, Value, 0);
    if (Error <> LB_ERR) and (Error <> LB_ERRSPACE) then
      FCount := Value
    else
      raise Exception.CreateFmt(SErrorSettingCount, [Name]);
  end
  else
    raise Exception.CreateFmt(SListBoxMustBeVirtual, [Name]);
end;

function TMyCustomListBox.DoGetData(const Index: Integer): String;
begin
  if Assigned(FOnData) then FOnData(Self, Index, Result);
end;

function TMyCustomListBox.DoGetDataObject(const Index: Integer): TObject;
begin
  if Assigned(FOnDataObject) then FOnDataObject(Self, Index, Result);
end;

function TMyCustomListBox.DoFindData(const Data: String): Integer;
begin
  if Assigned(FOnDataFind) then
    Result := FOnDataFind(Self, Data)
  else
    Result := -1;
end;

end.
