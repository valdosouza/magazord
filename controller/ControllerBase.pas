unit ControllerBase;

interface

uses Classes,SysUtils, GenericORM,STTransaction,STScript,FireDAC.Stan.Param,
     UnFunctions, Windows,Gauges, Un_DM, STQuery,
    STDatabase, IBX.IBScript;

Type
  TControllerBase = Class(TComponent)
  private
    FDataBase: TSTDatabase;

    procedure setFDataBase(const Value: TSTDatabase);
    procedure setFOrderBy(const Value: String);
  protected
    FOrderBy: String;

    function clearObj<T: class>(Obj: T):Boolean;
    function insertObj<T: class>(Obj: T):Boolean;
    function updateObj<T: class>(Obj: T):Boolean;
    function deleteObj<T: class>(Obj: T):Boolean;
    procedure SaveObj<T: class>(Obj: T);
    procedure replaceObj<T: class>(Obj: T);
    function getSqlCommandReplaceObj<T: class>(Obj: T):String;

    function getLastInsert<T: class>(Obj: T):Integer;
    function getNextByField<T: class>(Obj: T; Field: String;Intitution: Integer): Integer;
    function getByField(strTable:String;field:String; Content:String):TSTQuery;
    procedure _getByKey<T: class>(Obj: T);
    function existObj<T: class>(Obj: T):Boolean;

    function NomeComputador: string;
    procedure get<T: class>(Qry: TSTQuery;Obj: T);
  public
    exist : Boolean;
    update : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    Function GeraQuery():TSTQuery;
    Function GeraIBScript():TSTScript;
    procedure FinalizaQuery(Qry:TSTQuery);
    procedure FinalizaISQL(Script: TSTScript);
    function Generator(pc_Gen: string): Integer;
    procedure ClonarObj<T: class>(ObjOri: T;ObjClone: T);
    function getMaxTable(Field,Tab:String):Integer;
    function TimeValid(value:String):Boolean;
    procedure setGenerator(Generator,Sequencia:String);
    Procedure geralog(origem,msg : string);Virtual;
    procedure AtivarAllTrighers;
    procedure DesativarAllTrighers;

  published
    { Published declarations }
    //Informa o banco de dados
    property DataBase : TSTDatabase read FDataBase write setFDataBase;
    property OrderBy :String read FOrderBy write setFOrderBy;
  End;

implementation

{ TControllerBase }



function TControllerBase.existObj<T>(Obj: T): Boolean;
VAr
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add (TGenericORM._Select(Obj,''));
        Active := True;
        FetchAll;
        result := ( RecordCount > 0 );
      End;
    Except on E: Exception do
      geralog('Base - existObj - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;


procedure TControllerBase.FinalizaISQL(Script: TSTScript);
begin
  try
    Script.Transaction.Commit;
  finally
    Script.Transaction.DisposeOf;
    Script.DisposeOf;
  end;
end;

procedure TControllerBase.FinalizaQuery(Qry: TSTQuery);
begin
  try
    Qry.Transaction.Commit;
  finally
    Qry.Transaction.DisposeOf;
    Qry.Close;
    Qry.DisposeOf;
  end;
end;

function TControllerBase.deleteObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Delete(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.AtivarAllTrighers;
Var
  Lc_Qry : TSTQuery;
Begin
  Lc_Qry := GeraQuery;
  try
    with Lc_Qry do
    Begin
      sql.Add(concat(
              'update RDB$TRIGGERS set RDB$TRIGGER_INACTIVE = 0 ',
              'where rdb$trigger_source is not null and ((rdb$system_flag = 0) or ',
              '(rdb$system_flag is null)); '
      ));
      ExecSQL;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;

function TControllerBase.clearObj<T>(Obj: T): Boolean;
begin
  Try
    TGenericORM._Clear(Obj);
    Result := True;
  except
    Result := False;
  End;
end;

constructor TControllerBase.Create(AOwner: TComponent);
begin
  FDataBase := DM.IBD_Gestao;
  exist := False;
  update := False;
end;

procedure TControllerBase.DesativarAllTrighers;
Var
  Lc_Qry : TSTQuery;
Begin
  Lc_Qry := GeraQuery;
  try
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'update RDB$TRIGGERS set RDB$TRIGGER_INACTIVE = 1 ',
                'where rdb$trigger_source is not null and ((rdb$system_flag = 0) or ',
                '(rdb$system_flag is null));'
      ));
      ExecSQL;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

destructor TControllerBase.Destroy;
begin

end;

Function TControllerBase.GeraQuery():TSTQuery;
VAr
  Lc_Tsc : TSTTransaction;
begin
  Result := TSTQuery.Create(Self);
  Lc_Tsc := TSTTransaction.Create(nil);
  if not FDataBase.Connected then
    FDataBase.Connected := True;
  Lc_Tsc.Connection := FDataBase;

  With Result do
  Begin
    Database := FDataBase;
    Transaction := Lc_Tsc; //DM.IBT_Crud;
    Transaction.StartTransaction;
    Active := False;
    sql.Clear;
  End;
end;


function TControllerBase.getByField(strTable, field, Content: String): TSTQuery;
var
  vSelect: string;
begin
  Result := GeraQuery;
  with Result do
  begin
    Active := False;
    SQL.Clear;
    vSelect := Format('Select * from %s where ( %s = :%s ) ',[strTable, Field, Field]);
    SQL.Add(vSelect);
    ParamByName(Field).Value := Content;
    active := True;
    FetchAll;
    exist := (RecordCount > 0);
  end;
end;

function TControllerBase.getLastInsert<T>(Obj: T): Integer;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._getLastInsert( Obj ) );
        Active := True;
      End;
      Result := StrToIntDef(Lc_Qry.FieldByName('id').AsString,0);
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getMaxTable(Field,Tab: String): Integer;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    Result := 0;
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add(concat(
                  'select Max(',Field,') id ',
                  'from ',Tab
        ));
        Active := True;
        Result := StrToIntDef( FieldByName('id').AsString,0);
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getNextByField<T>(Obj: T; Field: String;
  Intitution: Integer): Integer;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._getNextByField( Obj,Field, Intitution  ) );
        Active := True;
        Result := StrToIntDef( FieldByName(Field).AsString,0) + 1;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.getSqlCommandReplaceObj<T>(Obj: T): String;
begin
  Result := TGenericORM._Replace(Obj);
end;

function TControllerBase.insertObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Insert(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('insertObj - ',E.Message + Lc_Qry.SQL.Text);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerBase.NomeComputador: string;
var
   lpBuffer: PChar;
   nSize: DWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
   nSize := Buff_Size;
   lpBuffer := StrAlloc(Buff_Size);
   GetComputerName(lpBuffer, nSize);
   Result := string(lpBuffer);
   StrDispose(lpBuffer);
end;


procedure TControllerBase.replaceObj<T>(Obj: T);
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Replace(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.SaveObj<T>(Obj: T);
begin
  if existObj(Obj) then
    updateObj(Obj)
  else
    InsertObj(Obj);
end;



procedure TControllerBase.setFDataBase(const Value: TSTDatabase);
begin
  FDataBase := Value;
end;

procedure TControllerBase.setFOrderBy(const Value: String);
begin
  FOrderBy := Value;
end;

procedure TControllerBase.setGenerator(Generator, Sequencia: String);
var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    with Lc_Qry do
    Begin
      CachedUpdates := True;
      if Sequencia = '' then Sequencia := '0';

      sql.Add('ALTER SEQUENCE ' + Generator + ' RESTART WITH ' + Sequencia);
      ExecSQL;

    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerBase.TimeValid(value: String): Boolean;
begin
  try
    StrToTime(Value);
    Result := True;
  Except
    Result := False;
  end;

end;

function TControllerBase.updateObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericORM._Update(Obj) );
        ExecSQL;
      End;
    Except on E: Exception do
      geralog('updateObj - ',Concat(E.Message,' - ',Lc_Qry.SQL.Text ));
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerBase.get<T>(Qry: TSTQuery;Obj: T) ;
begin
  clearObj(Obj);
  TGenericORM._get(Qry,Obj);
end;

procedure TControllerBase.ClonarObj<T>(ObjOri, ObjClone: T);
begin
  TGenericORM._assign(ObjOri,ObjClone);
end;

procedure TControllerBase._getByKey<T>(Obj: T);
VAr
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  Try
    try
      with Lc_Qry do
      Begin
        SQL.Clear;
        SQL.Add (TGenericORM._Select(Obj,''));
        Active := True;
        FetchAll;
        exist  := ( RecordCount > 0 );
        if exist then
        Begin
          clearObj(Obj);
          TGenericORM._get(Lc_Qry,Obj) ;
        End;
      End;
    Except on E: Exception do
      geralog('Base - _getByKey - ',E.Message);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerBase.Generator(pc_Gen: string): Integer;
var
  Lc_Qry : TSTQuery;
begin
  Lc_Qry := GeraQuery;
  TRy
    with Lc_Qry do
    Begin
      CachedUpdates := True;
      sql.Add('SELECT GEN_ID(' + pc_Gen + ',1) FROM RDB$DATABASE');
      Active := True;
      Result := fieldbyname('GEN_ID').AsInteger;
      ApplyUpdates;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerBase.GeraIBScript: TSTScript;
VAr
  Lc_Tsc : TSTTransaction;
begin
  Result := TSTScript.Create(Self);
  Lc_Tsc := TSTTransaction.Create(nil);
  if not FDataBase.Connected then
    FDataBase.Connected := True;
  Lc_Tsc.Connection := FDataBase;

  With Result do
  Begin
    Connection := FDataBase;
    Transaction := Lc_Tsc; //DM.IBT_Crud;
    Transaction.StartTransaction;
    Result.SQLScripts.Clear;
  End;
end;

procedure TControllerBase.geralog(origem, msg: string);
begin

end;

end.
