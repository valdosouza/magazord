inherited FrMain: TFrMain
  Caption = 'Controle de pedidos loja virtual Magazord'
  ClientHeight = 299
  ClientWidth = 852
  ExplicitWidth = 858
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton [0]
    Left = 136
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo [1]
    Left = 0
    Top = 39
    Width = 852
    Height = 260
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  inherited Menu: TMainMenu
    Left = 16
    Top = 8
  end
end
