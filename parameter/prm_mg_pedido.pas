unit prm_mg_pedido;

interface

uses prm_base,ModelMGPedido, System.SysUtils, System.Classes;

Type
  TPrmMGPedido = class(TPrmBase)
  private
    FFieldName: TMGPedido;
    procedure setFFieldName(const Value: TMGPedido);
  public
    constructor Create();override;
    destructor Destroy;override;

    property FieldName : TMGPedido read FFieldName write setFFieldName;
  end;

implementation

{ TPrmMGPedido }

constructor TPrmMGPedido.Create();
begin
  inherited;
  FFieldName := TMGPedido.Create;
end;

destructor TPrmMGPedido.Destroy;
begin

  inherited;
end;

procedure TPrmMGPedido.setFFieldName(const Value: TMGPedido);
begin
  FFieldName := Value;
end;

end.
