unit ModelMGPedidoRastreio;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections,
  ModelMGPedidoHistorico,ModelMGPedidoNotaFiscal,ModelMGPedidoItem;

type

  TMGPedidoRastreio = Class(TGenericEntity)
      type
      TPedidoItemArray = array of TMGPedidoItem;
      TPedidoNotaFiscalItemArray = array of TMGPedidoNotaFiscal;
  private
    FTransportadoraCodigoRastreioInterno: Boolean;
    FValorFrete: string;
    FTransportadoraNome: string;
    FTransportadoraTipo: Integer;
    FLojistaNome: string;
    FPedidoSituacaoDescricao: string;
    FValorFreteTransportadora: string;
    FTransportadoraServicoTipo: Integer;
    FPedidoRastreioHistorico: String;
    FLink: string;
    FTransportadoraTextoEntrega: string;
    FDataLimiteEntregaCliente: TDateTime;
    FCodigoRastreio: string;
    FPedidoSituacaoDescricaoDetalhada: string;
    FId: Integer;
    FPedidoNotaFiscal: TPedidoNotaFiscalItemArray;
    FTransportadoraAgenciaCodigoServico: string;
    FPedidoSituacaoEtapa: Integer;
    FDataLimitePostagem: TDateTime;
    FDiasUteis: Integer;
    FTransportadoraId: Integer;
    FSituacao: Integer;
    FTransportadoraServicoDescricao: string;
    FPedidoSituacaoTipo: Integer;
    FPedidoItem: TPedidoItemArray;
    FPedidoLojistaCodigo: string;
    FTransportadoraServicoOpcoes: TStringList;
    FTransportadoraServicoId: Integer;
    FPedidoSituacao: Integer;
    FTransportadoraAgenciaNome: string;
    procedure setFCodigoRastreio(const Value: string);
    procedure setFDataLimiteEntregaCliente(const Value: TDateTime);
    procedure setFDataLimitePostagem(const Value: TDateTime);
    procedure setFDiasUteis(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFLink(const Value: string);
    procedure setFLojistaNome(const Value: string);
    procedure setFPedidoItem(const Value: TPedidoItemArray);
    procedure setFPedidoLo(const Value: string);
    procedure setFPedidoNotaFiscal(const Value: TPedidoNotaFiscalItemArray);
    procedure setFPedidoRastreioHistorico(const Value: String);
    procedure setFPedidoSituacao(const Value: Integer);
    procedure setFPedidoSituacaoDescricao(const Value: string);
    procedure setFPedidoSituacaoDescricaoDetalhada(const Value: string);
    procedure setFPedidoSituacaoEtapa(const Value: Integer);
    procedure setFPedidoSituacaoTipo(const Value: Integer);
    procedure setFSituacao(const Value: Integer);
    procedure setFTransportadoraAgenciaCodigoServico(const Value: string);
    procedure setFTransportadoraAgenciaNome(const Value: string);
    procedure setFTransportadoraCodigoRastreioInterno(const Value: Boolean);
    procedure setFTransportadoraId(const Value: Integer);
    procedure setFTransportadoraNome(const Value: string);
    procedure setFTransportadoraServicoDescricao(const Value: string);
    procedure setFTransportadoraServicoId(const Value: Integer);
    procedure setFTransportadoraServicoOpcoes(const Value: TStringList);
    procedure setFTransportadoraServicoTipo(const Value: Integer);
    procedure setFTransportadoraTextoEntrega(const Value: string);
    procedure setFTransportadoraTipo(const Value: Integer);
    procedure setFValorFrete(const Value: string);
    procedure setFValorFreteTransportadora(const Value: string);

  public
    property Id: Integer read FId write setFId;
    property ValorFrete: string read FValorFrete write setFValorFrete;
    property ValorFreteTransportadora: string read FValorFreteTransportadora write setFValorFreteTransportadora;
    property DiasUteis: Integer read FDiasUteis write setFDiasUteis;
    property CodigoRastreio: string read FCodigoRastreio write setFCodigoRastreio;
    property Link: string read FLink write setFLink;
    property DataLimiteEntregaCliente: TDateTime read FDataLimiteEntregaCliente write setFDataLimiteEntregaCliente;
    property DataLimitePostagem: TDateTime read FDataLimitePostagem write setFDataLimitePostagem;
    property Situacao: Integer read FSituacao write setFSituacao;
    property TransportadoraServicoId: Integer read FTransportadoraServicoId write setFTransportadoraServicoId;
    property TransportadoraServicoOpcoes: TStringList read FTransportadoraServicoOpcoes write setFTransportadoraServicoOpcoes;
    property TransportadoraServicoTipo: Integer read FTransportadoraServicoTipo write setFTransportadoraServicoTipo;
    property TransportadoraServicoDescricao: string read FTransportadoraServicoDescricao write setFTransportadoraServicoDescricao;
    property TransportadoraTextoEntrega: string read FTransportadoraTextoEntrega write setFTransportadoraTextoEntrega;
    property TransportadoraAgenciaNome: string read FTransportadoraAgenciaNome write setFTransportadoraAgenciaNome;
    property TransportadoraAgenciaCodigoServico: string read FTransportadoraAgenciaCodigoServico write setFTransportadoraAgenciaCodigoServico;
    property TransportadoraId: Integer read FTransportadoraId write setFTransportadoraId;
    property TransportadoraNome: string read FTransportadoraNome write setFTransportadoraNome;
    property TransportadoraTipo: Integer read FTransportadoraTipo write setFTransportadoraTipo;
    property TransportadoraCodigoRastreioInterno: Boolean read FTransportadoraCodigoRastreioInterno write setFTransportadoraCodigoRastreioInterno;
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;
    property PedidoSituacaoEtapa: Integer read FPedidoSituacaoEtapa write setFPedidoSituacaoEtapa;
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write setFPedidoSituacaoTipo;
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;
    property PedidoLojistaCodigo: string read FPedidoLojistaCodigo write setFPedidoLo;
    property LojistaNome: string read FLojistaNome write setFLojistaNome;
    property PedidoItem: TPedidoItemArray read FPedidoItem write setFPedidoItem;
    property PedidoNotaFiscal: TPedidoNotaFiscalItemArray read FPedidoNotaFiscal write setFPedidoNotaFiscal;
    property PedidoRastreioHistorico: String read FPedidoRastreioHistorico write setFPedidoRastreioHistorico;
  end;

implementation


{ TMGPedidoRastreio }

procedure TMGPedidoRastreio.setFCodigoRastreio(const Value: string);
begin
  FCodigoRastreio := Value;
end;

procedure TMGPedidoRastreio.setFDataLimiteEntregaCliente(
  const Value: TDateTime);
begin
  FDataLimiteEntregaCliente := Value;
end;

procedure TMGPedidoRastreio.setFDataLimitePostagem(const Value: TDateTime);
begin
  FDataLimitePostagem := Value;
end;

procedure TMGPedidoRastreio.setFDiasUteis(const Value: Integer);
begin
  FDiasUteis := Value;
end;

procedure TMGPedidoRastreio.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedidoRastreio.setFLink(const Value: string);
begin
  FLink := Value;
end;

procedure TMGPedidoRastreio.setFLojistaNome(const Value: string);
begin
  FLojistaNome := Value;
end;

procedure TMGPedidoRastreio.setFPedidoItem(const Value: TPedidoItemArray);
begin
  FPedidoItem := Value;
end;

procedure TMGPedidoRastreio.setFPedidoLo(const Value: string);
begin
  FPedidoLojistaCodigo := Value;
end;

procedure TMGPedidoRastreio.setFPedidoNotaFiscal(
  const Value: TPedidoNotaFiscalItemArray);
begin
  FPedidoNotaFiscal := Value;
end;

procedure TMGPedidoRastreio.setFPedidoRastreioHistorico(const Value: String);
begin
  FPedidoRastreioHistorico := Value;
end;

procedure TMGPedidoRastreio.setFPedidoSituacao(const Value: Integer);
begin
  FPedidoSituacao := Value;
end;

procedure TMGPedidoRastreio.setFPedidoSituacaoDescricao(const Value: string);
begin
  FPedidoSituacaoDescricao := Value;
end;

procedure TMGPedidoRastreio.setFPedidoSituacaoDescricaoDetalhada(
  const Value: string);
begin
  FPedidoSituacaoDescricaoDetalhada := Value;
end;

procedure TMGPedidoRastreio.setFPedidoSituacaoEtapa(const Value: Integer);
begin
  FPedidoSituacaoEtapa := Value;
end;

procedure TMGPedidoRastreio.setFPedidoSituacaoTipo(const Value: Integer);
begin
  FPedidoSituacaoTipo := Value;
end;

procedure TMGPedidoRastreio.setFSituacao(const Value: Integer);
begin
  FSituacao := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraAgenciaCodigoServico(
  const Value: string);
begin
  FTransportadoraAgenciaCodigoServico := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraAgenciaNome(const Value: string);
begin
  FTransportadoraAgenciaNome := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraCodigoRastreioInterno(
  const Value: Boolean);
begin
  FTransportadoraCodigoRastreioInterno := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraId(const Value: Integer);
begin
  FTransportadoraId := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraNome(const Value: string);
begin
  FTransportadoraNome := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraServicoDescricao(
  const Value: string);
begin
  FTransportadoraServicoDescricao := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraServicoId(const Value: Integer);
begin
  FTransportadoraServicoId := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraServicoOpcoes(
  const Value: TStringList);
begin
  FTransportadoraServicoOpcoes := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraServicoTipo(const Value: Integer);
begin
  FTransportadoraServicoTipo := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraTextoEntrega(const Value: string);
begin
  FTransportadoraTextoEntrega := Value;
end;

procedure TMGPedidoRastreio.setFTransportadoraTipo(const Value: Integer);
begin
  FTransportadoraTipo := Value;
end;

procedure TMGPedidoRastreio.setFValorFrete(const Value: string);
begin
  FValorFrete := Value;
end;

procedure TMGPedidoRastreio.setFValorFreteTransportadora(const Value: string);
begin
  FValorFreteTransportadora := Value;
end;

end.

