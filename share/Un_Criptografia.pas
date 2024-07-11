unit Un_Criptografia;

interface

uses IdCoder, IdCoder3to4, IdCoderMIME, jpeg, SysUtils;

function Fc_Base64Encode(const Text : String): String;
function Fc_Base64Decode(const Text : String): String;


implementation



function Fc_Base64Decode(const Text : String): String;
var
  Decoder : TIdDecoderMime;
begin
  Decoder := TIdDecoderMime.Create(nil);
  try
    Result := Decoder.DecodeString(Text);
  finally
    FreeAndNil(Decoder)
  end
end;

function Fc_Base64Encode(const Text : String): String;
var
  Encoder : TIdEncoderMime;
begin
  Encoder := TIdEncoderMime.Create(nil);
  try
    Result := Encoder.EncodeString(Text);
  finally
    FreeAndNil(Encoder);
  end
end;



end.
