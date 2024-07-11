unit ControllerMGPedidoItem;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoItem, prm_mg_pedido_item,FireDAC.Stan.Param;

Type
  TListaMGPedidoItem = TObjectList<TMGPedidoItem>;

  TControllerMGPedidoItem = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoItem;
    procedure setFParametros(const Value: TPrmMGPedidoItem);

  public
    Registro : TMGPedidoItem;
    Lista : TListaMGPedidoItem;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoItem read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoItem }

procedure TControllerMGPedidoItem.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoItem.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoItem.Create(Self);
  Lista := TListaMGPedidoItem.Create;
  FParametros := TPrmMGPedidoItem.create(Self);
end;

destructor TControllerMGPedidoItem.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoItem.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoItem.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoItem.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoItem;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS_ITEM ',
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
        Lc_item := TMGPedidoItem.Create(Self);
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoItem.setFParametros(const Value: TPrmMGPedidoItem);
begin
  FParametros := Value;
end;

end.
