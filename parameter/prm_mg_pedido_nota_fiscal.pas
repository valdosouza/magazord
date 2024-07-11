unit prm_mg_pedido_nota_fiscal;

interface

uses prm_base,ModelMGPedidoItem, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoNotaFiscal = class(TPrmBase)
  private
    FFieldName: TMGPedidoItem;
    procedure setFFieldName(const Value: TMGPedidoItem);

  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;

    property FieldName : TMGPedidoItem read FFieldName write setFFieldName;
  end;

implementation

{ TPrmMGPedid0NotaFiscal }

constructor TPrmMGPedidoNotaFiscal.Create(AOwner: TComponent);
begin
  inherited;
  FFieldName := TMGPedidoItem.Create(self);
end;

destructor TPrmMGPedidoNotaFiscal.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedidoNotaFiscal.setFFieldName(const Value: TMGPedidoItem);
begin
  FFieldName := Value;
end;

end.
