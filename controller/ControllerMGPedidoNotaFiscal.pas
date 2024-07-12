unit ControllerMGPedidoNotaFiscal;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoNotaFiscal, prm_mg_pedido_nota_fiscal,FireDAC.Stan.Param;

Type
  TListaMGPedidoNotaFiscal = TObjectList<TMGPedidoNotaFiscal>;

  TControllerMGPedidoNotaFiscal = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoNotaFiscal;
    procedure setFParametros(const Value: TPrmMGPedidoNotaFiscal);

  public
    Registro : TMGPedidoNotaFiscal;
    Lista : TListaMGPedidoNotaFiscal;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoNotaFiscal read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoNotaFiscal }

procedure TControllerMGPedidoNotaFiscal.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoNotaFiscal.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoNotaFiscal.Create;
  Lista := TListaMGPedidoNotaFiscal.Create;
  FParametros := TPrmMGPedidoNotaFiscal.create;
end;

destructor TControllerMGPedidoNotaFiscal.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoNotaFiscal.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoNotaFiscal.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoNotaFiscal.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoNotaFiscal;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_MG_PEDIDOS_NOTA_FISCAL ',
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
        Lc_item := TMGPedidoNotaFiscal.Create;
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoNotaFiscal.setFParametros(const Value: TPrmMGPedidoNotaFiscal);
begin
  FParametros := Value;
end;

end.
