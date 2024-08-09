program Magazord;

uses
  Vcl.Forms,
  main in 'main.pas' {FrMain},
  Un_Base in 'view\inheritable\Un_Base.pas' {Fr_Base},
  base_registry in 'view\inheritable\base_registry.pas' {BaseRegistry},
  base_search in 'view\inheritable\base_search.pas' {BaseSearch},
  un_dm in 'un_dm.pas' {DM: TDataModule},
  tas_config in 'view\module\operation\admin\tas_config.pas' {TasConfig},
  ModelMGPedidoTrackingParams in 'model\ModelMGPedidoTrackingParams.pas',
  ModelMGPedidoBoleto in 'model\ModelMGPedidoBoleto.pas',
  ControllerMGPedidoBoleto in 'controller\ControllerMGPedidoBoleto.pas',
  prm_mg_pedido_boleto in 'parameter\prm_mg_pedido_boleto.pas',
  base_frame_list in 'view\inheritable\base_frame_list.pas' {BaseFrameList: TFrame},
  forma_pagamento_frame_list in 'view\frames\forma_pagamento_frame_list.pas' {FormaPagamentoFrameList: TFrame},
  tabela_preco_frame_list in 'view\frames\tabela_preco_frame_list.pas' {TabelaPrecoFrameList: TFrame},
  vendedor_frame_list in 'view\frames\vendedor_frame_list.pas' {VendedorFrameList: TFrame},
  tas_generate_order in 'view\module\operation\task\tas_generate_order.pas' {TasGenerateOrder},
  tas_mg_pedido in 'view\module\operation\task\tas_mg_pedido.pas' {TasMgPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrMain, FrMain);
  Application.Run;
end.
