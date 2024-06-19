unit ModelMGPedidoHistorico;

interface

uses
  JSON.Types, TEntity, System.Classes, System.Generics.Collections;

type
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

  public
    property Id: Integer read FId write setFId;
    property DataHora: TDateTime read FDataHora write setFDataHora;
    property PedidoSituacao: Integer read FPedidoSituacao write setFPedidoSituacao;
    property PedidoSituacaoDescricao: string read FPedidoSituacaoDescricao write setFPedidoSituacaoDescricao;
    property PedidoSituacaoDescricaoDetalhada: string read FPedidoSituacaoDescricaoDetalhada write setFPedidoSituacaoDescricaoDetalhada;
    property Tipo: Integer read FTipo write setFTipo;
    property Etapa: Integer read FEtapa write setFEtapa;
    property Situacao: Integer read FSituacao write setFSituacao;
    property NomeUsuario: string read FNomeUsuario write setFNomeUsuario;
    property TipoUsuario: string read FTipoUsuario write setFTipoUsuario;
    property PedidoRastreioId: string read FPedidoRastreioId write setFPedidoRastreioId;
  end;

implementation

{ TMGPedidoHistorico }

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

procedure TMGPedidoHistorico.setFTipo(const Value: Integer);
begin
  FTipo := Value;
end;

procedure TMGPedidoHistorico.setFTipoUsuario(const Value: string);
begin
  FTipoUsuario := Value;
end;

end.
