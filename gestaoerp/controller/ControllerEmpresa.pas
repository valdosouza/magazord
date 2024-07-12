unit ControllerEmpresa;

interface
uses  Classes, SysUtils,ControllerBase,  tblEmpresa ,ControllerEndereco,
      Generics.Collections, ControllerColaborador, STQuery,FireDAC.Stan.Param;


Type
  TListEmpresa = TObjectList<TEmpresa>;

  TControllerEmpresa = Class(TControllerBase)

  private
  protected

  public
    Registro : TEmpresa;
    Endereco : TControllerEndereco;
    Lista : TListEmpresa;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function migra:boolean;
    function insert:Boolean;
    function Update:Boolean;
    function Detele:Boolean;
    procedure getById;
    procedure getByDocumento;
    Function delete:boolean;
    procedure SetSequencia;
    procedure getAllBykey;
    function getList: Boolean;
    function getListMovimento: Boolean;
    procedure clear;
    function Replace:boolean;
    procedure criarEmpresaSemCPFCNPJ;

    procedure AtualizaBanco;
  End;

implementation

{ TControllerEmpresa }

procedure TControllerEmpresa.AtualizaBanco;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat(
              'UPDATE TB_EMPRESA SET '+
              'EMP_NUMBCO =:EMP_NUMBCO '+
              'where ( EMP_CODIGO =:EMP_CODIGO) '
      ));
      parambyname('EMP_NUMBCO').asString := Registro.NumeroBanco;
      parambyname('EMP_CODIGO').asInteger := Registro.Codigo;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerEmpresa.clear;
begin
  clearObj(Registro);
  endereco.clear;
end;

constructor TControllerEmpresa.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEmpresa.Create;
  Endereco := TControllerEndereco.Create(Self);
  Lista := TListEmpresa.create;
end;

procedure TControllerEmpresa.criarEmpresaSemCPFCNPJ;
begin
  clear;
  Registro.Codigo                     := 0;
  Registro.Tipo                       := 1;
  Registro.NomeRazaoSocial            := 'CLIENTE SEM CPF/CNPJ';
  Registro.ApelidoFantasia            := 'CLIENTE SEM CPF/CNPJ';
  Registro.CpfCNPJ                    := '12345677654321';
  Registro.TipoPessoa                 := 'J';
  Registro.ConsumidorFinal            := 'N';
  Registro.Multiplicador              := 1;
  Registro.OptantePeloSimples         := 'N';
  Registro.IndicadorInscricaoEstadual := '1';
  Registro.CodigoVendedor             := 0;
  Registro.Ativa                      := 'S';
  salva;
  Endereco.Registro.Codigo := 0;
  Endereco.Registro.CodigoEmpresa :=  Registro.Codigo;
  Endereco.Registro.Cnpj          :=  Registro.CpfCNPJ;
  Endereco.Registro.Tipo          := 'COMERCIAL';
  Endereco.Registro.Tipo          := 'PRINCIPAL';
  Endereco.Registro.Logradouro    := 'RUA';
  Endereco.Registro.Bairro        := 'BAIRRO';
  Endereco.Registro.Cep           := '80000000';
  Endereco.Registro.NumeroPredial := '1';
  Endereco.Registro.CodigoPais    := 1058;
  Endereco.Registro.CodigoEstado  := 41;
  Endereco.Registro.CodigoCidade  := 4004;
  Endereco.salva;


end;

function TControllerEmpresa.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerEmpresa.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Endereco);
  FreeAndNil(Lista);
  inherited;
end;

function TControllerEmpresa.Detele: Boolean;
begin
  try
    DeleteObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerEmpresa.salva: boolean;
begin
  Result := True;
  if (Registro.Codigo = 0 ) then
    Registro.Codigo := Generator('GN_EMPRESA');
  SaveObj(Registro);
end;

procedure TControllerEmpresa.SetSequencia;
begin
  Registro.Codigo := getNextByField(Registro,'EMP_CODIGO',0) ;
  setGenerator('GN_EMPRESA',Registro.Codigo.ToString);
end;

function TControllerEmpresa.Update: Boolean;
begin
  try
    UpdateObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;


procedure TControllerEmpresa.getAllBykey;
begin
  _getByKey(Registro);
  Endereco.clear;
  if (exist) then
  Begin
    Endereco.Registro.CodigoEmpresa := Registro.Codigo;
    Endereco.getAll;
  End;

end;

procedure TControllerEmpresa.getByDocumento;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT c.* '+
              'FROM tb_empresa c '+
              'where ( c.EMP_CNPJ =:EMP_CNPJ) and (c.EMP_CNPJ <> '''') ');
      parambyname('EMP_CNPJ').asString := Registro.CpfCNPJ;
      active := True;
      fetchall;
      exist := (RecordCount > 0);
      if exist then get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerEmpresa.getById;
begin
  _getByKey(Registro);
end;

function TControllerEmpresa.getList: Boolean;
var
  Lc_Qry : TSTQuery;
  LcLista : TEmpresa;
begin
  Lc_Qry := GeraQuery;
  Result := True;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_EMPRESA ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TEmpresa.Create;
        get(Lc_qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerEmpresa.getListMovimento: Boolean;
var
  Lc_Qry : TSTQuery;
  LcLista : TEmpresa;
begin
  Lc_Qry := GeraQuery;
  Result := True;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat('select distinct e.* ',
                     'from tb_empresa e ',
                     '  inner join tb_pedido p ',
                     '  on (p.ped_codemp = e.emp_codigo) '
      ));
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TEmpresa.Create;
        get(Lc_qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerEmpresa.insert: Boolean;
begin
  try
    if (Registro.Codigo = 0 ) then
      Registro.Codigo := Generator('GN_EMPRESA')
    else
    if Registro.Codigo = -1 then
    Begin
      Registro.Codigo := getNextByField(Registro,'EMP_CODIGO',0) ;
      setGenerator('GN_EMPRESA',Registro.Codigo.ToString);
    End;
    InsertObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerEmpresa.migra: boolean;
begin
  Result := True;
  SaveObj(Registro);
end;

function TControllerEmpresa.Replace: boolean;
begin
  Try
    replaceObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
