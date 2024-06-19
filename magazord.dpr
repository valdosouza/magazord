program magazord;

uses
  Vcl.Forms,
  main in 'main.pas' {FrMain},
  Un_Base in 'view\inheritable\Un_Base.pas' {Fr_Base},
  base_registry in 'view\inheritable\base_registry.pas' {BaseRegistry},
  base_search in 'view\inheritable\base_search.pas' {BaseSearch},
  un_dm in 'un_dm.pas' {DM: TDataModule},
  ControllerPermissao in 'controller\ControllerPermissao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
