unit ControllerMGPedidoPromocoes;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoPromocoes, prm_mg_pedido_promocoes,FireDAC.Stan.Param;

Type
  TListaMGPedidoPromocoes = TObjectList<TMGPedidoPromocoes>;

  TControllerMGPedidoPromocoes = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoPromocoes;
    procedure setFParametros(const Value: TPrmMGPedidoPromocoes);

  public
    Registro : TMGPedidoPromocoes;
    Lista : TListaMGPedidoPromocoes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoPromocoes read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoPromocoes }

procedure TControllerMGPedidoPromocoes.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoPromocoes.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoPromocoes.Create;
  Lista := TListaMGPedidoPromocoes.Create;
  FParametros := TPrmMGPedidoPromocoes.create;
end;

destructor TControllerMGPedidoPromocoes.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoPromocoes.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoPromocoes.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoPromocoes.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoPromocoes;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS_PROMOCOES ',
                      'WHERE ID IS NOT NULL '
      ));
      //Agrega SQÇl
      if Parametros.Periodo then
      Begin
        sql.add(' AND (DATA_HORA BETWEEN :DATAINI  AND :DATAFIM)');
      End;

      //PAssagem de PArametros
      if Parametros.Periodo then
      Begin
        ParamByName('DATAINI').AsDateTime := StrToDateTime(formatdatetime('dd/MM/yyyy', Parametros.DataInicial)+' 00:00');
        ParamByName('DATAFIM').AsDateTime := StrToDateTime(formatdatetime('dd/MM/yyyy', Parametros.DataFinal)+' 23:59');
      End;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        Lc_item := TMGPedidoPromocoes.Create;
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoPromocoes.setFParametros(const Value: TPrmMGPedidoPromocoes);
begin
  FParametros := Value;
end;

end.
