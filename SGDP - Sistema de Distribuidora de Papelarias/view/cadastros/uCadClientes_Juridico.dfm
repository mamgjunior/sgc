inherited frmCadClientes_Juridico: TfrmCadClientes_Juridico
  Caption = 'Cadastro de Clientes'
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
      object lblDataCadastro: TLabel
        Left = 16
        Top = 24
        Width = 89
        Height = 13
        Caption = 'Data do Cadastro:'
      end
      object lblNomeCliente: TLabel
        Left = 16
        Top = 45
        Width = 82
        Height = 13
        Caption = 'Nome do Cliente:'
      end
      object lblCNPJ: TLabel
        Left = 16
        Top = 89
        Width = 29
        Height = 13
        Caption = 'CNPJ:'
      end
      object lblInscEstadual: TLabel
        Left = 300
        Top = 89
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual:'
      end
      object lblEmail: TLabel
        Left = 16
        Top = 138
        Width = 32
        Height = 13
        Caption = 'E-mail:'
      end
      object lblLimiteCredito: TLabel
        Left = 16
        Top = 188
        Width = 84
        Height = 13
        Caption = 'Limite de Cr'#233'dito:'
      end
      object dbtxtDataCadastro: TDBText
        Left = 111
        Top = 24
        Width = 65
        Height = 17
        DataField = 'DATA_CADASTRO'
        DataSource = dmModuloDados1.dsClientes
      end
      object lblDebito: TLabel
        Left = 336
        Top = 188
        Width = 112
        Height = 13
        Caption = 'D'#233'bito total em aberto:'
      end
      object dbtxtDebito: TDBText
        Left = 456
        Top = 188
        Width = 65
        Height = 17
        DataField = 'VALOR_ABERTO'
        DataSource = dmModuloDados1.dsClientes
      end
      object dbedtNome: TDBEdit
        Left = 16
        Top = 62
        Width = 586
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_CLIENTE'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 0
        OnEnter = dbedtNomeEnter
        OnExit = dbedtNomeExit
      end
      object dbedtCNPJ: TDBEdit
        Left = 16
        Top = 108
        Width = 219
        Height = 21
        DataField = 'CNPJ'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 1
      end
      object dbedtInscEstadual: TDBEdit
        Left = 300
        Top = 108
        Width = 302
        Height = 21
        DataField = 'INSCRICAO_ESTADUAL'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 2
      end
      object dbedtEmail: TDBEdit
        Left = 16
        Top = 157
        Width = 586
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 3
      end
      object dbedtLimite: TDBEdit
        Left = 16
        Top = 207
        Width = 219
        Height = 21
        DataField = 'LIMITE_CREDITO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 4
      end
      object dbrgrpTipoCobranca: TDBRadioGroup
        Left = 16
        Top = 240
        Width = 219
        Height = 65
        Caption = '  Tipos de Cobran'#231'as  '
        DataField = 'TIPO_COBRANCA'
        DataSource = dmModuloDados1.dsClientes
        Items.Strings = (
          'Em Carteira'
          'Boleto Bancario')
        TabOrder = 5
        Values.Strings = (
          'C'
          'B')
      end
    end
    object tsEndereco: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object lblEndereco: TLabel
        Left = 3
        Top = 20
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o:'
      end
      object lblComplemento: TLabel
        Left = 3
        Top = 66
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Complemento:'
      end
      object lblCidade: TLabel
        Left = 3
        Top = 111
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade:'
      end
      object lblEstado: TLabel
        Left = 377
        Top = 111
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado:'
      end
      object lblCEP: TLabel
        Left = 3
        Top = 150
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'CEP:'
      end
      object lblTelefone: TLabel
        Left = 214
        Top = 152
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone:'
      end
      object lblContComercial: TLabel
        Left = 3
        Top = 196
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Contato:'
      end
      object lblFoneComercial: TLabel
        Left = 444
        Top = 196
        Width = 105
        Height = 13
        Alignment = taRightJustify
        Caption = 'TeleFone de Contato:'
      end
      object lblBairro: TLabel
        Left = 377
        Top = 66
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro:'
      end
      object lblFax: TLabel
        Left = 444
        Top = 152
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fax:'
      end
      object lblNumero: TLabel
        Left = 512
        Top = 20
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object dbedtENDERECO: TDBEdit
        Left = 3
        Top = 39
        Width = 494
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 0
      end
      object dbedtCOMPLEMENTO: TDBEdit
        Left = 3
        Top = 83
        Width = 340
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 1
      end
      object edtCIDADE: TDBEdit
        Left = 3
        Top = 127
        Width = 340
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 2
      end
      object dbedtCEP: TDBEdit
        Left = 3
        Top = 169
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 3
      end
      object dbedtTELEFONE: TDBEdit
        Left = 214
        Top = 169
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 4
      end
      object dbedtNUMERO: TDBEdit
        Left = 512
        Top = 39
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 5
      end
      object dbedtBAIRRO: TDBEdit
        Left = 377
        Top = 85
        Width = 208
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 6
      end
      object dblkcbbESTADO: TDBLookupComboBox
        Left = 377
        Top = 127
        Width = 207
        Height = 21
        DataField = 'ESTADO'
        DataSource = dmModuloDados1.dsClientes
        KeyField = 'SIGLA_ESTADO'
        ListField = 'ESTADO'
        ListSource = dmModuloDados1.dsEstados
        TabOrder = 7
      end
      object dbedtFAX: TDBEdit
        Left = 444
        Top = 169
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 8
      end
      object dbedtCONTATO: TDBEdit
        Left = 2
        Top = 212
        Width = 428
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CONTATO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 9
      end
      object dbedtTELEFONE_CONTATO: TDBEdit
        Left = 444
        Top = 215
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE_CONTATO'
        DataSource = dmModuloDados1.dsClientes
        TabOrder = 10
      end
    end
  end
end
