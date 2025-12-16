inherited TasMgPedido: TTasMgPedido
  Caption = 'Pedido Magazord'
  ClientHeight = 647
  ClientWidth = 1060
  ExplicitWidth = 1066
  ExplicitHeight = 696
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1060
    Height = 583
    Align = alClient
    TabOrder = 0
    object Lb_Codigo: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 3
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
    object Lb_Data: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 45
      Width = 60
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_Cliente: TLabel
      AlignWithMargins = True
      Left = 134
      Top = 45
      Width = 60
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_FormaPagamento: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 85
      Width = 131
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Forma de Pagamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_Nr_Doc: TLabel
      AlignWithMargins = True
      Left = 695
      Top = 45
      Width = 60
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'N'#250'mero Documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_Condicao_Pagamento: TLabel
      AlignWithMargins = True
      Left = 364
      Top = 84
      Width = 131
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Condi'#231#227'o de Pagamentos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_Marketplace: TLabel
      AlignWithMargins = True
      Left = 341
      Top = 124
      Width = 131
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Marketplace'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Lb_Pedido_situacao: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 124
      Width = 131
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Situa'#231#227'o do Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 720
      Top = 84
      Width = 131
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'Forma de Recebimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 204
      Top = 3
      Width = 117
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      AutoSize = False
      Caption = 'C'#243'digo Secund'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object E_Codigo: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 19
      Width = 196
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
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
    object E_Data: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 60
      Width = 122
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
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
    object E_Cliente: TEdit
      AlignWithMargins = True
      Left = 134
      Top = 61
      Width = 555
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object E_Forma_Pagamentos: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 100
      Width = 354
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object E_Nr_Doc: TEdit
      AlignWithMargins = True
      Left = 695
      Top = 60
      Width = 354
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object E_Condicao_Pagamento: TEdit
      AlignWithMargins = True
      Left = 364
      Top = 99
      Width = 354
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object E_Marketplace: TEdit
      AlignWithMargins = True
      Left = 341
      Top = 139
      Width = 329
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object E_Pedido_situacao: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 139
      Width = 329
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object Pnl_totalizador: TPanel
      Left = 1
      Top = 538
      Width = 1058
      Height = 44
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 8
      DesignSize = (
        1058
        44)
      object Lb_Qt_Produto: TLabel
        Left = 557
        Top = 3
        Width = 55
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Lb_VL_Produto: TLabel
        Left = 661
        Top = 3
        Width = 71
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Produtos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Lb_VL_Frete: TLabel
        Left = 759
        Top = 3
        Width = 53
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Frete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Lb_VL_Pedido: TLabel
        Left = 960
        Top = 3
        Width = 50
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 603
      end
      object Lb_VL_Desconto: TLabel
        Left = 857
        Top = 3
        Width = 77
        Height = 14
        Anchors = [akRight, akBottom]
        Caption = 'Valor Desconto '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object E_VL_Frete: TEdit
        Left = 755
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
      object E_VL_Produto: TEdit
        Left = 657
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object E_VL_Desconto: TEdit
        Left = 855
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
      end
      object E_VL_Pedido: TEdit
        Left = 957
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object E_Qt_Produto: TEdit
        Left = 556
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object Pg_main: TPageControl
      Left = 1
      Top = 165
      Width = 1058
      Height = 373
      ActivePage = TabSheet1
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 9
      object TabSheet1: TTabSheet
        Caption = 'Itens'
        object DBG_Items: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1044
          Height = 339
          Align = alClient
          Color = clCream
          DataSource = ds_search
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'product_id'
              Title.Caption = 'C'#243'digo Produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'product_description'
              Title.Caption = 'Descri'#231#227'o produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 425
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_unitario'
              Title.Caption = 'Valor Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_subtotal'
              Title.Caption = 'Valor Subtotal'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ean'
              Title.Caption = 'C'#243'digo Barras'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'brand_name'
              Title.Caption = 'Marca'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 388
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'categoria_name'
              Title.Caption = 'Categoria'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object tbs_delivery: TTabSheet
        Caption = 'Dados de Entrega'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Pnl_delivery: TPanel
          Left = 0
          Top = 0
          Width = 1050
          Height = 345
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Lb_Logradouro: TLabel
            AlignWithMargins = True
            Left = 6
            Top = 4
            Width = 60
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'Logradouro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Numero: TLabel
            AlignWithMargins = True
            Left = 560
            Top = 5
            Width = 60
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'N'#250'mero'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Complemento: TLabel
            AlignWithMargins = True
            Left = 6
            Top = 45
            Width = 131
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'Complemento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Bairro: TLabel
            AlignWithMargins = True
            Left = 695
            Top = 5
            Width = 60
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'Bairro'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Cidade: TLabel
            AlignWithMargins = True
            Left = 461
            Top = 44
            Width = 131
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'Cidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Estado: TLabel
            AlignWithMargins = True
            Left = 812
            Top = 43
            Width = 67
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'Estado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Lb_Cep: TLabel
            AlignWithMargins = True
            Left = 368
            Top = 43
            Width = 67
            Height = 13
            Margins.Top = 1
            Margins.Bottom = 1
            AutoSize = False
            Caption = 'CEP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object E_Logradouro: TEdit
            AlignWithMargins = True
            Left = 5
            Top = 20
            Width = 552
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
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
          object E_Numero: TEdit
            AlignWithMargins = True
            Left = 560
            Top = 20
            Width = 122
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
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
          object E_Complemento: TEdit
            AlignWithMargins = True
            Left = 6
            Top = 60
            Width = 354
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object E_Bairro: TEdit
            AlignWithMargins = True
            Left = 688
            Top = 20
            Width = 354
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object E_Cidade: TEdit
            AlignWithMargins = True
            Left = 461
            Top = 60
            Width = 347
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
          end
          object E_Estado: TEdit
            AlignWithMargins = True
            Left = 810
            Top = 60
            Width = 72
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 5
          end
          object E_Cep: TEdit
            AlignWithMargins = True
            Left = 366
            Top = 60
            Width = 91
            Height = 22
            Margins.Top = 1
            Margins.Bottom = 1
            TabStop = False
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Observa'#231#245'es'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object E_Note: TMemo
          Left = 0
          Top = 0
          Width = 1050
          Height = 345
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object E_Forma_recebimento: TEdit
      AlignWithMargins = True
      Left = 720
      Top = 99
      Width = 329
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
    end
    object E_Codigo_Secundario: TEdit
      AlignWithMargins = True
      Left = 203
      Top = 19
      Width = 844
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      TabStop = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 583
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
      OnClick = SB_GerarPedidoClick
      ExplicitTop = 5
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
      OnClick = SB_SairClick
      ExplicitLeft = 800
      ExplicitTop = 6
      ExplicitHeight = 54
    end
  end
  inherited MnuBase: TMainMenu
    Left = 160
    Top = 304
  end
  object cds_search: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 232
    Top = 298
    object cds_searchproduct_id: TIntegerField
      FieldName = 'product_id'
    end
    object cds_searchproduct_description: TStringField
      FieldName = 'product_description'
      Size = 200
    end
    object cds_searchquantity: TFloatField
      FieldName = 'quantity'
    end
    object cds_searchvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
    end
    object cds_searchvalor_subtotal: TFloatField
      FieldName = 'valor_subtotal'
    end
    object cds_searchean: TStringField
      FieldName = 'ean'
    end
    object cds_searchbrand_name: TStringField
      FieldName = 'brand_name'
      Size = 100
    end
    object cds_searchcategoria_name: TStringField
      FieldName = 'categoria_name'
      Size = 100
    end
  end
  object ds_search: TDataSource
    DataSet = cds_search
    Left = 232
    Top = 354
  end
end
