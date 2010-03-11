object Form1: TForm1
  Left = 435
  Top = 326
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 104
    Width = 73
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 56
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 1
    Text = '100'
  end
  object MyListBox11: TMyListBox1
    Left = 248
    Top = 64
    Width = 81
    Height = 97
    BarColor = 14084567
    BarFont.Charset = DEFAULT_CHARSET
    BarFont.Color = clGreen
    BarFont.Height = -13
    BarFont.Name = 'MS Sans Serif'
    BarFont.Style = []
    BarStyle = tbsLowered
    EvenColor = 14803425
    ItemHeight = 20
    OddColor = 13750737
    TabOrder = 2
  end
  object MyListBox12: TMyListBox1
    Left = 360
    Top = 64
    Width = 73
    Height = 97
    BarColor = 14084567
    BarFont.Charset = DEFAULT_CHARSET
    BarFont.Color = clGreen
    BarFont.Height = -13
    BarFont.Name = 'MS Sans Serif'
    BarFont.Style = []
    BarStyle = tbsLowered
    EvenColor = 14803425
    ItemHeight = 20
    OddColor = 13750737
    TabOrder = 3
  end
  object MyListBox13: TMyListBox1
    Left = 168
    Top = 64
    Width = 49
    Height = 97
    BarColor = 14084567
    BarFont.Charset = DEFAULT_CHARSET
    BarFont.Color = clGreen
    BarFont.Height = -13
    BarFont.Name = 'MS Sans Serif'
    BarFont.Style = []
    BarStyle = tbsLowered
    EvenColor = 14803425
    ItemHeight = 20
    OddColor = 13750737
    TabOrder = 4
  end
  object TTimer
    Interval = 100
  end
  object TTimer
    Interval = 100
  end
  object TTimer
    Interval = 100
  end
  object Timer1: TTimer
  end
end
