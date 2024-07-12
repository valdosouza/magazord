unit tas_mg_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Un_Base, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls,ControllerMGPedido, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Mask, Vcl.ComCtrls, ControllerPedido;

type
  TTasMgPedido = class(TFr_Base)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_GerarPedido: TSpeedButton;
    SB_Sair: TSpeedButton;
    Lb_Codigo: TLabel;
    E_Codigo: TEdit;
    E_Data: TEdit;
    Lb_Data: TLabel;
    E_Cliente: TEdit;
    Lb_Cliente: TLabel;
    Lb_FormaPagamento: TLabel;
    E_Forma_Pagamentos: TEdit;
    Lb_Nr_Doc: TLabel;
    E_Nr_Doc: TEdit;
    Lb_Condicao_Pagamento: TLabel;
    E_Condicao_Pagamento: TEdit;
    Lb_Marketplace: TLabel;
    E_Marketplace: TEdit;
    E_Pedido_situacao: TEdit;
    Lb_Pedido_situacao: TLabel;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    cds_searchproduct_description: TStringField;
    cds_searchproduct_id: TIntegerField;
    cds_searchquantity: TFloatField;
    cds_searchvalor_unitario: TFloatField;
    cds_searchvalor_subtotal: TFloatField;
    cds_searchean: TStringField;
    cds_searchbrand_name: TStringField;
    cds_searchcategoria_name: TStringField;
    Pnl_totalizador: TPanel;
    Lb_Qt_Produto: TLabel;
    Lb_VL_Produto: TLabel;
    Lb_VL_Frete: TLabel;
    Lb_VL_Pedido: TLabel;
    Lb_VL_Desconto: TLabel;
    E_VL_Frete: TEdit;
    E_VL_Produto: TEdit;
    E_VL_Desconto: TEdit;
    E_VL_Pedido: TEdit;
    E_Qt_Produto: TEdit;
    Pg_main: TPageControl;
    TabSheet1: TTabSheet;
    DBG_Items: TDBGrid;
    tbs_delivery: TTabSheet;
    Pnl_delivery: TPanel;
    Lb_Logradouro: TLabel;
    Lb_Numero: TLabel;
    Lb_Complemento: TLabel;
    Lb_Bairro: TLabel;
    Lb_Cidade: TLabel;
    Lb_Estado: TLabel;
    E_Logradouro: TEdit;
    E_Numero: TEdit;
    E_Complemento: TEdit;
    E_Bairro: TEdit;
    E_Cidade: TEdit;
    E_Estado: TEdit;
    Lb_Cep: TLabel;
    E_Cep: TEdit;
    Label1: TLabel;
    E_Forma_recebimento: TEdit;
    Label2: TLabel;
    E_Codigo_Secundario: TEdit;
    procedure SB_SairClick(Sender: TObject);
    procedure SB_GerarPedidoClick(Sender: TObject);
  private
    FCodigoPedido: String;
    procedure setFCodigoPedido(const Value: String);
    function ValidaDownloadPedido:Boolean;
    function DownloadPedido:Boolean;
    procedure SaveMGPedido;
    procedure PreencherPedido;
    procedure PreencherPedidoItem;
    procedure PreencherPedidoEntrega;
    function ValidaGeraPedidoSetes:boolean;
    procedure GeraPedidosSetes;

  protected
    procedure ImagemBotao;override;
    procedure CriarVariaveis;override;
    procedure IniciaVariaveis;override;
    procedure FinalizaVariaveis;override;
    procedure setPerfil;override;
    procedure FormataTela;override;
  public
    MGPedido : TControllerMGPedido;
    Pedido : TControllerPedido;
    property CodigoPedido : String read FCodigoPedido write setFCodigoPedido;
  end;

var
  TasMgPedido: TTasMgPedido;

implementation

uses Un_Msg,un_variables;
{$R *.dfm}

{ TTasMgPedido }

procedure TTasMgPedido.CriarVariaveis;
begin
  inherited;
  MGPedido := TControllerMGPedido.create(Self);
  Pedido := TControllerPedido.create(Self);
end;

function TTasMgPedido.DownloadPedido:boolean;
begin
  MGApi.CodigoPedido := self.CodigoPedido;
  try
    MGApi.getPedido;
    Result := True;
  Except
    Result := False;
  end;
end;

procedure TTasMgPedido.FinalizaVariaveis;
begin
  FreeAndNil(Pedido);
  FreeAndNil(MGPedido);
  inherited;
end;

procedure TTasMgPedido.FormataTela;
begin
  inherited;

end;

procedure TTasMgPedido.GeraPedidosSetes;
begin

end;

procedure TTasMgPedido.ImagemBotao;
begin
  inherited;
  CarregaImagemBotao(SB_Sair,'SAIR');
  CarregaImagemBotao(SB_GerarPedido,'CONFIRMAR');

end;

procedure TTasMgPedido.IniciaVariaveis;
begin
  inherited;
  Try
    ProcessoAguarde('I');
    if ValidaDownloadPedido then
    Begin
      if DownloadPedido then
        SaveMGPedido;
    End;
    PreencherPedido;
    PreencherPedidoItem;
    PreencherPedidoEntrega;
  Finally
    ProcessoAguarde('F');
  End;
end;

procedure TTasMgPedido.PreencherPedido;
begin
  E_Codigo.Text             :=  MGPedido.Registro.Codigo;
  E_Codigo_Secundario.Text  :=  MGPedido.Registro.CodigoSecundario;
  E_Data.Text               :=  DateTimeToStr(MGPedido.Registro.DataHora);
  E_Cliente.Text            :=  MGPedido.Registro.PessoaNome;
  E_Forma_Pagamentos.Text   :=  MGPedido.Registro.FormaPagamentoNome;
  E_Nr_Doc.Text             :=  MGPedido.Registro.PessoaCpfCnpj;
  E_Condicao_Pagamento.Text :=  MGPedido.Registro.CondicaoPagamentoNome;
  E_Forma_recebimento.Text  :=  MGPedido.Registro.FormaRecebimentoNome;
  E_Marketplace.Text        :=  MGPedido.Registro.MarketplaceNome;
  E_Pedido_situacao.Text    :=  MGPedido.Registro.PedidoSituacaoDescricao;
  E_VL_Frete.Text           :=  FloatToStrF(MGPedido.Registro.ValorFrete,ffNumber,10,2);
  E_VL_Produto.Text         :=  FloatToStrF(MGPedido.Registro.ValorProduto,ffNumber,10,2);
  E_VL_Desconto.Text        :=  FloatToStrF(MGPedido.Registro.ValorDesconto,ffNumber,10,2);
  E_VL_Pedido.Text          :=  FloatToStrF(MGPedido.Registro.ValorTotal,ffNumber,10,2);

end;

procedure TTasMgPedido.PreencherPedidoEntrega;
begin
  E_Logradouro.Text   := MGPedido.Registro.Logradouro;
  E_Numero.Text       := MGPedido.Registro.Numero;
  E_Bairro.Text       := MGPedido.Registro.Bairro;
  E_Complemento.Text  := MGPedido.Registro.Complemento;
  E_Cep.Text          := MGPedido.Registro.Cep;
  E_Cidade.Text       := MGPedido.Registro.CidadeNome;
  E_Estado.Text       := MGPedido.Registro.EstadoSigla;
end;

procedure TTasMgPedido.PreencherPedidoItem;
begin

end;

procedure TTasMgPedido.SaveMGPedido;
Var
  I,J : Integer;
begin
  MGPedido.ClonarObj(MGApi.Pedido.data,MGPedido.Registro);
  MGPedido.Registro.Estabelecimento := Gb_CodMha;
  MGPedido.salva;

  for I := 0 to High(MGApi.Pedido.data.PedidoRastreio) do
  Begin
    MGPedido.ClonarObj(MGApi.Pedido.data.PedidoRastreio[I], MGPedido.Rastreio.Registro);
    MGPedido.Rastreio.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
    MGPedido.Rastreio.salva;

    for J := 0 to High(MGApi.Pedido.data.PedidoRastreio[I].PedidoItem) do
    Begin
      MGPedido.ClonarObj( MGApi.Pedido.data.PedidoRastreio[I].PedidoItem[J],MGPedido.Item.Registro);
      MGPedido.Item.Registro.Estabelecimento :=  MGPedido.Registro.Estabelecimento;
      MGPedido.Item.salva;
    End;

    for J := 0 to High(MGApi.Pedido.data.PedidoRastreio[I].PedidoNotaFiscal) do
    Begin
      MGPedido.ClonarObj( MGApi.Pedido.data.PedidoRastreio[I].PedidoNotaFiscal[J],MGPedido.NotaFiscal.Registro);
      MGPedido.NotaFiscal.Registro.Estabelecimento :=  MGPedido.Registro.Estabelecimento;
      MGPedido.NotaFiscal.salva;
    End;

  End;

  for I := 0 to High(MGApi.Pedido.data.PedidoHistorico) do
  Begin
    MGPedido.ClonarObj(MGApi.Pedido.data.PedidoHistorico[I], MGPedido.Historico.Registro);
    MGPedido.Historico.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
    MGPedido.Historico.salva;
  End;

  MGPedido.ClonarObj(MGApi.Pedido.data.PedidoPromocoes, MGPedido.Promocoes.Registro);
  MGPedido.Promocoes.Registro.Estabelecimento := MGPedido.Registro.Estabelecimento;
  MGPedido.Promocoes.salva;



end;

procedure TTasMgPedido.SB_GerarPedidoClick(Sender: TObject);
begin
  if ValidaGeraPedidoSetes then
    GeraPedidosSetes;

end;

procedure TTasMgPedido.SB_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasMgPedido.setFCodigoPedido(const Value: String);
begin
  FCodigoPedido := Value;
end;

procedure TTasMgPedido.setPerfil;
begin
  inherited;

end;


function TTasMgPedido.ValidaDownloadPedido: Boolean;
begin
  //Só faz o downalod se o pedido não existir
  MGPedido.Parametros.FieldName.Codigo := self.CodigoPedido;
  MGPedido.Parametros.Estabelecimento := Gb_CodMha;
  MGPedido.getByCodigo;
  Result := not MGPedido.exist;
end;

function TTasMgPedido.ValidaGeraPedidoSetes: boolean;
begin
  Result := True;
  MGPedido.FromExterior.Registro.CodigoExterior := MGPedido.Registro.Codigo;
  MGPedido.FromExterior.Registro.Kind := 'MAGAZORD';
  MGPedido.FromExterior.getbyId;
  if MGPedido.FromExterior.exist then
  Begin

  End;

end;

end.
