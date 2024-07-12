unit ControllerColaborador;

interface

uses Classes, STQuery, SysUtils,ControllerBase, tblColaborador ,Un_MSg,
      Generics.Collections,  ControllerUF, controllerCidade,FireDAC.Stan.Param;


Type
  TListColaborador = TObjectList<TColaborador>;

  TControllerColaborador = Class(TControllerBase)
  private

  protected

  public
    Registro : TColaborador;
    Lista : TListColaborador;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function migra:boolean;
    procedure getbyId;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    function getList:Boolean;
    function getDocByID:String;
    function getByDoc:Boolean;
    function getByUser:Boolean;
    function getIDByDoc:Integer;
   function temPedido:Boolean;
    function getByUsuario:Boolean;
    function Replace:boolean;

    function VerificaExistenciaUsuario(UsuarioId:Integer):Boolean;
  End;

implementation


constructor TControllerColaborador.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TColaborador.Create;
  Lista     := TListColaborador.Create;
end;

function TControllerColaborador.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerColaborador.Destroy;
begin
  FreeAndNil(Lista);
  FreeAndNil(Registro);
  inherited;
end;

function TControllerColaborador.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_COLABORADOR');
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerColaborador.migra: boolean;
begin
  Result := True;
  SaveObj(Registro);
end;

function TControllerColaborador.Replace: boolean;
begin
  Try
    replaceObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerColaborador.salva: boolean;
begin
  Result := True;
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_COLABORADOR');
  SaveObj(Registro);
end;


function TControllerColaborador.temPedido: Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      sql.Add(concat('select PED_CODVDO ',
                     'from TB_PEDIDO ',
                     'where PED_CODVDO =:PED_CODVDO '
                     ));
      ParamByName('PED_CODVDO').AsInteger := Registro.codigo;
      Active := True;
      FetchAll;
      REsult := (recordCount > 0)
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerColaborador.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerColaborador.VerificaExistenciaUsuario(
  UsuarioId: Integer): Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Result := True;
  Try
    with Lc_Qry do
    Begin
      sql.Add(concat('select * ',
                     'from TB_COLABORADOR ',
                     'where CLB_CODUSU =:CLB_CODUSU ',
                     ' AND CLB_CODIGO <>:CLB_CODIGO '
                     ));
      ParamByName('CLB_CODUSU').AsInteger := UsuarioId;
      ParamByName('CLB_CODIGO').AsInteger := Registro.codigo;
      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerColaborador.getById;
begin
  _getByKey(Registro);
end;


function TControllerColaborador.getByUser: Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    Result := True;
    with Lc_Qry do
    Begin
      sql.Add(concat('select *  ',
                     'from tb_colaborador ',
                     'where CLB_CODUSU =:CLB_CODUSU'
                     ));
      ParamByName('CLB_CODUSU').AsInteger := Registro.Usuario;
      Active := True;
      First;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerColaborador.getByUsuario: Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Result := True;
  Try
    with Lc_Qry do
    Begin
      sql.Add(concat(
                  'select * ',
                  'from tb_colaborador ',
                  'where (CLB_CODUSU =:CLB_CODUSU) '
      ));
      ParamByName('CLB_CODUSU').AsInteger := Registro.Usuario;
      Active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if not exist then
      Begin
        Active := False;
        sql.Clear;
        sql.Add(concat(
                  'SELECT FIRST 1 C.* ',
                  'from tb_colaborador C ',
                  '  INNER JOIN TB_CARGO G ',
                  '  ON (G.crg_codigo  = C.clb_codcrg) ',
                  'where (G.crg_descricao LIKE ''VENDEDOR%'') '
        ));
        Active := True;
        FetchAll;
        exist := (RecordCount > 0);
      End;
      if exist then
      Begin
        get(Lc_Qry,Registro);
      End
      else
      BEgin
        Active := False;
        sql.Clear;
        sql.Add(concat(
                  'SELECT FIRST 1 C.* ',
                  'from tb_colaborador C '
        ));
        Active := True;
        FetchAll;
        exist := (RecordCount > 0);
        if exist then
          get(Lc_Qry,Registro);
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerColaborador.getDocByID: String;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    Result := '';
    with Lc_Qry do
    Begin
      sql.Add(concat('select CLB_CPF ',
                     'from tb_colaborador ',
                     'where clb_codigo =:clb_codigo'
                     ));
      ParamByName('clb_codigo').AsInteger := Registro.Codigo;
      Active := True;
      First;
      if RecordCount > 0 then
        REsult := FieldByName('CLB_CPF').AsString;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerColaborador.getIDByDoc: Integer;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    Result := 0;
    with Lc_Qry do
    Begin
      sql.Add(concat('select CLB_CODIGO ',
                     'from tb_colaborador ',
                     'where CLB_CPF =:CLB_CPF '
                     ));
      ParamByName('CLB_CPF').AsString := Registro.CPFCNPJ;
      Active := True;
      First;
      if RecordCount > 0 then
        REsult := FieldByName('CLB_CODIGO').AsInteger;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerColaborador.getList: boolean;
var
  Lc_Qry : TSTQuery;
  LcLista : TColaborador;
begin
  Lc_Qry := GeraQuery;
  Result := True;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_COLABORADOR ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TColaborador.Create;
        get(Lc_qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerColaborador.getByDoc: Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    Result := True;
    with Lc_Qry do
    Begin
      sql.Add(concat('select *  ',
                     'from tb_colaborador ',
                     'where CLB_CPF =:CLB_CPF'
                     ));
      ParamByName('CLB_CPF').AsString := Registro.CPFCNPJ;
      Active := True;
      First;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
