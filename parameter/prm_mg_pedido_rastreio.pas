unit prm_mg_pedido_rastreio;

interface

uses prm_base,ModelMGPedidoRastreio, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoRastreio = class(TPrmBase)
  private
    FFieldName: TMGPedidoRastreio;
    procedure setFFieldName(const Value: TMGPedidoRastreio);

  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;

    property FieldName : TMGPedidoRastreio read FFieldName write setFFieldName;
  end;


implementation

{ TPrmMGPedidoRastreio }

constructor TPrmMGPedidoRastreio.Create(AOwner: TComponent);
begin
  inherited;
    FFieldName := TMGPedidoRastreio.Create(Self);
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
