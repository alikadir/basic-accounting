{*******************************************************}
{                                                       }
{  TDCMinTray Component                                 }
{                                                       }
{  Copyright (c) 1997-2000 Dream Company                }
{  http://www.dream-com.com                             }
{  e-mail: contact@dream-com.com                        }
{                                                       }
{*******************************************************}
unit dcMinTray;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ShellApi, Menus;

type
  TDCRestoreMode=(rmClick,rmDblClick);
  TDCTrayMode=(tmOnMinimize,tmAlways);

  TDCMinTray = class(TComponent)
  private
    FHideWhenMinimized:Boolean;
    FHint:String;
    FIsSetHook:Boolean;
    FMinimized:Boolean;
    FPopupMenu:TPopupMenu;
    FRestoreMode:TDCRestoreMode;
    FStreamTrayMode:TDCTrayMode;
    FTrayData:TNotifyIconData;
    FTrayIconCreated:Boolean;
    FTrayMode:TDCTrayMode;
    FIcon : TIcon;
    Procedure AddTrayIcon;
    Function ApplicationHook(Var Message:TMessage):Boolean;
    Procedure HookMainForm;
    Procedure RemoveTrayIcon;
    Procedure SetHideWhenMinimized(Value:Boolean);
    Procedure SetHint(const Value:String);
    Procedure SetTrayMode(Value:TDCTrayMode);
    Procedure UnhookMainForm;
    Procedure SetIcon(Value : TIcon);
  protected
    Procedure Loaded;override;
    Procedure Notification(AComponent:TComponent;Operation:TOperation);override;
  public
    Constructor Create(AOwner:TComponent);override;
    Destructor Destroy;override;
    Procedure HideFromTaskBar;
    Procedure RestoreApplication;
    Procedure ShowInTaskBar;
  published
    Property HideWhenMinimized:Boolean read FHideWhenMinimized write SetHideWhenMinimized default True;
    Property Hint:String read FHint write SetHint;
    Property PopupMenu:TPopupMenu read FPopupMenu write FPopupMenu;
    Property RestoreMode:TDCRestoreMode read FRestoreMode write FRestoreMode default rmDblClick;
    Property TrayMode:TDCTrayMode read FTrayMode write SetTrayMode default tmOnMinimize;
    property TrayIcon : TIcon read FIcon write SetIcon;
  end;

procedure Register;

implementation

const
  TrayID=1;
  CM_TRAYICON=WM_USER+1;

Constructor TDCMinTray.Create(AOwner:TComponent);
Begin
  Inherited;
  FIcon := TIcon.Create;
  FHideWhenMinimized:=True;
  FRestoreMode:=rmDblClick;
End;

{---------------------------------------------------------}

Destructor TDCMinTray.Destroy;
Begin
  FIcon.Free;
  RemoveTrayIcon;
  UnhookMainForm;
  Inherited;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.SetIcon(Value : TIcon);
Begin
  FIcon.Assign(Value);
End;

{---------------------------------------------------------}

Procedure TDCMinTray.AddTrayIcon;
Var
  AHint:String;
Begin
  FTrayData.cbSize:=SizeOf(FTrayData);
  FTrayData.Wnd:=Application.Handle;
  FTrayData.uID:=TrayID;
  FTrayData.uFlags:=NIF_ICON Or NIF_MESSAGE Or NIF_TIP;
  FTrayData.uCallBackMessage:=CM_TRAYICON;
  If Not FIcon.Empty then
    FTrayData.hIcon := FIcon.Handle
  Else
  Begin
    FTrayData.hIcon:=Application.Icon.Handle;
    If FTrayData.hIcon=0 Then
      FTrayData.hIcon:=Application.Icon.Handle;
  End;
  AHint:=FHint;
  If AHint='' Then
    AHint:=Application.Title;
  StrLCopy(FTrayData.szTip,PChar(AHint),SizeOf(FTrayData.szTip)-1);
  Shell_NotifyIcon(NIM_ADD,@FTrayData);
  FTrayIconCreated:=True;
End;

{---------------------------------------------------------}

Function TDCMinTray.ApplicationHook(Var Message:TMessage):Boolean;
Var
  Pt:TPoint;
Begin
  Result:=False;
  Case Message.Msg Of
    WM_SIZE:
      Case Message.wParam Of
        SIZE_MINIMIZED:
        Begin
          If FHideWhenMinimized Then
            HideFromTaskBar;
          FMinimized:=True;
          If FTrayMode=tmOnMinimize Then
            AddTrayIcon;
        End;
      End;
    WM_SYSCOMMAND:
      Case Message.wParam Of
        SC_RESTORE:
          RestoreApplication;
      End;      
    WM_DESTROY:
    Begin
      RemoveTrayIcon;
      UnhookMainForm;
    End;
    CM_TRAYICON:
    Begin
      Case Message.lParam Of
        WM_RBUTTONUP:
          If FPopupMenu<>Nil Then
            Begin
              GetCursorPos(Pt);
              SetActiveWindow(TForm(Owner).Handle);
              FPopupMenu.Popup(Pt.X,Pt.Y);
            End;
        WM_LBUTTONUP:
          If FRestoreMode=rmClick Then
            RestoreApplication;
        WM_LBUTTONDBLCLK:
          If FRestoreMode=rmDblClick Then
            RestoreApplication;
      End;
    End;
  End;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.HideFromTaskBar;
Begin
  ShowWindow(Application.Handle,SW_HIDE);
End;

{---------------------------------------------------------}

Procedure TDCMinTray.HookMainForm;
Begin
  Application.HookMainWindow(ApplicationHook);
End;

{---------------------------------------------------------}

Procedure TDCMinTray.Loaded;
Begin
  Inherited;
  If Not (csDesigning In ComponentState) And (Owner Is TForm) And
     ((Application.MainForm=Nil) Or (Owner=Application.MainForm)) Then
  Begin
    HookMainForm;
    FIsSetHook:=True;
    SetTrayMode(FStreamTrayMode);
  End;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.Notification(AComponent:TComponent;Operation:TOperation);
Begin
  Inherited;
  If (AComponent=FPopupMenu) And (Operation=opRemove) Then
    FPopupMenu:=Nil;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.RemoveTrayIcon;
Begin
  If FTrayIconCreated Then
  Begin
    Shell_NotifyIcon(NIM_DELETE,@FTrayData);
    FTrayIconCreated:=False;
  End;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.RestoreApplication;
Begin
  If FHideWhenMinimized Then
    ShowInTaskBar;
  Application.Restore;
  FMinimized:=False;
  If TrayMode=tmOnMinimize Then
    RemoveTrayIcon;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.ShowInTaskBar;
Begin
  ShowWindow(Application.Handle,SW_SHOW);
End;

{---------------------------------------------------------}

Procedure TDCMinTray.SetHideWhenMinimized(Value:Boolean);
Begin
  If FHideWhenMinimized=Value Then
    Exit;
  FHideWhenMinimized:=Value;
  If FMinimized Then
    If Value Then
      ShowInTaskBar
    Else
      HideFromTaskBar;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.SetHint(const Value:String);
Var
  Data:TNotifyIconData;
Begin
  If FHint=Value Then
    Exit;
  FHint:=Value;
  If FTrayIconCreated Then
  Begin
    Data:=FTrayData;
    Data.uFlags:=NIF_TIP;
    StrLCopy(Data.szTip,PChar(FHint),SizeOf(Data.szTip)-1);
    Shell_NotifyIcon(NIM_MODIFY,@Data);
  End;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.SetTrayMode(Value:TDCTrayMode);
Begin
  If FTrayMode=Value Then
    Exit;
  If csLoading In ComponentState Then
  Begin
    FStreamTrayMode:=Value;
    Exit;
  End;
  FTrayMode:=Value;
  If Not (csDesigning In ComponentState) Then
    If FTrayMode=tmOnMinimize Then
    Begin
      If Not FMinimized Then
        RemoveTrayIcon;
    End
    Else
      AddTrayIcon;
End;

{---------------------------------------------------------}

Procedure TDCMinTray.UnhookMainForm;
Begin
  If FIsSetHook Then
    Application.UnHookMainWindow(ApplicationHook);
End;

procedure Register;
begin
  RegisterComponents('Dream Company', [TDCMinTray]);
end;

end.