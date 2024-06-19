unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_base, Vcl.Menus;

type
  TFrMain = class(TFr_Base)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;
  GB_NM_Empresa : String;
  Gb_CodMha : Integer;
  Gb_Nivel : Integer;
  Gb_Cd_Usuario : Integer;
  GB_Nm_Usuario : String;
  Gb_Senha : String;
  Gb_Cd_Vendedor : Integer;
  Gb_Liberado : Boolean;
  Gb_DataCaixa : TDateTime;
  Gb_PAF_NFE_e : Boolean;

implementation

{$R *.dfm}

end.
