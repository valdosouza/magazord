inherited TabelaPrecoFrameList: TTabelaPrecoFrameList
  inherited L_Carteira: TLabel
    Caption = 'Tabela de Pre'#231'o'
    ExplicitWidth = 77
  end
  inherited pnl_linha_1: TPanel
    inherited Dblcb_Lista: TDBLookupComboBox
      KeyField = 'TPR_CODIGO'
      ListField = 'TPR_NOME'
    end
  end
  inherited Qr_Lista: TSTQuery
    Active = True
    SQL.Strings = (
      'select * '
      'from TB_TABELA_PRECO '
      'where (TPR_CODIGO <> 2) '
      ' AND ( TPR_ATIVA = '#39'S'#39') '
      'ORDER BY TPR_NOME ')
  end
end
