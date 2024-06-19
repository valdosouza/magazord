unit ModelMGPedidoNotaFiscal;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections;


type
  TMGPedidoNotaFiscal = Class(TGenericEntity)
  private
    FId: Integer;
    FNumero: Integer;
    FValorTotal: Double;
    FDataEmissao: TDateTime;
    FSituacao: Integer;
    FPedidoRastreioId: Integer;
    FCfopCodigo: Integer;
    FSerieLegal: string;
    FTipo: Integer;
    FChave: string;
    FSituacaoDescricao: string;
    procedure setFCfopCodigo(const Value: Integer);
    procedure setFChave(const Value: string);
    procedure setFDataEmissao(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFNumero(const Value: Integer);
    procedure setFPedidoRastreioId(const Value: Integer);
    procedure setFSerieLegal(const Value: string);
    procedure setFSituacao(const Value: Integer);
    procedure setFSituacaoDescricao(const Value: string);
    procedure setFTipo(const Value: Integer);
    procedure setFValorTotal(const Value: Double);

  public
    property Id: Integer read FId write setFId;
    property Numero: Integer read FNumero write setFNumero;
    property SerieLegal: string read FSerieLegal write setFSerieLegal;
    property DataEmissao: TDateTime read FDataEmissao write setFDataEmissao;
    property Chave: string read FChave write setFChave;
    property ValorTotal: Double read FValorTotal write setFValorTotal;
    property Situacao: Integer read FSituacao write setFSituacao;
    property Tipo: Integer read FTipo write setFTipo;
    property CfopCodigo: Integer read FCfopCodigo write setFCfopCodigo;
    property SituacaoDescricao: string read FSituacaoDescricao write setFSituacaoDescricao;
    property PedidoRastreioId: Integer read FPedidoRastreioId write setFPedidoRastreioId;
  end;

implementation

{ TMGPedidoNotaFiscal }

{ TMGPedidoNotaFiscal }

procedure TMGPedidoNotaFiscal.setFCfopCodigo(const Value: Integer);
begin
  FCfopCodigo := Value;
end;

procedure TMGPedidoNotaFiscal.setFChave(const Value: string);
begin
  FChave := Value;
end;

procedure TMGPedidoNotaFiscal.setFDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TMGPedidoNotaFiscal.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedidoNotaFiscal.setFNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TMGPedidoNotaFiscal.setFPedidoRastreioId(const Value: Integer);
begin
  FPedidoRastreioId := Value;
end;

procedure TMGPedidoNotaFiscal.setFSerieLegal(const Value: string);
begin
  FSerieLegal := Value;
end;

procedure TMGPedidoNotaFiscal.setFSituacao(const Value: Integer);
begin
  FSituacao := Value;
end;

procedure TMGPedidoNotaFiscal.setFSituacaoDescricao(const Value: string);
begin
  FSituacaoDescricao := Value;
end;

procedure TMGPedidoNotaFiscal.setFTipo(const Value: Integer);
begin
  FTipo := Value;
end;

procedure TMGPedidoNotaFiscal.setFValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
