unit ModelMGPedidoHeaderRetorno;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections,System.SysUtils,
  ModelMGPedidoHeader;

type
  TMGPedidoHeaderDataRetorno = Class(TGenericEntity)
    type
      TListaPedidosArray  = array of TMGPedidoHeader;
  private
    FItems: TListaPedidosArray;
    procedure setFItems(const Value: TListaPedidosArray);
    public
    property Items : TListaPedidosArray read FItems write setFItems;
  End;

  TMGPedidoHeaderRetorno = Class(TGenericEntity)
    type
      TListaPedidosArray  = array of TMGPedidoHeader;
  private
    FStatus: String;
    FData: TMGPedidoHeaderDataRetorno;
    procedure setFData(const Value: TMGPedidoHeaderDataRetorno);
    procedure setFStatus(const Value: String);

  public
    constructor create;
    destructor Destroy;

    property status :String read FStatus write setFStatus;
    property data : TMGPedidoHeaderDataRetorno read FData write setFData;
  End;

  implementation


{ TMGPedidoHeaderDataRetorno }

procedure TMGPedidoHeaderDataRetorno.setFItems(const Value: TListaPedidosArray);
begin
  FItems := Value;
end;


{ TMGPedidoHeaderRetorno }

constructor TMGPedidoHeaderRetorno.create;
begin

end;

destructor TMGPedidoHeaderRetorno.Destroy;
begin

end;

procedure TMGPedidoHeaderRetorno.setFData(
  const Value: TMGPedidoHeaderDataRetorno);
begin
  FData := Value;
end;

procedure TMGPedidoHeaderRetorno.setFStatus(const Value: String);
begin
  FStatus := Value;
end;

end.
