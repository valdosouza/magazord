unit forma_pagamento_frame_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, STQuery, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, STTransaction;

type
  TFormaPagamentoFrameList = class(TBaseFrameList)
  private
    { Private declarations }
  public
    procedure Listar;
  end;

var
  FormaPagamentoFrameList: TFormaPagamentoFrameList;

implementation

{$R *.dfm}

{ TFormaPagamentoFrameList }

procedure TFormaPagamentoFrameList.Listar;
begin
  with Qr_Lista do
  Begin
    Active:=false;
    SQL.Clear;
    SQL.Add(concat(
            'SELECT FPT_CODIGO, FPT_DESCRICAO, FPT_ATIVO ',
            'FROM TB_FORMAPAGTO ',
            'WHERE (FPT_ATIVO = ''S'')    ',
            ' ORDER BY FPT_DESCRICAO'
    ));
    Active:=true;
    FetchAll;
  End;
end;

end.
