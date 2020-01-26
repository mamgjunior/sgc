inherited frmLocalizaFuncionarios: TfrmLocalizaFuncionarios
  Caption = 'Localizar Funcion'#225'rios'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Width = 127
    Caption = 'Nome do Funcion'#225'rio:'
    ExplicitWidth = 127
  end
  inherited edtPesquisar: TEdit
    Left = 146
    Top = 8
    Width = 560
    CharCase = ecUpperCase
    OnKeyPress = edtPesquisarKeyPress
    ExplicitLeft = 146
    ExplicitTop = 8
    ExplicitWidth = 560
  end
  inherited grdDados: TDBGrid
    Left = 18
    Top = 40
    DataSource = dmModuloDados1.dsFuncionarios
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_FUNCIONARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Funcion'#225'rio'
        Width = 657
        Visible = True
      end>
  end
  inherited btnOk: TBitBtn
    OnClick = btnOkClick
  end
end
