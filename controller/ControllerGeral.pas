unit ControllerGeral;

interface
uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase,
      tblGeral ,Generics.Collections, FireDAC.Stan.Param;


Type
  TListaGeral = TObjectList<TGeral>;

  TControllerGeral = Class(TControllerBase)
    Lista : TListaGeral;
  private
    procedure updateRegistro;
    procedure insertRegistro;
  public
    Registro : TGeral;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    function Seleciona: boolean;
    procedure getList;
  End;

implementation

{ TControllerGeral }

procedure TControllerGeral.Clear;
begin
  clearObj(Registro);
end;

constructor TControllerGeral.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TGeral.Create;
  Lista := TListaGeral.Create;
end;

destructor TControllerGeral.Destroy;
begin
  Registro.DisposeOf;
  lista.DisposeOf;
  inherited;
end;

procedure TControllerGeral.getById;
begin
  _getByKey(Registro);
end;


procedure TControllerGeral.getList;
var
  Lc_Qry : TSTQuery;
  LITem : TGeral;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_GERAL ',
                      'order by GRL_CODIGO '
                    ));
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TGeral.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


procedure TControllerGeral.insertRegistro;
var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat(
              'INSERT INTO TB_GERAL(GRL_CAMPO, GRL_CONTEUDO, GRL_CODMHA) ',
              ' VALUES (:GRL_CAMPO, :GRL_CONTEUDO, :GRL_CODMHA) '
      ));
      ParamByName('GRL_CAMPO').AsString := Registro.Campo;
      ParamByName('GRL_CONTEUDO').Value := Registro.Conteudo;
      ParamByName('GRL_CODMHA').AsInteger := Registro.CodigoEstabelecimento;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TControllerGeral.salva: boolean;
begin
  //foram criados updade e insert especifico para escapar do simbolo & o parametro deve ser passado como value e não Asstring
  TRy
    if existObj(registro) then
      updateRegistro
    else
      InsertRegistro;
    Result := True;
  except
    Result := False;
  End;
end;

function TControllerGeral.Seleciona: boolean;
begin
  REsult := existObj(Registro);
end;

procedure TControllerGeral.updateRegistro;
var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat(
              'UPDATE TB_GERAL SET ',
              'GRL_CAMPO =:GRL_CAMPO, ',
              'GRL_CONTEUDO =:GRL_CONTEUDO ',
              'Where ( GRL_CAMPO =:GRL_CAMPO) AND ( GRL_CODMHA =:GRL_CODMHA ) '
      ));
      ParamByName('GRL_CAMPO').AsString := Registro.Campo;
      ParamByName('GRL_CONTEUDO').Value := Registro.Conteudo;
      ParamByName('GRL_CODMHA').AsInteger := Registro.CodigoEstabelecimento;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
