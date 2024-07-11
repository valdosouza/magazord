unit ModelMGPedido;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections, ModelMGPedidoHistorico,
  ModelMGPedidoPromocoes, ModelMGPedidoRastreio,CAtribEntity;

type
  [TableName('TB_MG_PEDIDOS')]
  TMGPedido = Class(TGenericEntity)
    type
      TPedidoRastreioArray  = array of TMGPedidoRastreio;
      TPedidoHistoricoArray = array of TMGPedidoHistorico;
      TBoletosArray = array of String;
      TTagsArray = array of String;
      TBloqueiosArray = array of String;
  private
    FLinkAvaliacao: string;
    FPedidoTrackingParams: string;
    FLogradouro: string;
    FCondicaoPagamentoNome: string;
    FPessoaSexo: Integer;
    FPessoaNome: string;
    FValorFrete: Real;
    FFormaRecebimentoId: Integer;
    FPessoaTipo: Integer;
    FId_loja: Integer;
    FValorPersonalizacao: Real;
    FLojaDoMarketplaceId: Integer;
    FFormaPagamentoNome: string;
    FPedidoIp: string;
    FPedidoPagamentoPix: String;
    FDataHora: TDateTime;
    FPedidoTrackingSource: string;
    FBairro: string;
    FValorProduto: Real;
    FPedidoSituacaoDescricao: string;
    FPedidoHistorico: TPedidoHistoricoArray;
    FPedidoAnaliseRisco: String;
    FCuponTipoDesconto: Integer;
    FValorAcrescimo: Real;
    FValorDesconto: Real;
    FPessoaDataNascimento: TDateTime;
    FPessoaEmail: string;
    FTags: TTagsArray;
    FCreditoUtilizado: Real;
    FMarketplaceNome: string;
    FCodigo: string;
    FLojaUrl: string;
    FFormaRecebimentoNome: string;
    FLojaNome: string;
    FLojaDoMarketplaceNome: string;
    FDataMarketplace: TDateTime;
    FCodigoSecundario: string;
    FCep: string;
    FPedidoSituacaoDescricaoDetalhada: string;
    FId: Integer;
    FNumero: string;
    FValorTotalFinal: Real;
    FLojaMarketplaceId: Integer;
    FCuponValorDesconto: Real;
    FCashbackUtilizado: Real;
    FValorTotal: Real;
    FEstadoSigla: string;
    FBloqueios: TBloqueiosArray;
    FTipoCadastroPM: Integer;
    FCuponCodigo: string;
    FPedidoSituacaoEtapa: Integer;
    FCondicaoPagamentoId: Integer;
    FPessoaCpfCnpj: string;
    FPessoaId: Integer;
    FPedidoPagamentoAme: string;
    FComplemento: string;
    FFormaPagamentoId: Integer;
    FPedidoPromocoes: TMGPedidoPromocoes;
    FBoletos: TBoletosArray;
    FCidadeNome: string;
    FValorPresente: Real;
    FTB_INSTITUTION_ID: Integer;
    FPaisNome: string;
    FPedidoSituacaoTipo: Integer;
    FGatewayPagamentoId: Integer;
    FLinkPagamento: string;
    FCodigoMarketplace: string;
    FArrayPedidoRastreio: TPedidoRastreioArray;
    FPedidoSituacao: Integer;
    FCondicaoPagamentoParcelas: Integer;
    FLojaMarketplaceNome: string;
    FPedidoTrackingUserAgent: string;
    FOrigem: Integer;
    FLojaUrlImagem: string;
    FNomeDestinatario: string;
    FDataPreVenda: TDateTime;
    FMarketplaceId: Integer;
    procedure setFArrayPedidoRastreio(const Value: TPedidoRastreioArray);
    procedure setFBairro(const Value: string);
    procedure setFBloqueios(const Value: TBloqueiosArray);
    procedure setFBoletos(const Value: TBoletosArray);
    procedure setFCashbackUtilizado(const Value: Real);
    procedure setFCep(const Value: string);
    procedure setFCidadeNome(const Value: string);
    procedure setFCodigo(const Value: string);
    procedure setFCodigoMarketplace(const Value: string);
    procedure setFCodigoSecundario(const Value: string);
    procedure setFComplemento(const Value: string);
    procedure setFCondicaoPagamentoId(const Value: Integer);
    procedure setFCondicaoPagamentoNome(const Value: string);
    procedure setFCondicaoPagamentoParcelas(const Value: Integer);
    procedure setFCreditoUtilizado(const Value: Real);
    procedure setFCuponCodigo(const Value: string);
    procedure setFCuponTipoDesconto(const Value: Integer);
    procedure setFCuponValorDesconto(const Value: Real);
    procedure setFDataHora(const Value: TDateTime);
    procedure setFDataMarketplace(const Value: TDateTime);
    procedure setFDataPreVenda(const Value: TDateTime);
    procedure setFEstadoSigla(const Value: string);
    procedure setFFormaPagamentoId(const Value: Integer);
    procedure setFFormaPagamentoNome(const Value: string);
    procedure setFFormaRecebimentoId(const Value: Integer);
    procedure setFFormaRecebimentoNome(const Value: string);
    procedure setFGatewayPagamentoId(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFId_loja(const Value: Integer);
    procedure setFLinkAvaliacao(const Value: string);
    procedure setFLinkPagamento(const Value: string);
    procedure setFLojaDoMarketplaceId(const Value: Integer);
    procedure setFLojaDoMarketplaceNome(const Value: string);
    procedure setFLojaMarketplaceId(const Value: Integer);
    procedure setFLojaMarketplaceNome(const Value: string);
    procedure setFLojaNome(const Value: string);
    procedure setFLojaUrl(const Value: string);
    procedure setFLojaUrlImagem(const Value: string);
    procedure setFMarketplaceId(const Value: Integer);
    procedure setFMarketplaceNome(const Value: string);
    procedure setFNomeDestinatario(const Value: string);
    procedure setFNumero(const Value: string);
    procedure setFOrigem(const Value: Integer);
    procedure setFPaisNome(const Value: string);
    procedure setFPedidoAnaliseRisco(const Value: String);
    procedure setFPedidoHistorico(const Value: TPedidoHistoricoArray);
    procedure setFPedidoIp(const Value: string);
    procedure setFPedidoPagamentoAme(const Value: string);
    procedure setFPedidoPagamentoPix(const Value: String);
    procedure setFPedidoPromocoes(const Value: TMGPedidoPromocoes);
    procedure setFPedidoSituacao(const Value: Integer);
    procedure setFPedidoSituacaoDescricao(const Value: string);
    procedure setFPedidoSituacaoDescricaoDetalhada(const Value: string);
    procedure setFPedidoSituacaoEtapa(const Value: Integer);
    procedure setFPedidoSituacaoTipo(const Value: Integer);
    procedure setFPedidoTrackingParams(const Value: string);
    procedure setFPedidoTrackingSource(const Value: string);
    procedure setFPedidoTrackingUserAgent(const Value: string);
    procedure setFPessoaCpfCnpj(const Value: string);
    procedure setFPessoaDataNascimento(const Value: TDateTime);
    procedure setFPessoaEmail(const Value: string);
    procedure setFPessoaId(const Value: Integer);
    procedure setFPessoaNome(const Value: string);
    procedure setFPessoaSexo(const Value: Integer);
    procedure setFPessoaTipo(const Value: Integer);
    procedure setFTags(const Value: TTagsArray);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTipoCadastroPM(const Value: Integer);
    procedure setFValorAcrescimo(const Value: Real);
    procedure setFValorDesconto(const Value: Real);
    procedure setFValorFrete(const Value: Real);
    procedure setFValorPersonalizacao(const Value: Real);
    procedure setFValorPresente(const Value: Real);
    procedure setFValorProduto(const Value: Real);
    procedure setFValorTotal(const Value: Real);
    procedure setFValorTotalFinal(const Value: Real);

  public
    constructor Create(AOwner: TComponent);Override;
    destructor Destroy;override;

    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('ID')]
    [FieldName('ID')]
    property Id: Integer read FId write setFId;

    [FieldName('ID_LOJA')]
    property IdLoja: Integer read FId_loja write setFId_loja;

    [FieldName('LOJA_NOME')]
    property LojaNome: string read FLojaNome write setFLojaNome;

    [FieldName('codigo')]
    property Codigo: string read FCodigo write setFCodigo;

    [FieldName('CODIGO_SECUNDARIO')]
    property CodigoSecundario: string read FCodigoSecundario write setFCodigoSecundario;

    [FieldName('DATA_HORA')]
    property DataHora: TDateTime read FDataHora write setFDataHora;

    [FieldName('VALOR_PRODUTO')]
    property ValorProduto: Real read FValorProduto write setFValorProduto;

    [FieldName('VALOR_FRETE')]
    property ValorFrete: Real read FValorFrete write setFValorFrete;

    [FieldName('VALOR_DESCONTO')]
    property ValorDesconto: Real read FValorDesconto write setFValorDesconto;

    [FieldName('VALOR_ACRESCIMO')]
    property ValorAcrescimo: Real read FValorAcrescimo write setFValorAcrescimo;

    [FieldName('VALOR_PRESENTE')]
    property ValorPresente: Real read FValorPresente write setFValorPresente;

    [FieldName('VALOR_TOTAL')]
    property ValorTotal: Real read FValorTotal write setFValorTotal;

    [FieldName('origem')]
    property Origem: Integer read FOrigem write setFOrigem;

    [FieldName('PEDIDO_IP')]
    property PedidoIp: string read FPedidoIp write setFPedidoIp;

    [FieldName('PESSOA_ID')]
    property PessoaId: Integer read FPessoaId write setFPessoaId;

    [FieldName('PESSOA_NOME')]
    property PessoaNome: string read FPessoaNome write setFPessoaNome;

    [FieldName('PESSOA_CPF_CNPJ')]
    property PessoaCpfCnpj: string read FPessoaCpfCnpj write setFPessoaCpfCnpj;

    [FieldName('PESSOA_EMAIL')]
    property PessoaEmail: string read FPessoaEmail write setFPessoaEmail;

    [FieldName('PESSOA_TIPO')]
    property PessoaTipo: Integer read FPessoaTipo write setFPessoaTipo;

    [FieldName('PESSOA_DATA_NASCIMENTO')]
    property PessoaDataNascimento: TDateTime read FPessoaDataNascimento write setFPessoaDataNascimento;

    [FieldName('PESSOA_SEXO')]
    property PessoaSexo: Integer read FPessoaSexo write setFPessoaSexo;

    [FieldName('FORMA_PAGAMENTO_ID')]
    property FormaPagamentoId: Integer read FFormaPagamentoId write setFFormaPagamentoId;

    [FieldName('FORMA_PAGAMENTO_NOME')]
    property FormaPagamentoNome: string read FFormaPagamentoNome write setFFormaPagamentoNome;

    [FieldName('CONDICAO_PAGAMENTO_ID')]
    property CondicaoPagamentoId: Integer read FCondicaoPagamentoId write setFCondicaoPagamentoId;

    [FieldName('CONDICAO_PAGAMENTO_NOME')]
    property CondicaoPagamentoNome: string read FCondicaoPagamentoNome write setFCondicaoPagamentoNome;

    [FieldName('CONDICAO_PAGAMENTO_PARCELAS')]
    property CondicaoPagamentoParcelas: Integer read FCondicaoPagamentoParcelas write setFCondicaoPagamentoParcelas;

    [FieldName('MARKETPLACE_ID')]
    property MarketplaceId: Integer read FMarketplaceId write setFMarketplaceId;

    [FieldName('MARKETPLACE_NOME')]
    property MarketplaceNome: string read FMarketplaceNome write setFMarketplaceNome;

    [FieldName('CODIGO_MARKETPLACE')]
    property CodigoMarketplace: string read FCodigoMarketplace write setFCodigoMarketplace;

    [FieldName('DATA_MARKETPLACE')]
    property DataMarketplace: TDateTime read FDataMarketplace write setFDataMarketplace;

    [FieldName('PEDIDO_SITUACAO')]
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;

    [FieldName('PS_ETAPA')]
    property PedidoSituacaoEtapa: Integer read FPedidoSituacaoEtapa write setFPedidoSituacaoEtapa;

    [FieldName('PS_TIPO')]
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write setFPedidoSituacaoTipo;

    [FieldName('PS_DESCRICAO')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;

    [FieldName('PS_DESCRICAO_DETALHADA')]
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;

    [FieldName('DATA_PRE_VENDA')]
    property DataPreVenda: TDateTime read FDataPreVenda write setFDataPreVenda;

    [FieldName('NOME_DESTINATARIO')]
    property NomeDestinatario: string read FNomeDestinatario write setFNomeDestinatario;

    [FieldName('LOGRADOURO')]
    property Logradouro: string read FLogradouro write setFNumero;

    [FieldName('NUMERO')]
    property Numero: string read FNumero write setFNumero;

    [FieldName('BAIRRO')]
    property Bairro: string read FBairro write setFBairro;

    [FieldName('COMPLEMENTO')]
    property Complemento: string read FComplemento write setFComplemento;

    [FieldName('CIDADE_NOME')]
    property CidadeNome: string read FCidadeNome write setFCidadeNome;

    [FieldName('ESTADO_SIGLA')]
    property EstadoSigla: string read FEstadoSigla write setFEstadoSigla;

    [FieldName('PAIS_NOME')]
    property PaisNome: string read FPaisNome write setFPaisNome;

    [FieldName('Cep')]
    property Cep: string read FCep write setFCep;

    [FieldName('PEDIDO_TRACKING_SOURCE')]
    property PedidoTrackingSource: string read FPedidoTrackingSource write setFPedidoTrackingSource;

    [FieldName('PEDIDO_TRACKING_USER_AGENT')]
    property PedidoTrackingUserAgent: string read FPedidoTrackingUserAgent write setFPedidoTrackingUserAgent;

    [FieldName('PEDIDO_TRACKING_PARAMS')]
    property PedidoTrackingParams: string read FPedidoTrackingParams write setFPedidoTrackingParams;

    [FieldName('CUPOM_CODIGO')]
    property CupomCodigo: string read FCuponCodigo write setFCuponCodigo;

    [FieldName('CUPOM_VALOR_DESCONTO')]
    property CupomValorDesconto: Real read FCuponValorDesconto write setFCuponValorDesconto;

    [FieldName('CUPOM_TIPO_DESCONTO')]
    property CupomTipoDesconto: Integer read FCuponTipoDesconto write setFCuponTipoDesconto;

    [FieldName('LOJA_DO_MARKETPLACE_ID')]
    property LojaDoMarketplaceId: Integer read FLojaDoMarketplaceId write setFLojaDoMarketplaceId;

    [FieldName('LOJA_DO_MARKETPLACE_NOME')]
    property LojaDoMarketplaceNome: string read FLojaDoMarketplaceNome write setFLojaDoMarketplaceNome;

    [FieldName('LOJA_MARKETPLACE_ID')]
    property LojaMarketplaceId: Integer read FLojaMarketplaceId write setFLojaMarketplaceId;

    [FieldName('LOJA_MARKETPLACE_NOME')]
    property LojaMarketplaceNome: string read FLojaMarketplaceNome write setFLojaMarketplaceNome;

    [FieldName('FORMA_RECEBIMENTO_ID')]
    property FormaRecebimentoId: Integer read FFormaRecebimentoId write setFFormaRecebimentoId;

    [FieldName('FORMA_RECEBIMENTO_NOME')]
    property FormaRecebimentoNome: string read FFormaRecebimentoNome write setFFormaRecebimentoNome;

    [FieldName('GATEWAY_PAGAMENTO_ID')]
    property GatewayPagamentoId: Integer read FGatewayPagamentoId write setFGatewayPagamentoId;

    [FieldName('TIPO_CADASTRO_PM')]
    property TipoCadastroPM: Integer read FTipoCadastroPM write setFTipoCadastroPM;

    [FieldName('VALOR_PERSONALIZACAO')]
    property ValorPersonalizacao: Real read FValorPersonalizacao write setFValorPersonalizacao;

    [FieldName('LOJA_URL_IMAGEM')]
    property LojaUrlImagem: string read FLojaUrlImagem write setFLojaUrlImagem;

    [FieldName('LOJA_URL')]
    property LojaUrl: string read FLojaUrl write setFLojaUrl;

    [FieldName('CREDITO_UTILIZADO')]
    property CreditoUtilizado: Real read FCreditoUtilizado write setFCreditoUtilizado;

    [FieldName('CASHBACK_UTILIZADO')]
    property CashbackUtilizado: Real read FCashbackUtilizado write setFCashbackUtilizado;

    [FieldName('PEDIDO_ANALISE_RISCO')]
    property PedidoAnaliseRisco: String read FPedidoAnaliseRisco write setFPedidoAnaliseRisco;

    [FieldName('VALOR_TOTAL_FINAL')]
    property ValorTotalFinal: Real read FValorTotalFinal write setFValorTotalFinal;

    property PedidoRastreio: TPedidoRastreioArray read FArrayPedidoRastreio write setFArrayPedidoRastreio;

    property Boletos: TBoletosArray read FBoletos write setFBoletos;

    [FieldName('PEDIDO_PAGAMENTO_PIX')]
    property PedidoPagamentoPix: String read FPedidoPagamentoPix write setFPedidoPagamentoPix;

    [FieldName('LINK_PAGAMENTO')]
    property LinkPagamento: string read FLinkPagamento write setFLinkPagamento;

    [FieldName('LINK_AVALIACAO')]
    property LinkAvaliacao: string read FLinkAvaliacao write setFLinkAvaliacao;

    [FieldName('PEDIDO_PAGAMENTO_AME')]
    property PedidoPagamentoAme: string read FPedidoPagamentoAme write setFPedidoPagamentoAme;

    property PedidoHistorico: TPedidoHistoricoArray read FPedidoHistorico write setFPedidoHistorico;

    property PedidoPromocoes: TMGPedidoPromocoes read FPedidoPromocoes write setFPedidoPromocoes;

    property Tags: TTagsArray read FTags write setFTags;

    property Bloqueios: TBloqueiosArray read FBloqueios write setFBloqueios;

  end;

implementation

{ TMGPedido }

constructor TMGPedido.create(AOwner: TComponent);
begin
  inherited create(AOwner);
  FPedidoPromocoes := TMGPedidoPromocoes.create(Self);
end;

destructor TMGPedido.Destroy;
Begin
  FPedidoPromocoes.DisposeOf;
  inherited;
end;


procedure TMGPedido.setFArrayPedidoRastreio(const Value: TPedidoRastreioArray);
begin
  FArrayPedidoRastreio := Value;
end;

procedure TMGPedido.setFBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TMGPedido.setFBloqueios(const Value: TBloqueiosArray);
begin
  FBloqueios := Value;
end;

procedure TMGPedido.setFBoletos(const Value: TBoletosArray);
begin
  FBoletos := Value;
end;

procedure TMGPedido.setFCashbackUtilizado(const Value: Real);
begin
  FCashbackUtilizado := Value;
end;

procedure TMGPedido.setFCep(const Value: string);
begin
  FCep := Value;
end;

procedure TMGPedido.setFCidadeNome(const Value: string);
begin
  FCidadeNome := Value;
end;

procedure TMGPedido.setFCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TMGPedido.setFCodigoMarketplace(const Value: string);
begin
  FCodigoMarketplace := Value;
end;

procedure TMGPedido.setFCodigoSecundario(const Value: string);
begin
  FCodigoSecundario := Value;
end;

procedure TMGPedido.setFComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TMGPedido.setFCondicaoPagamentoId(const Value: Integer);
begin
  FCondicaoPagamentoId := Value;
end;

procedure TMGPedido.setFCondicaoPagamentoNome(const Value: string);
begin
  FCondicaoPagamentoNome := Value;
end;

procedure TMGPedido.setFCondicaoPagamentoParcelas(const Value: Integer);
begin
  FCondicaoPagamentoParcelas := Value;
end;

procedure TMGPedido.setFCreditoUtilizado(const Value: Real);
begin
  FCreditoUtilizado := Value;
end;

procedure TMGPedido.setFCuponCodigo(const Value: string);
begin
  FCuponCodigo := Value;
end;

procedure TMGPedido.setFCuponTipoDesconto(const Value: Integer);
begin
  FCuponTipoDesconto := Value;
end;

procedure TMGPedido.setFCuponValorDesconto(const Value: Real);
begin
  FCuponValorDesconto := Value;
end;

procedure TMGPedido.setFDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TMGPedido.setFDataMarketplace(const Value: TDateTime);
begin
  FDataMarketplace := Value;
end;

procedure TMGPedido.setFDataPreVenda(const Value: TDateTime);
begin
  FDataPreVenda := Value;
end;

procedure TMGPedido.setFEstadoSigla(const Value: string);
begin
  FEstadoSigla := Value;
end;

procedure TMGPedido.setFFormaPagamentoId(const Value: Integer);
begin
  FFormaPagamentoId := Value;
end;

procedure TMGPedido.setFFormaPagamentoNome(const Value: string);
begin
  FFormaPagamentoNome := Value;
end;

procedure TMGPedido.setFFormaRecebimentoId(const Value: Integer);
begin
  FFormaRecebimentoId := Value;
end;

procedure TMGPedido.setFFormaRecebimentoNome(const Value: string);
begin
  FFormaRecebimentoNome := Value;
end;

procedure TMGPedido.setFGatewayPagamentoId(const Value: Integer);
begin
  FGatewayPagamentoId := Value;
end;

procedure TMGPedido.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedido.setFId_loja(const Value: Integer);
begin
  FId_loja := Value;
end;

procedure TMGPedido.setFLinkAvaliacao(const Value: string);
begin
  FLinkAvaliacao := Value;
end;

procedure TMGPedido.setFLinkPagamento(const Value: string);
begin
  FLinkPagamento := Value;
end;

procedure TMGPedido.setFLojaDoMarketplaceId(const Value: Integer);
begin
  FLojaDoMarketplaceId := Value;
end;

procedure TMGPedido.setFLojaDoMarketplaceNome(const Value: string);
begin
  FLojaDoMarketplaceNome := Value;
end;

procedure TMGPedido.setFLojaMarketplaceId(const Value: Integer);
begin
  FLojaMarketplaceId := Value;
end;

procedure TMGPedido.setFLojaMarketplaceNome(const Value: string);
begin
  FLojaMarketplaceNome := Value;
end;

procedure TMGPedido.setFLojaNome(const Value: string);
begin
  FLojaNome := Value;
end;

procedure TMGPedido.setFLojaUrl(const Value: string);
begin
  FLojaUrl := Value;
end;

procedure TMGPedido.setFLojaUrlImagem(const Value: string);
begin
  FLojaUrlImagem := Value;
end;

procedure TMGPedido.setFMarketplaceId(const Value: Integer);
begin
  FMarketplaceId := Value;
end;

procedure TMGPedido.setFMarketplaceNome(const Value: string);
begin
  FMarketplaceNome := Value;
end;

procedure TMGPedido.setFNomeDestinatario(const Value: string);
begin
  FNomeDestinatario := Value;
end;

procedure TMGPedido.setFNumero(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TMGPedido.setFOrigem(const Value: Integer);
begin
  FOrigem := Value;
end;

procedure TMGPedido.setFPaisNome(const Value: string);
begin
  FPaisNome := Value;
end;

procedure TMGPedido.setFPedidoAnaliseRisco(const Value: String);
begin
  FPedidoAnaliseRisco := Value;
end;

procedure TMGPedido.setFPedidoHistorico(const Value: TPedidoHistoricoArray);
begin
  FPedidoHistorico := Value;
end;

procedure TMGPedido.setFPedidoIp(const Value: string);
begin
  FPedidoIp := Value;
end;

procedure TMGPedido.setFPedidoPagamentoAme(const Value: string);
begin
  FPedidoPagamentoAme := Value;
end;

procedure TMGPedido.setFPedidoPagamentoPix(const Value: String);
begin
  FPedidoPagamentoPix := Value;
end;

procedure TMGPedido.setFPedidoPromocoes(const Value: TMGPedidoPromocoes);
begin
  FPedidoPromocoes := Value;
end;

procedure TMGPedido.setFPedidoSituacao(const Value: Integer);
begin
  FPedidoSituacao := Value;
end;

procedure TMGPedido.setFPedidoSituacaoDescricao(const Value: string);
begin
  FPedidoSituacaoDescricao := Value;
end;

procedure TMGPedido.setFPedidoSituacaoDescricaoDetalhada(const Value: string);
begin
  FPedidoSituacaoDescricaoDetalhada := Value;
end;

procedure TMGPedido.setFPedidoSituacaoEtapa(const Value: Integer);
begin
  FPedidoSituacaoEtapa := Value;
end;

procedure TMGPedido.setFPedidoSituacaoTipo(const Value: Integer);
begin
  FPedidoSituacaoTipo := Value;
end;

procedure TMGPedido.setFPedidoTrackingParams(const Value: string);
begin
  FPedidoTrackingParams := Value;
end;

procedure TMGPedido.setFPedidoTrackingSource(const Value: string);
begin
  FPedidoTrackingSource := Value;
end;

procedure TMGPedido.setFPedidoTrackingUserAgent(const Value: string);
begin
  FPedidoTrackingUserAgent := Value;
end;

procedure TMGPedido.setFPessoaCpfCnpj(const Value: string);
begin
  FPessoaCpfCnpj := Value;
end;

procedure TMGPedido.setFPessoaDataNascimento(const Value: TDateTime);
begin
  FPessoaDataNascimento := Value;
end;

procedure TMGPedido.setFPessoaEmail(const Value: string);
begin
  FPessoaEmail := Value;
end;

procedure TMGPedido.setFPessoaId(const Value: Integer);
begin
  FPessoaId := Value;
end;

procedure TMGPedido.setFPessoaNome(const Value: string);
begin
  FPessoaNome := Value;
end;

procedure TMGPedido.setFPessoaSexo(const Value: Integer);
begin
  FPessoaSexo := Value;
end;

procedure TMGPedido.setFPessoaTipo(const Value: Integer);
begin
  FPessoaTipo := Value;
end;

procedure TMGPedido.setFTags(const Value: TTagsArray);
begin
  FTags := Value;
end;

procedure TMGPedido.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedido.setFTipoCadastroPM(const Value: Integer);
begin
  FTipoCadastroPM := Value;
end;

procedure TMGPedido.setFValorAcrescimo(const Value: Real);
begin
  FValorAcrescimo := Value;
end;

procedure TMGPedido.setFValorDesconto(const Value: Real);
begin
  FValorDesconto := Value;
end;

procedure TMGPedido.setFValorFrete(const Value: Real);
begin
  FValorFrete := Value;
end;

procedure TMGPedido.setFValorPersonalizacao(const Value: Real);
begin
  FValorPersonalizacao := Value;
end;

procedure TMGPedido.setFValorPresente(const Value: Real);
begin
  FValorPresente := Value;
end;

procedure TMGPedido.setFValorProduto(const Value: Real);
begin
  FValorProduto := Value;
end;

procedure TMGPedido.setFValorTotal(const Value: Real);
begin
  FValorTotal := Value;
end;

procedure TMGPedido.setFValorTotalFinal(const Value: Real);
begin
  FValorTotalFinal := Value;
end;

end.
