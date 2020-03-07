inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
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
      inherited btnLocalizar: TToolButton
        Visible = False
      end
    end
  end
  inherited pgDados: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblFuncionario: TLabel
        Left = 30
        Top = 25
        Width = 100
        Height = 13
        Caption = 'Nome do Funcion'#225'rio'
      end
      object lblUsuario: TLabel
        Left = 30
        Top = 81
        Width = 116
        Height = 13
        Caption = 'Identifica'#231#227'o do Usu'#225'rio'
      end
      object lblSenha: TLabel
        Left = 330
        Top = 81
        Width = 81
        Height = 13
        Caption = 'Senha de acesso'
      end
      object lblPerfil: TLabel
        Left = 30
        Top = 136
        Width = 77
        Height = 13
        HelpContext = 136
        Caption = 'Perfil de usu'#225'rio'
      end
      object cbbFuncionario: TDBLookupComboBox
        Left = 30
        Top = 44
        Width = 580
        Height = 21
        DataField = 'CODIGO_FUNCIONARIO'
        DataSource = dmModuloDados1.dsUsuarios
        KeyField = 'MATRICULA_FUNCIONARIO'
        ListField = 'NOME_FUNCIONARIO'
        ListSource = dmModuloDados1.dsFuncionarios
        TabOrder = 0
      end
      object edtUsuario: TDBEdit
        Left = 30
        Top = 100
        Width = 280
        Height = 21
        CharCase = ecUpperCase
        DataField = 'IDENTIFICACAO_USUARIO'
        DataSource = dmModuloDados1.dsUsuarios
        TabOrder = 1
        OnEnter = edtUsuarioEnter
        OnExit = edtUsuarioExit
      end
      object edtSenha: TDBEdit
        Left = 330
        Top = 100
        Width = 280
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SENHA_ACESSO'
        DataSource = dmModuloDados1.dsUsuarios
        TabOrder = 2
        OnEnter = edtSenhaEnter
        OnExit = edtSenhaExit
      end
      object cbbPerfil: TDBLookupComboBox
        Left = 30
        Top = 155
        Width = 580
        Height = 21
        DataField = 'CODIGO_PERFIL'
        DataSource = dmModuloDados1.dsUsuarios
        KeyField = 'CODIGO_PERFIL'
        ListField = 'DESCRICAO_PERFIL'
        ListSource = dmModuloDados1.dsPerfilUsuario
        TabOrder = 3
      end
    end
  end
end
