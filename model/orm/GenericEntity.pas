unit GenericEntity;

interface

uses
  System.Classes;

Type
  TGenericEntity = class(TComponent)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  end;

implementation


{ TGenericEntity }

constructor TGenericEntity.create(AOwner: TComponent);
begin
  inherited;
end;

destructor TGenericEntity.Destroy;
begin
  inherited;
end;

end.
