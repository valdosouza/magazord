unit un_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, STDatabase, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, STQuery;

type
  TDM = class(TDataModule)
    IBD_Gestao: TSTDatabase;
    Qr_Crud: TSTQuery;
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
Var
  LcServer, LcPort, LcDatabase,LcUserName,LcPassword : String;
begin
  LcServer   := 'NOTEVALDO';
  LcPort     := '3060';
  LcDatabase := 'D:\Modelos\erp\Database\IBGCOM.FDB';
  LcUserName := 'sysdba';
  LcPassword := 'masterkey';

  DM.IBD_Gestao.Close;
  DM.IBD_Gestao.DatabaseName := Concat(LcServer,'/',LcPort,LcDatabase);
  {
  DM.IBD_Gestao.Params.Clear;
  DM.IBD_Gestao.Params.Add('Protocol=TCPIP');
  DM.IBD_Gestao.Params.Add('Server='+LcServer);
  DM.IBD_Gestao.Params.Add('Database='+LcDatabase);
  DM.IBD_Gestao.Params.Add('User_Name='+LcUsername);
  DM.IBD_Gestao.Params.Add('Password='+LcPassword);
  DM.IBD_Gestao.Params.Add('DriverID=FB');
  DM.IBD_Gestao.Params.Add('Port=3350');
  }
  DM.IBD_Gestao.Connected := True;
end;
end.
