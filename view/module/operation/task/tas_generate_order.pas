unit tas_generate_order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Un_Base, Vcl.Menus, Vcl.Buttons,
  Vcl.ExtCtrls,ControllerPedido,ControllerMGPedido, Vcl.StdCtrls,
  base_frame_list, vendedor_frame_list, forma_pagamento_frame_list,
  tabela_preco_frame_list;

type

  TTasGenerateOrder = class(TFr_Base)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_GerarPedido: TSpeedButton;
    SB_Sair: TSpeedButton;
    VendedorFrameList: TVendedorFrameList;
    FormaPagamentoFrameList: TFormaPagamentoFrameList;
    TabelaPrecoFrameList: TTabelaPrecoFrameList;
    procedure SB_SairClick(Sender: TObject);
    procedure SB_GerarPedidoClick(Sender: TObject);
  private
    function  ValidaGeraPedido:boolean;
    procedure AtivaFrames;
  protected
    procedure ImagemBotao;override;
    procedure IniciaVariaveis;override;
  public

  end;

var
  TasGenerateOrder: TTasGenerateOrder;

implementation

uses Un_Msg,un_variables,UnFunctions;
{$R *.dfm}

{ TTasGenerateOrder }

procedure TTasGenerateOrder.AtivaFrames;
begin
  VendedorFrameList.Listar;
  VendedorFrameList.Dblcb_Lista.KeyValue := ExecGeneralConfig('L','MG_VENDEDOR',Gb_Cd_Vendedor.ToString());

  FormaPagamentoFrameList.Listar;
  FormaPagamentoFrameList.Dblcb_Lista.KeyValue := ExecGeneralConfig('L','MG_FORMAPAGAMENTO','1');

  TabelaPrecoFrameList.Listar;
  TabelaPrecoFrameList.Dblcb_Lista.KeyValue := ExecGeneralConfig('L','MG_TABELAPRECO','1');
end;

procedure TTasGenerateOrder.ImagemBotao;
begin
  inherited;
  CarregaImagemBotao(SB_Sair,'SAIR');
  CarregaImagemBotao(SB_GerarPedido,'CONFIRMAR');

end;

procedure TTasGenerateOrder.IniciaVariaveis;
begin
  AtivaFrames;
end;

procedure TTasGenerateOrder.SB_GerarPedidoClick(Sender: TObject);
begin
  if ValidaGeraPedido then
  Begin
    ExecGeneralConfig('G','MG_VENDEDOR',intToStr(VendedorFrameList.Dblcb_Lista.KeyValue));
    ExecGeneralConfig('G','MG_FORMAPAGAMENTO',intToStr(FormaPagamentoFrameList.Dblcb_Lista.KeyValue));
    ExecGeneralConfig('G','MG_TABELAPRECO',IntToStr(TabelaPrecoFrameList.Dblcb_Lista.KeyValue));
    Close;
  End;
end;

procedure TTasGenerateOrder.SB_SairClick(Sender: TObject);
begin
  VendedorFrameList.Dblcb_Lista.KeyValue := Null;
  FormaPagamentoFrameList.Dblcb_Lista.KeyValue := Null;
  TabelaPrecoFrameList.Dblcb_Lista.KeyValue := Null;
  Close;
end;

function TTasGenerateOrder.ValidaGeraPedido: boolean;
begin
  Result := True;
  if (VendedorFrameList.Dblcb_Lista.Text = EmptyStr ) then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo vendedor é obrigatório.'+EOLN+
                   'Preencha para continuar.'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    Result := False;
    exit;
  End;

  if (FormaPagamentoFrameList.Dblcb_Lista.Text = EmptyStr ) then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo forma de pagamento é obrigatório.'+EOLN+
                   'Preencha para continuar.'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    Result := False;
    exit;
  End;


  if (TabelaPrecoFrameList.Dblcb_Lista.Text = EmptyStr ) then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo Tabela de preço é obrigatório.'+EOLN+
                   'Preencha para continuar.'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    Result := False;
    exit;
  End;
end;

end.
