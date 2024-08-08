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
  FormaPagamentoFrameList.Listar;
  TabelaPrecoFrameList.Listar;
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
  try
    ProcessoAguarde('I');
    if ValidaGeraPedido then
    Begin

    End;
  finally
    ProcessoAguarde('F');
  end;
end;

procedure TTasGenerateOrder.SB_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

function TTasGenerateOrder.ValidaGeraPedido: boolean;
begin
  Result := True;
end;

end.
