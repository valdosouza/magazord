unit ModelMGPedidoRetorno;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections, ModelMGPedidoHistorico,
  ModelMGPedidoPromocoes, ModelMGPedidoRastreio, ModelMGPedido,CAtribEntity,
  System.SysUtils;

type
  TMGPedidoRetorno = Class(TGenericEntity)
  private
    Fstatus: String;
    Fdata: TMGPedido;
    procedure setFdata(const Value: TMGPedido);
    procedure setFstatus(const Value: String);

  public
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;

    property status :String read FStatus write setFStatus;
    property data : TMGPedido read FData write setFData;
  End;

  implementation

{ TMGPedidoRetorno }

constructor TMGPedidoRetorno.create;
begin
  inherited;
  Fdata:= TMGPedido.create(self);
end;

destructor TMGPedidoRetorno.Destroy;
begin
  FData.DisposeOf;
  inherited;
end;

procedure TMGPedidoRetorno.setFdata(const Value: TMGPedido);
begin
  Fdata := Value;
end;

procedure TMGPedidoRetorno.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

end.
