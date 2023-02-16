object Form1: TForm1
  Left = 1284
  Top = 129
  Width = 610
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BackSpaceBtn: TButton
    Left = 48
    Top = 176
    Width = 75
    Height = 40
    Caption = #8592
    TabOrder = 0
    OnClick = BackSpaceBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object SubClearBtn: TButton
    Left = 136
    Top = 176
    Width = 75
    Height = 40
    Caption = 'CE'
    TabOrder = 1
    OnClick = SubClearBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object ClearBtn: TButton
    Left = 224
    Top = 176
    Width = 75
    Height = 40
    Caption = 'C'
    TabOrder = 2
    OnClick = ClearBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object DivBtn: TButton
    Left = 312
    Top = 176
    Width = 75
    Height = 40
    Caption = '/'
    TabOrder = 3
    OnClick = DivBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn7: TButton
    Left = 48
    Top = 224
    Width = 75
    Height = 40
    Caption = '7'
    TabOrder = 4
    OnClick = Btn7Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn8: TButton
    Left = 136
    Top = 224
    Width = 75
    Height = 40
    Caption = '8'
    TabOrder = 5
    OnClick = Btn8Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn9: TButton
    Left = 224
    Top = 224
    Width = 75
    Height = 40
    Caption = '9'
    TabOrder = 6
    OnClick = Btn9Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object MulBtn: TButton
    Left = 312
    Top = 224
    Width = 75
    Height = 40
    Caption = '*'
    TabOrder = 7
    OnClick = MulBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn4: TButton
    Left = 48
    Top = 272
    Width = 75
    Height = 40
    Caption = '4'
    TabOrder = 8
    OnClick = Btn4Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn5: TButton
    Left = 136
    Top = 272
    Width = 75
    Height = 40
    Caption = '5'
    TabOrder = 9
    OnClick = Btn5Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn6: TButton
    Left = 224
    Top = 272
    Width = 75
    Height = 40
    Caption = '6'
    TabOrder = 10
    OnClick = Btn6Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object MinusBtn: TButton
    Left = 312
    Top = 272
    Width = 75
    Height = 40
    Caption = '-'
    TabOrder = 11
    OnClick = MinusBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn1: TButton
    Left = 48
    Top = 320
    Width = 75
    Height = 40
    Caption = '1'
    TabOrder = 12
    OnClick = Btn1Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn2: TButton
    Left = 136
    Top = 320
    Width = 75
    Height = 40
    Caption = '2'
    TabOrder = 13
    OnClick = Btn2Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn3: TButton
    Left = 224
    Top = 320
    Width = 75
    Height = 40
    Caption = '3'
    TabOrder = 14
    OnClick = Btn3Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object PlusBtn: TButton
    Left = 312
    Top = 320
    Width = 75
    Height = 40
    Caption = '+'
    TabOrder = 15
    OnClick = PlusBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Btn0: TButton
    Left = 48
    Top = 368
    Width = 161
    Height = 40
    Caption = '0'
    TabOrder = 16
    OnClick = Btn0Click
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object DotBtn: TButton
    Left = 224
    Top = 368
    Width = 75
    Height = 40
    Caption = '-'
    TabOrder = 17
    OnClick = DotBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object EqualBtn: TButton
    Left = 312
    Top = 368
    Width = 75
    Height = 40
    Caption = '='
    TabOrder = 18
    OnClick = EqualBtnClick
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object Edit1: TEdit
    Left = 48
    Top = 144
    Width = 425
    Height = 21
    Enabled = False
    TabOrder = 19
  end
  object Edit2: TEdit
    Left = 48
    Top = 112
    Width = 425
    Height = 21
    Enabled = False
    TabOrder = 20
  end
  object RootBtn: TButton
    Left = 400
    Top = 176
    Width = 70
    Height = 40
    Caption = #8730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = RootBtnClick
  end
  object SquareBtn: TButton
    Left = 400
    Top = 224
    Width = 70
    Height = 40
    Caption = 'x2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    OnClick = SquareBtnClick
  end
  object ReciprocalBtn: TButton
    Left = 400
    Top = 272
    Width = 70
    Height = 40
    Caption = '1/x'
    TabOrder = 23
    OnClick = ReciprocalBtnClick
  end
end
