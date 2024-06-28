unit ModelMGPedidoHeader;

interface

uses
  Classes;

type
  TMGPedidoHeader = class
  private
    FCondicaoPagamentoNome: string;
    FPessoaNome: string;
    FValorFrete: Double;
    FLojaId: Integer;
    FFormaRecebimentoId: Integer;
    FLojaDoMarketplaceId: Integer;
    FFormaPagamentoNome: string;
    FDataHora: TDateTime;
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
    FPedidoSituacaoTipo: Integer;
    FCodigoMarketplace: string;
    FPedidoSituacao: Integer;
  public
    [FieldName('id')]
    property Id: Integer read FId write FId;

    [FieldName('codigo')]
    property Codigo: string read FCodigo write FCodigo;

    [FieldName('codigoMarketplace')]
    property CodigoMarketplace: string read FCodigoMarketplace write FCodigoMarketplace;

    [FieldName('dataHora')]
    property DataHora: TDateTime read FDataHora write FDataHora;

    [FieldName('valorProduto')]
    property ValorProduto: Double read FValorProduto write FValorProduto;

    [FieldName('valorFrete')]
    property ValorFrete: Double read FValorFrete write FValorFrete;

    [FieldName('valorDesconto')]
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;

    [FieldName('valorAcrescimo')]
    property ValorAcrescimo: Double read FValorAcrescimo write FValorAcrescimo;

    [FieldName('valorTotal')]
    property ValorTotal: Double read FValorTotal write FValorTotal;

    [FieldName('pessoaId')]
    property PessoaId: Integer read FPessoaId write FPessoaId;

    [FieldName('pessoaNome')]
    property PessoaNome: string read FPessoaNome write FPessoaNome;

    [FieldName('pessoaCpfCnpj')]
    property PessoaCpfCnpj: string read FPessoaCpfCnpj write FPessoaCpfCnpj;

    [FieldName('formaPagamentoId')]
    property FormaPagamentoId: Integer read FFormaPagamentoId write FFormaPagamentoId;

    [FieldName('formaPagamentoNome')]
    property FormaPagamentoNome: string read FFormaPagamentoNome write FFormaPagamentoNome;

    [FieldName('formaRecebimentoId')]
    property FormaRecebimentoId: Integer read FFormaRecebimentoId write FFormaRecebimentoId;

    [FieldName('formaRecebimentoNome')]
    property FormaRecebimentoNome: string read FFormaRecebimentoNome write FFormaRecebimentoNome;

    [FieldName('condicaoPagamentoId')]
    property CondicaoPagamentoId: Integer read FCondicaoPagamentoId write FCondicaoPagamentoId;

    [FieldName('condicaoPagamentoNome')]
    property CondicaoPagamentoNome: string read FCondicaoPagamentoNome write FCondicaoPagamentoNome;

    [FieldName('pedidoSituacao')]
    property PedidoSituacao: Integer read FPedidoSituacao write FPedidoSituacao;

    [FieldName('pedidoSituacaoDescricao')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write FPedidoSituacaoDescricao;

    [FieldName('pedidoSituacaoTipo')]
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write FPedidoSituacaoTipo;

    [FieldName('lojaId')]
    property LojaId: Integer read FLojaId write FLojaId;

    [FieldName('lojaDoMarketplaceId')]
    property LojaDoMarketplaceId: Integer read FLojaDoMarketplaceId write FLojaDoMarketplaceId;

    [FieldName('lojaDoMarketplaceNome')]
    property LojaDoMarketplaceNome: string read FLojaDoMarketplaceNome write FLojaDoMarketplaceNome;
  end;

implementation

end.

