// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'SUIGrid.pas' rev: 6.00

#ifndef SUIGridHPP
#define SUIGridHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <StdCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <SUIMgr.hpp>	// Pascal unit
#include <SUIScrollBar.hpp>	// Pascal unit
#include <SUIThemes.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Suigrid
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TsuiCustomDrawGrid;
class PASCALIMPLEMENTATION TsuiCustomDrawGrid : public Grids::TCustomDrawGrid 
{
	typedef Grids::TCustomDrawGrid inherited;
	
private:
	Graphics::TColor m_BorderColor;
	Graphics::TColor m_FocusedColor;
	Graphics::TColor m_SelectedColor;
	Suithemes::TsuiUIStyle m_UIStyle;
	Suimgr::TsuiFileTheme* m_FileTheme;
	Graphics::TColor m_FixedFontColor;
	void __fastcall SetBorderColor(const Graphics::TColor Value);
	MESSAGE void __fastcall WMEARSEBKGND(Messages::TMessage &Msg);
	void __fastcall SetUIStyle(const Suithemes::TsuiUIStyle Value);
	void __fastcall SetFocusedColor(const Graphics::TColor Value);
	void __fastcall SetSelectedColor(const Graphics::TColor Value);
	void __fastcall SetFixedFontColor(const Graphics::TColor Value);
	bool __fastcall GetCtl3D(void);
	void __fastcall SetFontColor(const Graphics::TColor Value);
	Graphics::TColor __fastcall GetFontColor(void);
	void __fastcall SetFileTheme(const Suimgr::TsuiFileTheme* Value);
	
protected:
	virtual void __fastcall DrawCell(int ACol, int ARow, const Types::TRect &ARect, Grids::TGridDrawState AState);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TsuiCustomDrawGrid(Classes::TComponent* AOwner);
	
__published:
	__property Suimgr::TsuiFileTheme* FileTheme = {read=m_FileTheme, write=SetFileTheme};
	__property Suithemes::TsuiUIStyle UIStyle = {read=m_UIStyle, write=SetUIStyle, nodefault};
	__property Color  = {default=-2147483643};
	__property FixedColor  = {default=-2147483633};
	__property Graphics::TColor BorderColor = {read=m_BorderColor, write=SetBorderColor, nodefault};
	__property Graphics::TColor FocusedColor = {read=m_FocusedColor, write=SetFocusedColor, nodefault};
	__property Graphics::TColor SelectedColor = {read=m_SelectedColor, write=SetSelectedColor, nodefault};
	__property Graphics::TColor FixedFontColor = {read=m_FixedFontColor, write=SetFixedFontColor, nodefault};
	__property Graphics::TColor FontColor = {read=GetFontColor, write=SetFontColor, nodefault};
	__property Ctl3D  = {read=GetCtl3D};
public:
	#pragma option push -w-inl
	/* TCustomGrid.Destroy */ inline __fastcall virtual ~TsuiCustomDrawGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TsuiCustomDrawGrid(HWND ParentWindow) : Grids::TCustomDrawGrid(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TsuiDrawGrid;
class PASCALIMPLEMENTATION TsuiDrawGrid : public TsuiCustomDrawGrid 
{
	typedef TsuiCustomDrawGrid inherited;
	
__published:
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BiDiMode ;
	__property BorderStyle  = {default=1};
	__property ColCount  = {default=5};
	__property Constraints ;
	__property DefaultColWidth  = {default=64};
	__property DefaultRowHeight  = {default=24};
	__property DefaultDrawing  = {default=1};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property Enabled  = {default=1};
	__property FixedCols  = {default=1};
	__property RowCount  = {default=5};
	__property FixedRows  = {default=1};
	__property Font ;
	__property GridLineWidth  = {default=1};
	__property Options  = {default=31};
	__property ParentBiDiMode  = {default=1};
	__property ParentColor  = {default=0};
	__property ParentCtl3D  = {default=1};
	__property ParentFont  = {default=1};
	__property ParentShowHint  = {default=1};
	__property PopupMenu ;
	__property ScrollBars  = {default=3};
	__property ShowHint ;
	__property TabOrder  = {default=-1};
	__property Visible  = {default=1};
	__property VisibleColCount ;
	__property VisibleRowCount ;
	__property OnClick ;
	__property OnColumnMoved ;
	__property OnContextPopup ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnDrawCell ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnGetEditMask ;
	__property OnGetEditText ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnMouseWheelDown ;
	__property OnMouseWheelUp ;
	__property OnRowMoved ;
	__property OnSelectCell ;
	__property OnSetEditText ;
	__property OnStartDock ;
	__property OnStartDrag ;
	__property OnTopLeftChanged ;
public:
	#pragma option push -w-inl
	/* TsuiCustomDrawGrid.Create */ inline __fastcall virtual TsuiDrawGrid(Classes::TComponent* AOwner) : TsuiCustomDrawGrid(AOwner) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomGrid.Destroy */ inline __fastcall virtual ~TsuiDrawGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TsuiDrawGrid(HWND ParentWindow) : TsuiCustomDrawGrid(ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TsuiStringGrid;
class PASCALIMPLEMENTATION TsuiStringGrid : public Grids::TStringGrid 
{
	typedef Grids::TStringGrid inherited;
	
private:
	Graphics::TColor m_BorderColor;
	Graphics::TColor m_FocusedColor;
	Graphics::TColor m_SelectedColor;
	Suithemes::TsuiUIStyle m_UIStyle;
	Graphics::TColor m_FixedFontColor;
	Suimgr::TsuiFileTheme* m_FileTheme;
	void __fastcall SetBorderColor(const Graphics::TColor Value);
	void __fastcall SetFocusedColor(const Graphics::TColor Value);
	void __fastcall SetSelectedColor(const Graphics::TColor Value);
	void __fastcall SetUIStyle(const Suithemes::TsuiUIStyle Value);
	void __fastcall SetFixedFontColor(const Graphics::TColor Value);
	bool __fastcall GetCtl3D(void);
	void __fastcall SetFontColor(const Graphics::TColor Value);
	Graphics::TColor __fastcall GetFontColor(void);
	void __fastcall SetFileTheme(const Suimgr::TsuiFileTheme* Value);
	Graphics::TColor __fastcall GetBGColor(void);
	void __fastcall SetBGColor(const Graphics::TColor Value);
	Graphics::TColor __fastcall GetFixedBGColor(void);
	void __fastcall SetFixedBGColor(const Graphics::TColor Value);
	MESSAGE void __fastcall WMEARSEBKGND(Messages::TMessage &Msg);
	
protected:
	virtual void __fastcall DrawCell(int ACol, int ARow, const Types::TRect &ARect, Grids::TGridDrawState AState);
	virtual void __fastcall Paint(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TsuiStringGrid(Classes::TComponent* AOwner);
	
__published:
	__property Suimgr::TsuiFileTheme* FileTheme = {read=m_FileTheme, write=SetFileTheme};
	__property Suithemes::TsuiUIStyle UIStyle = {read=m_UIStyle, write=SetUIStyle, nodefault};
	__property Graphics::TColor BGColor = {read=GetBGColor, write=SetBGColor, nodefault};
	__property Graphics::TColor BorderColor = {read=m_BorderColor, write=SetBorderColor, nodefault};
	__property Graphics::TColor FocusedColor = {read=m_FocusedColor, write=SetFocusedColor, nodefault};
	__property Graphics::TColor SelectedColor = {read=m_SelectedColor, write=SetSelectedColor, nodefault};
	__property Graphics::TColor FixedFontColor = {read=m_FixedFontColor, write=SetFixedFontColor, nodefault};
	__property Graphics::TColor FixedBGColor = {read=GetFixedBGColor, write=SetFixedBGColor, nodefault};
	__property Graphics::TColor FontColor = {read=GetFontColor, write=SetFontColor, nodefault};
	__property Ctl3D  = {read=GetCtl3D};
public:
	#pragma option push -w-inl
	/* TStringGrid.Destroy */ inline __fastcall virtual ~TsuiStringGrid(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TsuiStringGrid(HWND ParentWindow) : Grids::TStringGrid(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Suigrid */
using namespace Suigrid;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SUIGrid
