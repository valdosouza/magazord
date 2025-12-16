object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object IBD_Gestao: TSTDatabase
    Params.Strings = (
      'Database=D:\Modelos\Genio\database\IBGCOM.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object Qr_Crud: TSTQuery
    Connection = IBD_Gestao
    SQL.Strings = (
      'SELECT *'
      'FROM TB_MG_PEDIDO_HEADER ')
    ForcedRefresh = False
    Left = 16
    Top = 72
  end
  object DSP: TDataSetProvider
    DataSet = Qr_Crud
    Left = 96
    Top = 72
  end
end
