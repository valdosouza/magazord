unit ModelMGPedidoHistorico;

interface

uses
  JSON.Types, GenericEntity, System.Classes, System.Generics.Collections,CAtribEntity;

type
  [TableName('TB_MG_PEDIDOS_HISTORICO')]
  TMGPedidoHistorico = Class(TGenericEntity)
  private
    FDataHora: TDateTime;
    FPedidoSituacaoDescricao: string;
    FPedidoSituacaoDescricaoDetalhada: string;
    FId: Integer;
    FSituacao: Integer;
    FNomeUsuario: string;
    FPedidoRastreioId: string;
    FTipoUsuario: string;
    FEtapa: Integer;
    FTipo: Integer;
    FPedidoSituacao: Integer;
    FTB_MG_PEDIDO_ID: Integer;
    FTB_INSTITUTION_ID: Integer;
    procedure setFDataHora(const Value: TDateTime);
    procedure setFEtapa(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFNomeUsuario(const Value: string);
    procedure setFPedidoRastreioId(const Value: string);
    procedure setFPedidoSituacao(const Value: Integer);
    procedure setFPedidoSituacaoDescricao(const Value: string);
    procedure setFPedidoSituacaoDescricaoDetalhada(const Value: string);
    procedure setFSituacao(const Value: Integer);
    procedure setFTipo(const Value: Integer);
    procedure setFTipoUsuario(const Value: string);
    procedure setFTB_INSTITUTION_ID(const Value: Integer);
    procedure setFTB_MG_PEDIDO_ID(const Value: Integer);

  public

    [KeyField('TB_INSTITUTION_ID')]
    [FieldName('TB_INSTITUTION_ID')]
    property Estabelecimento: Integer read FTB_INSTITUTION_ID write setFTB_INSTITUTION_ID;

    [KeyField('TB_MG_PEDIDO_ID')]
    [FieldName('TB_MG_PEDIDO_ID')]
    property PedidoMagazord: Integer read FTB_MG_PEDIDO_ID write setFTB_MG_PEDIDO_ID;

    [KeyField('ID')]
    [FieldName('Id')]
    property Id: Integer read FId write setFId;

    [FieldName('DATA_HORA')]
    property DataHora: TDateTime read FDataHora write setFDataHora;

    [FieldName('PEDIDO_SITUACAO')]
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;

    [FieldName('PS_DESCRICAO')]
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;

    [FieldName('PS_DESCRICAO_DETALHADA')]
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;

    [FieldName('Tipo')]
    property Tipo: Integer read FTipo write setFTipo;

    [FieldName('Etapa')]
    property Etapa: Integer read FEtapa write setFEtapa;

    [FieldName('Situacao')]
    property Situacao: Integer read FSituacao write setFSituacao;

    [FieldName('NOME_USUARIO')]
    property NomeUsuario: string read FNomeUsuario write setFNomeUsuario;

    [FieldName('TIPO_USUARIO')]
    property TipoUsuario: string read FTipoUsuario write setFTipoUsuario;

    [FieldName('PEDIDO_RASTREIO_ID')]
    property PedidoRastreioId: string read FPedidoRastreioId write setFPedidoRastreioId;


  end;

implementation

{ TMGPedidoHistorico }

procedure TMGPedidoHistorico.setFDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TMGPedidoHistorico.setFEtapa(const Value: Integer);
begin
  FEtapa := Value;
end;

procedure TMGPedidoHistorico.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMGPedidoHistorico.setFNomeUsuario(const Value: string);
begin
  FNomeUsuario := Value;
end;

procedure TMGPedidoHistorico.setFPedidoRastreioId(const Value: string);
begin
  FPedidoRastreioId := Value;
end;

procedure TMGPedidoHistorico.setFPedidoSituacao(const Value: Integer);
begin
  FPedidoSituacao := Value;
end;

procedure TMGPedidoHistorico.setFPedidoSituacaoDescricao(const Value: string);
begin
  FPedidoSituacaoDescricao := Value;
end;

procedure TMGPedidoHistorico.setFPedidoSituacaoDescricaoDetalhada(
  const Value: string);
begin
  FPedidoSituacaoDescricaoDetalhada := Value;
end;

procedure TMGPedidoHistorico.setFSituacao(const Value: Integer);
begin
  FSituacao := Value;
end;

procedure TMGPedidoHistorico.setFTB_INSTITUTION_ID(const Value: Integer);
begin
  FTB_INSTITUTION_ID := Value;
end;

procedure TMGPedidoHistorico.setFTB_MG_PEDIDO_ID(const Value: Integer);
begin
  FTB_MG_PEDIDO_ID := Value;
end;

procedure TMGPedidoHistorico.setFTipo(const Value: Integer);
begin
  FTipo := Value;
end;

procedure TMGPedidoHistorico.setFTipoUsuario(const Value: string);
begin
  FTipoUsuario := Value;
end;

end.
