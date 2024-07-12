unit prm_mg_pedido_rastreio;

interface

uses prm_base,ModelMGPedidoRastreio, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoRastreio = class(TPrmBase)
  private
    FFieldName: TMGPedidoRastreio;
    procedure setFFieldName(const Value: TMGPedidoRastreio);

  public
    constructor Create();override;
    destructor Destroy;override;

    property FieldName : TMGPedidoRastreio read FFieldName write setFFieldName;
  end;


implementation

{ TPrmMGPedidoRastreio }

constructor TPrmMGPedidoRastreio.Create();
begin
  inherited;
    FFieldName := TMGPedidoRastreio.Create;
end;

destructor TPrmMGPedidoRastreio.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedidoRastreio.setFFieldName(const Value: TMGPedidoRastreio);
begin
  FFieldName := Value;
end;

end.
