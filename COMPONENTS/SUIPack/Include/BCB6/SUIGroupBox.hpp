// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'SUIGroupBox.pas' rev: 6.00

#ifndef SUIGroupBoxHPP
#define SUIGroupBoxHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <SUIMgr.hpp>	// Pascal unit
#include <SUIThemes.hpp>	// Pascal unit
#include <SUIPublic.hpp>	// Pascal unit
#include <SUIImagePanel.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Suigroupbox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TsuiCustomGroupBox;
class PASCALIMPLEMENTATION TsuiCustomGroupBox : public Suiimagepanel::TsuiCustomPanel 
{
	typedef Suiimagepanel::TsuiCustomPanel inherited;
	
private:
	Graphics::TColor m_BorderColor;
	AnsiString m_Caption;
	Suimgr::TsuiFileTheme* m_FileTheme;
	Suithemes::TsuiUIStyle m_UIStyle;
	void __fastcall SetBorderColor(const Graphics::TColor Value);
	void __fastcall SetCaption(const AnsiString Value);
	void __fastcall SetFileTheme(const Suimgr::TsuiFileTheme* Value);
	void __fastcall SetUIStyle(const Suithemes::TsuiUIStyle Value);
	HIDESBASE MESSAGE void __fastcall CMFONTCHANGED(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMTEXTCHANGED(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMERASEBKGND(Messages::TMessage &Msg);
	
protected:
	virtual void __fastcall Paint(void);
	virtual void __fastcall SetEnabled(bool Value);
	Types::TRect __fastcall GetClient();
	virtual void __fastcall AlignControls(Controls::TControl* AControl, Types::TRect &Rect);
	__property Graphics::TColor BorderColor = {read=m_BorderColor, write=SetBorderColor, nodefault};
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TsuiCustomGroupBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TsuiCustomGroupBox(void);
	virtual void __fastcall UpdateUIStyle(Suithemes::TsuiUIStyle UIStyle, Suimgr::TsuiFileTheme* FileTheme);
	
__published:
	__property Suimgr::TsuiFileTheme* FileTheme = {read=m_FileTheme, write=SetFileTheme};
	__property Suithemes::TsuiUIStyle UIStyle = {read=m_UIStyle, write=SetUIStyle, nodefault};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property Align  = {default=0};
	__property Caption  = {read=m_Caption, write=SetCaption};
	__property Color  = {default=-2147483633};
	__property Font ;
	__property Enabled  = {default=1};
	__property Transparent  = {default=0};
	__property ParentColor  = {default=0};
	__property ParentShowHint  = {default=1};
	__property ParentBiDiMode  = {default=1};
	__property ParentFont  = {default=1};
	__property TabOrder  = {default=-1};
	__property TabStop  = {default=0};
	__property Visible  = {default=1};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TsuiCustomGroupBox(HWND ParentWindow) : Suiimagepanel::TsuiCustomPanel(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TsuiGroupBox;
class PASCALIMPLEMENTATION TsuiGroupBox : public TsuiCustomGroupBox 
{
	typedef TsuiCustomGroupBox inherited;
	
__published:
	__property BorderColor ;
	__property OnCanResize ;
	__property OnClick ;
	__property OnConstrainedResize ;
	__property OnDockDrop ;
	__property OnDockOver ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnGetSiteInfo ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnResize ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnUnDock ;
public:
	#pragma option push -w-inl
	/* TsuiCustomGroupBox.Create */ inline __fastcall virtual TsuiGroupBox(Classes::TComponent* AOwner) : TsuiCustomGroupBox(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TsuiCustomGroupBox.Destroy */ inline __fastcall virtual ~TsuiGroupBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TsuiGroupBox(HWND ParentWindow) : TsuiCustomGroupBox(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Suigroupbox */
using namespace Suigroupbox;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SUIGroupBox