unit ModelMGPedidoPromocoes;

interface

uses
    JSON.Types, TEntity, System.Classes, System.Generics.Collections;

type
  TMGPedidoPromocoes = Class(TGenericEntity)
    type
      TPromocoesUtilizadas  = array of String;

  private
    FTotalPromocoesUtilizadas: Integer;
    FTotalDesconto: Real;
    FPromocoesUtilizadas: TPromocoesUtilizadas;
    procedure setFPromocoesUtilizadas(const Value: TPromocoesUtilizadas);
    procedure setFTotalDesconto(const Value: Real);
    procedure setFTotalPromocoesUtilizadas(const Value: Integer);


  public
    [FieldName('TotalDesconto')]
    property TotalDesconto: Real read FTotalDesconto write setFTotalDesconto;

    [FieldName('TotalPromocoesUtilizadas')]
    property TotalPromocoesUtilizadas: Integer read FTotalPromocoesUtilizadas write setFTotalPromocoesUtilizadas;

    [FieldName('PromocoesUtilizadas')]
    property PromocoesUtilizadas: TPromocoesUtilizadas read FPromocoesUtilizadas write setFPromocoesUtilizadas;
  end;

implementation

{ TMGPedidoPromocoes }

procedure TMGPedidoPromocoes.setFPromocoesUtilizadas(
  const Value: TPromocoesUtilizadas);
begin
  FPromocoesUtilizadas := Value;
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

