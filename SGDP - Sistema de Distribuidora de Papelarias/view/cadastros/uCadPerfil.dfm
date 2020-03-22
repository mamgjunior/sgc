inherited frmCadPerfil: TfrmCadPerfil
  Caption = 'Cadastro de Perfil de Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited clbCadastro: TCoolBar
    inherited tlbCadastro: TToolBar
      inherited btnAnterior: TToolButton
        OnClick = btnAnteriorClick
      end
      inherited btnProximo: TToolButton
        OnClick = btnProximoClick
      end
      inherited btnLocalizar: TToolButton
        Visible = False
      end
    end
  end
  inherited pgDados: TPageControl
    inherited TabSheet1: TTabSheet
      object lblIdPerfil: TLabel
        Left = 14
        Top = 20
        Width = 108
        Height = 13
        Caption = 'Identifica'#231#227'o do Perfil:'
      end
      object edtIdPerfil: TDBEdit
        Left = 128
        Top = 17
        Width = 474
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_PERFIL'
        DataSource = dmModuloDados1.dsPerfilUsuario
        TabOrder = 0
      end
      object pgPerfil: TPageControl
        Left = 14
        Top = 72
        Width = 635
        Height = 313
        ActivePage = tsCadastro
        TabOrder = 1
        object tsCadastro: TTabSheet
          Caption = 'Cadastros'
          object chkCADASTRO_FORNECEDORES: TDBCheckBox
            Left = 22
            Top = 29
            Width = 97
            Height = 17
            Caption = 'Fornecedores'
            DataField = 'CADASTRO_FORNECEDORES'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkCADASTRO_PRODUTOS: TDBCheckBox
            Left = 22
            Top = 52
            Width = 97
            Height = 17
            Caption = 'Produtos'
            DataField = 'CADASTRO_PRODUTOS'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkCADASTRO_FUNCIONARIOS: TDBCheckBox
            Left = 22
            Top = 109
            Width = 97
            Height = 17
            Caption = 'Funcion'#225'rios'
            DataField = 'CADASTRO_FUNCIONARIOS'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkCADASTRO_CLIENTES: TDBCheckBox
            Left = 22
            Top = 81
            Width = 97
            Height = 17
            Caption = 'Clientes'
            DataField = 'CADASTRO_CLIENTES'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkCADASTRO_USUARIOS: TDBCheckBox
            Left = 22
            Top = 137
            Width = 97
            Height = 17
            Caption = 'Usu'#225'rios'
            DataField = 'CADASTRO_USUARIOS'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object tsMovimentos: TTabSheet
          Caption = 'Movimentos'
          ImageIndex = 1
          object fldEntradaEstoque: TDBCheckBox
            Left = 22
            Top = 29
            Width = 150
            Height = 17
            Caption = 'Entrada de Notas Fiscais'
            DataField = 'ENTRADA_ESTOQUE'
            DataSource = dmModuloDados1.dsPerfilUsuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
    end
  end
end
