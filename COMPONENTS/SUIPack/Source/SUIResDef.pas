////////////////////////////////////////////////////////////////////////////////
//
//
//  FileName    :   SUIResDef.pas
//  Creator     :   Shen Min
//  Date        :   2002-5-15
//  Comment     :
//
//  Copyright (c) 2002-2003 Sunisoft
//  http://www.sunisoft.com
//  Email: support@sunisoft.com
//
////////////////////////////////////////////////////////////////////////////////

unit SUIResDef;

interface

{$I SUIPack.inc}

{$IFDEF RES_ALL}
    {$R UIResAll.res}
{$ELSE}
    {$IFDEF RES_MACOS}
        {$R UIResMac.res}
    {$ENDIF}

    {$IFDEF RES_WINXP}
        {$R UIResXP.res}
    {$ENDIF}

    {$IFDEF RES_DEEPBLUE}
        {$R UIResDB.res}
    {$ENDIF}

    {$IFDEF RES_BLUEGLASS}
        {$R UIResBG.res}
    {$ENDIF}

    {$IFDEF RES_PROTEIN}
        {$R UIResPt.res}
    {$ENDIF}
    {$R UIResCom.res}    
{$ENDIF}

{$R SUIPack.dcr}

resourcestring
{$IFDEF LANG_CHS}
    SUI_TITLE_MENUITEM_MINIMIZE = '��С��(&N)';
    SUI_TITLE_MENUITEM_MAXIMIZE = '���/��ԭ(&X)';
    SUI_TITLE_MENUITEM_CLOSE    = '�ر�(&C)';
{$ELSE}
    SUI_TITLE_MENUITEM_MINIMIZE = 'Mi&nimize';
    SUI_TITLE_MENUITEM_MAXIMIZE = 'Ma&ximize/Restore';
    SUI_TITLE_MENUITEM_CLOSE    = '&Close';
{$ENDIF}

implementation


end.
 