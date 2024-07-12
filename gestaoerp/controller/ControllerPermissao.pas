unit ControllerPermissao;

interface

uses ControllerBase,STQuery,FireDAC.Stan.Param;

Type
  TControllerPermissao = Class(TControllerBase)
  private
    FSituacao: String;
    FMenu: String;
    FTipo: String;
    FUsuario: Integer;
    procedure setFMenu(const Value: String);
    procedure setFSituacao(const Value: String);
    procedure setFTipo(const Value: String);
    procedure setFUsuario(const Value: Integer);

  public
    function HabilitaPermissao: Boolean;

    property Usuario : Integer read FUsuario write setFUsuario;
    property Menu : String read FMenu write setFMenu;
    property Tipo : String read FTipo write setFTipo;
    property Situacao: String read FSituacao write setFSituacao;
  End;


implementation

{ TControllerPermissao }

function TControllerPermissao.HabilitaPermissao:boolean;
var
  Lc_SqlTxt: string;
  Lc_Qry: TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    with Lc_Qry do
    Begin
      //Verifica se é adminsitrador
      Lc_SqlTxt := 'SELECT DISTINCT                            '+
                   '   OPF.OPF_CODIGO,                         '+
                   '   OPF.OPF_DESCRICAO                       '+
                   'FROM TB_INTERFACE IFC                      '+
                   '   INNER JOIN TB_ITENS_IFC IIF             '+
                   '   ON (IIF.IIF_CODIFC = IFC.IFC_CODIGO)    '+
                   '   INNER JOIN TB_PERMISSAO PER             '+
                   '   ON (PER.PER_CODIIF = IIF.IIF_CODIGO)    '+
                   '   INNER JOIN TB_OPER_INTERFACE OPF        '+
                   '   ON (OPF.OPF_CODIGO = IIF.IIF_CODOPF)    '+
                   'WHERE (IFC_SISTEMA = ''S'')                '+
                   ' AND (PER.PER_CODUSU=:PER_CODUSU)          '+
                   ' AND OPF.OPF_DESCRICAO=:OPF_DESCRICAO      ';
      if FSituacao = 'S' then Lc_SqlTxt := Lc_SqlTxt + '  AND ( (IFC.IFC_DESCRICAO=:IFC_DESCRICAO) OR (IFC.IFC_FR_NAME=:IFC_DESCRICAO) ) ';
      SQL.Add(Lc_SqlTxt);
      ParamByName('PER_CODUSU').AsInteger := FUsuario;
      if FSituacao = 'S' then ParamByName('IFC_DESCRICAO').AsString := FMenu;
      ParamByName('OPF_DESCRICAO').AsString := FTipo;

      Active := True;
      FetchAll;
      if RecordCount > 0 then Result := True else Result := False;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;

procedure TControllerPermissao.setFMenu(const Value: String);
begin
  FMenu := Value;
end;

procedure TControllerPermissao.setFSituacao(const Value: String);
begin
  FSituacao := Value;
end;

procedure TControllerPermissao.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TControllerPermissao.setFUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

end.
