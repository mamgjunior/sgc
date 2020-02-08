object dmModuloDados1: TdmModuloDados1
  OldCreateOrder = False
  Height = 349
  Width = 631
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
    object sdsFornecedoresCODIGO_FORNECEDOR: TIntegerField
      FieldName = 'CODIGO_FORNECEDOR'
      Required = True
    end
    object sdsFornecedoresRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object sdsFornecedoresNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 30
    end
    object sdsFornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object sdsFornecedoresNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 5
    end
    object sdsFornecedoresCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsFornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object sdsFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object sdsFornecedoresESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object sdsFornecedoresCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99.999-999;0; '
      FixedChar = True
      Size = 9
    end
    object sdsFornecedoresINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      EditMask = '999.999.999.999;0; '
      Size = 15
    end
    object sdsFornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object sdsFornecedoresCONTATO_COMERCIAL: TStringField
      FieldName = 'CONTATO_COMERCIAL'
      Size = 50
    end
    object strngfldFornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99;0; '
      Size = 18
    end
    object strngfldFornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object strngfldFornecedoresHOME_PAGE: TStringField
      FieldName = 'HOME_PAGE'
      Size = 30
    end
    object strngfldFornecedoresFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object strngfldFornecedoresFONE_COMERCIAL: TStringField
      FieldName = 'FONE_COMERCIAL'
      Size = 16
    end
  end
  object dsFornecedores: TDataSource
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
      Required = True
      FixedChar = True
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
    object sdsCargosCODIGO_CARGO: TIntegerField
      FieldName = 'CODIGO_CARGO'
      Required = True
    end
    object sdsCargosDESCRICAO_CARGO: TStringField
      FieldName = 'DESCRICAO_CARGO'
      Size = 40
    end
    object sdsCargosVENDEDOR_EXTERNO: TStringField
      FieldName = 'VENDEDOR_EXTERNO'
      FixedChar = True
      Size = 1
    end
    object sdsCargosVENDEDOR_INTERNO: TStringField
      FieldName = 'VENDEDOR_INTERNO'
      FixedChar = True
      Size = 1
    end
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
    object sdsFuncionariosMATRICULA_FUNCIONARIO: TStringField
      FieldName = 'MATRICULA_FUNCIONARIO'
      Required = True
      FixedChar = True
      Size = 5
    end
    object sdsFuncionariosNOME_FUNCIONARIO: TStringField
      FieldName = 'NOME_FUNCIONARIO'
      Size = 50
    end
    object sdsFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object sdsFuncionariosNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 5
    end
    object sdsFuncionariosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsFuncionariosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object sdsFuncionariosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object sdsFuncionariosESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object sdsFuncionariosCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object sdsFuncionariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object sdsFuncionariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object sdsFuncionariosCODIGO_DEPARTAMENTO: TIntegerField
      FieldName = 'CODIGO_DEPARTAMENTO'
    end
    object sdsFuncionariosCODIGO_CARGO: TIntegerField
      FieldName = 'CODIGO_CARGO'
    end
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
  object sdsEstados: TSimpleDataSet
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
    DataSet.CommandText = 'ESTADOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 40
    object sdsEstadosSIGLA_ESTADO: TStringField
      FieldName = 'SIGLA_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object sdsEstadosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 40
    end
  end
  object dsEstados: TDataSource
    DataSet = sdsEstados
    Left = 80
    Top = 41
  end
  object sdsGrupos: TSimpleDataSet
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
    DataSet.CommandText = 'GRUPO_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsGruposBeforeDelete
    Left = 33
    Top = 135
    object sdsGruposCODIGO_GRUPO: TIntegerField
      FieldName = 'CODIGO_GRUPO'
      Required = True
    end
    object sdsGruposDESCRICAO_GRUPO: TStringField
      FieldName = 'DESCRICAO_GRUPO'
      Size = 30
    end
  end
  object sdsCategorias: TSimpleDataSet
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
    DataSet.CommandText = 'CATEGORIA_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsCategoriasBeforeDelete
    Left = 116
    Top = 136
    object sdsCategoriasCODIGO_CATEGORIA: TIntegerField
      FieldName = 'CODIGO_CATEGORIA'
      Required = True
    end
    object sdsCategoriasDESCRICAO_CATEGORIA: TStringField
      FieldName = 'DESCRICAO_CATEGORIA'
      Size = 30
    end
  end
  object sdsFamilias: TSimpleDataSet
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
    DataSet.CommandText = 'FAMILIA_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsFamiliasBeforeDelete
    Left = 204
    Top = 137
    object sdsFamiliasCODIGO_FAMILIA: TIntegerField
      FieldName = 'CODIGO_FAMILIA'
      Required = True
    end
    object sdsFamiliasDESCRICAO_FAMILIA: TStringField
      FieldName = 'DESCRICAO_FAMILIA'
      Size = 30
    end
  end
  object sdsMarcas: TSimpleDataSet
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
    DataSet.CommandText = 'MARCA_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsMarcasBeforeDelete
    Left = 292
    Top = 138
    object sdsMarcasCODIGO_MARCA: TIntegerField
      FieldName = 'CODIGO_MARCA'
      Required = True
    end
    object sdsMarcasDESCRICAO_MARCA: TStringField
      FieldName = 'DESCRICAO_MARCA'
      Size = 30
    end
  end
  object sdsDescricao: TSimpleDataSet
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
    DataSet.CommandText = 'DESCRICAO_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsDescricaoBeforeDelete
    Left = 379
    Top = 138
    object sdsDescricaoCODIGO_DESCRICAO: TIntegerField
      FieldName = 'CODIGO_DESCRICAO'
      Required = True
    end
    object sdsDescricaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object sdsCatalogo: TSimpleDataSet
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
    DataSet.CommandText = 'CATALOGO_PRODUTOS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsCatalogoBeforeDelete
    Left = 466
    Top = 138
    object sdsCatalogoCODIGO_INTERNO: TIntegerField
      FieldName = 'CODIGO_INTERNO'
      Required = True
    end
    object sdsCatalogoCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object sdsCatalogoCODIGO_DESCRICAO: TIntegerField
      FieldName = 'CODIGO_DESCRICAO'
    end
    object sdsCatalogoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 50
    end
    object sdsCatalogoUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      FixedChar = True
      Size = 4
    end
    object sdsCatalogoCODIGO_GRUPO: TIntegerField
      FieldName = 'CODIGO_GRUPO'
    end
    object sdsCatalogoCODIGO_CATEGORIA: TIntegerField
      FieldName = 'CODIGO_CATEGORIA'
    end
    object sdsCatalogoCODIGO_FAMILIA: TIntegerField
      FieldName = 'CODIGO_FAMILIA'
    end
    object sdsCatalogoCODIGO_MARCA: TIntegerField
      FieldName = 'CODIGO_MARCA'
    end
    object sdsCatalogoPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsCatalogoICMS: TFMTBCDField
      FieldName = 'ICMS'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object sdsCatalogoIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object sdsCatalogoMARGEM_LUCRO: TFMTBCDField
      FieldName = 'MARGEM_LUCRO'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object sdsCatalogoPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsCatalogoCONSUMO_MEDIO: TIntegerField
      FieldName = 'CONSUMO_MEDIO'
    end
    object sdsCatalogoESTOQUE_ATUAL: TIntegerField
      FieldName = 'ESTOQUE_ATUAL'
    end
    object sdsCatalogoESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
  end
  object sdsFornecedorProduto: TSimpleDataSet
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
    DataSet.CommandText = 'FORNECEDOR_PRODUTO'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeDelete = sdsFornecedorProdutoBeforeDelete
    Left = 553
    Top = 138
    object sdsFornecedorProdutoREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
      Required = True
    end
    object sdsFornecedorProdutoCODIGO_FORNECEDOR: TIntegerField
      FieldName = 'CODIGO_FORNECEDOR'
    end
    object sdsFornecedorProdutoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 30
    end
    object sdsFornecedorProdutoCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object sdsFornecedorProdutoDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 80
    end
  end
  object dsGrupos: TDataSource
    DataSet = sdsGrupos
    Left = 32
    Top = 184
  end
  object dsCategorias: TDataSource
    DataSet = sdsCategorias
    Left = 114
    Top = 184
  end
  object dsFamilias: TDataSource
    DataSet = sdsFamilias
    Left = 202
    Top = 185
  end
  object dsMarcas: TDataSource
    DataSet = sdsMarcas
    Left = 293
    Top = 187
  end
  object dsDescricao: TDataSource
    DataSet = sdsDescricao
    Left = 379
    Top = 186
  end
  object dsCatalogo: TDataSource
    DataSet = sdsCatalogo
    Left = 466
    Top = 186
  end
  object dsFornecedorProduto: TDataSource
    DataSet = sdsFornecedorProduto
    Left = 553
    Top = 186
  end
end
