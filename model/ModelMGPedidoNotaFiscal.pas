unit ModelMGPedidoNotaFiscal;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,CAtribEntity;


type
  [TableName('TB_MG_PEDIDOS_NOTA_FISCAL')]
  TMGPedidoNotaFiscal = Class(TGenericEntity)
  private
    FId: Integer;
    FNumero: Integer;
    FValorTotal: Real;
    FDataEmissao: TDateTime;
    FSituacao: Integer;
    FPedidoRastreioId: Integer;
    FCfopCodigo: Integer;
    FSerieLegal: string;
    FTipo: Integer;
    FChave: string;
    FSituacaoDescricao: string;
    FTB_MG_PEDIDO_ID: Integer;
    FTB_INSTITUTION_ID: Integer;
    procedure setFCfopCodigo(const Value: Integer);
    procedure setFChave(const Value: string);
    procedure setFDataEmissao(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFNumero(const Value: Integer);
    procedure setFPedidoRastreioId(const Value: Integer);
    procedure setFSerieLegal(const Value: string);
    procedure setFSituacao(const Value: Integer);
    procedure setFSituacaoDescricao(const Value: string);
    procedure setFTipo(const Value: Integer);
    procedure setFValorTotal(const Value: Real);
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

    [FieldName('Numero')]
    property Numero: Integer read FNumero write setFNumero;

    [FieldName('SERIE_LEGAL')]
    property SerieLegal: string read FSerieLegal write setFSerieLegal;

    [FieldName('DATA_EMISSAO')]
    property DataEmissao: TDateTime read FDataEmissao write setFDataEmissao;

    [FieldName('CHAVE')]
    property Chave: string read FChave write setFChave;

    [FieldName('VALOR_TOTAL')]
    property ValorTotal: Real read FValorTotal write setFValorTotal;

    [FieldName('Situacao')]
    property Situacao: Integer read FSituacao write setFSituacao;

    [FieldName('Tipo')]
    property Tipo: Integer read FTipo write setFTipo;

    [FieldName('CFOP_CODIGO')]
    property CfopCodigo: Integer read FCfopCodigo write setFCfopCodigo;

    [FieldName('SITUACAO_DESCRICAO')]
    property SituacaoDescricao: string read FSituacaoDescricao write setFSituacaoDescricao;

    [FieldName('PEDIDO_RASTREIO_ID')]
    property PedidoRastreioId: Integer read FPedidoRastreioId write setFPedidoRastreioId;

  end;

implementation

{ TMGPedidoNotaFiscal }

procedure TMGPedidoNotaFiscal.setFCfopCodigo(const Value: Integer);
begin
  FCfopCodigo := Value;
end;

procedure TMGPedidoNotaFiscal.setFChave(const Value: string);
begin
  FChave := Value;
end;

procedure TMGPedidoNotaFiscal.setFDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TMGPedidoNotaFiscal.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedidoNotaFiscal.setFNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TMGPedidoNotaFiscal.setFPedidoRastreioId(const Value: Integer);
begin
  FPedidoRastreioId := Value;
end;

procedure TMGPedidoNotaFiscal.setFSerieLegal(const Value: string);
begin
  FSerieLegal := Value;
end;

procedure TMGPedidoNotaFiscal.setFSituacao(const Value: Integer);
begin
  FSituacao := Value;
end;

procedure TMGPedidoNotaFiscal.setFSituacaoDescricao(const Value: string);
begin
  FSituacaoDescricao := Value;
end;

procedure TMGPedidoNotaFiscal.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedidoNotaFiscal.setFTB_MG_PEDIDO_ID(const Value: Integer);
begin
  FTB_MG_PEDIDO_ID := Value;
end;

procedure TMGPedidoNotaFiscal.setFTipo(const Value: Integer);
begin
  FTipo := Value;
end;

procedure TMGPedidoNotaFiscal.setFValorTotal(const Value: Real);
begin
  FValorTotal := Value;
end;

end.
