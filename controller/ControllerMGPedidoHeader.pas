unit ControllerMGPedidoHeader;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase,
      tblGeral ,Generics.Collections,ModelMGPedidoHeader, prm_mg_pedido_header,
      FireDAC.Stan.Param,System.StrUtils;

Type
  TListaMGPedidoHeader = TObjectList<TMGPedidoHeader>;

  TControllerMGPedidoHeaderRetorno = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoHeader;
    procedure setFParametros(const Value: TPrmMGPedidoHeader);

  public
    Registro : TMGPedidoHeader;
    Lista : TListaMGPedidoHeader;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoHeader read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoHeaderRetorno }

procedure TControllerMGPedidoHeaderRetorno.Clear;
begin
  clearObj(Registro)
end;

constructor TControllerMGPedidoHeaderRetorno.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoHeader.Create;
  Lista := TListaMGPedidoHeader.Create;
  FParametros := TPrmMGPedidoHeader.create;
end;

destructor TControllerMGPedidoHeaderRetorno.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

procedure TControllerMGPedidoHeaderRetorno.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoHeaderRetorno.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerMGPedidoHeaderRetorno.search;
var
  Lc_Qry : TSTQuery;
  Lc_item : TMGPedidoHeader;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT PH.* ',
                      'FROM TB_MG_PEDIDOS_HEADER PH '
      ));
      case AnsiIndexStr(Parametros.Integrado, ['S', 'N', 'T']) of
        0:Begin
            sql.add(concat(
                  ' INNER JOIN tb_pedido_from_exterior PFE ',
                  ' ON (PFE.id_exterior = PH.codigo) ',
                  'WHERE ID IS NOT NULL '
            ));
        End;
        1:Begin
            sql.add(concat(
                   '  LEFT JOIN tb_pedido_from_exterior PFE ',
                   '  ON (PFE.id_exterior  =PH.codigo ) ',
                   'WHERE PFE.tb_pedido_id IS NULL '
            ));
        End;
        2:Begin
            sql.add('WHERE ID IS NOT NULL ');
        End;
      end;

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
        Lc_item := TMGPedidoHeader.Create;
        get(Lc_Qry,Lc_item);
        Lista.add(Lc_item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMGPedidoHeaderRetorno.setFParametros(
  const Value: TPrmMGPedidoHeader);
begin
  FParametros := Value;
end;

end.
