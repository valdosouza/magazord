inherited FormaPagamentoFrameList: TFormaPagamentoFrameList
  Height = 39
  ExplicitHeight = 39
  inherited L_Carteira: TLabel
    Caption = 'Forma de Pagamento'
    ExplicitWidth = 101
  end
  inherited pnl_linha_1: TPanel
    inherited Dblcb_Lista: TDBLookupComboBox
      KeyField = 'FPT_CODIGO'
      ListField = 'FPT_DESCRICAO'
    end
  end
  inherited Qr_Lista: TSTQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM TB_FORMAPAGTO '
      'WHERE (FPT_ATIVO = '#39'S'#39')   '
      ' ORDER BY FPT_DESCRICAO')
  end
end
