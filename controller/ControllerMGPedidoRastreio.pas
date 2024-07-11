unit ControllerMGPedidoRastreio;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoRastreio, prm_mg_pedido_rastreio,FireDAC.Stan.Param;

Type
  TListaMGPedidoRastreio = TObjectList<TMGPedidoRastreio>;

  TControllerMGPedidoRastreio = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoRastreio;
    procedure setFParametros(const Value: TPrmMGPedidoRastreio);

  public
    Registro : TMGPedidoRastreio;
    Lista : TListaMGPedidoRastreio;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoRastreio read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoRastreio }

procedure TControllerMGPedidoRastreio.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoRastreio.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoRastreio.Create(Self);
  Lista := TListaMGPedidoRastreio.Create;
  FParametros := TPrmMGPedidoRastreio.create(Self);
end;

destructor TControllerMGPedidoRastreio.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoRastreio.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoRastreio.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoRastreio.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoRastreio;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS_RASTREIO ',
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
        Lc_item := TMGPedidoRastreio.Create(Self);
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoRastreio.setFParametros(const Value: TPrmMGPedidoRastreio);
begin
  FParametros := Value;
end;

end.
