unit ModelMGPedidoRastreio;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,CAtribEntity,
  ModelMGPedidoHistorico,ModelMGPedidoNotaFiscal,ModelMGPedidoItem;

type
  [TableName('TB_MG_PEDIDOS_RASTREIO')]
  TMGPedidoRastreio = Class(TGenericEntity)
      type
      TPedidoItemArray = array of TMGPedidoItem;
      TPedidoNotaFiscalArray = array of TMGPedidoNotaFiscal;
  private
    FTransportadoraCodigoRastreioInterno: Boolean;
    FValorFrete: string;
    FTransportadoraNome: string;
    FTransportadoraTipo: Integer;
    FLojistaNome: string;
    FPedidoSituacaoDescricao: string;
    FValorFreteTransportadora: string;
    FTransportadoraServicoTipo: Integer;

    FLink: string;
    FTransportadoraTextoEntrega: string;
    FDataLimiteEntregaCliente: String;
    FCodigoRastreio: string;
    FPedidoSituacaoDescricaoDetalhada: string;
    FId: Integer;
    FPedidoNotaFiscal: TPedidoNotaFiscalArray;
    FTransportadoraAgenciaCodigoServico: string;
    FPedidoSituacaoEtapa: Integer;
    FDataLimitePostagem: String;
    FDiasUteis: Integer;
    FTransportadoraId: Integer;
    FSituacao: Integer;
    FTransportadoraServicoDescricao: string;
    FTB_INSTITUTION_ID: Integer;
    FPedidoSituacaoTipo: Integer;
    FPedidoItem: TPedidoItemArray;
    FPedidoLojistaCodigo: string;
    FTransportadoraServicoOpcoes: String;
    FTransportadoraServicoId: Integer;
    FPedidoSituacao: Integer;
    FTransportadoraAgenciaNome: string;
    procedure setFCodigoRastreio(const Value: string);
    procedure setFDataLimiteEntregaCliente(const Value: String);
    procedure setFDataLimitePostagem(const Value: String);
    procedure setFDiasUteis(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFLink(const Value: string);
    procedure setFLojistaNome(const Value: string);
    procedure setFPedidoItem(const Value: TPedidoItemArray);
    procedure setFPedidoLo(const Value: string);
    procedure setFPedidoNotaFiscal(const Value: TPedidoNotaFiscalArray);

    procedure setFPedidoSituacao(const Value: Integer);
    procedure setFPedidoSituacaoDescricao(const Value: string);
    procedure setFPedidoSituacaoDescricaoDetalhada(const Value: string);
    procedure setFPedidoSituacaoEtapa(const Value: Integer);
    procedure setFPedidoSituacaoTipo(const Value: Integer);
    procedure setFSituacao(const Value: Integer);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTransportadoraAgenciaCodigoServico(const Value: string);
    procedure setFTransportadoraAgenciaNome(const Value: string);
    procedure setFTransportadoraCodigoRastreioInterno(const Value: Boolean);
    procedure setFTransportadoraId(const Value: Integer);
    procedure setFTransportadoraNome(const Value: string);
    procedure setFTransportadoraServicoDescricao(const Value: string);
    procedure setFTransportadoraServicoId(const Value: Integer);
    procedure setFTransportadoraServicoOpcoes(const Value: String);
    procedure setFTransportadoraServicoTipo(const Value: Integer);
    procedure setFTransportadoraTextoEntrega(const Value: string);
    procedure setFTransportadoraTipo(const Value: Integer);
    procedure setFValorFrete(const Value: string);
    procedure setFValorFreteTransportadora(const Value: string);

  public

    procedure setArrayPedidoItem(i:Integer);
    procedure setArrayPedidoNotaFiscalItem(i:Integer);

    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('ID')]
    [FieldName('Id')]
    property Id: Integer read FId write setFId;

    [FieldName('VALOR_FRETE')]
    property ValorFrete: string read FValorFrete write setFValorFrete;

    [FieldName('VALOR_FRETE_TRANSPORTADORA')]
    property ValorFreteTransportadora: string read FValorFreteTransportadora write setFValorFreteTransportadora;

    [FieldName('DIAS_UTEIS')]
    property DiasUteis: Integer read FDiasUteis write setFDiasUteis;

    [FieldName('CODIGO_RASTREIO')]
    property CodigoRastreio: string read FCodigoRastreio write setFCodigoRastreio;

    [FieldName('Link')]
    property Link: string read FLink write setFLink;

    [FieldName('DATA_LIMITE_ENTREGA_CLIENTE')]
    property DataLimiteEntregaCliente: String read FDataLimiteEntregaCliente write setFDataLimiteEntregaCliente;

    [FieldName('DATA_LIMITE_POSTAGEM')]
    property DataLimitePostagem: String read FDataLimitePostagem write setFDataLimitePostagem;

    [FieldName('Situacao')]
    property Situacao: Integer read FSituacao write setFSituacao;

    [FieldName('TRP_SERVICO_ID')]
    property TransportadoraServicoId: Integer read FTransportadoraServicoId write setFTransportadoraServicoId;

    [FieldName('TRP_SERVICO_OPCOES')]
    property TransportadoraServicoOpcoes: String read FTransportadoraServicoOpcoes write setFTransportadoraServicoOpcoes;

    [FieldName('TRP_SERVICO_TIPO')]
    property TransportadoraServicoTipo: Integer read FTransportadoraServicoTipo write setFTransportadoraServicoTipo;

    [FieldName('TRP_SERVICO_DESCRICAO')]
    property TransportadoraServicoDescricao: string read FTransportadoraServicoDescricao write setFTransportadoraServicoDescricao;

    [FieldName('TRP_TEXTO_ENTREGA')]
    property TransportadoraTextoEntrega: string read FTransportadoraTextoEntrega write setFTransportadoraTextoEntrega;

    [FieldName('TRP_AGENCIA_NOME')]
    property TransportadoraAgenciaNome: string read FTransportadoraAgenciaNome write setFTransportadoraAgenciaNome;

    [FieldName('TRP_AGENCIA_CODIGO_SERVICO')]
    property TransportadoraAgenciaCodigoServico: string read FTransportadoraAgenciaCodigoServico write setFTransportadoraAgenciaCodigoServico;

    [FieldName('TRP_ID')]
    property TransportadoraId: Integer read FTransportadoraId write setFTransportadoraId;

    [FieldName('TRP_NOME')]
    property TransportadoraNome: string read FTransportadoraNome write setFTransportadoraNome;

    [FieldName('TRP_TIPO')]
    property TransportadoraTipo: Integer read FTransportadoraTipo write setFTransportadoraTipo;

    [FieldName('TRP_CODIGO_RASTREIO_INTERNO')]
    property TransportadoraCodigoRastreioInterno: Boolean read FTransportadoraCodigoRastreioInterno write setFTransportadoraCodigoRastreioInterno;

    [FieldName('PEDIDO_SITUACAO')]
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;

    [FieldName('PS_ETAPA')]
    property PedidoSituacaoEtapa: Integer read FPedidoSituacaoEtapa write setFPedidoSituacaoEtapa;

    [FieldName('PS_TIPO')]
    property PedidoSituacaoTipo: Integer read FPedidoSituacaoTipo write setFPedidoSituacaoTipo;

    [FieldName('PS_DESCRICAO')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;

    [FieldName('PS_DESCRICAO_DETALHADA')]
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;

    [FieldName('PEDIDO_LOJISTA_CODIGO')]
    property PedidoLojistaCodigo: string read FPedidoLojistaCodigo write setFPedidoLo;

    [FieldName('LOJISTA_NOME')]
    property LojistaNome: string read FLojistaNome write setFLojistaNome;

    property PedidoItem: TPedidoItemArray read FPedidoItem write setFPedidoItem;

    property PedidoNotaFiscal: TPedidoNotaFiscalArray read FPedidoNotaFiscal write setFPedidoNotaFiscal;

//    [FieldName('PEDIDO_RASTREIO_HISTORICO')]
//    property PedidoRastreioHistorico: String read FPedidoRastreioHistorico write setFPedidoRastreioHistorico;

  end;

implementation


{ TMGPedidoRastreio }


procedure TMGPedidoRastreio.setArrayPedidoItem(i: Integer);
begin
  SetLength(FPedidoItem,I);
end;

procedure TMGPedidoRastreio.setArrayPedidoNotaFiscalItem(i: Integer);
begin
  SetLength(FPedidoNotaFiscal,I);
end;


procedure TMGPedidoRastreio.setFCodigoRastreio(const Value: string);
begin
  FCodigoRastreio := Value;
end;

procedure TMGPedidoRastreio.setFDataLimiteEntregaCliente(const Value: String);
begin
  FDataLimiteEntregaCliente := Value;
end;

procedure TMGPedidoRastreio.setFDataLimitePostagem(const Value: String);
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
  const Value: TPedidoNotaFiscalArray);
begin
  FPedidoNotaFiscal := Value;
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

procedure TMGPedidoRastreio.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
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
  const Value: String);
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

