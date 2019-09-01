////////////////////////////////////////////////////////////////////////////////
//
//
//  FileName    :   SUIMainMenu.pas
//  Creator     :   Shen Min
//  Date        :   2002-05-26 V1-V3
//                  2003-06-15 V4
//  Comment     :
//
//  Copyright (c) 2002-2003 Sunisoft
//  http://www.sunisoft.com
//  Email: support@sunisoft.com
//
////////////////////////////////////////////////////////////////////////////////

unit SUIMainMenu;

interface

{$I SUIPack.inc}

uses Windows, Classes, Menus, Forms, Graphics, ImgList, Controls, ComCtrls,
     SUIForm, SUIThemes, SUIMgr;

type
    TsuiMainMenu = class(TMainMenu)
    private
        m_Images : TCustomImageList;
        m_UIStyle : TsuiUIStyle;
        m_Height : Integer;
        m_SeparatorHeight : Integer;
        m_BarColor : TColor;
        m_BarWidth : Integer;
        m_Color : TColor;
        m_SeparatorColor : TColor;
        m_SelectedBorderColor : TColor;
        m_SelectedColor : TColor;
        m_SelectedFontColor : TColor;
        m_FontColor : TColor;
        m_BorderColor : TColor;
        m_FlatMenu : Boolean;
        m_FontName : TFontName;
        m_FontSize : Integer;
        m_FontCharset : TFontCharset;
        m_UseSystemFont : Boolean;
        m_Form: TsuiForm;
        m_FileTheme : TsuiFileTheme;

        function GetImages() : TCustomImageList;
        procedure SetImages(const Value : TCustomImageList);
        function GetOwnerDraw() : Boolean;
        procedure SetOwnerDraw(const Value : Boolean);

        procedure DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
        procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);

        procedure SetUIStyle(const Value: TsuiUIStyle);
        procedure SetHeight(const Value: Integer);
        procedure SetSeparatorHeight(const Value: Integer);
        procedure SetUseSystemFont(const Value: Boolean);
        procedure SetFileTheme(const Value: TsuiFileTheme);

    protected
        procedure MenuChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean); override;
        procedure Loaded; override;
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;        

    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy(); override;

        procedure AfterConstruction(); override;
        procedure MenuAdded();

        property Form : TsuiForm read m_Form write m_Form;        

    published
        property Images read GetImages write SetImages;
        property OwnerDraw read GetOwnerDraw write SetOwnerDraw;
        property FileTheme : TsuiFileTheme read m_FileTheme write SetFileTheme;
        property UIStyle : TsuiUIStyle read m_UIStyle write SetUIStyle;
        property MenuItemHeight : Integer read m_Height write SetHeight;
        property SeparatorHeight : Integer read m_SeparatorHeight write SetSeparatorHeight;
        property BarWidth : Integer read m_BarWidth write m_BarWidth;
        property BarColor : TColor read m_BarColor write m_BarColor;
        property Color : TColor read m_Color write m_Color;
        property SeparatorColor : TColor read m_SeparatorColor write m_SeparatorColor;
        property SelectedBorderColor : TColor read m_SelectedBorderColor write m_SelectedBorderColor;
        property SelectedColor : TColor read m_SelectedColor write m_SelectedColor;
        property SelectedFontColor : TColor read m_SelectedFontColor write m_SelectedFontColor;
        property FontColor : TColor read m_FontColor write m_FontColor;
        property BorderColor : TColor read m_BorderColor write m_BorderColor;
        property FlatMenu : Boolean read m_FlatMenu write m_FlatMenu;
        property FontName : TFontName read m_FontName write m_FontName;
        property FontSize : Integer read m_FontSize write m_FontSize;
        property FontCharset : TFontCharset read m_FontCharset write m_FontCharset;

        property UseSystemFont : Boolean read m_UseSystemFont write SetUseSystemFont;
    end;


implementation

uses SUIResDef, SUIPublic, SUIMenu;


{ TsuiMainMenu }

procedure TsuiMainMenu.AfterConstruction;
var
    i : Integer;
begin
    inherited;

    if not (Owner is TCustomForm) then
        Exit;
    (Owner as TCustomForm).Menu := nil;

    for i := 0 to TCustomForm(Owner).ControlCount - 1 do
    begin
        if (TCustomForm(Owner).Controls[i] is TsuiForm) then
        begin
            TsuiForm(TCustomForm(Owner).Controls[i]).Menu := self;
            Exit;
        end;
    end;
end;

constructor TsuiMainMenu.Create(AOwner: TComponent);
var
    Bmp : TBitmap;
begin
    inherited;

    m_Images := TImageList.Create(self);
    Bmp := TBitmap.Create();
    Bmp.LoadFromResourceName(
        hInstance,
        'MENU_CHECKED'
    );
    Bmp.Transparent := True;
    m_Images.AddMasked(Bmp, clWhite);
    Bmp.Free();
    inherited Images := m_Images;

    m_Height := 21;
    m_SeparatorHeight := 21;
    m_BarColor := clBtnFace;
    m_BarWidth := 0;
    m_Color := clWhite;
    m_SeparatorColor := clGray;
    m_SelectedBorderColor := clHighlight;
    m_SelectedColor := clHighlight;
    m_SelectedFontColor := clWhite;
    m_FontColor := clWhite;
    m_BorderColor := clBlack;
    m_FlatMenu := false;
    m_FontName := 'MS Sans Serif';
    m_FontSize := 8;
    m_FontCharset := DEFAULT_CHARSET;
    m_UseSystemFont := true;

    UIStyle := GetSUIFormStyle(AOwner);
end;

destructor TsuiMainMenu.Destroy;
begin
    m_Images.Free();
    m_Images := nil;

    inherited;
end;

procedure TsuiMainMenu.DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
    OutUIStyle : TsuiUIStyle;
    R : TRect;
    Cap : String;
    ShortKey : String;
    nCharLength : Integer;
    nCharStart : Integer;
    Item : TMenuItem;
    HandleOfMenuWindow : HWND;    
begin
    Item := Sender as TMenuItem;

    if m_FlatMenu then
    begin
        HandleOfMenuWindow := WindowFromDC(ACanvas.Handle);
        if HandleOfMenuWindow <> 0 then
        begin
            if UsingFileTheme(m_FileTheme, m_UIStyle, OutUIStyle) then
                Menu_DrawWindowBorder(
                    HandleOfMenuWindow,
                    clBlack,
                    m_FileTheme.GetColor(SUI_THEME_FORM_BACKGROUND_COLOR)
                )
            else
                Menu_DrawWindowBorder(
                    HandleOfMenuWindow,
                    clBlack,
                    GetInsideThemeColor(OutUIStyle, SUI_THEME_FORM_BACKGROUND_COLOR)
                )
        end;
    end;

    // draw line
    if Item.Caption = '-' then
    begin
{$IFDEF RES_MACOS}
        if m_UIStyle = MacOS then
            Menu_DrawMacOSLineItem(ACanvas, ARect)
        else
{$ENDIF}        
        begin
            // draw Left bar
            if m_BarWidth > 0 then
            begin
                R := Rect(ARect.Left, ARect.Top, ARect.Left + m_BarWidth, ARect.Bottom);
                Menu_DrawBackGround(ACanvas, R, m_BarColor);
            end;

            // draw right non-bar
            R := Rect(ARect.Left + m_BarWidth, ARect.Top, ARect.Right, ARect.Bottom);
            Menu_DrawBackGround(ACanvas, R, m_Color);

            // draw line
            Menu_DrawLineItem(ACanvas, ARect, m_SeparatorColor, m_BarWidth);
        end;

        Exit;
    end; // draw line

    // draw background
    if Selected and Item.Enabled then
    begin
{$IFDEF RES_MACOS}
        if m_UIStyle = MacOS then
            Menu_DrawMacOSSelectedItem(ACanvas, ARect)
        else
{$ENDIF}        
        begin
            Menu_DrawBackGround(ACanvas, ARect, m_SelectedColor);
            Menu_DrawBorder(ACanvas, ARect, m_SelectedBorderColor);
        end;
    end
    else
    begin
{$IFDEF RES_MACOS}
        if m_UIStyle = MacOS then
            Menu_DrawMacOSNonSelectedItem(ACanvas, ARect)
        else
{$ENDIF}
        begin
            // draw left bar
            if m_BarWidth > 0 then
            begin
                R := Rect(ARect.Left, ARect.Top, ARect.Left + m_BarWidth, ARect.Bottom);
                Menu_DrawBackGround(ACanvas, R, m_BarColor);
            end;

            R := Rect(ARect.Left + m_BarWidth, ARect.Top, ARect.Right, ARect.Bottom);
            Menu_DrawBackGround(ACanvas, R, m_Color);
        end
    end;

    // draw caption and shortkey
    Cap := Item.Caption;
    if m_UseSystemFont then
        Menu_GetSystemFont(ACanvas.Font)
    else
    begin
        ACanvas.Font.Name := m_FontName;
        ACanvas.Font.Size := m_FontSize;
        ACanvas.Font.Charset := m_FontCharset;
    end;
    ACanvas.Brush.Style := bsClear;

    if Item.Enabled then
    begin
        if Selected then
            ACanvas.Font.Color := m_SelectedFontColor
        else
            ACanvas.Font.Color := m_FontColor;
    end
    else
        ACanvas.Font.Color := clGray;

    if Item.Default then
        ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];

    R := Rect(ARect.Left + m_BarWidth + 4, ARect.Top + 4, ARect.Right, ARect.Bottom);
{$WARNINGS OFF}
    DrawText(ACanvas.Handle, PChar(Cap), -1, R, DT_LEFT or DT_TOP or DT_SINGLELINE);
{$WARNINGS ON}

    ShortKey := ShortCutToText(Item.ShortCut);
    nCharLength := ACanvas.TextWidth(ShortKey);
    nCharStart := ARect.Right - nCharLength - 16;
    ACanvas.TextOut(nCharStart, ARect.Top + 4, ShortKey);

    // draw checked
    if Item.Checked then
    begin
        if (
            (Item.ImageIndex = -1) or
            (Images = nil) or
            (Item.ImageIndex >= Images.Count)
        ) then
            m_Images.Draw(ACanvas, ARect.Left + 4, ARect.Top + 3, 0, Item.Enabled)
        else
        begin
            ACanvas.Brush.Color := clBlack;
            ACanvas.FrameRect(Rect(ARect.Left + 2, ARect.Top + 1, ARect.Left + 21, ARect.Top + 20));
            ACanvas.Brush.Color := m_SelectedColor;
            ACanvas.FillRect(Rect(ARect.Left + 3, ARect.Top + 2, ARect.Left + 20, ARect.Top + 19));
        end;
    end;

    // draw images
    if (Item.ImageIndex <> -1) and (Images <> nil) then
        if Item.ImageIndex < Images.Count then
            Images.Draw(ACanvas, ARect.Left + 4, ARect.Top + 3, Item.ImageIndex, Item.Enabled);
end;

function TsuiMainMenu.GetImages: TCustomImageList;
begin
    if inherited Images = m_Images then
        Result := nil
    else
        Result := inherited Images;
end;

function TsuiMainMenu.GetOwnerDraw: Boolean;
begin
    Result := true;
end;

procedure TsuiMainMenu.Loaded;
begin
    inherited;

    MenuAdded();
end;

procedure TsuiMainMenu.MeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
var
    Item : TMenuItem;
begin
    Item := Sender as TMenuItem;

    if Item.Caption = '-' then
        Height := m_SeparatorHeight
    else
        Height := m_Height;

    Width := ACanvas.TextWidth(Item.Caption) + ACanvas.TextWidth(ShortCutToText(Item.ShortCut)) + m_BarWidth + 40;
end;

procedure TsuiMainMenu.MenuAdded;
var
    i : Integer;
begin
    for i := 0 to Items.Count - 1 do
        Menu_SetItemEvent(Items[i], DrawItem, MeasureItem);
    if m_Form <> nil then
        m_Form.UpdateMenu();
end;

procedure TsuiMainMenu.MenuChanged(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
    inherited;

    if not (Owner is TCustomForm) then
        Exit;

    if m_Form <> nil then
        m_Form.UpdateTopMenu();

    if (
        (csLoading in ComponentState) or
        (not (csDesigning in ComponentState))
    ) then
        Exit;

    if m_Form <> nil then
        m_Form.UpdateMenu();
end;

procedure TsuiMainMenu.Notification(AComponent: TComponent;
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

    if (
        (Operation = opInsert) and
        (AComponent is TMenuItem)
    ) then
    begin
        Menu_SetItemEvent(AComponent as TMenuItem, DrawItem, MeasureItem);
    end;
end;

procedure TsuiMainMenu.SetFileTheme(const Value: TsuiFileTheme);
begin
    m_FileTheme := Value;
    SetUIStyle(m_UIStyle);
end;

procedure TsuiMainMenu.SetHeight(const Value: Integer);
begin
    if {$IFDEF RES_MACOS}m_UIStyle <> MacOS {$ELSE} True {$ENDIF} then
        m_Height := Value;
end;

procedure TsuiMainMenu.SetImages(const Value: TCustomImageList);
begin
    if Value = nil then
        inherited Images := m_Images
    else
        inherited Images := Value;
end;

procedure TsuiMainMenu.SetOwnerDraw(const Value: Boolean);
begin
    // Do nothing
end;

procedure TsuiMainMenu.SetSeparatorHeight(const Value: Integer);
begin
    if {$IFDEF RES_MACOS}m_UIStyle <> MacOS {$ELSE} True {$ENDIF} then
        m_SeparatorHeight := Value;
end;

procedure TsuiMainMenu.SetUIStyle(const Value: TsuiUIStyle);
var
    OutUIStyle : TsuiUIStyle;
begin
    m_UIStyle := Value;

    m_BarWidth := 26;
{$IFDEF RES_MACOS}
    if m_UIStyle = MacOS then
    begin
        m_Height := 20;
        m_SeparatorHeight := 12;
        m_SeparatorColor := 0;
    end
    else
{$ENDIF}
    begin
        m_Height := 21;
        m_SeparatorHeight := 5;
        m_SeparatorColor := $00848284;
    end;

    if UsingFileTheme(m_FileTheme, m_UIStyle, OutUIStyle) then
    begin
        m_BarColor            := m_FileTheme.GetColor(SUI_THEME_MENU_LEFTBAR_COLOR);
        m_Color               := m_FileTheme.GetColor(SUI_THEME_MENU_BACKGROUND_COLOR);
        m_FontColor           := m_FileTheme.GetColor(SUI_THEME_MENU_FONT_COLOR);
        m_SelectedBorderColor := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_BORDER_COLOR);
        m_SelectedColor       := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        m_SelectedFontColor   := m_FileTheme.GetColor(SUI_THEME_MENU_SELECTED_FONT_COLOR);
    end
    else
    begin
        m_BarColor            := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_LEFTBAR_COLOR);
        m_Color               := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_BACKGROUND_COLOR);
        m_FontColor           := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_FONT_COLOR);
        m_SelectedBorderColor := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_BORDER_COLOR);
        m_SelectedColor       := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_BACKGROUND_COLOR);
        m_SelectedFontColor   := GetInsideThemeColor(OutUIStyle, SUI_THEME_MENU_SELECTED_FONT_COLOR);
    end;
end;

procedure TsuiMainMenu.SetUseSystemFont(const Value: Boolean);
begin
    m_UseSystemFont := Value;

    if m_Form <> nil then
        m_Form.RepaintMenuBar();
end;

end.
