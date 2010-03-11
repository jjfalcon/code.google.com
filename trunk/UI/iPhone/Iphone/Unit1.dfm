object Form1: TForm1
  Left = 453
  Top = 327
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Keyboard1: TKeyboard
    Left = 144
    Top = 72
    Width = 377
    Height = 209
    TabOrder = 0
    Visible = False
  end
  object Edit1: TEdit
    Left = 88
    Top = 272
    Width = 273
    Height = 21
    TabOrder = 1
    Text = ' '
    OnClick = Edit1Click
  end
  object Memo1: TMemo
    Left = 96
    Top = 312
    Width = 265
    Height = 193
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
    WantTabs = True
    OnClick = Memo1Click
  end
end
