unit ControllerMGPedidoBoleto;

interface

uses STDatabase,Classes, Vcl.Grids,STQuery, SysUtils,ControllerBase, tblGeral,
     Generics.Collections,ModelMGPedidoBoleto, FireDAC.Stan.Param,
  prm_mg_pedido_boleto;

Type
  TListaMGPedidoBoleto = TObjectList<TMGPedidoBoleto>;

  TControllerMGPedidoBoleto = Class(TControllerBase)
  private
    FParametros: TPrmMGPedidoboleto;
    procedure setFParametros(const Value: TPrmMGPedidoboleto);

  public
    Registro : TMGPedidoBoleto;
    Lista : TListaMGPedidoBoleto;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear;
    procedure getById;
    function salva:boolean;
    procedure search;
    property Parametros : TPrmMGPedidoboleto read FParametros write setFParametros;
  End;

implementation

{ TControllerMGPedidoBoleto }

procedure TControllerMGPedidoBoleto.Clear;
begin
  clearObj(Registro);
end;

constructor TControllerMGPedidoBoleto.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMGPedidoBoleto.Create;
  Lista := TListaMGPedidoBoleto.Create;
  FParametros := TPrmMGPedidoboleto.Create;
end;

destructor TControllerMGPedidoBoleto.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  FreeAndNil(FParametros);
  inherited;
end;

procedure TControllerMGPedidoBoleto.getById;
begin
  _getByKey(Registro);
end;

function TControllerMGPedidoBoleto.salva: boolean;
begin
  Result := True;
  SaveObj(Registro);
end;

procedure TControllerMGPedidoBoleto.search;
begin

end;

procedure TControllerMGPedidoBoleto.setFParametros(
  const Value: TPrmMGPedidoboleto);
begin
  FParametros := Value;
end;

end.
