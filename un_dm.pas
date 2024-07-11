unit un_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, STDatabase, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, STQuery, Datasnap.Provider;

type
  TDM = class(TDataModule)
    IBD_Gestao: TSTDatabase;
    Qr_Crud: TSTQuery;
    DSP: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    procedure DatabaseConnect;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DatabaseConnect;
begin
  {
  LcServer   := '127.0.0.1';
  LcPort     := '3050';
  LcDatabase := 'D:\Modelos\Genio\Database\IBGCOM.FDB';
  LcUserName := 'sysdba';
  LcPassword := 'masterkey';
  }


  DM.IBD_Gestao.Close;
  //DM.IBD_Gestao.DatabaseName := Concat(LcServer,'/',LcPort,LcDatabase);

  DM.IBD_Gestao.Params.Clear;
  DM.IBD_Gestao.Params.Add('Database=D:\Modelos\Genio\database\IBGCOM.FDB');
  DM.IBD_Gestao.Params.Add('User_Name=sysdba');
  DM.IBD_Gestao.Params.Add('Password=masterkey');
  DM.IBD_Gestao.Params.Add('Protocol=TCPIP');
  DM.IBD_Gestao.Params.Add('Server=127.0.0.1');
  DM.IBD_Gestao.Params.Add('Port=3050');
  DM.IBD_Gestao.Params.Add('CharacterSet=WIN1252');
  DM.IBD_Gestao.Params.Add('DriverID=FB');

  DM.IBD_Gestao.Connected := True;
end;
procedure TDM.DataModuleCreate(Sender: TObject);
begin
  DatabaseConnect;
end;

end.
