////////////////////////////////////////////////////////////////////////////////
//
//
//  FileName    :   SSVolumeController.pas
//  Creator     :   Shen Min
//  Date        :   2002-09-28
//  Comment     :   Component to change mixer volume
//                  http://www.sunisoft.com
//
////////////////////////////////////////////////////////////////////////////////

unit SSVolumeController;

interface

uses SysUtils, Classes, MMSystem, Windows, Math;

type
    TssVolumeController = class(TComponent)
    private
        m_mixerHandle : Cardinal;
        m_MuteControl : MixerControl;
        m_VolControl : MixerControl;

        m_Mute : Boolean;
        m_Volume: Integer;
        m_Balance : Integer;

        procedure InitMixerControls;
        procedure UnInitMixerControls;
        procedure SetVolume(Vol, Balance : Integer);
        procedure GetVolume(var Vol, Balance : integer);
        procedure SetMute(Value : Boolean);

        procedure SetMuteProp(const Value: Boolean);
        procedure SetVolumeProp(const Value: Integer);
        procedure SetBalanceProp(const Value: Integer);
        function GetBalanceProp: Integer;
        function GetVolumeProp: Integer;

    public
        constructor Create(AOwner : TComponent); override;
        destructor Destroy(); override;

    published
        property Mute : Boolean read m_Mute write SetMuteProp;
        property Volume : Integer read GetVolumeProp write SetVolumeProp;
        property Balance : Integer read GetBalanceProp write SetBalanceProp;

    end;

procedure Register;

implementation


procedure Register;
begin
    RegisterComponents('Sunisoft FreeVCL', [TssVolumeController]);
end;


procedure TssVolumeController.InitMixerControls;
var
    LineControls : MIXERLINECONTROLS;
  	MixerLine : TMIXERLINE;
    Controls : array [0 .. 30] of TMixerControl;
    i : integer;
begin
    ZeroMemory(@Controls[0], sizeof(TMixerControl) * 31);
    mixerOpen(@m_MixerHandle, 0, 0, 0, MIXER_OBJECTF_MIXER);

    ZeroMemory(@MixerLine, sizeof(TMIXERLINE));
    MixerLine.cbStruct := sizeof(TMIXERLINE);
    MixerLine.dwDestination := 1;
    MixerLine.dwComponentType := MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
    mixerGetLineInfo(m_MixerHandle, @MixerLine, MIXER_GETLINEINFOF_COMPONENTTYPE);

    ZeroMemory(@LineControls, sizeof(MIXERLINECONTROLS));
    LineControls.cbStruct := sizeof(MIXERLINECONTROLS);
    LineControls.dwControlType := MIXERCONTROL_CONTROLTYPE_VOLUME;
    LineControls.dwLineID := MixerLine.dwLineID;
    LineControls.cControls := MixerLine.cControls;
    LineControls.cbmxctrl := sizeof(MIXERCONTROL);
    LineControls.pamxctrl := @Controls[0];
    mixerGetLineControls(m_MixerHandle, @LineControls, MIXER_GETLINECONTROLSF_ALL);

    for i := 31 downto 0 do
    begin
        if Controls[i].dwControlType = MIXERCONTROL_CONTROLTYPE_VOLUME then
            m_VolControl := Controls[i];

        if Controls[i].dwControlType = MIXERCONTROL_CONTROLTYPE_MUTE then
            m_MuteControl := Controls[i];
    end;

    m_VolControl.Metrics.dwReserved[1] := 1;
    m_VolControl.Metrics.dwReserved[2] := 1;
end;

procedure TssVolumeController.SetVolume(Vol, Balance : Integer);
var
    V : integer;
    aDetails : array [0 .. 1] of MIXERCONTROLDETAILS_UNSIGNED;
    ControlDetails : TMIXERCONTROLDETAILS;
begin
    V := Vol * $FFFF div 100;

    if Balance < 0 then
    begin
        aDetails[0].dwValue := V;
        aDetails[1].dwValue := V * (100 + Balance) div 100;
    end
    else
    begin
        aDetails[0].dwValue := V * (100 - Balance) div 100;
        aDetails[1].dwValue := V;
    end;

    ZeroMemory(@ControlDetails, sizeof(TMIXERCONTROLDETAILS));
    ControlDetails.cbStruct := sizeof(TMIXERCONTROLDETAILS);
    ControlDetails.dwControlID := m_VolControl.dwControlID;
    ControlDetails.cChannels := 2; // 2 sound channels
    ControlDetails.cMultipleItems := 0;
    ControlDetails.cbDetails := sizeof(MIXERCONTROLDETAILS_UNSIGNED);
    ControlDetails.paDetails := @aDetails[0];
    mixerSetControlDetails(0, @ControlDetails, MIXER_SETCONTROLDETAILSF_VALUE);
end;

procedure TssVolumeController.GetVolume(var Vol, Balance:integer);
var
    aDetails : array [0 .. 30] of Integer;
    ControlDetails : TMIXERCONTROLDETAILS;
    L, R : Integer;
begin
    ZeroMemory(@ControlDetails, sizeof(TMIXERCONTROLDETAILS));
    ControlDetails.cbStruct := sizeof(TMIXERCONTROLDETAILS);
    ControlDetails.dwControlID := m_VolControl.dwControlID;
    ControlDetails.cbDetails := sizeof(integer);
    ControlDetails.hwndOwner := 0;
    ControlDetails.cChannels := 2;
    ControlDetails.paDetails := @aDetails;
    MixerGetControlDetails(m_mixerHandle, @ControlDetails, MIXER_GETCONTROLDETAILSF_VALUE);
    L := aDetails[0];
    R := aDetails[1];
    Vol:=Max(L, R) * 100 div $FFFF;

    if Vol <> 0 then
        if L>R then
            Balance := -(L - R) * 100 div L
        else
            Balance := (R - L) * 100 div R
    else
        Balance := 0;
end;

procedure TssVolumeController.SetMute(Value : Boolean);
var
    cdetails : TMixerControlDetails;
    details : array [0 .. 30] of Integer;
begin
    cdetails.cbStruct := sizeof(cdetails);
    cdetails.dwControlID := m_MuteControl.dwControlID;
    cdetails.cbDetails := sizeof(integer);
    cdetails.hwndOwner := 0;
    cdetails.cChannels := 1;
    cdetails.paDetails := @details[0];
    details[0] := Integer(Value);
    MixerSetControlDetails(m_mixerhandle, @cdetails, MIXER_GETCONTROLDETAILSF_VALUE);
end;

constructor TssVolumeController.Create(AOwner: TComponent);
begin
    inherited;

    InitMixerControls();
    Mute := false;
    GetVolume(m_Volume, m_Balance);
end;

destructor TssVolumeController.Destroy;
begin
    UnInitMixerControls();

    inherited;
end;

procedure TssVolumeController.UnInitMixerControls;
begin
//
end;

procedure TssVolumeController.SetMuteProp(const Value: Boolean);
begin
    m_Mute := Value;

    SetMute(m_Mute);
end;

procedure TssVolumeController.SetVolumeProp(const Value: Integer);
begin
    if (Value < 0) or (Value > 100) then
        Exit;

    m_Volume := Value;

    SetVolume(m_Volume, m_Balance);
end;

procedure TssVolumeController.SetBalanceProp(const Value: Integer);
begin
    if (Value < -100) or (Value > 100) then
        Exit;

    m_Balance := Value;

    SetVolume(m_Volume, m_Balance);
end;

function TssVolumeController.GetBalanceProp: Integer;
begin
    GetVolume(m_Volume, m_Balance);
    Result := m_Balance;
end;

function TssVolumeController.GetVolumeProp: Integer;
begin
    GetVolume(m_Volume, m_Balance);
    Result := m_Volume;
end;

end.
