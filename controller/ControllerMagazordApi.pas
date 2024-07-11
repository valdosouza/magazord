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
    FDataeHora: String;
    FCodigoPedido: String;
    FPassword: String;
    FURL: String;
    FUser: String;
    procedure setFDataeHora(const Value: String);
    procedure setFCodigoPedido(const Value: String);
    procedure setFPassword(const Value: String);
    procedure setFURL(const Value: String);
    procedure setFUser(const Value: String);
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
    property DataeHora : String read FDataeHora write setFDataeHora;
    property CodigoPedido : String read FCodigoPedido write setFCodigoPedido;
  End;
implementation

{ TControllerMagazordApi }

constructor TControllerMagazordApi.Create(AOwner: TComponent);
begin
  inherited;
  ListaPedido := TMGPedidoHeaderRetorno.Create(self);
end;

destructor TControllerMagazordApi.Destroy;
begin

  inherited;
end;

procedure TControllerMagazordApi.getPedido;
Var
  Lc_request : IRequest;
begin
  Try
    Try
      Lc_request := TRequest.New.BaseURL(concat(FUrl , '/v2/site/pedido/',FCodigoPedido))
                    .ContentType('application/json')
                    .Accept('application/json')
                    .BasicAuthentication(FUser,FPassword);
      FResponse := Lc_request.Get;
      Pedido := TJson.JsonToObject<TMGPedidoRetorno>(FResponse.Content);
    Except

    End;
  Finally

  End;

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
      if FDataeHora <> '' then
      Begin
        Lc_request. AddParam('dataHora[gte]', FDataeHora);//menor ou igual a data
        Lc_request. AddParam('dataHora[lte]', FDataeHora);//menor ou igual a data
      End;
      FResponse := Lc_request.Get;
      ListaPedido := TJson.JsonToObject<TMGPedidoHeaderRetorno>(FResponse.Content);
    Except

    End;
  Finally

  End;
end;

procedure TControllerMagazordApi.setFDataeHora(const Value: String);
begin
  FDataeHora := Value;
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

end.
