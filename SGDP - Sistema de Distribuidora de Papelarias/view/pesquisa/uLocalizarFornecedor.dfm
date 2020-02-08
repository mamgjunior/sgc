inherited frmLocalizarFornecedor: TfrmLocalizarFornecedor
  Caption = 'Localizar Fornecedor'
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Left = 17
    Top = 11
    Width = 81
    Caption = 'Raz'#227'o Social:'
    ExplicitLeft = 17
    ExplicitTop = 11
    ExplicitWidth = 81
  end
  object lblNomeFantasia: TLabel [1]
    Left = 6
    Top = 41
    Width = 92
    Height = 16
    Caption = 'Nome Fantasia:'
  end
  inherited edtPesquisar: TEdit
    Left = 104
    Top = 8
    Width = 606
    CharCase = ecUpperCase
    OnKeyPress = edtPesquisarKeyPress
    ExplicitLeft = 104
    ExplicitTop = 8
    ExplicitWidth = 606
  end
  inherited grdDados: TDBGrid
    Left = 18
    Top = 72
    Height = 305
    DataSource = dmModuloDados1.dsFornecedores
    TabOrder = 2
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'RAZAO_SOCIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Raz'#227'o Social'
        Width = 660
        Visible = True
      end>
  end
  inherited btnOk: TBitBtn
    TabOrder = 3
    OnClick = btnOkClick
  end
  inherited btnCancelar: TBitBtn
    TabOrder = 4
  end
  object edtNomeFantasia: TEdit
    Left = 104
    Top = 38
    Width = 606
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 1
    OnEnter = edtNomeFantasiaEnter
    OnExit = edtNomeFantasiaExit
    OnKeyPress = edtNomeFantasiaKeyPress
  end
end
