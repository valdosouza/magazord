inherited TasConfig: TTasConfig
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o de Conex'#227'o'
  ClientHeight = 201
  ClientWidth = 631
  ExplicitWidth = 637
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_body: TPanel [0]
    Left = 0
    Top = 0
    Width = 631
    Height = 137
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Lb_Url: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 621
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      AutoSize = False
      Caption = 'URL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 6
      ExplicitWidth = 60
    end
    object Lb_Password: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 81
      Width = 621
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      AutoSize = False
      Caption = 'Senha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 44
      ExplicitWidth = 60
    end
    object Lb_User: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 42
      Width = 621
      Height = 13
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      AutoSize = False
      Caption = 'Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 44
      ExplicitWidth = 60
    end
    object E_Password: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 96
      Width = 621
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object E_URL: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 621
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object E_User: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 57
      Width = 621
      Height = 22
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alTop
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnl_Bottom: TPanel [1]
    Left = 0
    Top = 137
    Width = 631
    Height = 64
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object SB_Gravar: TSpeedButton
      AlignWithMargins = True
      Left = 420
      Top = 5
      Width = 102
      Height = 54
      Margins.Left = 1
      Margins.Right = 1
      Align = alRight
      Caption = 'Gravar- F5'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SB_GravarClick
      ExplicitLeft = 398
      ExplicitTop = 6
    end
    object SB_Cancelar: TSpeedButton
      AlignWithMargins = True
      Left = 524
      Top = 5
      Width = 102
      Height = 54
      Margins.Left = 1
      Align = alRight
      Caption = 'Cancelar - F6'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = SB_CancelarClick
      ExplicitTop = 6
    end
  end
  inherited MnuBase: TMainMenu
    Left = 704
  end
end
