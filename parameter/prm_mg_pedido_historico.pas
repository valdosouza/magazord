unit prm_mg_pedido_historico;

interface

uses prm_base,ModelMGPedidoHistorico, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoHistorico = class(TPrmBase)
  private
    FFieldName: TMGPedidoHistorico;
    procedure setFFieldName(const Value: TMGPedidoHistorico);

  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;

    property FieldName : TMGPedidoHistorico read FFieldName write setFFieldName;
  end;


implementation

{ TPrmMGPedidoHistorico }

constructor TPrmMGPedidoHistorico.Create(AOwner: TComponent);
begin
  inherited;
    FFieldName := TMGPedidoHistorico.Create(Self);
end;

destructor TPrmMGPedidoHistorico.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedidoHistorico.setFFieldName(const Value: TMGPedidoHistorico);
begin
  FFieldName := Value;
end;

end.
