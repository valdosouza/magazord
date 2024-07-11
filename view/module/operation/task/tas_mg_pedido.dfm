inherited TasMgPedido: TTasMgPedido
  Caption = 'Pedido Magazord'
  ClientHeight = 593
  ClientWidth = 1060
  ExplicitWidth = 1066
  ExplicitHeight = 642
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1060
    Height = 529
    Align = alClient
    TabOrder = 0
    object Lb_Url: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 5
      Width = 60
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 208
      Top = 5
      Width = 60
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object E_URL: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 196
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 207
      Top = 21
      Width = 196
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 529
    Width = 1060
    Height = 64
    Align = alBottom
    TabOrder = 1
    object SB_GerarPedido: TSpeedButton
      AlignWithMargins = True
      Left = 840
      Top = 4
      Width = 112
      Height = 56
      Margins.Left = 1
      Margins.Right = 1
      Align = alRight
      Caption = 'Gerar Pedido - F10'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
    end
    object SB_Sair: TSpeedButton
      AlignWithMargins = True
      Left = 954
      Top = 4
      Width = 102
      Height = 56
      Margins.Left = 1
      Align = alRight
      Caption = 'Sair - ESC'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ExplicitLeft = 800
      ExplicitTop = 6
      ExplicitHeight = 54
    end
  end
  inherited Menu: TMainMenu
    Left = 8
    Top = 408
  end
end
