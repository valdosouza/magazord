unit ModelMGPedido;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections, ModelMGPedidoHistorico,
  ModelMGPedidoPromocoes, ModelMGPedidoRastreio;

type
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
    FPedidoAnaliseRisco: Boolean;
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
    procedure setFPedidoAnaliseRisco(const Value: Boolean);
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
    constructor create;
    destructor Destroy;

    [FieldName('ID')]
    property Id: Integer read FId write setFId;

    [FieldName('id_loja')]
    property IdLoja: Integer read FId_loja write setFId_loja;

    [FieldName('lojaNome')]
    property LojaNome: string read FLojaNome write setFLojaNome;

    [FieldName('codigo')]
    property Codigo: string read FCodigo write setFCodigo;

    [FieldName('codigoSecundario')]
    property CodigoSecundario: string read FCodigoSecundario write setFCodigoSecundario;

    [FieldName('dataHora')]
    property DataHora: TDateTime read FDataHora write setFDataHora;

    [FieldName('valorProduto')]
    property ValorProduto: Real read FValorProduto write setFValorProduto;

    [FieldName('valorFrete')]
    property ValorFrete: Real read FValorFrete write setFValorFrete;

    [FieldName('valorDesconto')]
    property ValorDesconto: Real read FValorDesconto write setFValorDesconto;

    [FieldName('valorAcrescimo')]
    property ValorAcrescimo: Real read FValorAcrescimo write setFValorAcrescimo;

    [FieldName('valorPresente')]
    property ValorPresente: Real read FValorPresente write setFValorPresente;

    [FieldName('valorTotal')]
    property ValorTotal: Real read FValorTotal write setFValorTotal;

    [FieldName('origem')]
    property Origem: Integer read FOrigem write setFOrigem;

    [FieldName('pedidoIp')]
    property PedidoIp: string read FPedidoIp write setFPedidoIp;

    [FieldName('pessoaId')]
    property PessoaId: Integer read FPessoaId write setFPessoaId;

    [FieldName('pessoaNome')]
    property PessoaNome: string read FPessoaNome write setFPessoaNome;

    [FieldName('pessoaCpfCnpj')]
    property PessoaCpfCnpj: string read FPessoaCpfCnpj write setFPessoaCpfCnpj;

    [FieldName('pessoaEmail')]
    property PessoaEmail: string read FPessoaEmail write setFPessoaEmail;

    [FieldName('pessoaTipo')]
    property PessoaTipo: Integer read FPessoaTipo write setFPessoaTipo;

    [FieldName('pessoaDataNascimento')]
    property PessoaDataNascimento: TDateTime read FPessoaDataNascimento write setFPessoaDataNascimento;

    [FieldName('pessoaSexo')]
    property PessoaSexo: Integer read FPessoaSexo write setFPessoaSexo;

    [FieldName('formaPagamentoId')]
    property FormaPagamentoId: Integer read FFormaPagamentoId write setFFormaPagamentoId;

    [FieldName('formaPagamentoNome')]
    property FormaPagamentoNome: string read FFormaPagamentoNome write setFFormaPagamentoNome;

    [FieldName('condicaoPagamentoId')]
    property CondicaoPagamentoId: Integer read FCondicaoPagamentoId write setFCondicaoPagamentoId;

    [FieldName('condicaoPagamentoNome')]
    property CondicaoPagamentoNome: string read FCondicaoPagamentoNome write setFCondicaoPagamentoNome;

    [FieldName('condicaoPagamentoParcelas')]
    property CondicaoPagamentoParcelas: Integer read FCondicaoPagamentoParcelas write setFCondicaoPagamentoParcelas;

    [FieldName('marketplaceId')]
    property MarketplaceId: Integer read FMarketplaceId write setFMarketplaceId;

    [FieldName('marketplaceNome')]
    property MarketplaceNome: string read FMarketplaceNome write setFMarketplaceNome;

    [FieldName('codigoMarketplace')]
    property CodigoMarketplace: string read FCodigoMarketplace write setFCodigoMarketplace;

    [FieldName('dataMarketplace')]
    property DataMarketplace: TDateTime read FDataMarketplace write setFDataMarketplace;

    [FieldName('pedidoSituacao')]
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;

    [FieldName('pedidoSituacaoEtapa')]
    property PedidoSituacaoEtapa: Integer read FPedidoSituacaoEtapa write setFPedidoSituacaoEtapa;

    [FieldName('pedidoSituacaoTipo')]
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write setFPedidoSituacaoTipo;

    [FieldName('pedidoSituacaoDescricao')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;

    [FieldName('pedidoSituacaoDescricaoDetalhada')]
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;

    [FieldName('DataPreVenda')]
    property DataPreVenda: TDateTime read FDataPreVenda write setFDataPreVenda;

    [FieldName('NomeDestinatario')]
    property NomeDestinatario: string read FNomeDestinatario write setFNomeDestinatario;

    [FieldName('Logradouro')]
    property Logradouro: string read FLogradouro write setFNumero;

    [FieldName('Numero')]
    property Numero: string read FNumero write setFNumero;

    [FieldName('Bairro')]
    property Bairro: string read FBairro write setFBairro;

    [FieldName('Complemento')]
    property Complemento: string read FComplemento write setFComplemento;

    [FieldName('CidadeNome')]
    property CidadeNome: string read FCidadeNome write setFCidadeNome;

    [FieldName('EstadoSigla')]
    property EstadoSigla: string read FEstadoSigla write setFEstadoSigla;

    [FieldName('PaisNome')]
    property PaisNome: string read FPaisNome write setFPaisNome;

    [FieldName('Cep')]
    property Cep: string read FCep write setFCep;

    [FieldName('PedidoTrackingSource')]
    property PedidoTrackingSource: string read FPedidoTrackingSource write setFPedidoTrackingSource;

    [FieldName('PedidoTrackingUserAgent')]
    property PedidoTrackingUserAgent: string read FPedidoTrackingUserAgent write setFPedidoTrackingUserAgent;

    [FieldName('PedidoTrackingParams')]
    property PedidoTrackingParams: string read FPedidoTrackingParams write setFPedidoTrackingParams;

    [FieldName('CupomCodigo')]
    property CupomCodigo: string read FCuponCodigo write setFCuponCodigo;

    [FieldName('CupomValorDesconto')]
    property CupomValorDesconto: Real read FCuponValorDesconto write setFCuponValorDesconto;

    [FieldName('CupomTipoDesconto')]
    property CupomTipoDesconto: Integer read FCuponTipoDesconto write setFCuponTipoDesconto;

    [FieldName('LojaDoMarketplaceId')]
    property LojaDoMarketplaceId: Integer read FLojaDoMarketplaceId write setFLojaDoMarketplaceId;

    [FieldName('LojaDoMarketplaceNome')]
    property LojaDoMarketplaceNome: string read FLojaDoMarketplaceNome write setFLojaDoMarketplaceNome;

    [FieldName('LojaMarketplaceId')]
    property LojaMarketplaceId: Integer read FLojaMarketplaceId write setFLojaMarketplaceId;

    [FieldName('LojaMarketplaceNome')]
    property LojaMarketplaceNome: string read FLojaMarketplaceNome write setFLojaMarketplaceNome;

    [FieldName('FormaRecebimentoId')]
    property FormaRecebimentoId: Integer read FFormaRecebimentoId write setFFormaRecebimentoId;

    [FieldName('FormaRecebimentoNome')]
    property FormaRecebimentoNome: string read FFormaRecebimentoNome write setFFormaRecebimentoNome;

    [FieldName('GatewayPagamentoId')]
    property GatewayPagamentoId: Integer read FGatewayPagamentoId write setFGatewayPagamentoId;

    [FieldName('TipoCadastroPM')]
    property TipoCadastroPM: Integer read FTipoCadastroPM write setFTipoCadastroPM;

    [FieldName('ValorPersonalizacao')]
    property ValorPersonalizacao: Real read FValorPersonalizacao write setFValorPersonalizacao;

    [FieldName('LojaUrlImagem')]
    property LojaUrlImagem: string read FLojaUrlImagem write setFLojaUrlImagem;

    [FieldName('LojaUrl')]
    property LojaUrl: string read FLojaUrl write setFLojaUrl;

    [FieldName('CreditoUtilizado')]
    property CreditoUtilizado: Real read FCreditoUtilizado write setFCreditoUtilizado;

    [FieldName('CashbackUtilizado')]
    property CashbackUtilizado: Real read FCashbackUtilizado write setFCashbackUtilizado;

    [FieldName('PedidoAnaliseRisco')]
    property PedidoAnaliseRisco: Boolean read FPedidoAnaliseRisco write setFPedidoAnaliseRisco;

    [FieldName('ValorTotalFinal')]
    property ValorTotalFinal: Real read FValorTotalFinal write setFValorTotalFinal;

    [FieldName('ArrayPedidoRastreio')]
    property ArrayPedidoRastreio: TPedidoRastreioArray read FArrayPedidoRastreio write setFArrayPedidoRastreio;

    [FieldName('Boletos')]
    property Boletos: TBoletosArray read FBoletos write setFBoletos;

    [FieldName('PedidoPagamentoPix')]
    property PedidoPagamentoPix: String read FPedidoPagamentoPix write setFPedidoPagamentoPix;

    [FieldName('LinkPagamento')]
    property LinkPagamento: string read FLinkPagamento write setFLinkPagamento;

    [FieldName('LinkAvaliacao')]
    property LinkAvaliacao: string read FLinkAvaliacao write setFLinkAvaliacao;

    [FieldName('PedidoPagamentoAme')]
    property PedidoPagamentoAme: string read FPedidoPagamentoAme write setFPedidoPagamentoAme;

    [FieldName('PedidoHistorico')]
    property PedidoHistorico: TPedidoHistoricoArray read FPedidoHistorico write setFPedidoHistorico;

    [FieldName('PedidoPromocoes')]
    property PedidoPromocoes: TMGPedidoPromocoes read FPedidoPromocoes write setFPedidoPromocoes;

    [FieldName('Tags')]
    property Tags: TTagsArray read FTags write setFTags;

    [FieldName('Bloqueios')]
    property Bloqueios: TBloqueiosArray read FBloqueios write setFBloqueios;

  end;

implementation

{ TMGPedido }

constructor TMGPedido.create;
begin

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

procedure TMGPedido.setFPedidoAnaliseRisco(const Value: Boolean);
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
