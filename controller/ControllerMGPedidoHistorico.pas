unit ControllerMGPedidoHistorico;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoHistorico, prm_mg_pedido_historico,FireDAC.Stan.Param;

Type
  TListaMGPedidoHistorico = TObjectList<TMGPedidoHistorico>;

  TControllerMGPedidoHistorico = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoHistorico;
    procedure setFParametros(const Value: TPrmMGPedidoHistorico);

  public
    Registro : TMGPedidoHistorico;
    Lista : TListaMGPedidoHistorico;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoHistorico read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoHistorico }

procedure TControllerMGPedidoHistorico.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoHistorico.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoHistorico.Create;
  Lista := TListaMGPedidoHistorico.Create;
  FParametros := TPrmMGPedidoHistorico.create;
end;

destructor TControllerMGPedidoHistorico.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoHistorico.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoHistorico.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoHistorico.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoHistorico;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS_HISTORICO ',
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
        Lc_item := TMGPedidoHistorico.Create;
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoHistorico.setFParametros(const Value: TPrmMGPedidoHistorico);
begin
  FParametros := Value;
end;

end.
