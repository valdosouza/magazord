unit un_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, STDatabase, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, STQuery, Datasnap.Provider, System.IniFiles, Vcl.Forms;

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
var
   Lc_Arq_Ini: TIniFile;
   Lc_Dado:String;
   Lc_pos : Integer;
   Lc_pos2 : Integer;
   Lc_ServFB : String;
   Lc_PathFB : String;
   Lc_Port : String;
begin
  //Database=192.168.25.251:/home/genio/database/IBGCOM.FDB
  Lc_Arq_Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');
  Lc_Dado := Lc_Arq_Ini.ReadString('Path', 'Database', Lc_PathFB);
  Lc_Port := '3050';

  Lc_pos := pos('/',Lc_Dado);
  lc_pos2  := pos(':',Lc_Dado);
  if  (Lc_pos >  0) and (Lc_pos < lc_pos2 ) then
  Begin
    Lc_ServFB := Copy(Lc_Dado,0,lc_pos-1);
    Lc_Port := Copy(Lc_Dado,lc_pos+1,4);

    lc_pos:= pos(':',Lc_Dado);
    Lc_PathFB := Copy(Lc_Dado,lc_pos+1,Length(Lc_Dado));
  End
  else
  Begin
    lc_pos:= pos(':',Lc_Dado);
    Lc_ServFB := Copy(Lc_Dado,0,lc_pos-1);
    Lc_PathFB := Copy(Lc_Dado,lc_pos+1,Length(Lc_Dado));
  End;


  DM.IBD_Gestao.Close;
  //DM.IBD_Gestao.DatabaseName := Concat(LcServer,'/',LcPort,LcDatabase);
  {
  Database=/home/genio/database/IBGCOM.FDB
  User_Name=sysdba
  Password=*****
  Protocol=TCPIP
  Server=192.168.25.251
  Port=3050
  CharacterSet=WIN1252
  DriverID=FB
  }
  DM.IBD_Gestao.Params.Clear;
  DM.IBD_Gestao.Params.Add( concat('Database=',Lc_PathFB) );
  DM.IBD_Gestao.Params.Add('User_Name=sysdba');
  DM.IBD_Gestao.Params.Add('Password=masterkey');
  DM.IBD_Gestao.Params.Add('Protocol=TCPIP');
  DM.IBD_Gestao.Params.Add( concat('Server=',Lc_ServFB));
  DM.IBD_Gestao.Params.Add( concat('Port=',Lc_Port));
  DM.IBD_Gestao.Params.Add('CharacterSet=WIN1252');
  DM.IBD_Gestao.Params.Add('DriverID=FB');

  DM.IBD_Gestao.Connected := True;
end;
procedure TDM.DataModuleCreate(Sender: TObject);
begin
  DatabaseConnect;
end;

end.
