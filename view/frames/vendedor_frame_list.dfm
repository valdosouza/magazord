inherited VendedorFrameList: TVendedorFrameList
  inherited L_Carteira: TLabel
    Caption = 'Vendedores'
    ExplicitWidth = 59
  end
  inherited pnl_linha_1: TPanel
    inherited Dblcb_Lista: TDBLookupComboBox
      KeyField = 'CLB_CODIGO'
      ListField = 'CLB_NOME'
    end
  end
  inherited Qr_Lista: TSTQuery
    Active = True
    SQL.Strings = (
      'SELECT CLB_CODIGO, CLB_NOME, CLB_AQ_COM_vda,CLB_AQ_COM_SRV'
      'FROM TB_COLABORADOR tb_colaborador'
      'INNER JOIN TB_CARGO tb_cargo'
      'ON (tb_cargo.CRG_CODIGO = tb_colaborador.CLB_CODCRG)'
      'WHERE (CLB_DEMISSAO IS NULL)'
      'AND  (CRG_DESCRICAO LIKE '#39'VENDEDOR%'#39')'
      'ORDER BY CLB_NOME')
  end
end
