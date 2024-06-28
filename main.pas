unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_base, Vcl.Menus, Vcl.StdCtrls,REST.Json,
  ControllerMagazordApi,
  ModelMGPedidoRetorno,
  ModelMGPedido,
  ModelMGPedidoPromocoes,
  ModelMGPedidoHistorico,
  ModelMGPedidoItem,
  ModelMGPedidoNotaFiscal,
  ModelMGPedidoRastreio, ModelMGPedidoHeader;

type
  TFrMain = class(TFr_Base)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TFrMain.Button2Click(Sender: TObject);
Var
  Lc_api : TControllerMagazordApi;
  I :Integer;
begin
  Try
    Lc_api := TControllerMagazordApi.Create(Self);
    Lc_api.getPedidosHeader;
    Memo1.Lines.Clear;
    for I := 0 to hIGH(Lc_api.ListaPedido.data.Items) do
    Begin
      Memo1.Lines.Add(concat('Pedido: ',Lc_api.ListaPedido.data.Items[I].Codigo));
    End;

  Finally
    FreeAndNil(Lc_api);
  End;

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
