program Magazord;

uses
  Vcl.Forms,
  main in 'main.pas' {FrMain},
  Un_Base in 'view\inheritable\Un_Base.pas' {Fr_Base},
  base_registry in 'view\inheritable\base_registry.pas' {BaseRegistry},
  base_search in 'view\inheritable\base_search.pas' {BaseSearch},
  un_dm in 'un_dm.pas' {DM: TDataModule},
  tas_config in 'view\module\operation\admin\tas_config.pas' {TasConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrMain, FrMain);
  Application.CreateForm(TTasConfig, TasConfig);
  Application.Run;
end.
