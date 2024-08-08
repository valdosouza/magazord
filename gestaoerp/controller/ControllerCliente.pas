unit ControllerCliente;

interface
uses Classes, STQuery, SysUtils,ControllerBase,
      tblCliente ,Generics.Collections, ControllerEmpresa,ControllerColaborador,
      Vcl.StdCtrls;
Type
  TListCliente = TObjectList<TCliente>;

  TControllerCliente = Class(TControllerBase)

  private

  protected

  public
    Registro : TCliente;
    Lista :TListCliente;
    Empresa : TControllerEmpresa;
    Vendedor : TControllerColaborador;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:Boolean;
    function salva:boolean;
    function update:Boolean;
    procedure getById;
    procedure getList;
    procedure getallByKey;
    procedure clear;
    function Delete:Boolean;
    procedure criarClienteSemCPFCNPJ;
    procedure PreencheComboBox(Order:String;Cb: TComboBox);
    function getByFieldName(strTable, field, Content: String):Boolean;
  End;

implementation

{ TControllerCashier }

procedure TControllerCliente.clear;
begin
  clearObj(registro);
  Empresa.Clear;
end;

constructor TControllerCliente.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCliente.Create;
  Empresa := TControllerEmpresa.Create(Self);
  Vendedor := TControllerColaborador.Create(Self);
  Lista := TListCliente.Create;
end;

procedure TControllerCliente.criarClienteSemCPFCNPJ;
begin
  empresa.Registro.CpfCNPJ := '12345677654321';
  empresa.getByDocumento;
  if not empresa.exist then
  Begin
    Empresa.criarEmpresaSemCPFCNPJ;
    clear;
    Registro.Codigo             := Empresa.Registro.Codigo;
    Registro.Ativo              := 'S';
    Registro.IndicadorIE_Dest   := '1';
    Registro.EnviaEmailNFeAuto  := 'N';
    Registro.EnviarSomenteXML   := 'N';
    salva;
  End;
end;

function TControllerCliente.Delete: Boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerCliente.Destroy;
begin
  FreeANdNil(Registro);
  FreeANdNil(Lista);
  FreeANdNil(Empresa);
  FreeANdNil(Vendedor);
  inherited;
end;


procedure TControllerCliente.getallByKey;
begin
  getById;
  if (exist) then
  Begin
    Empresa.Registro.Codigo := Registro.Codigo;
    Empresa.getAllBykey;

    Vendedor.Registro.Codigo := Empresa.Registro.CodigoVendedor;
    Vendedor.getbyId;
  End;
end;

function TControllerCliente.getByFieldName(strTable, field,
  Content: String): Boolean;
var
    Lc_Qry : TSTQuery;
begin
  Result := True;
  Lc_Qry := getbyField(strTable,Field,Content);
  Try
    exist  := ( Lc_Qry.RecordCount > 0 );
    if exist then
    Begin
      Empresa.exist := True;
      clearObj(Empresa.Registro);
      get(Lc_Qry,Empresa.Registro) ;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerCliente.getById;
begin
  _getByKey(Registro);
end;

procedure TControllerCliente.getList;
var
  Lc_Qry : TSTQuery;
  LcLista : TCliente;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_CLIENTE ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TCliente.Create;
        get(Lc_qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerCliente.insert: Boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  end;
end;

procedure TControllerCliente.PreencheComboBox(Order:String;Cb: TComboBox);
var
  Lc_Qry : TSTQuery;
  Lc_Filter : TStringList;
begin
  Lc_Qry := GeraQuery;
  Lc_Filter := TStringList.Create;
  Try
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select  ',
                ' EMP_CODIGO, ',
                ' EMP_NOME, ',
                ' EMP_FANTASIA ',
                'FROM tb_empresa E ',
                '  INNER JOIN tb_cliente c ',
                '  on (c.cli_codemp = e.emp_codigo) ',
                'where cli_ativo = ''S'' '));
      IF Order = 'EMP_NOME' then
        sql.add( ' ORDER BY EMP_CODIGO desc, EMP_NOME asc ')
      else
        sql.add( ' ORDER BY EMP_CODIGO desc, EMP_FANTASIA ASC ');
      Active := True;
      FetchAll;
      First;
      disablecontrols;
      Cb.items.beginUpdate;
      Lc_Filter.Clear;
      while not eof do
      Begin
        if Order = 'EMP_NOME' then
          Lc_Filter.Add(FieldByName('EMP_NOME').AsString)
        else
          Lc_Filter.Add(FieldByName('EMP_FANTASIA').AsString);
        next;
      end;
      Cb.Items.Assign(Lc_Filter);
      Cb.items.endUpdate;
      enablecontrols;
    end;
  Finally
    Lc_Filter.free;
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerCliente.salva: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


function TControllerCliente.update: Boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

end.
