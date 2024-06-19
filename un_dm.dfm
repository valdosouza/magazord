object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object IBD_Gestao: TSTDatabase
    Params.Strings = (
      'Database=D:\Modelos\HbAutocenter\Database\IBGCOM.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=notevaldo'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object Qr_Crud: TSTQuery
    Connection = IBD_Gestao
    ForcedRefresh = False
    Left = 32
    Top = 88
  end
end
