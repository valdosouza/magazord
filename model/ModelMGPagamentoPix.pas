unit ModelMGPagamentoPix;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections;

type
  TMGPagamentoPix = Class(TGenericEntity)
  private
    Fvalor: String;
    FqrCodeAsImageBase64: String;
    procedure setFqrCodeAsImageBase64(const Value: String);
    procedure setFvalor(const Value: String);
  public
    property valor: String read Fvalor write setFvalor;
    property qrCodeAsImageBase64: String read FqrCodeAsImageBase64 write setFqrCodeAsImageBase64;
  End;



implementation


{ TMGPagamentoPix }

procedure TMGPagamentoPix.setFqrCodeAsImageBase64(const Value: String);
begin
  FqrCodeAsImageBase64 := Value;
end;

procedure TMGPagamentoPix.setFvalor(const Value: String);
begin
  Fvalor := Value;
end;

end.
