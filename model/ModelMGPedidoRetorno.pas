unit ModelMGPedidoRetorno;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections, ModelMGPedidoHistorico,
  ModelMGPedidoPromocoes, ModelMGPedidoRastreio, ModelMGPedido,
  System.SysUtils;

type
  TMGPedidoRetorno = Class(TGenericEntity)
  private
    Fstatus: String;
    Fdata: TMGPedido;
    procedure setFdata(const Value: TMGPedido);
    procedure setFstatus(const Value: String);

  public
    constructor create;
    destructor Destroy;

    property status :String read FStatus write setFStatus;
    property data : TMGPedido read FData write setFData;
  End;

  implementation

{ TMGPedidoRetorno }

constructor TMGPedidoRetorno.create;
begin

  Fdata:= TMGPedido.Create;
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
