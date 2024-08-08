unit prm_mg_pedido_boleto;

interface

uses prm_base,ModelMGPedidoBoleto, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoboleto = class(TPrmBase)
  private
    FFieldName: TMGPedidoBoleto;
    procedure setFFieldName(const Value: TMGPedidoBoleto);

  public
    constructor Create();override;
    destructor Destroy;override;

    property FieldName : TMGPedidoBoleto read FFieldName write setFFieldName;
  end;

implementation

{ TPrmMGPedidoboleto }

constructor TPrmMGPedidoboleto.Create;
begin
  inherited;
  FFieldName := TMGPedidoBoleto.Create;
end;

destructor TPrmMGPedidoboleto.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrmMGPedidoboleto.setFFieldName(const Value: TMGPedidoBoleto);
begin
  FFieldName := Value;
end;

end.
