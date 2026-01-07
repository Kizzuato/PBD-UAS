object DM_perpus127: TDM_perpus127
  OldCreateOrder = False
  Left = 953
  Top = 171
  Height = 281
  Width = 426
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=GET_ACP')
    HostName = 'localhost'
    Port = 3306
    Database = 'db_perpustakaan'
    User = 'root'
    Protocol = 'mysql'
    Left = 29
    Top = 16
  end
  object ZQueryLogin: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT * FROM users'
      'WHERE username = :u AND password = :p;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'u'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p'
        ParamType = ptUnknown
      end>
    Left = 30
    Top = 67
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'u'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p'
        ParamType = ptUnknown
      end>
  end
  object ds_anggota127: TDataSource
    DataSet = zq_anggota127
    Left = 110
    Top = 122
  end
  object zq_anggota127: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT * FROM anggota')
    Params = <>
    Left = 110
    Top = 66
  end
  object zq_buku127: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT * FROM anggota')
    Params = <>
    Left = 186
    Top = 66
  end
  object ds_buku127: TDataSource
    DataSet = zq_buku127
    Left = 187
    Top = 122
  end
end
