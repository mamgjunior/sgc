inherited frmLocalizarCliente: TfrmLocalizarCliente
  Caption = 'Localizar Clientes'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Left = 37
    Width = 34
    Alignment = taRightJustify
    Caption = 'Nome'
    ExplicitLeft = 37
    ExplicitWidth = 34
  end
  inherited edtPesquisar: TEdit
    CharCase = ecUpperCase
    OnKeyPress = edtPesquisarKeyPress
  end
  inherited grdDados: TDBGrid
    Left = 18
    Top = 40
    DataSource = dmModuloDados1.dsClientes
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited btnOk: TBitBtn
    OnClick = btnOkClick
  end
end
