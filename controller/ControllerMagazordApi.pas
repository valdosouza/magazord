unit ControllerMagazordApi;

interface

uses
  System.Classes, RESTRequest4D, System.Generics.Collections,REST.Json,
  ModelMGPedidoHeaderRetorno,
  ModelMGPedidoHeader;

type

  TControllerMagazordApi = Class(TComponent)
  private
    FUrl : String;
    FUser : String;
    FPassword : String;
    FResponse: IResponse;
  public
    ListaPedido : TMGPedidoHeaderRetorno;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  getPedidosHeader;
  End;
implementation

{ TControllerMagazordApi }

constructor TControllerMagazordApi.Create(AOwner: TComponent);
begin
  inherited;
  //       https://genioferramentas.painel.magazord.com.br/api/v2/site/pedido?dataHora[gt]=2024-06-27
  FURL := 'https://genioferramentas.painel.magazord.com.br/api';
  FUser := 'bf0e3daf73197b4fe134a47f2072fbcc44a02c7fa32b1fab5a045d7062522991';
  FPassword := '%Q6o&64#G';
  ListaPedido := TMGPedidoHeaderRetorno.Create;
end;

destructor TControllerMagazordApi.Destroy;
begin

  inherited;
end;

procedure TControllerMagazordApi.getPedidosHeader;
begin
  Try
    Try
      FResponse := TRequest.New.BaseURL(concat(FUrl , '/v2/site/pedido'))
        .ContentType('application/json')
        .Accept('application/json')
        .BasicAuthentication(FUser,FPassword)
        .AddParam('dataHora[gt]', '2024-06-27')
        .Get;
      ListaPedido := TJson.JsonToObject<TMGPedidoHeaderRetorno>(FResponse.Content);
    Except

    End;
  Finally

  End;
end;

end.
