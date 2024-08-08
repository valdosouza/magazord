unit tas_config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Un_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons;

type

  TTasConfig = class(TFr_Base)
    Pnl_body: TPanel;
    pnl_Bottom: TPanel;
    Lb_Url: TLabel;
    Lb_Password: TLabel;
    E_Password: TEdit;
    E_URL: TEdit;
    SB_Gravar: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    Lb_User: TLabel;
    E_User: TEdit;
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_GravarClick(Sender: TObject);
  private

  protected
    procedure IniciaVariaveis;Override;
    procedure ImagemBotao;override;
    function ValidateSave():boolean;Virtual;
    procedure Save;Virtual;

  public
    { Public declarations }
  end;

var
  TasConfig: TTasConfig;

implementation

{$R *.dfm}

uses un_msg;

procedure TTasConfig.ImagemBotao;
begin
  CarregaImagemBotao(SB_Gravar,'GRAVAR');
  CarregaImagemBotao(SB_Cancelar,'CANCELAR');
end;

procedure TTasConfig.IniciaVariaveis;
begin
  E_URL.Text      := ExecGeneralConfig('L','MG_URL','');
  E_User.Text     := ExecGeneralConfig('L','MG_USER','');
  E_Password.Text := ExecGeneralConfig('L','MG_PASSWORD','');
end;

procedure TTasConfig.Save;
begin
  ExecGeneralConfig('G','MG_URL',E_URL.Text);
  MGApi.URL := E_URL.Text;
  ExecGeneralConfig('G','MG_USER',E_User.Text);
  MGApi.User := E_User.Text;
  ExecGeneralConfig('G','MG_PASSWORD',E_Password.Text);
  MGApi.Password := E_Password.Text;
end;

procedure TTasConfig.SB_GravarClick(Sender: TObject);
begin
  if ValidateSave then
  Begin
    Save;
    Close;
  End;
end;

procedure TTasConfig.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

function TTasConfig.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_URL.Text) = '' then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo URL deve ser preenchido.'+EOLN+
                   'Verifique antes de Continuar'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    result := False;
    exit;
  End;

  if trim(E_User.Text) = '' then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo Usuário deve ser preenchido.'+EOLN+
                   'Verifique antes de Continuar'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    result := False;
    exit;
  End;

  if trim(E_Password.Text) = '' then
  Begin
    MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                   'Campo senha deve ser preenchido.'+EOLN+
                   'Verifique antes de Continuar'+EOLN,
                   ['OK'],[bEscape],mpAlerta);
    result := False;
    exit;
  End;


end;

end.
