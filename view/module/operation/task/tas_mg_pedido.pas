unit tas_mg_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Un_Base, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls,ControllerMGPedido, Vcl.StdCtrls;

type
  TTasMgPedido = class(TFr_Base)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_GerarPedido: TSpeedButton;
    SB_Sair: TSpeedButton;
    Lb_Url: TLabel;
    E_URL: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
  private
    FCodigoPedido: String;
    procedure setFCodigoPedido(const Value: String);
    function ValidaDownloadPedido:Boolean;
    function DownloadPedido:Boolean;
    procedure SaveMGPedido;
  protected
    procedure ImagemBotao;override;
    procedure CriarVariaveis;override;
    procedure IniciaVariaveis;override;
    procedure FinalizaVariaveis;override;
    procedure setPerfil;override;
    procedure FormataTela;override;
  public
    MGPedido : TControllerMGPedido;
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
  FreeAndNil(MGPedido);
  inherited;
end;

procedure TTasMgPedido.FormataTela;
begin
  inherited;

end;

procedure TTasMgPedido.ImagemBotao;
begin
  inherited;
  CarregaImagemBotao(SB_Sair,'SAIR');
  CarregaImagemBotao(SB_GerarPedido,'CONFIRMAR');

end;

procedure TTasMgPedido.IniciaVariaveis;
begin
  if ValidaDownloadPedido then
  Begin
    Try
      ProcessoAguarde('I');
      if DownloadPedido then
        SaveMGPedido;
    Finally
      ProcessoAguarde('F');
    End;
  End;
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

end.
