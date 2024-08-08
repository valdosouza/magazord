unit ModelMGPedidoTrackingParams;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,System.SysUtils,
  ModelMGPedidoHeader;

type
  TMGPedidoTrackingParams = Class(TComponent)
  private
    Fpe: String;
    FDispositivo: String;
    FStart_buy: String;
    procedure setFDispositivo(const Value: String);
    procedure setFpe(const Value: String);
    procedure setFStart_buy(const Value: String);


  public
    property start_buy : String read FStart_buy write setFStart_buy;
    property pe : String read Fpe write setFpe;
    property dispositivo : String read FDispositivo write setFDispositivo;
  End;

implementation

{ TMGPedidoTrackingParams }

procedure TMGPedidoTrackingParams.setFDispositivo(const Value: String);
begin
  FDispositivo := Value;
end;

procedure TMGPedidoTrackingParams.setFpe(const Value: String);
begin
  Fpe := Value;
end;

procedure TMGPedidoTrackingParams.setFStart_buy(const Value: String);
begin
  FStart_buy := Value;
end;

end.
