////////////////////////////////////////////////////////////////////////////////
//
//
//  FileName    :   SUIGrid.pas
//  Creator     :   Shen Min
//  Date        :   2003-04-03 V1-V3
//                  3003-07-04 V4
//  Comment     :
//
//  Copyright (c) 2002-2003 Sunisoft
//  http://www.sunisoft.com
//  Email: support@sunisoft.com
//
////////////////////////////////////////////////////////////////////////////////

unit SUIGrid;

interface

{$I SUIPack.inc}

uses Windows, Messages, SysUtils, Classes, Controls, Grids, Graphics, Forms,
     SUIThemes, SUIScrollBar, SUIMgr;

type
{$IFDEF SUIPACK_D5}
    TsuiCustomDrawGrid = class(TDrawGrid)
{$ENDIF}
{$IFDEF SUIPACK_D6UP}
    TsuiCustomDrawGrid = class(TCustomDrawGrid)
{$ENDIF}
    private
        m_BorderColor : TColor;
        m_FocusedColor : TColor;
        m_SelectedColor : TColor;
        m_UIStyle : TsuiUIStyle;
        m_FileTheme : TsuiFileTheme;
        m_FixedFontColor: TColor;

        procedure SetBorderColor(const Value: TColor);
        procedure WMEARSEBKGND(var Msg : TMessage); message WM_ERASEBKGND;
        procedure SetUIStyle(const Value: TsuiUIStyle);
        procedure SetFocusedColor(const Value: TColor);
        procedure SetSelectedColor(const Value: TColor);
        procedure SetFixedFontColor(const Value: TColor);
        function GetCtl3D: Boolean;
        procedure SetFontColor(const Value: TColor);
        function GetFontColor: TColor;
        procedure SetFileTheme(const Value: TsuiFileTheme);

    protected
        procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
        procedure Paint(); override;
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
        constructor Create (AOwner: TComponent); override;

    published
        property FileTheme : TsuiFileTheme read m_FileTheme write SetFileTheme;
        property UIStyle : TsuiUIStyle read m_UIStyle write SetUIStyle;
        property Color;
        property FixedColor;
        property BorderColor : TColor read m_BorderColor write SetBorderColor;
        property FocusedColor : TColor read m_FocusedColor write SetFocusedColor;
        property SelectedColor : TColor read m_SelectedColor write SetSelectedColor;
        property FixedFontColor : TColor read m_FixedFontColor write SetFixedFontColor;
        property FontColor : TColor read GetFontColor write SetFontColor;
        property Ctl3D read GetCtl3D;

    end;

    TsuiDrawGrid = class(TsuiCustomDrawGrid)
    published
        property Align;
        property Anchors;
        property BiDiMode;
        property BorderStyle;
        property ColCount;
        property Constraints;
        property DefaultColWidth;
        property DefaultRowHeight;
        property DefaultDrawing;
        property DragCursor;
        property DragKind;
        property DragMode;
        property Enabled;
        property FixedCols;
        property RowCount;
        property FixedRows;
        property Font;
        property GridLineWidth;
        property Options;
        property ParentBiDiMode;
        property ParentColor;
        property ParentCtl3D;
        property ParentFont;
        property ParentShowHint;
        property PopupMenu;
        property ScrollBars;
        property ShowHint;
        property TabOrder;
        property Visible;
        property VisibleColCount;
        property VisibleRowCount;
        property OnClick;
        property OnColumnMoved;
        property OnContextPopup;
        property OnDblClick;
        property OnDragDrop;
        property OnDragOver;
        property OnDrawCell;
        property OnEndDock;
        property OnEndDrag;
        property OnEnter;
        property OnExit;
        property OnGetEditMask;
        property OnGetEditText;
        property OnKeyDown;
        property OnKeyPress;
        property OnKeyUp;
        property OnMouseDown;
        property OnMouseMove;
        property OnMouseUp;
        property OnMouseWheelDown;
        property OnMouseWheelUp;
        property OnRowMoved;
        property OnSelectCell;
        property OnSetEditText;
        property OnStartDock;
        property OnStartDrag;
        property OnTopLeftChanged;

    end;

    TsuiStringGrid = class(TStringGrid)
    private
        m_BorderColor : TColor;
        m_FocusedColor : TColor;
        m_SelectedColor : TColor;
        m_UIStyle : TsuiUIStyle;
        m_FixedFontColor: TColor;
        m_FileTheme : TsuiFileTheme;

        procedure SetBorderColor(const Value: TColor);
        procedure SetFocusedColor(const Value: TColor);
        procedure SetSelectedColor(const Value: TColor);
        procedure SetUIStyle(const Value: TsuiUIStyle);
        procedure SetFixedFontColor(const Value: TColor);
        function GetCtl3D: Boolean;
        procedure SetFontColor(const Value: TColor);
        function GetFontColor: TColor;
        procedure SetFileTheme(const Value: TsuiFileTheme);
        function GetBGColor: TColor;
        procedure SetBGColor(const Value: TColor);
        function GetFixedBGColor: TColor;
        procedure SetFixedBGColor(const Value: TColor);

        procedure WMEARSEBKGND(var Msg : TMessage); message WM_ERASEBKGND;
        
    protected
        procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
        procedure Paint(); override;
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
        constructor Create (AOwner: TComponent); override;

    published
        property FileTheme : TsuiFileTheme read m_FileTheme write SetFileTheme;
        property UIStyle : TsuiUIStyle read m_UIStyle write SetUIStyle;

        property BGColor : TColor read GetBGColor write SetBGColor;
        property BorderColor : TColor read m_BorderColor write SetBorderColor;
        property FocusedColor : TColor read m_FocusedColor write SetFocusedColor;
        property SelectedColor : TColor read m_SelectedColor write SetSelectedColor;
        property FixedFontColor : TColor read m_FixedFontColor write SetFixedFontColor;
        property FixedBGColor : TColor read GetFixedBGColor write SetFixedBGColor;
        property FontColor : TColor read GetFontColor write SetFontColor;
        property Ctl3D read GetCtl3D;

    end;


implementation

uses SUIPublic, SUIProgressBar;

{ TsuiCustomDrawGrid }

constructor TsuiCustomDrawGrid.Create(AOwner: TComponent);
begin
    inherited;

    ControlStyle := ControlStyle + [csOpaque];
    BorderStyle := bsNone;
    BorderWidth := 1;
    UIStyle := GetSUIFormStyle(AOwner);
    FocusedColor := clGreen;
    SelectedColor := clYellow;
    ParentCtl3D := false;
    inherited Ctl3D := false;
end;

procedure TsuiCustomDrawGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
    R : TRect;
begin
    if not DefaultDrawing then
    begin
        inherited;
        exit;
    end;

    R := ARect;

    try
        if gdFixed in AState then
            Exit;

        if gdSelected in AState then
        begin
            Canvas.Brush.Color := m_SelectedColor;
        end;

        if gdFocused in AState then
        begin
            Canvas.Brush.Color := m_FocusedColor;
        end;

        if AState = [] then
            Canvas.Brush.Color := Color;

        Canvas.FillRect(R);
    finally
        inherited;
    end;
end;

function TsuiCustomDrawGrid.GetCtl3D: Boolean;
begin
    Result := false;
end;

function TsuiCustomDrawGrid.GetFontColor: TColor;
begin
    Result := Font.Color;
end;

procedure TsuiCustomDrawGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
    inherited;

    if (
        (Operation = opRemove) and
        (AComponent = m_FileTheme)
    )then
    begin
        m_FileTheme := nil;
        SetUIStyle(SUI_THEME_DEFAULT);
    end;
end;

procedure TsuiCustomDrawGrid.Paint;
begin
    inherited;

    DrawControlBorder(self, m_BorderColor, Color);
end;

procedure TsuiCustomDrawGrid.SetBorderColor(const Value: TColor);
begin
    m_BorderColor := Value;
    Repaint();
end;

procedure TsuiCustomDrawGrid.SetFileTheme(const Value: TsuiFileTheme);
begin
    m_FileTheme := Value;
    SetUIStyle(m_UIStyle);
end;

procedure TsuiCustomDrawGrid.SetFixedFontColor(const Value: TColor);
begin
    m_FixedFontColor := Value;
    Repaint();
end;

procedure TsuiCustomDrawGrid.SetFocusedColor(const Value: TColor);
begin
    m_FocusedColor := Value;
    Repaint();
end;

procedure TsuiCustomDrawGrid.SetFontColor(const Value: TColor);
begin
    Font.Color := Value;
    Repaint();
end;

procedure TsuiCustomDrawGrid.SetSelectedColor(const Value: TColor);
begin
    m_SelectedColor := Value;
    Repaint();
end;

procedure TsuiCustomDrawGrid.SetUIStyle(const Value: TsuiUIStyle);
var
    OutUIStyle : TsuiUIStyle;
begin
    m_UIStyle := Value;
    if UsingFileTheme(m_FileTheme, m_UIStyle, OutUIStyle) then
    begin
        BorderColor := m_FileTheme.GetColor(SUI_THEME_CONTROL_BORDER_COLOR);
        FixedColor := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        Color := m_FileTheme.GetColor(SUI_THEME_CONTROL_BACKGROUND_COLOR);
        FixedFontColor := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_FONT_COLOR);
        Font.Color := m_FileTheme.GetColor(SUI_THEME_MENU_FONT_COLOR);
	if (Font.Color = clWhite) then
	    Font.Color := clBlack;
    end
    else
    begin
        BorderColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_CONTROL_BORDER_COLOR);
        FixedColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        Color := GetInsideThemeColor(OutUIStyle, SUI_THEME_CONTROL_BACKGROUND_COLOR);
        FixedFontColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_FONT_COLOR);
        Font.Color := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_FONT_COLOR);
	if (Font.Color = clWhite) then
	    Font.Color := clBlack;
    end;
end;

procedure TsuiCustomDrawGrid.WMEARSEBKGND(var Msg: TMessage);
begin
    Paint();
end;

{ TsuiStringGrid }

constructor TsuiStringGrid.Create(AOwner: TComponent);
begin
    inherited;

    ControlStyle := ControlStyle + [csOpaque];
    BorderStyle := bsNone;
    BorderWidth := 1;
    UIStyle := GetSUIFormStyle(AOwner);
    FocusedColor := clLime;
    SelectedColor := clYellow;
    ParentCtl3D := false;
    inherited Ctl3D := false;
end;

procedure TsuiStringGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
    R : TRect;
begin
    if not DefaultDrawing then
    begin
        inherited;
        exit;
    end;

    R := ARect;

    try
        if gdFixed in AState then
            Exit;

        if gdSelected in AState then
        begin
            Canvas.Brush.Color := m_SelectedColor;
        end;

        if gdFocused in AState then
        begin
            Canvas.Brush.Color := m_FocusedColor;
        end;

        if AState = [] then
            Canvas.Brush.Color := Color;

        Canvas.FillRect(R);

    finally

        if gdFixed in AState then
        begin
            Canvas.Font.Color := m_FixedFontColor;
            Canvas.TextRect(ARect, ARect.Left + 2, ARect.Top + 2, Cells[ACol, ARow]);
        end;

        inherited;
    end;
end;

function TsuiStringGrid.GetBGColor: TColor;
begin
    Result := Color;
end;

function TsuiStringGrid.GetCtl3D: Boolean;
begin
    Result := false;
end;

function TsuiStringGrid.GetFixedBGColor: TColor;
begin
    Result := FixedColor;
end;

function TsuiStringGrid.GetFontColor: TColor;
begin
    Result := Font.Color;
end;

procedure TsuiStringGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
    inherited;

    if (
        (Operation = opRemove) and
        (AComponent = m_FileTheme)
    )then
    begin
        m_FileTheme := nil;
        SetUIStyle(SUI_THEME_DEFAULT);
    end;
end;

procedure TsuiStringGrid.Paint;
begin
    inherited;

    DrawControlBorder(self, m_BorderColor, Color, false);
end;

procedure TsuiStringGrid.SetBGColor(const Value: TColor);
begin
    Color := Value;
end;

procedure TsuiStringGrid.SetBorderColor(const Value: TColor);
begin
    m_BorderColor := Value;
    Repaint();
end;

procedure TsuiStringGrid.SetFileTheme(const Value: TsuiFileTheme);
begin
    m_FileTheme := Value;
    SetUIStyle(m_UIStyle);
end;

procedure TsuiStringGrid.SetFixedBGColor(const Value: TColor);
begin
    FixedColor := Value;
end;

procedure TsuiStringGrid.SetFixedFontColor(const Value: TColor);
begin
    m_FixedFontColor := Value;
    Repaint();
end;

procedure TsuiStringGrid.SetFocusedColor(const Value: TColor);
begin
    m_FocusedColor := Value;
    Repaint();
end;

procedure TsuiStringGrid.SetFontColor(const Value: TColor);
begin
    Font.Color := Value;
    Repaint();
end;

procedure TsuiStringGrid.SetSelectedColor(const Value: TColor);
begin
    m_SelectedColor := Value;
    Repaint();
end;

procedure TsuiStringGrid.SetUIStyle(const Value: TsuiUIStyle);
var
    OutUIStyle : TsuiUIStyle;
begin
    m_UIStyle := Value;
    if UsingFileTheme(m_FileTheme, m_UIStyle, OutUIStyle) then
    begin
        BorderColor := m_FileTheme.GetColor(SUI_THEME_CONTROL_BORDER_COLOR);
        FixedColor := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        Color := m_FileTheme.GetColor(SUI_THEME_CONTROL_BACKGROUND_COLOR);
        FixedFontColor := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_FONT_COLOR);
        Font.Color := m_FileTheme.GetColor(SUI_THEME_MENU_FONT_COLOR);
	if (Font.Color = clWhite) then
	    Font.Color := clBlack;
    end
    else
    begin
        BorderColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_CONTROL_BORDER_COLOR);
        FixedColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        Color := GetInsideThemeColor(OutUIStyle, SUI_THEME_CONTROL_BACKGROUND_COLOR);
        FixedFontColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_FONT_COLOR);
        Font.Color := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_FONT_COLOR);
	if (Font.Color = clWhite) then
	    Font.Color := clBlack;
    end;
end;

procedure TsuiStringGrid.WMEARSEBKGND(var Msg: TMessage);
begin
    Paint();
end;

end.
