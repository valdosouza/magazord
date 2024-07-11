unit ModelMGPedidoHeader;

interface

uses
  Classes, GenericEntity,CAtribEntity, System.SysUtils;

type
  [TableName('TB_MG_PEDIDOS_HEADER')]
  TMGPedidoHeader = Class(TGenericEntity)
  private
    FCondicaoPagamentoNome: string;
    FPessoaNome: string;
    FValorFrete: Double;
    FLojaId: Integer;
    FFormaRecebimentoId: Integer;
    FLojaDoMarketplaceId: Integer;
    FFormaPagamentoNome: string;
    FDataHora: String;
    FValorProduto: Double;
    FPedidoSituacaoDescricao: string;
    FValorAcrescimo: Double;
    FValorDesconto: Double;
    FCodigo: string;
    FFormaRecebimentoNome: string;
    FLojaDoMarketplaceNome: string;
    FId: Integer;
    FValorTotal: Double;
    FCondicaoPagamentoId: Integer;
    FPessoaCpfCnpj: string;
    FPessoaId: Integer;
    FFormaPagamentoId: Integer;
    FTB_INSTITUTION_ID: Integer;
    FPedidoSituacaoTipo: Integer;
    FCodigoMarketplace: string;
    FPedidoSituacao: Integer;

  public

    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write FTB_INSTITUTION_ID;

    [KeyField('ID')]
    [FieldName('id')]
    property Id: Integer read FId write FId;

    [FieldName('codigo')]
    property Codigo: string read FCodigo write FCodigo;

    [FieldName('CODIGO_MARKETPLACE')]
    property CodigoMarketplace: string read FCodigoMarketplace write FCodigoMarketplace;

    [FieldName('DATA_HORA')]
    property DataHora: String read FDataHora write FDataHora;

    [FieldName('VALOR_PRODUTO')]
    property ValorProduto: Double read FValorProduto write FValorProduto;

    [FieldName('VALOR_FRETE')]
    property ValorFrete: Double read FValorFrete write FValorFrete;

    [FieldName('VALOR_DESCONTO')]
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;

    [FieldName('VALOR_ACRESCIMO')]
    property ValorAcrescimo: Double read FValorAcrescimo write FValorAcrescimo;

    [FieldName('VALOR_TOTAL')]
    property ValorTotal: Double read FValorTotal write FValorTotal;

    [FieldName('PESSOA_ID')]
    property PessoaId: Integer read FPessoaId write FPessoaId;

    [FieldName('PESSOA_NOME')]
    property PessoaNome: string read FPessoaNome write FPessoaNome;

    [FieldName('PESSOA_CPF_CNPJ')]
    property PessoaCpfCnpj: string read FPessoaCpfCnpj write FPessoaCpfCnpj;

    [FieldName('FORMA_PAGAMENTO_ID')]
    property FormaPagamentoId: Integer read FFormaPagamentoId write FFormaPagamentoId;

    [FieldName('FORMA_PAGAMENTO_NOME')]
    property FormaPagamentoNome: string read FFormaPagamentoNome write FFormaPagamentoNome;

    [FieldName('FORMA_RECEBIMENTO_ID')]
    property FormaRecebimentoId: Integer read FFormaRecebimentoId write FFormaRecebimentoId;

    [FieldName('FORMA_RECEBIMENTO_NOME')]
    property FormaRecebimentoNome: string read FFormaRecebimentoNome write FFormaRecebimentoNome;

    [FieldName('CONDICAO_PAGAMENTO_ID')]
    property CondicaoPagamentoId: Integer read FCondicaoPagamentoId write FCondicaoPagamentoId;

    [FieldName('CONDICAO_PAGAMENTO_NOME')]
    property CondicaoPagamentoNome: string read FCondicaoPagamentoNome write FCondicaoPagamentoNome;

    [FieldName('PEDIDO_SITUACAO')]
    property PedidoSituacao: Integer read FPedidoSituacao write FPedidoSituacao;

    [FieldName('PEDIDO_SITUACAO_DESCRICAO')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write FPedidoSituacaoDescricao;

    [FieldName('PEDIDO_SITUACAO_TIPO')]
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write FPedidoSituacaoTipo;

    [FieldName('LOJA_ID')]
    property LojaId: Integer read FLojaId write FLojaId;

    [FieldName('LOJA_DO_MARKETPLACE_ID')]
    property LojaDoMarketplaceId: Integer read FLojaDoMarketplaceId write FLojaDoMarketplaceId;

    [FieldName('LOJA_DO_MARKETPLACE_NOME')]
    property LojaDoMarketplaceNome: string read FLojaDoMarketplaceNome write FLojaDoMarketplaceNome;
  end;

implementation


end.

