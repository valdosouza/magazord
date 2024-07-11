unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,REST.Json,IniFiles,
  ModelMGPedidoRetorno,
  ModelMGPedido,
  ModelMGPedidoPromocoes,
  ModelMGPedidoHistorico,
  ModelMGPedidoItem,
  ModelMGPedidoNotaFiscal,
  ModelMGPedidoRastreio,
  ModelMGPedidoHeader,
  un_variables,
  ControllerMGPedidoHeader, Un_Base, base_search, Data.DB,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Datasnap.Provider, Vcl.ComCtrls, tas_config;

type
  TFrMain = class(TBaseSearch)
    cds_searchID: TIntegerField;
    cds_searchCODIGO: TStringField;
    cds_searchCODIGO_MARKETPLACE: TStringField;
    cds_searchVALOR_PRODUTO: TFloatField;
    cds_searchVALOR_FRETE: TFloatField;
    cds_searchVALOR_DESCONTO: TFloatField;
    cds_searchVALOR_ACRESCIMO: TFloatField;
    cds_searchVALOR_TOTAL: TFloatField;
    cds_searchPESSOA_ID: TIntegerField;
    cds_searchPESSOA_NOME: TStringField;
    cds_searchPESSOA_CPF_CNPJ: TStringField;
    cds_searchFORMA_PAGAMENTO_ID: TIntegerField;
    cds_searchFORMA_PAGAMENTO_NOME: TStringField;
    cds_searchFORMA_RECEBIMENTO_ID: TIntegerField;
    cds_searchFORMA_RECEBIMENTO_NOME: TStringField;
    cds_searchCONDICAO_PAGAMENTO_ID: TIntegerField;
    cds_searchCONDICAO_PAGAMENTO_NOME: TStringField;
    cds_searchPEDIDO_SITUACAO: TIntegerField;
    cds_searchPEDIDO_SITUACAO_DESCRICAO: TStringField;
    cds_searchPEDIDO_SITUACAO_TIPO: TIntegerField;
    cds_searchLOJA_ID: TIntegerField;
    cds_searchLOJA_DO_MARKETPLACE_ID: TIntegerField;
    cds_searchLOJA_DO_MARKETPLACE_NOME: TStringField;
    E_Cliente: TEdit;
    E_Data_Ini: TDateTimePicker;
    E_Data_Fim: TDateTimePicker;
    ChBx_Periodo: TCheckBox;
    E_Codigo: TEdit;
    Lb_Placa: TLabel;
    Label1: TLabel;
    cds_searchDATA_HORA: TStringField;
    AtualizarMdulo1: TMenuItem;
    cds_searchTB_INSTITUTION_ID: TIntegerField;
    Configuraes1: TMenuItem;
    procedure ChBx_PeriodoClick(Sender: TObject);
    procedure AtualizarMdulo1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
  private

    procedure SolicitaAtualizacao;
  protected
    procedure CriarVariaveis;Override;
    procedure FinalizaVariaveis;Override;
    procedure IniciaVariaveis;Override;
    procedure GetView;Override;
    procedure Search;Override;
    function ValidaSetRegister:Boolean;override;
    procedure SetRegister;Override;
    procedure returnRegister;Override;

  public
    MGPedidoheader : TControllerMGPedidoHeaderRetorno;
  end;

var
  FrMain: TFrMain;


implementation

{$R *.dfm}

uses un_dm, tas_mg_pedido, un_msg,Un_Criptografia;


{ TFrMain }

procedure TFrMain.AtualizarMdulo1Click(Sender: TObject);
begin
  inherited;
  SolicitaAtualizacao;
end;

procedure TFrMain.ChBx_PeriodoClick(Sender: TObject);
begin
  inherited;
  E_Data_Ini.Enabled := TCheckBox(Sender).Enabled;
  E_Data_Fim.Enabled := TCheckBox(Sender).Enabled;
end;

procedure TFrMain.Configuraes1Click(Sender: TObject);
Var
  Lc_form : TTasConfig;
begin
  Try
    Lc_form := TTasConfig.Create(self);
    Lc_form.ShowModal;
  Finally
    FreeAndNil(Lc_form);
  End;
end;

procedure TFrMain.CriarVariaveis;
var
  Lc_Arq_Ini: TIniFile;
  Lc_Aux : String;
begin
  inherited;
  Lc_Arq_Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'autentica.txt');
  Try
    MGPedidoheader := TControllerMGPedidoHeaderRetorno.Create(self);
    if FileExists(ExtractFilePath(Application.ExeName)+'autentica.txt') then
    Begin
      Lc_Aux := Lc_Arq_Ini.ReadString('GESTAO', 'CODMHA','');
      Lc_Aux := Fc_Base64Decode(Lc_Aux);
      Gb_CodMha := StrToIntDef(Lc_Aux,0);

      Lc_Aux := Lc_Arq_Ini.ReadString('GESTAO', 'USUARIO','');
      Lc_Aux := Fc_Base64Decode(Lc_Aux);
      Gb_Cd_Usuario := StrToIntDef(Lc_Aux,0);

      Lc_Aux := Lc_Arq_Ini.ReadString('GESTAO', 'VENDEDOR','');
      Lc_Aux := Fc_Base64Decode(Lc_Aux);
      Gb_Cd_Vendedor := StrToIntDef(Lc_Aux,0);
    End;
  Finally
    Lc_Arq_Ini.DisposeOf;
    DeleteFile(ExtractFilePath(Application.ExeName)+'autentica.txt')
  End;
  {$IFDEF DEBUG}
    Gb_CodMha := 1;
    Gb_Cd_Usuario := 1;
    Gb_Cd_Vendedor := 1;
  {$ENDIF }
  if not ((Gb_Cd_Usuario > 0) AND (Gb_CodMha > 0)) then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Erro ao executar esse programa.'+EOLN+
                   'A executação deve ser feita através do Gestão.'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    Self.Close;
    Application.Terminate;
  end;

end;

procedure TFrMain.FinalizaVariaveis;
begin
  inherited;
  FreeAndNil(MGPedidoheader);
  FreeAndNil(MGApi);
end;

procedure TFrMain.GetView;
Var
  Lc_form : TTasMgPedido;
begin
  Try
    Lc_form := TTasMgPedido.Create(Self);
    Lc_form.CodigoPedido := cds_searchCODIGO.AsString;
    Lc_form.ShowModal;
  Finally
    FreeAndNil(Lc_form);
  End;
end;

procedure TFrMain.IniciaVariaveis;
begin
  inherited;
  E_Data_Ini.DateTime := Date;
  E_Data_Fim.DateTime := Date;
  Gb_PathExe := ExtractFilePath(Application.ExeName);
end;

procedure TFrMain.returnRegister;
begin
  inherited;

end;

procedure TFrMain.Search;
Var
  I : Integer;
begin
  TRY
    ProcessoAguarde('I');
    MGPedidoheader.Clear;
    MGPedidoheader.Parametros.FieldName.Estabelecimento := Gb_CodMha;
    MGPedidoheader.Parametros.Periodo               := ChBx_Periodo.Checked;
    MGPedidoheader.Parametros.DataInicial           := E_Data_Ini.DateTime;
    MGPedidoheader.Parametros.DataFinal             := E_Data_Fim.DateTime;
    MGPedidoheader.Parametros.FieldName.Codigo      := E_Codigo.Text;
    MGPedidoheader.Parametros.FieldName.PessoaNome  := E_Cliente.Text;
    MGPedidoheader.Search;

    if not cds_search.Active then cds_search.CreateDataSet;
    cds_search.EmptyDataSet;
    for I := 0 to MGPedidoheader.Lista.Count -1 do
    Begin
      cds_search.Append;
      cds_searchTB_INSTITUTION_ID.AsInteger := MGPedidoheader.Lista[I].Estabelecimento;
      cds_searchID.AsInteger :=  MGPedidoheader.Lista[I].Id;
      cds_searchCODIGO.AsString := MGPedidoheader.Lista[I].Codigo;
      cds_searchCODIGO_MARKETPLACE.AsString := MGPedidoheader.Lista[I].CodigoMarketplace;
      cds_searchDATA_HORA.AsString := MGPedidoheader.Lista[I].DataHora;
      cds_searchVALOR_PRODUTO.AsFloat := MGPedidoheader.Lista[I].ValorProduto;
      cds_searchVALOR_FRETE.AsFloat := MGPedidoheader.Lista[I].ValorFrete;
      cds_searchVALOR_DESCONTO.AsFloat := MGPedidoheader.Lista[I].ValorDesconto;
      cds_searchVALOR_ACRESCIMO.AsFloat := MGPedidoheader.Lista[I].ValorAcrescimo;
      cds_searchVALOR_TOTAL.AsFloat := MGPedidoheader.Lista[I].ValorTotal;
      cds_searchPESSOA_ID.AsInteger := MGPedidoheader.Lista[I].PessoaId;
      cds_searchPESSOA_NOME.AsString := MGPedidoheader.Lista[I].PessoaNome;
      cds_searchPESSOA_CPF_CNPJ.AsString := MGPedidoheader.Lista[I].PessoaCpfCnpj;
      cds_searchFORMA_PAGAMENTO_ID.AsInteger := MGPedidoheader.Lista[I].FormaPagamentoId;
      cds_searchFORMA_PAGAMENTO_NOME.AsString := MGPedidoheader.Lista[I].FormaPagamentoNome;
      cds_searchFORMA_RECEBIMENTO_ID.AsInteger :=  MGPedidoheader.Lista[I].FormaRecebimentoId;
      cds_searchFORMA_RECEBIMENTO_NOME.AsString := MGPedidoheader.Lista[I].FormaRecebimentoNome;
      cds_searchCONDICAO_PAGAMENTO_ID.AsInteger := MGPedidoheader.Lista[I].CondicaoPagamentoId;
      cds_searchCONDICAO_PAGAMENTO_NOME.AsString := MGPedidoheader.Lista[I].CondicaoPagamentoNome;
      cds_searchPEDIDO_SITUACAO.AsInteger := MGPedidoheader.Lista[I].PedidoSituacao;
      cds_searchPEDIDO_SITUACAO_DESCRICAO.AsString := MGPedidoheader.Lista[I].PedidoSituacaoDescricao;
      cds_searchPEDIDO_SITUACAO_TIPO.AsInteger := MGPedidoheader.Lista[I].PedidoSituacaoTipo;
      cds_searchLOJA_ID.AsInteger := MGPedidoheader.Lista[I].LojaId;
      cds_searchLOJA_DO_MARKETPLACE_ID.AsInteger := MGPedidoheader.Lista[I].LojaDoMarketplaceId;
      cds_searchLOJA_DO_MARKETPLACE_NOME.AsString := MGPedidoheader.Lista[I].LojaDoMarketplaceNome;
      cds_search.Post;
    End;
    inherited;
  FINALLY
    ProcessoAguarde('F');
  END;

end;

procedure TFrMain.SetRegister;
Var
  I :Integer;
begin
  Try
    ProcessoAguarde('I');
    MGApi.getPedidosHeader;
    for I := 0 to hIGH(MGApi.ListaPedido.data.Items) do
    Begin
      MGPedidoheader.Clear;
      MGPedidoheader.ClonarObj(MGApi.ListaPedido.data.Items[I],MGPedidoheader.Registro);
      MGPedidoheader.Registro.Estabelecimento := 1;
      MGPedidoheader.salva;
    End;
  Finally
    ProcessoAguarde('F');
  End;
end;



procedure TFrMain.SolicitaAtualizacao;
begin
  ExecFileConfig('G','ATUALIZA','MAGAZORD','S');
  MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                 'Esta tela será fechada para atualização.'+EOLN+
                 'Basta Abri-la novamente'+EOLN,
                 ['OK'],[bEscape],mpAlerta);
  Self.Close;
end;

function TFrMain.ValidaSetRegister: Boolean;
begin
  Result := True;
  if (MGApi.URL = '') or (MGApi.User = '' ) or (MGApi.Password = '' ) then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Antes de sincronizar por favor configure a API.'+EOLN+
                   'Verifique antes de continuar.'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    Result := False;
    exit;
  End;
end;

end.
