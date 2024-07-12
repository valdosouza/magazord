unit prm_mg_pedido_promocoes;

interface

uses prm_base,ModelMGPedidoPromocoes, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoPromocoes = class(TPrmBase)
  private
    FFieldName: TMGPedidoPromocoes;
    procedure setFFieldName(const Value: TMGPedidoPromocoes);

  public
    constructor Create();override;
    destructor Destroy;override;

    property FieldName : TMGPedidoPromocoes read FFieldName write setFFieldName;
  end;

implementation

{ TPrmMGPedidoPromocoes }

constructor TPrmMGPedidoPromocoes.Create();
begin
  inherited;
  FFieldName := TMGPedidoPromocoes.Create;
end;

destructor TPrmMGPedidoPromocoes.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedidoPromocoes.setFFieldName(const Value: TMGPedidoPromocoes);
begin
  FFieldName := Value;
end;

end.
