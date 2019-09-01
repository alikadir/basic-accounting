unit WinExit;

interface

uses
  Classes, Windows, SysUtils;
  {, Messages, , , Graphics, Controls, Forms, Dialogs,
  StdCtrls;}

Type
  // OS platforms
  TWinType = (wtWindows95, wtWindowsNT, wtWin32s, wtUnknown);

  // ShutDown/Logoff Windows95/NT modes
  TWinExitType  = (ewLogoff, ewReboot, ewShutDown, ewPowerOff,ewpowshut);

  TWinExit = class(TComponent)
  private
    FWinExitType  : TWinExitType;
    FUnconditional: boolean;
    FLastError    : string;
    function GetWinType: TWinType;
    function SetPrivilege(sPrivilegeName: string; bEnabled: boolean ): boolean;
    procedure SetWinExitType(Value: TWinExitType);
  public
    function Execute: boolean;
  published
    property ExitWinType   : TWinExitType read FWinExitType   write SetWinExitType default EWReboot;
    property LastError     : string       read FLastError;
    property Unconditional : boolean      read FUnconditional write FUnconditional default False;
  end;

const
  WinExitFlagsArr : array [TWinExitType] of word =
    (EWX_LOGOFF, EWX_REBOOT, EWX_SHUTDOWN, EWX_POWEROFF,EWX_POWEROFF or EWX_FORCE);

procedure Register;

implementation

// Get platform information
function TWinExit.GetWinType: TWinType;
var
  VersionInfo: TOSVersionInfo;
begin
  Result:=wtUnknown;
  VersionInfo.dwOSVersionInfoSize:=SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  case VersionInfo.dwPlatformId of
    VER_PLATFORM_WIN32S        : Result:=wtWin32s;
    VER_PLATFORM_WIN32_WINDOWS : Result:=wtWindows95;
    VER_PLATFORM_WIN32_NT      : Result:=wtWindowsNT;
  end;
end;

// Sets privileges of program under Windows NT ...
function TWinExit.SetPrivilege(sPrivilegeName : string;
                               bEnabled : boolean ): boolean;
var
  TPPrev,
  TP         : TTokenPrivileges;
  Token      : THandle;
  dwRetLen   : DWord;
begin
  Result := False;
  if not OpenProcessToken(GetCurrentProcess,
        TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,Token) then
  begin
    FLastError:='Error: OpenProcessToken';
    Exit;
  end;

  TP.PrivilegeCount:=1;
  if LookupPrivilegeValue(Nil, PChar(sPrivilegeName), TP.Privileges[0].LUID) then
  begin
    if bEnabled then TP.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED
                else TP.Privileges[0].Attributes:=0;

    dwRetLen:=0;
    if AdjustTokenPrivileges(Token, False, TP, SizeOf(TPPrev),
                             TPPrev, dwRetLen) then
      Result:=True
    else
      FLastError:='Error: AdjustTokenPrivileges';
  end;
  CloseHandle(Token);
end;

procedure TWinExit.SetWinExitType(Value: TWinExitType);
begin
  FWinExitType:=Value;
end;

// The functionality of this component is build in this routine
function TWinExit.Execute: boolean;
var
  Flags: word;
begin
  Result:=False;
  Flags:=WinExitFlagsArr[FWinExitType];

  if Unconditional then Flags:=Flags or EWX_FORCE;

  if GetWinType<>wtWindowsNT then ExitWindowsEx(Flags, 0)
  else
    if SetPrivilege('SeShutdownPrivilege', True) then
    begin
      Result:=ExitWindowsEx(Flags, 0);
      SetPrivilege('SeShutdownPrivilege', False);
    end;

  if not Result then
     FLastError:='Error: '+IntToStr(GetLastError);
end;

procedure Register;
begin
  RegisterComponents('System', [TWinExit]);
end;

end.