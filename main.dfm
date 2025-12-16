inherited FrMain: TFrMain
  Caption = 'Controle de pedidos loja virtual Magazord'
  ClientHeight = 692
  ClientWidth = 1341
  WindowState = wsMaximized
  ExplicitLeft = -222
  ExplicitWidth = 1347
  ExplicitHeight = 741
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TPanel
    Top = 63
    Width = 1335
    Height = 626
    ExplicitTop = 63
    ExplicitWidth = 1335
    ExplicitHeight = 626
    inherited Lb_ResultadoPesquisa: TLabel
      Width = 1331
    end
    inherited DBG_Pesquisa: TDBGrid
      Width = 1239
      Height = 608
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick]
      Columns = <
        item
          Expanded = False
          FieldName = 'TB_INSTITUTIION_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_MARKETPLACE'
          Title.Caption = 'C'#243'd. Marketplace'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_HORA'
          Title.Caption = 'Data'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PRODUTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_FRETE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_DESCONTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_ACRESCIMO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Valor Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESSOA_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PESSOA_NOME'
          Title.Caption = 'Nome do Cliente'
          Width = 385
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESSOA_CPF_CNPJ'
          Title.Caption = 'Doc. Cliente'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGAMENTO_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGAMENTO_NOME'
          Title.Caption = 'Forma Pagamento'
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_RECEBIMENTO_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FORMA_RECEBIMENTO_NOME'
          Title.Caption = 'Forma Recebimento'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONDICAO_PAGAMENTO_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CONDICAO_PAGAMENTO_NOME'
          Title.Caption = 'Condi'#231#227'o de Pagamento'
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_SITUACAO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_SITUACAO_DESCRICAO'
          Title.Caption = 'Situa'#231#227'o do Pedido'
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_SITUACAO_TIPO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOJA_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOJA_DO_MARKETPLACE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOJA_DO_MARKETPLACE_NOME'
          Title.Caption = 'Loja Marketplace'
          Width = 100
          Visible = True
        end>
    end
    inherited pnl_pesq_right: TPanel
      Left = 1241
      Height = 608
      ExplicitLeft = 1241
      ExplicitHeight = 608
      inherited Sb_Sair_0: TSpeedButton
        Top = 545
        ExplicitTop = 391
      end
      inherited SB_Visualizar: TSpeedButton
        Top = 482
        ExplicitTop = 328
      end
      inherited SB_Buscar: TSpeedButton
        Top = 419
        ExplicitTop = 265
      end
      inherited SB_Cadastrar: TSpeedButton
        Top = 356
        Caption = 'Sincronizar - F2'
        ExplicitTop = 202
      end
    end
  end
  inherited Pnl_Parametros: TPanel
    Width = 1335
    Height = 54
    ExplicitWidth = 1335
    ExplicitHeight = 54
    object Lb_Placa: TLabel
      Left = 177
      Top = 6
      Width = 60
      Height = 13
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
      Left = 326
      Top = 4
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object E_Cliente: TEdit
      Left = 326
      Top = 21
      Width = 383
      Height = 22
      CharCase = ecUpperCase
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
    object E_Data_Ini: TDateTimePicker
      Left = 7
      Top = 21
      Width = 81
      Height = 22
      Date = 39580.356281493060000000
      Time = 39580.356281493060000000
      Enabled = False
      TabOrder = 1
    end
    object E_Data_Fim: TDateTimePicker
      Left = 90
      Top = 21
      Width = 83
      Height = 22
      Date = 39580.356281493060000000
      Time = 39580.356281493060000000
      Enabled = False
      TabOrder = 2
    end
    object ChBx_Periodo: TCheckBox
      Left = 9
      Top = 5
      Width = 128
      Height = 13
      Caption = 'Data Inicial    Data Final'
      TabOrder = 0
      OnClick = ChBx_PeriodoClick
    end
    object E_Codigo: TEdit
      Left = 177
      Top = 21
      Width = 146
      Height = 22
      CharCase = ecUpperCase
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
    object Button1: TButton
      Left = 1128
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Teste '
      TabOrder = 5
      OnClick = Button1Click
    end
    object Rg_Integrado: TRadioGroup
      Left = 715
      Top = 2
      Width = 198
      Height = 47
      Caption = 'Pedidos Integrados'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited MnuBase: TMainMenu
    Left = 8
    Top = 176
    inherited arefas1: TMenuItem
      object Configuraes1: TMenuItem [0]
        Caption = 'Configura'#231#245'es'
        OnClick = Configuraes1Click
      end
      object AtualizarMdulo1: TMenuItem [1]
        Caption = 'Atualizar M'#243'dulo'
        OnClick = AtualizarMdulo1Click
      end
    end
  end
  inherited cds_search: TClientDataSet
    ProviderName = ''
    Top = 186
    object cds_searchTB_INSTITUTION_ID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TB_INSTITUTION_ID'
      Calculated = True
    end
    object cds_searchID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cds_searchCODIGO: TStringField
      DisplayWidth = 21
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 100
    end
    object cds_searchCODIGO_MARKETPLACE: TStringField
      DisplayWidth = 255
      FieldName = 'CODIGO_MARKETPLACE'
      Origin = 'CODIGO_MARKETPLACE'
      Size = 255
    end
    object cds_searchDATA_HORA: TStringField
      FieldName = 'DATA_HORA'
      Size = 25
    end
    object cds_searchVALOR_PRODUTO: TFloatField
      DisplayWidth = 16
      FieldName = 'VALOR_PRODUTO'
      Origin = 'VALOR_PRODUTO'
    end
    object cds_searchVALOR_FRETE: TFloatField
      DisplayWidth = 12
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
    end
    object cds_searchVALOR_DESCONTO: TFloatField
      DisplayWidth = 17
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
    end
    object cds_searchVALOR_ACRESCIMO: TFloatField
      DisplayWidth = 17
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'VALOR_ACRESCIMO'
    end
    object cds_searchVALOR_TOTAL: TFloatField
      DisplayWidth = 12
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '0.00'
    end
    object cds_searchPESSOA_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'PESSOA_ID'
      Origin = 'PESSOA_ID'
    end
    object cds_searchPESSOA_NOME: TStringField
      DisplayWidth = 255
      FieldName = 'PESSOA_NOME'
      Origin = 'PESSOA_NOME'
      Size = 255
    end
    object cds_searchPESSOA_CPF_CNPJ: TStringField
      DisplayWidth = 255
      FieldName = 'PESSOA_CPF_CNPJ'
      Origin = 'PESSOA_CPF_CNPJ'
      Size = 255
    end
    object cds_searchFORMA_PAGAMENTO_ID: TIntegerField
      DisplayWidth = 21
      FieldName = 'FORMA_PAGAMENTO_ID'
      Origin = 'FORMA_PAGAMENTO_ID'
    end
    object cds_searchFORMA_PAGAMENTO_NOME: TStringField
      DisplayWidth = 255
      FieldName = 'FORMA_PAGAMENTO_NOME'
      Origin = 'FORMA_PAGAMENTO_NOME'
      Size = 255
    end
    object cds_searchFORMA_RECEBIMENTO_ID: TIntegerField
      DisplayWidth = 23
      FieldName = 'FORMA_RECEBIMENTO_ID'
      Origin = 'FORMA_RECEBIMENTO_ID'
    end
    object cds_searchFORMA_RECEBIMENTO_NOME: TStringField
      DisplayWidth = 255
      FieldName = 'FORMA_RECEBIMENTO_NOME'
      Origin = 'FORMA_RECEBIMENTO_NOME'
      Size = 255
    end
    object cds_searchCONDICAO_PAGAMENTO_ID: TIntegerField
      DisplayWidth = 24
      FieldName = 'CONDICAO_PAGAMENTO_ID'
      Origin = 'CONDICAO_PAGAMENTO_ID'
    end
    object cds_searchCONDICAO_PAGAMENTO_NOME: TStringField
      DisplayWidth = 255
      FieldName = 'CONDICAO_PAGAMENTO_NOME'
      Origin = 'CONDICAO_PAGAMENTO_NOME'
      Size = 255
    end
    object cds_searchPEDIDO_SITUACAO: TIntegerField
      DisplayWidth = 16
      FieldName = 'PEDIDO_SITUACAO'
      Origin = 'PEDIDO_SITUACAO'
    end
    object cds_searchPEDIDO_SITUACAO_DESCRICAO: TStringField
      DisplayWidth = 255
      FieldName = 'PEDIDO_SITUACAO_DESCRICAO'
      Origin = 'PEDIDO_SITUACAO_DESCRICAO'
      Size = 255
    end
    object cds_searchPEDIDO_SITUACAO_TIPO: TIntegerField
      DisplayWidth = 22
      FieldName = 'PEDIDO_SITUACAO_TIPO'
      Origin = 'PEDIDO_SITUACAO_TIPO'
    end
    object cds_searchLOJA_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'LOJA_ID'
      Origin = 'LOJA_ID'
    end
    object cds_searchLOJA_DO_MARKETPLACE_ID: TIntegerField
      DisplayWidth = 25
      FieldName = 'LOJA_DO_MARKETPLACE_ID'
      Origin = 'LOJA_DO_MARKETPLACE_ID'
    end
    object cds_searchLOJA_DO_MARKETPLACE_NOME: TStringField
      DisplayWidth = 255
      FieldName = 'LOJA_DO_MARKETPLACE_NOME'
      Origin = 'LOJA_DO_MARKETPLACE_NOME'
      Size = 255
    end
  end
end
