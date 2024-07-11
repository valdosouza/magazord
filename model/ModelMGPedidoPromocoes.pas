unit ModelMGPedidoPromocoes;

interface

uses
    JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,CAtribEntity;

type
  [TableName('TB_MG_PEDIDOS_PROMOCOES')]
  TMGPedidoPromocoes = Class(TGenericEntity)
    type
      TPromocoesUtilizadas  = array of String;

  private
    FTotalPromocoesUtilizadas: Integer;
    FTotalDesconto: Real;
    FPromocoesUtilizadas: TPromocoesUtilizadas;
    FTB_MG_PEDIDO_ID: Integer;
    FTB_INSTITUTION_ID: Integer;
    procedure setFPromocoesUtilizadas(const Value: TPromocoesUtilizadas);
    procedure setFTotalDesconto(const Value: Real);
    procedure setFTotalPromocoesUtilizadas(const Value: Integer);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTB_MG_PEDIDO_ID(const Value: Integer);
  public

    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('TB_MG_PEDIDO_ID')]
    [FieldName('TB_MG_PEDIDO_ID')]
    property PedidoMagazord: Integer read FTB_MG_PEDIDO_ID write setFTB_MG_PEDIDO_ID;

    [FieldName('TOTAL_DESCONTO')]
    property TotalDesconto: Real read FTotalDesconto write setFTotalDesconto;

    [FieldName('TOTAL_PROMOCOES_UTILIZADAS')]
    property TotalPromocoesUtilizadas: Integer read FTotalPromocoesUtilizadas write setFTotalPromocoesUtilizadas;

    [FieldName('PROMOCOES_UTILIZADAS')]
    property PromocoesUtilizadas: TPromocoesUtilizadas read FPromocoesUtilizadas write setFPromocoesUtilizadas;
  end;

implementation

{ TMGPedidoPromocoes }

procedure TMGPedidoPromocoes.setFPromocoesUtilizadas(
  const Value: TPromocoesUtilizadas);
begin
  FPromocoesUtilizadas := Value;
end;

procedure TMGPedidoPromocoes.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedidoPromocoes.setFTB_MG_PEDIDO_ID(const Value: Integer);
begin
  FTB_MG_PEDIDO_ID := Value;
end;

procedure TMGPedidoPromocoes.setFTotalDesconto(const Value: Real);
begin
  FTotalDesconto := Value;
end;

procedure TMGPedidoPromocoes.setFTotalPromocoesUtilizadas(const Value: Integer);
begin
  FTotalPromocoesUtilizadas := Value;
end;

end.

