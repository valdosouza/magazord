unit tas_mg_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Un_Base, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls,ControllerMGPedido, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Mask, Vcl.ComCtrls, ControllerPedido;

type
  TTasMgPedido = class(TFr_Base)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_GerarPedido: TSpeedButton;
    SB_Sair: TSpeedButton;
    Lb_Codigo: TLabel;
    E_Codigo: TEdit;
    E_Data: TEdit;
    Lb_Data: TLabel;
    E_Cliente: TEdit;
    Lb_Cliente: TLabel;
    Lb_FormaPagamento: TLabel;
    E_Forma_Pagamentos: TEdit;
    Lb_Nr_Doc: TLabel;
    E_Nr_Doc: TEdit;
    Lb_Condicao_Pagamento: TLabel;
    E_Condicao_Pagamento: TEdit;
    Lb_Marketplace: TLabel;
    E_Marketplace: TEdit;
    E_Pedido_situacao: TEdit;
    Lb_Pedido_situacao: TLabel;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    cds_searchproduct_description: TStringField;
    cds_searchproduct_id: TIntegerField;
    cds_searchquantity: TFloatField;
    cds_searchvalor_unitario: TFloatField;
    cds_searchvalor_subtotal: TFloatField;
    cds_searchean: TStringField;
    cds_searchbrand_name: TStringField;
    cds_searchcategoria_name: TStringField;
    Pnl_totalizador: TPanel;
    Lb_Qt_Produto: TLabel;
    Lb_VL_Produto: TLabel;
    Lb_VL_Frete: TLabel;
    Lb_VL_Pedido: TLabel;
    Lb_VL_Desconto: TLabel;
    E_VL_Frete: TEdit;
    E_VL_Produto: TEdit;
    E_VL_Desconto: TEdit;
    E_VL_Pedido: TEdit;
    E_Qt_Produto: TEdit;
    Pg_main: TPageControl;
    TabSheet1: TTabSheet;
    DBG_Items: TDBGrid;
    tbs_delivery: TTabSheet;
    Pnl_delivery: TPanel;
    Lb_Logradouro: TLabel;
    Lb_Numero: TLabel;
    Lb_Complemento: TLabel;
    Lb_Bairro: TLabel;
    Lb_Cidade: TLabel;
    Lb_Estado: TLabel;
    E_Logradouro: TEdit;
    E_Numero: TEdit;
    E_Complemento: TEdit;
    E_Bairro: TEdit;
    E_Cidade: TEdit;
    E_Estado: TEdit;
    Lb_Cep: TLabel;
    E_Cep: TEdit;
    Label1: TLabel;
    E_Forma_recebimento: TEdit;
    Label2: TLabel;
    E_Codigo_Secundario: TEdit;
    TabSheet2: TTabSheet;
    E_Note: TMemo;
    procedure SB_SairClick(Sender: TObject);
    procedure SB_GerarPedidoClick(Sender: TObject);
  private
    FCodigoPedido: String;
    FCodigoVendedor : Integer;
    FCodigoFormaPagamento : Integer;
    FCodigoTabelaPreco : Integer;
    procedure setFCodigoPedido(const Value: String);
    function ValidaDownloadPedido:Boolean;
    function DownloadPedido:Boolean;
    procedure SaveMGPedido;
    procedure PreencherPedido;
    procedure PreencherPedidoItem;
    procedure PreencherPedidoEntrega;
    procedure PreencheObservacao;

    function ValidaCreateClienteSetes:Boolean;
    procedure CreateClienteSetes;
    procedure CreateEnderecoSetes;

    function AbreTelaGenerateOrder:Boolean;
    function ValidaGeraPedidoCompleto:boolean;
    procedure GeraPedidoCompleto;
    procedure GeraPedido;
    procedure GeraPedidoItens;
    procedure GeraVinculoFromExterior;


  protected
    procedure ImagemBotao;override;
    procedure CriarVariaveis;override;
    procedure IniciaVariaveis;override;
    procedure FinalizaVariaveis;override;
    procedure setPerfil;override;
    procedure FormataTela;override;
  public
    MGPedido : TControllerMGPedido;
    Pedido : TControllerPedido;
    property CodigoPedido : String read FCodigoPedido write setFCodigoPedido;
  end;

var
  TasMgPedido: TTasMgPedido;

implementation

uses Un_Msg,un_variables,UnFunctions, tas_generate_order;
{$R *.dfm}

{ TTasMgPedido }

function TTasMgPedido.AbreTelaGenerateOrder: Boolean;
Var
  Lc_form : TTasGenerateOrder;
begin
  Result := True;
  Lc_form := TTasGenerateOrder.Create(self);
  try
    Lc_form.ShowModal;
    if (Lc_form.VendedorFrameList.Dblcb_Lista.Text <> EmptyStr ) then
      FCodigoVendedor := Lc_form.VendedorFrameList.Dblcb_Lista.KeyValue;

    if (Lc_form.FormaPagamentoFrameList.Dblcb_Lista.Text <> EmptyStr ) then
      FCodigoFormaPagamento := Lc_form.FormaPagamentoFrameList.Dblcb_Lista.KeyValue;

    if (Lc_form.TabelaPrecoFrameList.Dblcb_Lista.Text <> EmptyStr ) then
      FCodigoTabelaPreco := Lc_form.TabelaPrecoFrameList.Dblcb_Lista.KeyValue;

    if (FCodigoVendedor = 0 ) or (FCodigoFormaPagamento = 0 ) or (FCodigoTabelaPreco = 0 ) then
    Begin
      Result := False;
    End;

  finally
    FreeAndNil(Lc_form);
  end;
end;

procedure TTasMgPedido.CreateClienteSetes;
Var
  Lc_CNPJ : String;
begin
  with Pedido.Cliente.Empresa.Registro do
  BEgin
    Codigo := 0;
    Tipo := 1;

    NomeRazaoSocial := UpperCase(RemoveAcento(MGPedido.Registro.PessoaNome));
    ApelidoFantasia := UpperCase(RemoveAcento(MGPedido.Registro.PessoaNome));
    InscricaoEstadual :=  '';
    SituacaoCredito := 'L';
    Observacao := '';
    DataCadastro := MGPedido.Registro.DataHora;
    Lc_CNPJ := RemoveCaracterInformado(MGPedido.Registro.PessoaCpfCnpj,['.','-','/']);
    if  Length(Lc_CNPJ) = 14 then
      TipoPessoa := 'J'
    else
      TipoPessoa := 'F';
    CpfCNPJ := Lc_CNPJ;
    ValorCredito := 0;
    CodigoVendedor := Gb_Cd_Usuario;
    UtilizarMalaDireta := 'S';
    Email := MGPedido.Registro.PessoaEmail;
    WebSite := '';
    DataFundacao := MGPedido.Registro.PessoaDataNascimento;
    CodigoTransportadora := 0;
    ConsumidorFinal := 'S';
    Multiplicador := 1;
    Status := 'L';
    IndicadorInscricaoEstadual := '9';
  End;
  Pedido.Cliente.Empresa.insert;

  with Pedido.Cliente.Registro do
  BEgin
    Codigo := Pedido.Cliente.Empresa.Registro.Codigo;
    Ativo := 'S';
    ObservacaoNF := '';
    EnviarSomenteXML := 'N';
    IndicadorIE_Dest := '9';
  End;
  Pedido.Cliente.insert;

end;

procedure TTasMgPedido.CreateEnderecoSetes;
begin
  with Pedido.Cliente.Empresa.Endereco.Registro do
  BEgin
    Codigo            := 0;
    CodigoEmpresa     := Pedido.Cliente.Empresa.Registro.Codigo;
    Cnpj              := Pedido.Cliente.Empresa.Registro.CpfCNPJ;
    Tipo              := 'PRINCIPAL';
    Logradouro        := UpperCase(RemoveAcento(MGPedido.Registro.Logradouro));
    NumeroPredial     := MGPedido.Registro.Numero;
    Complemento       := UpperCase(MGPedido.Registro.Complemento);
    Bairro            := UpperCase(MGPedido.Registro.Bairro);
    Cep               := MGPedido.Registro.Cep;
    Contato           := '';
    Fone              := '';
    Celular           := '';
    EnderecoPrincipal := 'S';
    CodigoPais        := 1058;
    CodigoEstado      := Pedido.Cliente.Empresa.Endereco.Uf.BuscaCodigo(MGPedido.Registro.EstadoSigla);
    CodigoCidade      := Pedido.Cliente.Empresa.Endereco.Cidade.Buscacodigo(0,MGPedido.Registro.CidadeNome,MGPedido.Registro.EstadoSigla);
    PossuiWhatsapp    := 'N';
  End;
  Pedido.Cliente.Empresa.Endereco.insert;
end;

procedure TTasMgPedido.CriarVariaveis;
begin
  inherited;
  MGPedido := TControllerMGPedido.create(Self);
  Pedido := TControllerPedido.create(Self);
end;

function TTasMgPedido.DownloadPedido:boolean;
begin
  MGApi.CodigoPedido := self.CodigoPedido;
  try
    MGApi.getPedido;
    Result := True;
  Except
    Result := False;
  end;
end;

procedure TTasMgPedido.FinalizaVariaveis;
begin
  FreeAndNil(Pedido);
  FreeAndNil(MGPedido);
  inherited;
end;

procedure TTasMgPedido.FormataTela;
begin
  inherited;

end;

procedure TTasMgPedido.GeraPedidoCompleto;
begin
  if Pedido.exist then
  Begin
    Pedido.DesregistrarEstoque;
    Pedido.DeletaItens;
    Pedido.delete;

  End;
  if ValidaCreateClienteSetes then
  Begin
    CreateClienteSetes;
    CreateEnderecoSetes;
  End;
  GeraPedido;
  GeraPedidoItens;
  GeraVinculoFromExterior;
  MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                 'Pedido Setes criado com sucesso.'+EOLN+EOLN,
                 ['OK'],[bEscape],mpInformacao);
end;


procedure TTasMgPedido.GeraPedidoItens;
Var
  I : Integer;
begin
  for I := 0 to MGPedido.Item.Lista.Count -1 do
  Begin
    with Pedido.Itens.Registro do
    Begin
      Codigo := 0;
      Sequencia := MGPedido.Item.Registro.Id;
      CodigoPedido := Pedido.Registro.Codigo;
      CodigoNota := 0;
      CodigoProduto := StrToIntDef(MGPedido.Item.Lista[I].ProdutoDerivacaoCodigo,1);
      Quantidade    := MGPedido.Item.Lista[I].Quantidade;
      ValorCusto     := 0;
      ValorUnitario  := MGPedido.Item.Lista[I].ValorUnitario;
      ValorDesconto := MGPedido.Item.Lista[I].ValorDesconto;
      Despachar := 'S';
      Estoque := 'S';
      AliqComissao := 0;
      Operacao := 'V';
      CodigoEstoque := Gb_cd_Estoque;
      CodigoTabela := FCodigoTabelaPreco;
    End;
    Pedido.Itens.insere;
    //Baixa simples produto a produto

    with Pedido.CtrlEstoque.Registro do
    Begin
      Codigo      := 0;
      Terminal    := 0;
      Vinculo     := 'P';
      Ordem       := Pedido.Itens.Registro.CodigoPedido;
      Item        := Pedido.Itens.Registro.Codigo;
      Estoque     := Gb_cd_Estoque;
      operacao    := 'S';
      Produto     := Pedido.Itens.Registro.CodigoProduto;
      Quantidade  := StrToFloatDef(E_Qt_Produto.Text,0);
      Data        := Pedido.Registro.Data;
      Tipo        := 'Venda';
      UpdateAt    := Now;
    End;
    Pedido.CtrlEstoque.Registra;
  End;
end;

procedure TTasMgPedido.GeraPedido;
begin
  with Pedido.Registro do
  Begin
    Codigo := 0;
    Tipo := 1;
    Usuario := Gb_Cd_Usuario;
    Data := MGPedido.Registro.DataHora;
    Empresa := Pedido.Cliente.Registro.Codigo;
    Vendedor := FCodigoVendedor;
    FormaPagto := FCodigoFormaPagamento;
    Prazo := '';
    Endereco := Pedido.Cliente.Empresa.Endereco.Registro.Codigo;
    QtdeProdutos := 0;
    ValorProdutos := MGPedido.Registro.ValorProduto;
    ValorFrete := MGPedido.Registro.ValorFrete;
    ValorDesconto := MGPedido.Registro.ValorDesconto;
    ValorPedido := MGPedido.Registro.ValorTotal;
    Faturado := 'N';
    EnderecoEntrega := Pedido.Cliente.Empresa.Endereco.Registro.Codigo;
    CodigoEstabelecimento := Gb_CodMha;
    Observacao := E_Note.Text;
    IndicaPresenca := 2;
    Terminal := 0;
    Hora := Time;
  End;
  Pedido.insere;
end;

procedure TTasMgPedido.GeraVinculoFromExterior;
begin
  with MGPedido.FromExterior.Registro do
  Begin
    CodigoExterior := MGPedido.Registro.Codigo;
    Kind := 'MAGAZORD';
    PedidoCodigo := Pedido.Registro.Codigo;
  End;
  MGPedido.FromExterior.insert;
end;

procedure TTasMgPedido.ImagemBotao;
begin
  inherited;
  CarregaImagemBotao(SB_Sair,'SAIR');
  CarregaImagemBotao(SB_GerarPedido,'CONFIRMAR');

end;

procedure TTasMgPedido.IniciaVariaveis;
begin
  inherited;
  Try
    ProcessoAguarde('I');
    if ValidaDownloadPedido then
    Begin
      if DownloadPedido then
        SaveMGPedido;
    End;
    PreencherPedido;
    PreencherPedidoItem;
    PreencherPedidoEntrega;
    PreencheObservacao;
  Finally
    ProcessoAguarde('F');
  End;
end;

procedure TTasMgPedido.PreencheObservacao;
begin
  E_Note.Lines.Add(concat('Forma pagamento: ',MGPedido.Registro.FormaPagamentoNome));
  E_Note.Lines.Add(concat('Forma Recebimento: ',MGPedido.Registro.FormaRecebimentoNome));
  E_Note.Lines.Add(concat('Condição Pagamento: ',MGPedido.Registro.CondicaoPagamentoNome));
  E_Note.Lines.Add(concat('Numero de parcelas: ',MGPedido.Registro.CondicaoPagamentoParcelas.ToString));
  E_Note.Lines.Add(concat('MarketplaceNome: ',MGPedido.Registro.MarketplaceNome));
  E_Note.Lines.Add(concat('Codigo: ',MGPedido.Registro.Codigo));
  E_Note.Lines.Add(concat('CodigoMarketplace: ',MGPedido.Registro.CodigoMarketplace));
end;

procedure TTasMgPedido.PreencherPedido;
begin
  E_Codigo.Text             :=  MGPedido.Registro.Codigo;
  E_Codigo_Secundario.Text  :=  MGPedido.Registro.CodigoSecundario;
  E_Data.Text               :=  DateTimeToStr(MGPedido.Registro.DataHora);
  E_Cliente.Text            :=  MGPedido.Registro.PessoaNome;
  E_Forma_Pagamentos.Text   :=  MGPedido.Registro.FormaPagamentoNome;
  E_Nr_Doc.Text             :=  MGPedido.Registro.PessoaCpfCnpj;
  E_Condicao_Pagamento.Text :=  MGPedido.Registro.CondicaoPagamentoNome;
  E_Forma_recebimento.Text  :=  MGPedido.Registro.FormaRecebimentoNome;
  E_Marketplace.Text        :=  MGPedido.Registro.MarketplaceNome;
  E_Pedido_situacao.Text    :=  MGPedido.Registro.PedidoSituacaoDescricao;
  E_VL_Frete.Text           :=  FloatToStrF(MGPedido.Registro.ValorFrete,ffNumber,10,2);
  E_VL_Produto.Text         :=  FloatToStrF(MGPedido.Registro.ValorProduto,ffNumber,10,2);
  E_VL_Desconto.Text        :=  FloatToStrF(MGPedido.Registro.ValorDesconto,ffNumber,10,2);
  E_VL_Pedido.Text          :=  FloatToStrF(MGPedido.Registro.ValorTotal,ffNumber,10,2);

end;

procedure TTasMgPedido.PreencherPedidoEntrega;
begin
  E_Logradouro.Text   := MGPedido.Registro.Logradouro;
  E_Numero.Text       := MGPedido.Registro.Numero;
  E_Bairro.Text       := MGPedido.Registro.Bairro;
  E_Complemento.Text  := MGPedido.Registro.Complemento;
  E_Cep.Text          := MGPedido.Registro.Cep;
  E_Cidade.Text       := MGPedido.Registro.CidadeNome;
  E_Estado.Text       := MGPedido.Registro.EstadoSigla;
end;

procedure TTasMgPedido.PreencherPedidoItem;
Var
  I : Integer;
begin
  MGPedido.Item.Parametros.Periodo := fALSE;
  MGPedido.Item.Parametros.Estabelecimento := MGPedido.Registro.Estabelecimento;
  MGPedido.Item.Parametros.FieldName.PedidoMagazord   := MGPedido.Registro.Id;
  MGPedido.Item.search;

  if not cds_search.Active then cds_search.CreateDataSet;
  cds_search.EmptyDataSet;

  for I := 0 to MGPedido.Item.Lista.Count -1 do
  Begin
    cds_search.Append;
    cds_searchproduct_description.AsString  := UpperCase( MGPedido.Item.Lista[I].Descricao );
    cds_searchproduct_id.AsString           := MGPedido.Item.Lista[I].ProdutoDerivacaoCodigo;
    cds_searchquantity.AsFloat              := MGPedido.Item.Lista[I].Quantidade;
    cds_searchvalor_unitario.AsFloat        := MGPedido.Item.Lista[I].ValorUnitario;
    cds_searchvalor_subtotal.AsFloat        := MGPedido.Item.Lista[I].ValorUnitario * MGPedido.Item.Lista[I].ValorUnitario;
    cds_searchean.AsString                  := MGPedido.Item.Lista[I].Ean;
    cds_searchbrand_name.AsString           := UpperCase( MGPedido.Item.Lista[I].MarcaNome );
    cds_searchcategoria_name.AsString       := UpperCase( MGPedido.Item.Lista[I].Categoria );
    cds_search.Post;
  End;
end;

procedure TTasMgPedido.SaveMGPedido;
Var
  I,J : Integer;
begin
  MGPedido.ClonarObj(MGApi.Pedido.data,MGPedido.Registro);
  MGPedido.Registro.Estabelecimento := Gb_CodMha;
  MGPedido.salva;

  for I := 0 to High(MGApi.Pedido.data.PedidoRastreio) do
  Begin
    MGPedido.ClonarObj(MGApi.Pedido.data.PedidoRastreio[I], MGPedido.Rastreio.Registro);
    MGPedido.Rastreio.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
    MGPedido.Rastreio.salva;

    for J := 0 to High(MGApi.Pedido.data.PedidoRastreio[I].PedidoItem) do
    Begin
      MGPedido.ClonarObj( MGApi.Pedido.data.PedidoRastreio[I].PedidoItem[J],MGPedido.Item.Registro);
      MGPedido.Item.Registro.Estabelecimento :=  MGPedido.Registro.Estabelecimento;
      MGPedido.Item.Registro.PedidoMagazord  :=  MGPedido.Registro.Id;
      MGPedido.Item.salva;
    End;

    for J := 0 to High(MGApi.Pedido.data.PedidoRastreio[I].PedidoNotaFiscal) do
    Begin
      MGPedido.ClonarObj( MGApi.Pedido.data.PedidoRastreio[I].PedidoNotaFiscal[J],MGPedido.NotaFiscal.Registro);
      MGPedido.NotaFiscal.Registro.Estabelecimento :=  MGPedido.Registro.Estabelecimento;
      MGPedido.NotaFiscal.Registro.PedidoMagazord  :=  MGPedido.Registro.Id;
      MGPedido.NotaFiscal.salva;
    End;

  End;

  for I := 0 to High(MGApi.Pedido.data.Boletos) do
  Begin
    MGPedido.ClonarObj(MGApi.Pedido.data.Boletos[I], MGPedido.Boleto.Registro);
    MGPedido.Boleto.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
    MGPedido.Boleto.Registro.PedidoMagazord := MGPedido.Registro.Id;
    MGPedido.Boleto.salva;
  End;

  for I := 0 to High(MGApi.Pedido.data.PedidoHistorico) do
  Begin
    MGPedido.ClonarObj(MGApi.Pedido.data.PedidoHistorico[I], MGPedido.Historico.Registro);
    MGPedido.Historico.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
    MGPedido.Historico.Registro.PedidoMagazord := MGPedido.Registro.Id;
    MGPedido.Historico.salva;
  End;

  MGPedido.ClonarObj(MGApi.Pedido.data.PedidoPromocoes, MGPedido.Promocoes.Registro);
  MGPedido.Promocoes.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
  MGPedido.Promocoes.Registro.PedidoMagazord := MGPedido.Registro.Id;
  MGPedido.Promocoes.salva;

end;

procedure TTasMgPedido.SB_GerarPedidoClick(Sender: TObject);
begin
  try
    ProcessoAguarde('I');
    if ValidaGeraPedidoCompleto then
      GeraPedidoCompleto
  finally
    ProcessoAguarde('F');
  end;
end;

procedure TTasMgPedido.SB_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasMgPedido.setFCodigoPedido(const Value: String);
begin
  FCodigoPedido := Value;
end;

procedure TTasMgPedido.setPerfil;
begin
  inherited;

end;


function TTasMgPedido.ValidaCreateClienteSetes: Boolean;
begin
  Result := True;
  with Pedido.Cliente do
  Begin
    Empresa.Registro.CpfCNPJ := RemoveCaracterInformado(MGPedido.Registro.PessoaCpfCnpj,['.','-','/']);
    Empresa.getByDocumento;
    if Empresa.exist then
    Begin
      Registro.Codigo := Empresa.Registro.Codigo;
      getallByKey;
      Result := False;
    End;
  End;
end;

function TTasMgPedido.ValidaDownloadPedido: Boolean;
begin
  //Só faz o downalod se o pedido não existir
  MGPedido.Parametros.FieldName.Codigo := self.CodigoPedido;
  MGPedido.Parametros.Estabelecimento := Gb_CodMha;
  MGPedido.getByCodigo;
  Result := not MGPedido.exist;
end;

function TTasMgPedido.ValidaGeraPedidoCompleto: boolean;
Begin
  Result := True;
  MGPedido.FromExterior.Registro.CodigoExterior := MGPedido.Registro.Codigo;
  MGPedido.FromExterior.Registro.Kind := 'MAGAZORD';
  MGPedido.FromExterior.getbyId;
  if ( MGPedido.FromExterior.exist ) then
  Begin
    Pedido.Registro.Codigo := MGPedido.FromExterior.Registro.PedidoCodigo;
    Pedido.getbyId;
    if Pedido.exist then
    Begin
      if Pedido.Registro.Faturado = 'S' then
      Begin
        MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                       'Este pedido já foi faturado.'+EOLN+
                       'Operação não pode ser executada.'+EOLN,
                       ['OK'],[bEscape],mpAlerta);
        Result := False;
        exit;
      End
      else
      Begin
        if Pedido.Registro.Faturado = 'A' then
        Begin
          MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                         'Este pedido está na lixeira.'+EOLN+
                         'Você precisa retirá-lo da lixeira, apagando ou restaurando ele.'+EOLN,
                         ['OK'],[bEscape],mpAlerta);
          Result := False;
          exit;
        End
        else
        Begin
          if (MensagemPadrao('Mensagem de Confirmação',
                             '                 Este pedido já foi gerado.'+EOLN+
                             '      Você tem certeza de que deseja gerar novamente.'+EOLN+
                             'Dados alterados serão perdidos se gerar o pedido novamente.'+EOLN+EOLN+
                             'Confirmar a geração ?',
                            ['Sim','Não'],[bEscape,bNormal],mpConfirmacao,clRed) = mrBotao2) then
          Begin
            Result := False;
            exit;
          End;
        End;
      End;
    End;
  End;
  if not AbreTelaGenerateOrder then
  Begin
    Result := False;
    exit;
  End;
end;


end.
