inherited frmCadFuncionarios: TfrmCadFuncionarios
  Caption = 'Cadastro de Funcion'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited clbCadastro: TCoolBar
    Bands = <
      item
        Control = tlbCadastro
        ImageIndex = -1
        MinHeight = 39
        Width = 688
      end>
    inherited tlbCadastro: TToolBar
      inherited btnAnterior: TToolButton
        OnClick = btnAnteriorClick
      end
      inherited btnProximo: TToolButton
        OnClick = btnProximoClick
      end
    end
  end
  inherited pgDados: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblMatricula: TLabel
        Left = 38
        Top = 24
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Matr'#237'cula'
      end
      object lblFuncionario: TLabel
        Left = 26
        Top = 53
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Funcion'#225'rio'
      end
      object lblEndereco: TLabel
        Left = 38
        Top = 80
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o'
      end
      object lblComplemento: TLabel
        Left = 16
        Top = 107
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Complemento'
      end
      object lblCidade: TLabel
        Left = 48
        Top = 133
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade'
      end
      object lblEstado: TLabel
        Left = 363
        Top = 136
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object lblCEP: TLabel
        Left = 62
        Top = 165
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'CEP'
      end
      object lblTelefone: TLabel
        Left = 261
        Top = 163
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone'
      end
      object lblDepartamento: TLabel
        Left = 12
        Top = 192
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Departamento'
      end
      object lblCargo: TLabel
        Left = 52
        Top = 219
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cargo'
      end
      object lblBairro: TLabel
        Left = 368
        Top = 109
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro'
      end
      object edtMatricula: TDBEdit
        Left = 87
        Top = 23
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MATRICULA_FUNCIONARIO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 0
        OnEnter = edtMatriculaEnter
        OnExit = edtMatriculaExit
      end
      object edtFuncionario: TDBEdit
        Left = 87
        Top = 50
        Width = 522
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_FUNCIONARIO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 1
      end
      object edtEndereco: TDBEdit
        Left = 89
        Top = 77
        Width = 443
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 2
      end
      object edtComplemento: TDBEdit
        Left = 87
        Top = 106
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 4
      end
      object edtCidade: TDBEdit
        Left = 87
        Top = 133
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 6
      end
      object edtCEP: TDBEdit
        Left = 87
        Top = 160
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 8
      end
      object edtTelefone: TDBEdit
        Left = 309
        Top = 160
        Width = 180
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 9
      end
      object edtNumero: TDBEdit
        Left = 538
        Top = 77
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 3
      end
      object edtBairro: TDBEdit
        Left = 402
        Top = 104
        Width = 208
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dmModuloDados1.dsFuncionarios
        TabOrder = 5
      end
      object lcbEstados: TDBLookupComboBox
        Left = 402
        Top = 133
        Width = 207
        Height = 21
        DataField = 'ESTADO'
        DataSource = dmModuloDados1.dsFuncionarios
        KeyField = 'SIGLA_ESTADO'
        ListField = 'ESTADO'
        ListSource = dmModuloDados1.dsEstados
        TabOrder = 7
      end
      object lcbDepartamento: TDBLookupComboBox
        Left = 87
        Top = 187
        Width = 402
        Height = 21
        DataField = 'CODIGO_DEPARTAMENTO'
        DataSource = dmModuloDados1.dsFuncionarios
        KeyField = 'CODIGO_DEPARTAMENTO'
        ListField = 'NOME_DEPARTAMENTO'
        ListSource = dmModuloDados1.dsDepartaentos
        TabOrder = 10
      end
      object lcbCargo: TDBLookupComboBox
        Left = 87
        Top = 214
        Width = 402
        Height = 21
        DataField = 'CODIGO_CARGO'
        DataSource = dmModuloDados1.dsFuncionarios
        KeyField = 'CODIGO_CARGO'
        ListField = 'DESCRICAO_CARGO'
        ListSource = dmModuloDados1.dsCargos
        TabOrder = 11
      end
    end
  end
end
