unit un_th_aguarde;
interface

uses
  System.Classes, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Forms, System.SysUtils,
  Vcl.Controls,GIFImg,ACBrGIF;


type
  TAguarde = class(TThread)
    private
      FPanel : TPanel;
      FImagem : TImage;
      FTela : TForm;
      procedure CreateImage;
    public
      constructor Create(Tela:TForm);
      destructor Destroy; override;
      procedure stop;
      procedure Execute(); override;
  end;


implementation

{ TAguarde }

uses un_variables;

constructor TAguarde.Create(Tela:TForm);
begin
  inherited Create (True);
  FreeOnTerminate := true;
  Ftela := Tela;
  Ftela.DoubleBuffered := True;
  Ftela.Enabled := True;
  CreateImage;
end;

destructor TAguarde.Destroy;
begin

  inherited;
end;

procedure TAguarde.Execute;
Begin
  priority := tpHighest;
  inherited;
  while not Terminated do
  Begin
    TThread.Synchronize(nil,
        procedure
        begin
          Application.ProcessMessages;
            Sleep(300);
        end
      );
  End;
end;


procedure TAguarde.CreateImage;
Var
  LcRand : String;
  Lc_I : Integer;
Begin
  LcRand := IntToStr(Random(10000));
  FPanel := TPanel.Create(FTela);
  FPanel.Name := concat('Pnl_ProceAguarde',LcRand) ;
  with FPanel do
  Begin
    Visible := False;
    Parent := FTela;
    Caption := '';
    FullRepaint := True;
    ShowCaption := False;
    BorderWidth := 0;
    BevelInner := bvNone;
    BevelKind := bkNone;
    BevelOuter := bvNone;
    Height := 114;
    Width := 340;
    Color := clBtnFace;
    Top := -115;//trunc((FTela.Height - FPanel.Height)/2);
    Left := trunc((FTela.Width - FPanel.Width)/2);
  End;
  //Cria imagens
  FImagem := TImage.Create(FPanel);
  FImagem.Name := concat('Img_ProceAguarde',LcRand) ;
  with FImagem do
  Begin
    Align := alClient;
    Parent := FPanel;
    Transparent := False;
    Center := True;
    Top := 3;
    Left := 8;
    Picture.LoadFromFile(concat(Gb_PathExe + 'aguarde.gif'));
    AutoSize := True;
    Stretch := False;
  End;
  (FImagem.Picture.Graphic as TGIFImage).Animate := True;
  FPanel.Visible := True;
  Application.ProcessMessages;

  for Lc_I := 1 to 12 do
  Begin
    FPanel.Top := -118 + (Lc_I * 10) ;
    FPanel.Update;
  end;
  FTela.BringToFront;
end;


procedure TAguarde.stop;
Var
  Lc_I,Lc_J : Integer;
  Lc_Achou : Boolean;
Begin
  Lc_Achou := false;
  for Lc_I := 0 to FTela.ComponentCount - 1 do
  begin
    //Limpa Painel
    if (FTela.Components[Lc_I].ClassType = TPanel) then
    begin
      if (Copy(TPanel(FTela.Components[Lc_I]).Name,1,16) = 'Pnl_ProceAguarde') then
      begin
        for Lc_J := 0 to TPanel(FTela.Components[Lc_I]).ComponentCount - 1 do
        Begin
          if (TPanel(FTela.Components[Lc_I]).Components[Lc_J].ClassType = TImage) then
          Begin
            TImage(TPanel(FTela.Components[Lc_I]).Components[Lc_J]).DisposeOf;
            TPanel(FTela.Components[Lc_I]).disposeOf;
            Lc_Achou := True;
            Break;
          End;
        End;
      end;
    end;
    if Lc_Achou then Break;
  end;
  terminate;
end;

end.
