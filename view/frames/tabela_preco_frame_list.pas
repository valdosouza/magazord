unit tabela_preco_frame_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, STQuery, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, STTransaction;

type
  TTabelaPrecoFrameList = class(TBaseFrameList)
  private
    { Private declarations }
  public
    procedure Listar;
  end;

var
  TabelaPrecoFrameList: TTabelaPrecoFrameList;

implementation

{$R *.dfm}

{ TTabelaPrecoFrameList }

procedure TTabelaPrecoFrameList.Listar;
begin
  with Qr_Lista do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'select TPR_CODIGO, TPR_NOME ',
              'from TB_TABELA_PRECO ',
              'where (TPR_CODIGO <> 2) ',
              ' AND ( TPR_ATIVA = ''S'') ',
              'ORDER BY TPR_NOME '
    ));

    Active := True;
    FetchAll;
  End;
end;

end.
