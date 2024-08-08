unit ModelMGPedidoBoleto;

interface

uses
  JSON.Types, GenericEntity, System.Classes, CAtribEntity, System.SysUtils;

type
  [TableName('TB_MG_PEDIDOS_BOLETO')]
  TMGPedidoBoleto = Class(TGenericEntity)
  private
    FValor: Real;
    FDataVencimento: TDate;
    FPedidoCodigo: string;
    FCodigoBarra: string;
    FSituacao: String;
    FDataHoraEmissao: TDateTime;
    FUrl: string;
    FDescricaoSituacao: string;
    FTB_MG_PEDIDO_ID: Integer;
    FTB_INSTITUTION_ID: Integer;
    procedure setFCodigoBarra(const Value: string);
    procedure setFDataHoraEmissao(const Value: TDateTime);
    procedure setFDataVencimento(const Value: TDate);
    procedure setFDescricaoSituacao(const Value: string);
    procedure setFPedidoCodigo(const Value: string);
    procedure setFSituacao(const Value: String);
    procedure setFUrl(const Value: string);
    procedure setFValor(const Value: Real);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTB_MG_PEDIDO_ID(const Value: Integer);
  public
    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('TB_MG_PEDIDO_ID')]
    [FieldName('TB_MG_PEDIDO_ID')]
    property PedidoMagazord: Integer read FTB_MG_PEDIDO_ID write setFTB_MG_PEDIDO_ID;

    [FieldName('VALOR')]
    property Valor: Real read FValor write setFValor;

    [FieldName('DATA_HORA_EMISSAO')]
    property DataHoraEmissao: TDateTime read FDataHoraEmissao write setFDataHoraEmissao;

    [FieldName('DATA_VENCIMENTO')]
    property DataVencimento: TDate read FDataVencimento write setFDataVencimento;

    [FieldName('URL')]
    property Url: string read FUrl write setFUrl;

    [FieldName('SITUACAO')]
    property Situacao: String read FSituacao write setFSituacao;

    [FieldName('CODIGO_BARRA')]
    property CodigoBarra: string read FCodigoBarra write setFCodigoBarra;

    [FieldName('DESCRICAO_SITUACAO')]
    property DescricaoSituacao: string read FDescricaoSituacao write setFDescricaoSituacao;

    [FieldName('PEDIDO_CODIGO')]
    property PedidoCodigo: string read FPedidoCodigo write setFPedidoCodigo;
  End;

implementation

{ TMGPedidoBoleto }

procedure TMGPedidoBoleto.setFCodigoBarra(const Value: string);
begin
  FCodigoBarra := Value;
end;

procedure TMGPedidoBoleto.setFDataHoraEmissao(const Value: TDateTime);
begin
  FDataHoraEmissao := Value;
end;

procedure TMGPedidoBoleto.setFDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TMGPedidoBoleto.setFDescricaoSituacao(const Value: string);
begin
  FDescricaoSituacao := Value;
end;

procedure TMGPedidoBoleto.setFPedidoCodigo(const Value: string);
begin
  FPedidoCodigo := Value;
end;

procedure TMGPedidoBoleto.setFSituacao(const Value: String);
begin
  FSituacao := Value;
end;

procedure TMGPedidoBoleto.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedidoBoleto.setFTB_MG_PEDIDO_ID(const Value: Integer);
begin
  FTB_MG_PEDIDO_ID := Value;
end;

procedure TMGPedidoBoleto.setFUrl(const Value: string);
begin
  FUrl := Value;
end;

procedure TMGPedidoBoleto.setFValor(const Value: Real);
begin
  FValor := Value;
end;

end.

