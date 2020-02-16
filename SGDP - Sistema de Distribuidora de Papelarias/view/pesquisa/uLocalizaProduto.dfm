inherited frmLocalizaProduto: TfrmLocalizaProduto
  Caption = 'Localizar Produtos'
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Left = 70
    Top = 46
    Width = 46
    Alignment = taRightJustify
    Caption = 'Modelo:'
    ExplicitLeft = 70
    ExplicitTop = 46
    ExplicitWidth = 46
  end
  object lblNomeProduto: TLabel [1]
    Left = 8
    Top = 15
    Width = 108
    Height = 16
    Caption = 'Descri'#231#227'o / Nome:'
  end
  inherited edtPesquisar: TEdit
    Left = 122
    Top = 42
    Width = 583
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = edtPesquisarKeyPress
    ExplicitLeft = 122
    ExplicitTop = 42
    ExplicitWidth = 583
  end
  inherited grdDados: TDBGrid
    Left = 8
    Top = 72
    Width = 697
    Height = 307
    DataSource = dmModuloDados1.dsProdutos
    TabOrder = 2
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_BARRAS'
        Title.Alignment = taCenter
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Title.Alignment = taCenter
        Title.Caption = 'Modelo'
        Width = 460
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
  object lcbbNomeProduto: TDBLookupComboBox
    Left = 122
    Top = 12
    Width = 583
    Height = 24
    KeyField = 'CODIGO_DESCRICAO'
    ListField = 'DESCRICAO'
    ListSource = dmModuloDados1.dsDescricao
    TabOrder = 0
    OnEnter = lcbbNomeProdutoEnter
    OnExit = lcbbNomeProdutoExit
  end
end
