unit ModelMGPedidoItem;

interface

uses
    JSON.Types, TEntity, System.Classes, System.Generics.Collections;

type
  TMGPedidoItem = Class(TGenericEntity)
  private
    FValorFrete: Double;
    FMidiaName: string;
    FMidiaPath: string;
    FProdutoTitulo: string;
    FValorAcrescimo: Double;
    FValorDesconto: Double;
    FLinkProduto: string;
    FProdutoDerivacaoNome: string;
    FDescricao: string;
    FValorTransportadora: Double;
    FIsPresente: Boolean;
    FValorUnitario: Double;
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
    FValorItem: Double;
    FProdutoDerivacaoCodigoKit: string;
    FProdutoDerivacaoCodigo: string;
    FEan: string;
    FAnuncioMarketplaceId: Integer;
    FProdutoNome: string;
    FMidiaTipoFile: Integer;
    FProdutoDerivacaoId: Integer;
    FCategoriaId: Integer;
    FDataPreVenda: TDateTime;
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
    procedure setFValorAcrescimo(const Value: Double);
    procedure setFValorDesconto(const Value: Double);
    procedure setFValorFrete(const Value: Double);
    procedure setFValorItem(const Value: Double);
    procedure setFValorTransportadora(const Value: Double);
    procedure setFValorUnitario(const Value: Double);

  public
    property Id: Integer read FId write setFId;
    property ProdutoDerivacaoId: Integer read FProdutoDerivacaoId write setFProdutoDerivacaoId;
    property Descricao: string read FDescricao write setFDescricao;
    property Quantidade: Integer read FQuantidade write setFQuantidade;
    property ValorUnitario: Double read FValorUnitario write setFValorUnitario;
    property ValorDesconto: Double read FValorDesconto write setFValorDesconto;
    property ValorAcrescimo: Double read FValorAcrescimo write setFValorAcrescimo;
    property ValorItem: Double read FValorItem write setFValorItem;
    property ValorFrete: Double read FValorFrete write setFValorFrete;
    property ValorTransportadora: Double read FValorTransportadora write setFValorTransportadora;
    property DataPreVenda: TDateTime read FDataPreVenda write setFDataPreVenda;
    property IsPresente: Boolean read FIsPresente write setFIsPresente;
    property Deposito: Integer read FDeposito write setFDeposito;
    property DepositoNome: string read FDepositoNome write setFDepositoNome;
    property ProdutoDerivacaoCodigo: string read FProdutoDerivacaoCodigo write setFProdutoDerivacaoCodigo;
    property CodigoPai: string read FCodigoPai write setFCodigoPai;
    property ProdutoTitulo: string read FProdutoTitulo write setFProdutoTitulo;
    property ProdutoId: Integer read FProdutoId write setFProdutoId;
    property ProdutoNome: string read FProdutoNome write setFProdutoNome;
    property ProdutoDerivacaoCodigoKit: string read FProdutoDerivacaoCodigoKit write setFProdutoDerivacaoCodigoKit;
    property AnuncioMarketplaceId: Integer read FAnuncioMarketplaceId write setFAnuncioMarketplaceId;
    property Ean: string read FEan write setFEan;
    property ProdutoDerivacaoNome: string read FProdutoDerivacaoNome write setFProdutoDerivacaoNome;
    property MarcaNome: string read FMarcaNome write setFMarcaNome;
    property MidiaPath: string read FMidiaPath write setFMidiaPath;
    property MidiaName: string read FMidiaName write setFMidiaName;
    property MidiaAlt: string read FMidiaAlt write setFMidiaAlt;
    property MidiaTipoFile: Integer read FMidiaTipoFile write setFMidiaTipoFile;
    property CategoriaArvore: string read FCategoriaArvore write setFCategoriaArvore;
    property CategoriaId: Integer read FCategoriaId write setFCategoriaId;
    property Categoria: string read FCategoria write setFCategoria;
    property LinkProduto: string read FLinkProduto write setFLinkProduto;
    property PedidoItemListaPresente: String read FPedidoItemListaPresente write setFPedidoItemListaPresente;
  end;

implementation

{ TMGPedidoItem }

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

procedure TMGPedidoItem.setFValorAcrescimo(const Value: Double);
begin
  FValorAcrescimo := Value;
end;

procedure TMGPedidoItem.setFValorDesconto(const Value: Double);
begin
  FValorDesconto := Value;
end;

procedure TMGPedidoItem.setFValorFrete(const Value: Double);
begin
  FValorFrete := Value;
end;

procedure TMGPedidoItem.setFValorItem(const Value: Double);
begin
  FValorItem := Value;
end;

procedure TMGPedidoItem.setFValorTransportadora(const Value: Double);
begin
  FValorTransportadora := Value;
end;

procedure TMGPedidoItem.setFValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

end.
