unit ControllerMagazordApi;

interface

uses
  System.Classes, RESTRequest4D, System.Generics.Collections,REST.Json,
  ModelMGPedidoHeaderRetorno,
  ModelMGPedidoHeader,
  ModelMGPedidoRetorno;

type

  TControllerMagazordApi = Class(TComponent)
  private
    FResponse: IResponse;
    FCodigoPedido: String;
    FPassword: String;
    FURL: String;
    FUser: String;
    FDataFinal: String;
    FDataInicial: String;
    procedure setFCodigoPedido(const Value: String);
    procedure setFPassword(const Value: String);
    procedure setFURL(const Value: String);
    procedure setFUser(const Value: String);
    procedure setFDataFinal(const Value: String);
    procedure setFDataInicial(const Value: String);
  public
    ListaPedido : TMGPedidoHeaderRetorno;
    Pedido : TMGPedidoRetorno;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  getPedidosHeader;
    procedure  getPedido;
  published
    property URL : String read FURL write setFURL;
    property User : String read FUser write setFUser;
    property Password : String read FPassword write setFPassword;
    property DataInicial : String read FDataInicial write setFDataInicial;
    property DataFinal : String read FDataFinal write setFDataFinal;
    property CodigoPedido : String read FCodigoPedido write setFCodigoPedido;
  End;
implementation

{ TControllerMagazordApi }

constructor TControllerMagazordApi.Create(AOwner: TComponent);
begin
  inherited;
  ListaPedido := TMGPedidoHeaderRetorno.Create;
end;

destructor TControllerMagazordApi.Destroy;
begin

  inherited;
end;

procedure TControllerMagazordApi.getPedido;
Var
  Lc_request : IRequest;
begin
  Lc_request := TRequest.New.BaseURL(concat(FUrl , '/v2/site/pedido/',FCodigoPedido))
                .ContentType('application/json')
                .Accept('application/json')
                .BasicAuthentication(FUser,FPassword);
  FResponse := Lc_request.Get;
  Pedido := TJson.JsonToObject<TMGPedidoRetorno>(FResponse.Content);

end;

procedure TControllerMagazordApi.getPedidosHeader;
Var
  Lc_request : IRequest;
begin
  Try
    Try
      Lc_request := TRequest.New.BaseURL(concat(FUrl , '/v2/site/pedido'))
                    .ContentType('application/json')
                    .Accept('application/json')
                    .BasicAuthentication(FUser,FPassword);
      if FDataInicial <> '' then
      Begin
        Lc_request. AddParam('dataHora[gte]', FDataInicial);//maior ou igual a data
      End;
      if FDataFinal <> '' then
      Begin
        Lc_request. AddParam('dataHora[lte]', FDataFinal);//menor ou igual a data
      End;

      FResponse := Lc_request.Get;
      ListaPedido := TJson.JsonToObject<TMGPedidoHeaderRetorno>(FResponse.Content);
    Except

    End;
  Finally

  End;
end;

procedure TControllerMagazordApi.setFPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TControllerMagazordApi.setFURL(const Value: String);
begin
  FURL := Value;
end;

procedure TControllerMagazordApi.setFUser(const Value: String);
begin
  FUser := Value;
end;

procedure TControllerMagazordApi.setFCodigoPedido(const Value: String);
begin
  FCodigoPedido := Value;
end;

procedure TControllerMagazordApi.setFDataFinal(const Value: String);
begin
  //Formato esperado "YYYY-MM-DDThh:mm:ssZ" ou "YYYY-MM-DD"  - DD-MM-YYYY
  FDataFinal := concat(Copy(Value,7,4),'-',Copy(Value,4,2),'-',Copy(Value,1,2));
end;

procedure TControllerMagazordApi.setFDataInicial(const Value: String);
begin
  //Formato esperado "YYYY-MM-DDThh:mm:ssZ" ou "YYYY-MM-DD"  - DD-MM-YYYY
  FDataInicial := concat(Copy(Value,7,4),'-',Copy(Value,4,2),'-',Copy(Value,1,2));
end;

end.
