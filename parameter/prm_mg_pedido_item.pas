unit prm_mg_pedido_item;

interface

uses prm_base,ModelMGPedidoItem, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoItem = class(TPrmBase)
  private
    FFieldName: TMGPedidoItem;
    procedure setFFieldName(const Value: TMGPedidoItem);

  public
    constructor Create();override;
    destructor Destroy;override;

    property FieldName : TMGPedidoItem read FFieldName write setFFieldName;
  end;

implementation

{ TPrmMGPedidoItem }

constructor TPrmMGPedidoItem.Create();
begin
  inherited;
  FFieldName := TMGPedidoItem.Create;
end;

destructor TPrmMGPedidoItem.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedidoItem.setFFieldName(const Value: TMGPedidoItem);
begin
  FFieldName := Value;
end;

end.
