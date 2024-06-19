unit ModelMGPedidoPromocoes;

interface

uses
    JSON.Types, TEntity, System.Classes, System.Generics.Collections;

type
  TMGPedidoPromocoes = Class(TGenericEntity)
  private
    FTotalPromocoesUtilizadas: Integer;
    FTotalDesconto: Double;
    FPromocoesUtilizadas: TList<TStringList>;
    procedure setFPromocoesUtilizadas(const Value: TList<TStringList>);
    procedure setFTotalDesconto(const Value: Double);
    procedure setFTotalPromocoesUtilizadas(const Value: Integer);

  public
    property TotalDesconto: Double read FTotalDesconto write setFTotalDesconto;
    property TotalPromocoesUtilizadas: Integer read FTotalPromocoesUtilizadas write setFTotalPromocoesUtilizadas;
    property PromocoesUtilizadas: TList<TStringList> read FPromocoesUtilizadas write setFPromocoesUtilizadas;
  end;

implementation

{ TMGPedidoPromocoes }

{ TMGPedidoPromocoes }

procedure TMGPedidoPromocoes.setFPromocoesUtilizadas(
  const Value: TList<TStringList>);
begin
  FPromocoesUtilizadas := Value;
end;

procedure TMGPedidoPromocoes.setFTotalDesconto(const Value: Double);
begin
  FTotalDesconto := Value;
end;

procedure TMGPedidoPromocoes.setFTotalPromocoesUtilizadas(const Value: Integer);
begin
  FTotalPromocoesUtilizadas := Value;
end;

end.

