unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_base, Vcl.Menus, Vcl.StdCtrls,REST.Json,
  ModelMGPedidoRetorno,
  ModelMGPedido,
  ModelMGPedidoPromocoes,
  ModelMGPedidoHistorico,
  ModelMGPedidoItem,
  ModelMGPedidoNotaFiscal,
  ModelMGPedidoRastreio;

type
  TFrMain = class(TFr_Base)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    function getContentFile:String;
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

procedure TFrMain.Button1Click(Sender: TObject);
Var
  LcPedido : TMGPedidoRetorno;
begin
  try
    Try
      getContentFile;
      LcPedido := TJson.JsonToObject<TMGPedidoRetorno>(Memo1.Text);
    Except
      on E:Exception do
        ShowMessage(E.Message);
    End;
  finally
    LcPedido.Destroy;
  end;


end;

function TFrMain.getContentFile: String;
var
f:TextFile; Linha:String;
  FileName : String;
begin
  Result := '';
  FileName := 'D:\Modelos\Genio\Pedido_mercado_livre.json';


  AssignFile(f, FileName);
  Reset(f);
  Memo1.Lines.Clear;
  While not Eof(f) do
  Begin
    Readln(f, Linha);
    Memo1.Lines.Add(Linha);
  end;
  CloseFile(f);
end;

end.
