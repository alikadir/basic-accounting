// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'frmMessage.pas' rev: 5.00

#ifndef frmMessageHPP
#define frmMessageHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Clipbrd.hpp>	// Pascal unit
#include <SUIForm.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frmmessage
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmMsg;
class PASCALIMPLEMENTATION TfrmMsg : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Suiform::TsuiForm* suiForm1;
	Stdctrls::TLabel* lbl;
	Extctrls::TImage* Image1;
	void __fastcall FormKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
public:
		
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TfrmMsg(Classes::TComponent* AOwner) : Forms::TForm(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmMsg(Classes::TComponent* AOwner, int Dummy
		) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmMsg(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TfrmMsg(HWND ParentWindow) : Forms::TForm(ParentWindow
		) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TfrmMsg* frmMsg;

}	/* namespace Frmmessage */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Frmmessage;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// frmMessage