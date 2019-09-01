object Form2: TForm2
  Left = 216
  Top = 163
  Width = 870
  Height = 500
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppViewer1: TppViewer
    Left = 0
    Top = 41
    Width = 862
    Height = 432
    Align = alClient
    BevelOuter = bvNone
    Color = clBtnShadow
    PageColor = clWindow
    Report = ppReport1
    ZoomPercentage = 100
    ZoomSetting = zsWholePage
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = ds_data
    UserName = 'BDEPipeline1'
    Left = 520
    Top = 40
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'FirmaAdi'
      FieldName = 'FirmaAdi'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPipeline1ppField2: TppField
      FieldAlias = 'Adres'
      FieldName = 'Adres'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = 'tel1'
      FieldName = 'tel1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'tel2'
      FieldName = 'tel2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'Email'
      FieldName = 'Email'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'ekbilgi'
      FieldName = 'ekbilgi'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'borc'
      FieldName = 'borc'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'odenen'
      FieldName = 'odenen'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'kalan'
      FieldName = 'kalan'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'kalantarih'
      FieldName = 'kalantarih'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    EmailSettings.ReportFormat = 'PDF'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 496
    Top = 272
    Version = '10.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        Anchors = []
        Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
        Border.Color = clBlack
        Border.Style = psSolid
        Border.Visible = True
        Border.Weight = 1.000000000000000000
        Caption = 'Memo1'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          'l'#305'h lh lkjhklhl  hkjlhjkh kjlhlkjhkjlhkjl')
        ReprintOnOverFlow = True
        Transparent = True
        mmHeight = 17992
        mmLeft = 63500
        mmTop = 2117
        mmWidth = 22490
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 424
    Top = 265
  end
  object ds_data: TDataSource
    DataSet = tablo_data
    Left = 312
    Top = 161
  end
  object tablo_data: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=..\access.mdb;Persi' +
      'st Security Info=False'
    CursorType = ctStatic
    TableName = 'firmalar'
    Left = 376
    Top = 161
  end
end
