unit GenericEntity;

interface

uses
  System.Classes;

Type
  TGenericEntity = class(TObject)
  public
    constructor Create(); Virtual;
    destructor Destroy;override;
  end;

implementation


{ TGenericEntity }

constructor TGenericEntity.create();
begin
  inherited;
end;

destructor TGenericEntity.Destroy;
begin
  inherited;
end;

end.
