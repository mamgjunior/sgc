object dmModuloDados1: TdmModuloDados1
  OldCreateOrder = False
  Height = 349
  Width = 613
  object SQLConnection1: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 40
    Top = 8
  end
  object tblFornecedores: TSQLDataSet
    CommandText = 'FORNECEDORES'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 80
  end
  object dspFornecedores: TDataSetProvider
    DataSet = tblFornecedores
    Left = 40
    Top = 128
  end
  object cdsFornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedores'
    Left = 40
    Top = 176
  end
  object dsFornecedores: TDataSource
    DataSet = cdsFornecedores
    Left = 40
    Top = 232
  end
  object sdsFornecedores: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'FBConnection'
    Connection.DriverName = 'Firebird'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connection.Connected = True
    DataSet.CommandText = 'FORNECEDORES'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsFornecedoresBeforeDelete
    Left = 176
    Top = 8
  end
  object dsFornecedores2: TDataSource
    DataSet = sdsFornecedores
    Left = 176
    Top = 56
  end
  object sdsControle: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'FBConnection'
    Connection.DriverName = 'Firebird'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connection.Connected = True
    DataSet.CommandText = 'CONTROLE_SEQUENCIA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 8
    object sdsControleREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 1
    end
    object sdsControleCODIGO_CARGO: TIntegerField
      FieldName = 'CODIGO_CARGO'
    end
    object sdsControleCODIGO_INTERNO: TIntegerField
      FieldName = 'CODIGO_INTERNO'
    end
    object sdsControleCODIGO_CATEGORIA: TIntegerField
      FieldName = 'CODIGO_CATEGORIA'
    end
    object sdsControleCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
    end
    object sdsControleCODIGO_DEPARTAMENTO: TIntegerField
      FieldName = 'CODIGO_DEPARTAMENTO'
    end
    object sdsControleCODIGO_DESCRICAO: TIntegerField
      FieldName = 'CODIGO_DESCRICAO'
    end
    object sdsControleCODIGO_FAMILIA: TIntegerField
      FieldName = 'CODIGO_FAMILIA'
    end
    object sdsControleREGISTRO_FORNECEDOR: TIntegerField
      FieldName = 'REGISTRO_FORNECEDOR'
    end
    object sdsControleCODIGO_FORNECEDOR: TIntegerField
      FieldName = 'CODIGO_FORNECEDOR'
    end
    object sdsControleCODIGO_GRUPO: TIntegerField
      FieldName = 'CODIGO_GRUPO'
    end
    object sdsControleCODIGO_MARCA: TIntegerField
      FieldName = 'CODIGO_MARCA'
    end
  end
  object dsControle: TDataSource
    DataSet = sdsControle
    Left = 295
    Top = 57
  end
  object sdsDepartamentos: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'FBConnection'
    Connection.DriverName = 'Firebird'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connection.Connected = True
    DataSet.CommandText = 'DEPARTAMENTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsDepartamentosBeforeDelete
    Left = 383
    Top = 8
    object sdsDepartamentosCODIGO_DEPARTAMENTO: TIntegerField
      FieldName = 'CODIGO_DEPARTAMENTO'
    end
    object sdsDepartamentosNOME_DEPARTAMENTO: TStringField
      FieldName = 'NOME_DEPARTAMENTO'
      Size = 30
    end
  end
  object sdsCargos: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'FBConnection'
    Connection.DriverName = 'Firebird'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connection.Connected = True
    DataSet.CommandText = 'CARGOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsCargosBeforeDelete
    Left = 472
    Top = 10
  end
  object sdsFuncionarios: TSimpleDataSet
    Aggregates = <>
    Connection.ConnectionName = 'FBConnection'
    Connection.DriverName = 'Firebird'
    Connection.LoginPrompt = False
    Connection.Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\workspace\Projeto_SGC\sgc\db_sgc.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connection.Connected = True
    DataSet.CommandText = 'FUNCIONARIOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsFuncionariosBeforeDelete
    Left = 549
    Top = 11
  end
  object dsDepartaentos: TDataSource
    DataSet = sdsDepartamentos
    Left = 381
    Top = 57
  end
  object dsCargos: TDataSource
    DataSet = sdsCargos
    Left = 473
    Top = 58
  end
  object dsFuncionarios: TDataSource
    DataSet = sdsFuncionarios
    Left = 550
    Top = 58
  end
end
