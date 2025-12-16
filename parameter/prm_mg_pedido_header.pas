unit prm_mg_pedido_header;

interface

uses prm_base,ModelMGPedidoHeader, System.SysUtils, System.Classes;

Type
  TPrmMGPedidoHeader = class(TPrmBase)
  private
    FFieldName: TMGPedidoHeader;
    FIntegrado: String;
    procedure setFFieldName(const Value: TMGPedidoHeader);
    procedure setFIntegrado(const Value: String);
  public
    constructor Create;override;
    destructor Destroy;override;
    property FieldName : TMGPedidoHeader read FFieldName write setFFieldName;
    property Integrado : String read FIntegrado write setFIntegrado;
  end;

implementation

{ TPrmMGPedidoHeader }

constructor TPrmMGPedidoHeader.Create;
begin
  inherited;
  FieldName := TMGPedidoHeader.Create;
end;

destructor TPrmMGPedidoHeader.Destroy;
begin
  FreeAndNil(FFieldName);
  inherited;
end;

procedure TPrmMGPedidoHeader.setFFieldName(const Value: TMGPedidoHeader);
begin
  FFieldName := Value;
end;

procedure TPrmMGPedidoHeader.setFIntegrado(const Value: String);
begin
  FIntegrado := Value;
end;

end.
