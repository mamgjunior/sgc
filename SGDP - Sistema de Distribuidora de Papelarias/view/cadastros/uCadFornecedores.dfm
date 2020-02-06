inherited frmCadFornecedores: TfrmCadFornecedores
  Caption = 'Cadastro de Fornecedores'
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
      object lblRazaoSocial: TLabel
        Left = 19
        Top = 40
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Raz'#227'o Social:'
      end
      object lblNomeFantasia: TLabel
        Left = 8
        Top = 72
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Fantasia:'
      end
      object lblCnpj: TLabel
        Left = 42
        Top = 116
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'C.N.P.J:'
      end
      object Label3: TLabel
        Left = 25
        Top = 154
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Home Page:'
      end
      object Label4: TLabel
        Left = 51
        Top = 192
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'E-mail:'
      end
      object Label5: TLabel
        Left = 276
        Top = 116
        Width = 72
        Height = 13
        Caption = 'Insc. Estadual:'
      end
      object edtRAZAO_SOCIAL: TDBEdit
        Left = 89
        Top = 45
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RAZAO_SOCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 0
        OnEnter = edtRAZAO_SOCIALEnter
        OnExit = edtRAZAO_SOCIALExit
      end
      object edtNOME_FANTASIA: TDBEdit
        Left = 89
        Top = 75
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_FANTASIA'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 1
      end
      object edtCNPJ: TDBEdit
        Left = 89
        Top = 113
        Width = 175
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CNPJ'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 2
      end
      object edtHOME_PAGE: TDBEdit
        Left = 89
        Top = 151
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'HOME_PAGE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 4
      end
      object edtEMAIL: TDBEdit
        Left = 89
        Top = 189
        Width = 440
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 5
      end
      object edtINSCRICAO_ESTADUAL: TDBEdit
        Left = 354
        Top = 113
        Width = 175
        Height = 21
        CharCase = ecUpperCase
        DataField = 'INSCRICAO_ESTADUAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 3
      end
    end
    object tsEndereco: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object lblEndereco: TLabel
        Left = 34
        Top = 31
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o:'
      end
      object lblComplemento: TLabel
        Left = 12
        Top = 67
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Complemento:'
      end
      object lblCidade: TLabel
        Left = 44
        Top = 113
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade:'
      end
      object lblEstado: TLabel
        Left = 359
        Top = 113
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado:'
      end
      object lblCEP: TLabel
        Left = 58
        Top = 153
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'CEP:'
      end
      object lblTelefone: TLabel
        Left = 217
        Top = 153
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone:'
      end
      object lblContComercial: TLabel
        Left = 1
        Top = 196
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cont. Comercial:'
      end
      object lblFoneComercial: TLabel
        Left = 4
        Top = 237
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fone Comercial:'
      end
      object lblBairro: TLabel
        Left = 364
        Top = 67
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro:'
      end
      object lblFax: TLabel
        Left = 441
        Top = 153
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fax:'
      end
      object edtENDERECO: TDBEdit
        Left = 89
        Top = 28
        Width = 443
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 0
      end
      object edtCOMPLEMENTO: TDBEdit
        Left = 87
        Top = 64
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 2
      end
      object edtCIDADE: TDBEdit
        Left = 87
        Top = 110
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 4
      end
      object edtCEP: TDBEdit
        Left = 87
        Top = 150
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 6
      end
      object edtTELEFONE: TDBEdit
        Left = 268
        Top = 150
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 7
      end
      object edtNUMERO: TDBEdit
        Left = 538
        Top = 28
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 1
      end
      object edtBAIRRO: TDBEdit
        Left = 402
        Top = 64
        Width = 208
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 3
      end
      object cbbESTADO: TDBLookupComboBox
        Left = 402
        Top = 110
        Width = 207
        Height = 21
        DataField = 'ESTADO'
        DataSource = dmModuloDados1.dsFornecedores
        KeyField = 'SIGLA_ESTADO'
        ListField = 'ESTADO'
        ListSource = dmModuloDados1.dsEstados
        TabOrder = 5
      end
      object edtFAX: TDBEdit
        Left = 469
        Top = 150
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 8
      end
      object edtCONTATO_COMERCIAL: TDBEdit
        Left = 87
        Top = 193
        Width = 522
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CONTATO_COMERCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 9
      end
      object edtFONE_COMERCIAL: TDBEdit
        Left = 87
        Top = 234
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FONE_COMERCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 10
      end
    end
    object tsProdutos: TTabSheet
      Caption = 'Lista de Produtos'
      ImageIndex = 2
    end
  end
end
