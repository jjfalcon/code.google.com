object FormMain: TFormMain
  Left = 383
  Top = 198
  Width = 262
  Height = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SOME 2009 - Calculadora '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    254
    206)
  PixelsPerInch = 96
  TextHeight = 13
  object imgC: TImage
    Left = 185
    Top = 40
    Width = 59
    Height = 26
    Cursor = crHandPoint
    OnClick = imgCClick
  end
  object imgCE: TImage
    Left = 121
    Top = 40
    Width = 59
    Height = 26
    Cursor = crHandPoint
    OnClick = imgCEClick
  end
  object ImgBack: TImage
    Left = 57
    Top = 40
    Width = 59
    Height = 26
    Cursor = crHandPoint
    OnClick = ImgBackClick
  end
  object btn9: TSpeedButton
    Left = 132
    Top = 73
    Width = 34
    Height = 28
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 93
    Top = 73
    Width = 34
    Height = 28
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton3: TSpeedButton
    Left = 54
    Top = 73
    Width = 34
    Height = 28
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = img7Click
  end
  object SpeedButton4: TSpeedButton
    Left = 210
    Top = 73
    Width = 34
    Height = 28
    Caption = 'sqrt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgSQRTClick
  end
  object SpeedButton5: TSpeedButton
    Left = 54
    Top = 170
    Width = 34
    Height = 28
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = img0Click
  end
  object SpeedButton6: TSpeedButton
    Left = 94
    Top = 170
    Width = 34
    Height = 28
    Caption = '+/-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgSignoClick
  end
  object SpeedButton7: TSpeedButton
    Left = 133
    Top = 170
    Width = 34
    Height = 28
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton8: TSpeedButton
    Left = 8
    Top = 73
    Width = 36
    Height = 28
    Caption = 'MC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgMCClick
  end
  object SpeedButton9: TSpeedButton
    Left = 8
    Top = 105
    Width = 36
    Height = 28
    Caption = 'MR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgMRClick
  end
  object SpeedButton10: TSpeedButton
    Left = 8
    Top = 137
    Width = 36
    Height = 28
    Caption = 'MS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgMSClick
  end
  object SpeedButton11: TSpeedButton
    Left = 8
    Top = 170
    Width = 36
    Height = 28
    Caption = 'M+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgMAClick
  end
  object SpeedButton12: TSpeedButton
    Left = 171
    Top = 73
    Width = 34
    Height = 28
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton15: TSpeedButton
    Left = 171
    Top = 170
    Width = 34
    Height = 28
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgSumarClick
  end
  object SpeedButton13: TSpeedButton
    Left = 171
    Top = 137
    Width = 34
    Height = 28
    Caption = '-'
    Font.Charset = OEM_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    OnClick = imgRestarClick
  end
  object SpeedButton14: TSpeedButton
    Left = 171
    Top = 105
    Width = 34
    Height = 28
    Caption = '*'
    Font.Charset = OEM_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton16: TSpeedButton
    Left = 54
    Top = 105
    Width = 34
    Height = 28
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = img4Click
  end
  object SpeedButton17: TSpeedButton
    Left = 54
    Top = 137
    Width = 34
    Height = 28
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = img1Click
  end
  object SpeedButton18: TSpeedButton
    Left = 94
    Top = 105
    Width = 34
    Height = 28
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton19: TSpeedButton
    Left = 94
    Top = 137
    Width = 34
    Height = 28
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton20: TSpeedButton
    Left = 134
    Top = 105
    Width = 34
    Height = 28
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton21: TSpeedButton
    Left = 134
    Top = 137
    Width = 34
    Height = 28
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton22: TSpeedButton
    Left = 210
    Top = 105
    Width = 34
    Height = 28
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton23: TSpeedButton
    Left = 210
    Top = 137
    Width = 34
    Height = 28
    Caption = '1/x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgInversoClick
  end
  object SpeedButton24: TSpeedButton
    Left = 211
    Top = 169
    Width = 34
    Height = 28
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgCalcularClick
  end
  object SpeedButton25: TSpeedButton
    Left = 185
    Top = 37
    Width = 60
    Height = 29
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgCClick
  end
  object SpeedButton26: TSpeedButton
    Left = 120
    Top = 37
    Width = 62
    Height = 29
    Caption = 'CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = imgCEClick
  end
  object SpeedButton27: TSpeedButton
    Left = 54
    Top = 37
    Width = 62
    Height = 29
    Caption = 'Retroceso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = ImgBackClick
  end
  object Shape1: TShape
    Left = 8
    Top = 2
    Width = 236
    Height = 22
    Pen.Color = clInactiveCaption
  end
  object lblResult: TLabel
    Left = 230
    Top = 6
    Width = 9
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = '0,'
    Color = clWhite
    ParentColor = False
  end
  object btnHelp: TButton
    Left = 128
    Top = 8
    Width = 33
    Height = 25
    Action = actHelp
    TabOrder = 0
    Visible = False
  end
  object btnAbout: TButton
    Left = 96
    Top = 8
    Width = 33
    Height = 25
    Action = actAbout
    TabOrder = 1
    Visible = False
  end
  object Panel1: TPanel
    Left = 11
    Top = 40
    Width = 29
    Height = 24
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'M'
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object mnuEdicion: TMenuItem
      Caption = 'Edici'#243'n'
      object mnuCopiar: TMenuItem
        Caption = 'Copiar'
        ShortCut = 16451
      end
      object mnuPegar: TMenuItem
        Caption = 'Pegar'
        ShortCut = 16470
      end
    end
    object mnuVer: TMenuItem
      Caption = 'Ver'
      object mnuEstandar: TMenuItem
        Caption = 'Estandar'
        Checked = True
        GroupIndex = 1
        RadioItem = True
      end
      object mnuCientifica: TMenuItem
        Caption = 'Cientifica'
        GroupIndex = 1
      end
      object mnuConversion: TMenuItem
        Caption = 'Conversion'
        GroupIndex = 1
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object mnuNumeroDigitos: TMenuItem
        Caption = 'N'#250'mero de d'#237'gitos en grupo'
        GroupIndex = 1
      end
      object mnuVistaClsica: TMenuItem
        Caption = 'Vista Cl'#225'sica'
        Checked = True
        GroupIndex = 1
      end
    end
    object mnuAyuda: TMenuItem
      Caption = 'Ayuda'
      object mnuTemasAyuda: TMenuItem
        Action = actHelp
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuAcerca: TMenuItem
        Action = actAbout
      end
    end
  end
  object ActionList: TActionList
    Left = 40
    Top = 8
    object actAbout: TAction
      Caption = 'Acerca de Calculadora'
      OnExecute = actAboutExecute
    end
    object actHelp: TAction
      Caption = 'Temas de Ayuda'
      OnExecute = actHelpExecute
    end
  end
  object XPManifest1: TXPManifest
    Left = 160
    Top = 8
  end
end
