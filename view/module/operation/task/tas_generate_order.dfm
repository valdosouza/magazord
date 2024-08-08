inherited TasGenerateOrder: TTasGenerateOrder
  Caption = 'Gera'#231#227'o do Pedido'
  ClientHeight = 199
  ClientWidth = 457
  ExplicitWidth = 463
  ExplicitHeight = 248
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 457
    Height = 135
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 636
    ExplicitHeight = 360
    inline VendedorFrameList: TVendedorFrameList
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 447
      Height = 38
      Margins.Bottom = 1
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 5
      ExplicitWidth = 626
      inherited L_Carteira: TLabel
        Width = 447
      end
      inherited pnl_linha_1: TPanel
        Width = 447
        ExplicitWidth = 626
        inherited Sb_Carteira: TSpeedButton
          Left = 423
          ExplicitLeft = 602
        end
        inherited Dblcb_Lista: TDBLookupComboBox
          Width = 423
          ExplicitWidth = 602
        end
      end
      inherited Qr_Lista: TSTQuery
        Active = False
      end
    end
    inline FormaPagamentoFrameList: TFormaPagamentoFrameList
      AlignWithMargins = True
      Left = 5
      Top = 45
      Width = 447
      Height = 39
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 5
      ExplicitTop = 45
      ExplicitWidth = 626
      inherited L_Carteira: TLabel
        Width = 447
      end
      inherited pnl_linha_1: TPanel
        Width = 447
        ExplicitWidth = 626
        inherited Sb_Carteira: TSpeedButton
          Left = 423
          ExplicitLeft = 602
        end
        inherited Dblcb_Lista: TDBLookupComboBox
          Width = 423
          ExplicitWidth = 602
        end
      end
    end
    inline TabelaPrecoFrameList: TTabelaPrecoFrameList
      AlignWithMargins = True
      Left = 5
      Top = 86
      Width = 447
      Height = 38
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 5
      ExplicitTop = 86
      ExplicitWidth = 626
      inherited L_Carteira: TLabel
        Width = 447
      end
      inherited pnl_linha_1: TPanel
        Width = 447
        ExplicitWidth = 626
        inherited Sb_Carteira: TSpeedButton
          Left = 423
          ExplicitLeft = 602
        end
        inherited Dblcb_Lista: TDBLookupComboBox
          Width = 423
          ExplicitWidth = 602
        end
      end
      inherited Qr_Lista: TSTQuery
        Active = False
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 135
    Width = 457
    Height = 64
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 360
    ExplicitWidth = 636
    object SB_GerarPedido: TSpeedButton
      AlignWithMargins = True
      Left = 237
      Top = 4
      Width = 112
      Height = 56
      Margins.Left = 1
      Margins.Right = 1
      Align = alRight
      Caption = 'Confirmar - F10'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SB_GerarPedidoClick
      ExplicitLeft = 840
      ExplicitTop = 5
    end
    object SB_Sair: TSpeedButton
      AlignWithMargins = True
      Left = 351
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
      OnClick = SB_SairClick
      ExplicitLeft = 800
      ExplicitTop = 6
      ExplicitHeight = 54
    end
  end
  inherited MnuBase: TMainMenu
    Left = 48
    Top = 304
  end
end
