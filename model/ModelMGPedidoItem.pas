unit ModelMGPedidoItem;

interface

uses
    JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,CAtribEntity;

type
  [TableName('TB_MG_PEDIDOS_ITEM')]
  TMGPedidoItem = Class(TGenericEntity)
  private
    FValorFrete: Real;
    FMidiaName: string;
    FMidiaPath: string;
    FProdutoTitulo: string;
    FValorAcrescimo: Real;
    FValorDesconto: Real;
    FLinkProduto: string;
    FProdutoDerivacaoNome: string;
    FDescricao: string;
    FValorTransportadora: Real;
    FIsPresente: Boolean;
    FValorUnitario: Real;
    FMidiaAlt: string;
    FDepositoNome: string;
    FProdutoId: Integer;
    FId: Integer;
    FCategoria: string;
    FCodigoPai: string;
    FPedidoItemListaPresente: String;
    FDeposito: Integer;
    FMarcaNome: string;
    FCategoriaArvore: string;
    FQuantidade: Integer;
    FValorItem: Real;
    FProdutoDerivacaoCodigoKit: string;
    FProdutoDerivacaoCodigo: string;
    FEan: string;
    FAnuncioMarketplaceId: Integer;
    FProdutoNome: string;
    FMidiaTipoFile: Integer;
    FProdutoDerivacaoId: Integer;
    FCategoriaId: Integer;
    FDataPreVenda: TDateTime;
    FTB_MG_PEDIDO_ID: Integer;
    FTB_INSTITUTION_ID: Integer;
    procedure setFAnuncioMarketplaceId(const Value: Integer);
    procedure setFCategoria(const Value: string);
    procedure setFCategoriaArvore(const Value: string);
    procedure setFCategoriaId(const Value: Integer);
    procedure setFCodigoPai(const Value: string);
    procedure setFDataPreVenda(const Value: TDateTime);
    procedure setFDeposito(const Value: Integer);
    procedure setFDepositoNome(const Value: string);
    procedure setFDescricao(const Value: string);
    procedure setFEan(const Value: string);
    procedure setFId(const Value: Integer);
    procedure setFIsPresente(const Value: Boolean);
    procedure setFLinkProduto(const Value: string);
    procedure setFMarcaNome(const Value: string);
    procedure setFMidiaAlt(const Value: string);
    procedure setFMidiaName(const Value: string);
    procedure setFMidiaPath(const Value: string);
    procedure setFMidiaTipoFile(const Value: Integer);
    procedure setFPedidoItemListaPresente(const Value: String);
    procedure setFProdutoDerivacaoCodigo(const Value: string);
    procedure setFProdutoDerivacaoCodigoKit(const Value: string);
    procedure setFProdutoDerivacaoId(const Value: Integer);
    procedure setFProdutoDerivacaoNome(const Value: string);
    procedure setFProdutoId(const Value: Integer);
    procedure setFProdutoNome(const Value: string);
    procedure setFProdutoTitulo(const Value: string);
    procedure setFQuantidade(const Value: Integer);
    procedure setFValorAcrescimo(const Value: Real);
    procedure setFValorDesconto(const Value: Real);
    procedure setFValorFrete(const Value: Real);
    procedure setFValorItem(const Value: Real);
    procedure setFValorTransportadora(const Value: Real);
    procedure setFValorUnitario(const Value: Real);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTB_MG_PEDIDO_ID(const Value: Integer);

  public
    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('TB_MG_PEDIDO_ID')]
    [FieldName('TB_MG_PEDIDO_ID')]
    property PedidoMagazord: Integer read FTB_MG_PEDIDO_ID write setFTB_MG_PEDIDO_ID;

    [KeyField('ID')]
    [FieldName('Id')]
    property Id: Integer read FId write setFId;

    [FieldName('PRODUTO_DERIVACAO_ID')]
    property ProdutoDerivacaoId: Integer read FProdutoDerivacaoId write setFProdutoDerivacaoId;

    [FieldName('Descricao')]
    property Descricao: string read FDescricao write setFDescricao;

    [FieldName('Quantidade')]
    property Quantidade: Integer read FQuantidade write setFQuantidade;

    [FieldName('VALOR_UNITARIO')]
    property ValorUnitario: Real read FValorUnitario write setFValorUnitario;

    [FieldName('VALOR_DESCONTO')]
    property ValorDesconto: Real read FValorDesconto write setFValorDesconto;

    [FieldName('VALOR_ACRESCIMO')]
    property ValorAcrescimo: Real read FValorAcrescimo write setFValorAcrescimo;

    [FieldName('VALOR_ITEM')]
    property ValorItem: Real read FValorItem write setFValorItem;

    [FieldName('VALOR_FRETE')]
    property ValorFrete: Real read FValorFrete write setFValorFrete;

    [FieldName('VALOR_TRANSPORTADORA')]
    property ValorTransportadora: Real read FValorTransportadora write setFValorTransportadora;

    [FieldName('DATA_PRE_VENDA')]
    property DataPreVenda: TDateTime read FDataPreVenda write setFDataPreVenda;

    [FieldName('IS_PRESENTE')]
    property IsPresente: Boolean read FIsPresente write setFIsPresente;

    [FieldName('Deposito')]
    property Deposito: Integer read FDeposito write setFDeposito;

    [FieldName('DEPOSITO_NOME')]
    property DepositoNome: string read FDepositoNome write setFDepositoNome;

    [FieldName('PRODUTO_DERIVACAO_CODIGO')]
    property ProdutoDerivacaoCodigo: string read FProdutoDerivacaoCodigo write setFProdutoDerivacaoCodigo;

    [FieldName('CODIGO_PAI')]
    property CodigoPai: string read FCodigoPai write setFCodigoPai;

    [FieldName('PRODUTO_TITULO')]
    property ProdutoTitulo: string read FProdutoTitulo write setFProdutoTitulo;

    [FieldName('PRODUTO_ID')]
    property ProdutoId: Integer read FProdutoId write setFProdutoId;

    [FieldName('PRODUTO_NOME')]
    property ProdutoNome: string read FProdutoNome write setFProdutoNome;

    [FieldName('PRODUTO_DERIVACAO_CODIGO_KIT')]
    property ProdutoDerivacaoCodigoKit: string read FProdutoDerivacaoCodigoKit write setFProdutoDerivacaoCodigoKit;

    [FieldName('ANUNCIO_MARKETPLACE_ID')]
    property AnuncioMarketplaceId: Integer read FAnuncioMarketplaceId write setFAnuncioMarketplaceId;

    [FieldName('Ean')]
    property Ean: string read FEan write setFEan;

    [FieldName('PRODUTO_DERIVACAO_NOME')]
    property ProdutoDerivacaoNome: string read FProdutoDerivacaoNome write setFProdutoDerivacaoNome;

    [FieldName('MARCA_NOME')]
    property MarcaNome: string read FMarcaNome write setFMarcaNome;

    [FieldName('MIDIA_PATH')]
    property MidiaPath: string read FMidiaPath write setFMidiaPath;

    [FieldName('MIDIA_NAME')]
    property MidiaName: string read FMidiaName write setFMidiaName;

    [FieldName('MIDIA_ALT')]
    property MidiaAlt: string read FMidiaAlt write setFMidiaAlt;

    [FieldName('MIDIA_TIPO_FILE')]
    property MidiaTipoFile: Integer read FMidiaTipoFile write setFMidiaTipoFile;

    [FieldName('CATEGORIA_ARVORE')]
    property CategoriaArvore: string read FCategoriaArvore write setFCategoriaArvore;

    [FieldName('CATEGORIA_ID')]
    property CategoriaId: Integer read FCategoriaId write setFCategoriaId;

    [FieldName('Categoria')]
    property Categoria: string read FCategoria write setFCategoria;

    [FieldName('LINK_PRODUTO')]
    property LinkProduto: string read FLinkProduto write setFLinkProduto;

    [FieldName('PEDIDO_ITEM_LISTA_PRESENTE')]
    property PedidoItemListaPresente: String read FPedidoItemListaPresente write setFPedidoItemListaPresente;

  end;

implementation

{ TMGPedidoItem }

procedure TMGPedidoItem.setFAnuncioMarketplaceId(const Value: Integer);
begin
  FAnuncioMarketplaceId := Value;
end;

procedure TMGPedidoItem.setFCategoria(const Value: string);
begin
  FCategoria := Value;
end;

procedure TMGPedidoItem.setFCategoriaArvore(const Value: string);
begin
  FCategoriaArvore := Value;
end;

procedure TMGPedidoItem.setFCategoriaId(const Value: Integer);
begin
  FCategoriaId := Value;
end;

procedure TMGPedidoItem.setFCodigoPai(const Value: string);
begin
  FCodigoPai := Value;
end;

procedure TMGPedidoItem.setFDataPreVenda(const Value: TDateTime);
begin
  FDataPreVenda := Value;
end;

procedure TMGPedidoItem.setFDeposito(const Value: Integer);
begin
  FDeposito := Value;
end;

procedure TMGPedidoItem.setFDepositoNome(const Value: string);
begin
  FDepositoNome := Value;
end;

procedure TMGPedidoItem.setFDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TMGPedidoItem.setFEan(const Value: string);
begin
  FEan := Value;
end;

procedure TMGPedidoItem.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedidoItem.setFIsPresente(const Value: Boolean);
begin
  FIsPresente := Value;
end;

procedure TMGPedidoItem.setFLinkProduto(const Value: string);
begin
  FLinkProduto := Value;
end;

procedure TMGPedidoItem.setFMarcaNome(const Value: string);
begin
  FMarcaNome := Value;
end;

procedure TMGPedidoItem.setFMidiaAlt(const Value: string);
begin
  FMidiaAlt := Value;
end;

procedure TMGPedidoItem.setFMidiaName(const Value: string);
begin
  FMidiaName := Value;
end;

procedure TMGPedidoItem.setFMidiaPath(const Value: string);
begin
  FMidiaPath := Value;
end;

procedure TMGPedidoItem.setFMidiaTipoFile(const Value: Integer);
begin
  FMidiaTipoFile := Value;
end;

procedure TMGPedidoItem.setFPedidoItemListaPresente(const Value: String);
begin
  FPedidoItemListaPresente := Value;
end;

procedure TMGPedidoItem.setFProdutoDerivacaoCodigo(const Value: string);
begin
  FProdutoDerivacaoCodigo := Value;
end;

procedure TMGPedidoItem.setFProdutoDerivacaoCodigoKit(const Value: string);
begin
  FProdutoDerivacaoCodigoKit := Value;
end;

procedure TMGPedidoItem.setFProdutoDerivacaoId(const Value: Integer);
begin
  FProdutoDerivacaoId := Value;
end;

procedure TMGPedidoItem.setFProdutoDerivacaoNome(const Value: string);
begin
  FProdutoDerivacaoNome := Value;
end;

procedure TMGPedidoItem.setFProdutoId(const Value: Integer);
begin
  FProdutoId := Value;
end;

procedure TMGPedidoItem.setFProdutoNome(const Value: string);
begin
  FProdutoNome := Value;
end;

procedure TMGPedidoItem.setFProdutoTitulo(const Value: string);
begin
  FProdutoTitulo := Value;
end;

procedure TMGPedidoItem.setFQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TMGPedidoItem.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedidoItem.setFTB_MG_PEDIDO_ID(const Value: Integer);
begin
  FTB_MG_PEDIDO_ID := Value;
end;

procedure TMGPedidoItem.setFValorAcrescimo(const Value: Real);
begin
  FValorAcrescimo := Value;
end;

procedure TMGPedidoItem.setFValorDesconto(const Value: Real);
begin
  FValorDesconto := Value;
end;

procedure TMGPedidoItem.setFValorFrete(const Value: Real);
begin
  FValorFrete := Value;
end;

procedure TMGPedidoItem.setFValorItem(const Value: Real);
begin
  FValorItem := Value;
end;

procedure TMGPedidoItem.setFValorTransportadora(const Value: Real);
begin
  FValorTransportadora := Value;
end;

procedure TMGPedidoItem.setFValorUnitario(const Value: Real);
begin
  FValorUnitario := Value;
end;

end.
