unit ControllerMGPedido;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedido, prm_mg_pedido,FireDAC.Stan.Param,
     ControllerMGPedidoHistorico, ControllerMGPedidoItem,ControllerMGPedidoNotaFiscal,
     ControllerMGPedidoPromocoes,ControllerMGPedidoRastreio;

Type
  TListaMGPedido = TObjectList<TMGPedido>;

  TControllerMGPedido = Class(TControllerBase)
  private
    FParametros: TPrmMgPedido;
    procedure setFParametros(const Value: TPrmMGPedido);

  public
    Registro : TMGPedido;
    Item : TControllerMGPedidoItem;
    NotaFiscal : TControllerMGPedidoNotaFiscal;
    Historico : TControllerMGPedidoHistorico;
    Promocoes : TControllerMGPedidoPromocoes;
    Rastreio : TControllerMGPedidoRastreio;
    Lista : TListaMGPedido;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    procedure getByCodigo;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedido read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedido }

procedure TControllerMGPedido.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedido.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedido.Create(Self);
  Lista := TListaMGPedido.Create;
  FParametros := TPrmMgPedido.create(Self);
  Item := TControllerMGPedidoItem.create(Self);
  Historico := TControllerMGPedidoHistorico.create(Self);
  NotaFiscal := TControllerMGPedidoNotaFiscal.create(Self);
  Promocoes := TControllerMGPedidoPromocoes.create(Self);
  Rastreio := TControllerMGPedidoRastreio.create(Self);
end;

destructor TControllerMGPedido.Destroy;
begin
  FreeAndNil(Rastreio);
  FreeAndNil(Promocoes);
  FreeAndNil(item);
  FreeAndNil(NotaFiscal);
  FreeAndNil(Historico);
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedido.getByCodigo;
var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS ',
                      'WHERE CODIGO =:CODIGO ',
                      ' AND (TB_INSTITUTION_ID =:TB_INSTITUTION_ID) '
      ));
      ParamByName('CODIGO').AsString := Parametros.FieldName.Codigo;
      ParamByName('TB_INSTITUTION_ID').AsInteger := Parametros.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerMGPedido.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedido.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedido.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedido;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS ',
                      'WHERE ID IS NOT NULL '
      ));
      //Agrega SQÇl
      if Parametros.Periodo then
      Begin
        sql.add(' AND (DATA_HORA BETWEEN :DATAINI  AND :DATAFIM)');
      End;

      if Trim(Parametros.FieldName.Codigo) <> '' then
        sql.add(' AND ( CODIGO =:CODIGO ) ');

      if Trim(Parametros.FieldName.PessoaNome) <> '' then
        sql.add(' AND ( UPPER(PESSOA_NOME) like :PESSOA_NOME ) ');

      //PAssagem de PArametros
      if Parametros.Periodo then
      Begin
        ParamByName('DATAINI').AsDateTime := StrToDateTime(formatdatetime('dd/MM/yyyy', Parametros.DataInicial)+' 00:00');
        ParamByName('DATAFIM').AsDateTime := StrToDateTime(formatdatetime('dd/MM/yyyy', Parametros.DataFinal)+' 23:59');
      End;

      if Trim(Parametros.FieldName.Codigo) <> '' then
         ParamByName('CODIGO').AsString := Parametros.FieldName.Codigo;

      if Trim(Parametros.FieldName.PessoaNome) <> '' then
         ParamByName('PESSOA_NOME').AsString := concat('%',Parametros.FieldName.PessoaNome,'%');

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        Lc_item := TMGPedido.Create(Self);
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedido.setFParametros(const Value: TPrmMGPedido);
begin
  FParametros := Value;
end;

end.
