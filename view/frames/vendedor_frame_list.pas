unit vendedor_frame_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, STQuery, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, STTransaction;

type
  TVendedorFrameList = class(TBaseFrameList)
  private
    { Private declarations }
  public
    procedure Listar;
  end;

var
  VendedorFrameList: TVendedorFrameList;

implementation

{$R *.dfm}

{ TBaseFrameList1 }

procedure TVendedorFrameList.Listar;
begin
  with Qr_Lista do
  Begin
    Active := False;
    SQL.Clear;
    sql.Add(concat(
              ' SELECT CLB_CODIGO, CLB_NOME, CLB_AQ_COM_vda,CLB_AQ_COM_SRV ',
              ' FROM TB_COLABORADOR tb_colaborador ',
              '   INNER JOIN TB_CARGO tb_cargo ',
              '   ON (tb_cargo.CRG_CODIGO = tb_colaborador.CLB_CODCRG) ',
              'WHERE (CLB_DEMISSAO IS NULL) ',
              ' AND  (CRG_DESCRICAO LIKE ''VENDEDOR%'') ',
              ' ORDER BY CLB_NOME '
    ));
    Active := true;
    FetchAll;
  end;

end;

end.
