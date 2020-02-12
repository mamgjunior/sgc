inherited frmLocalizaMarca: TfrmLocalizaMarca
  Caption = 'Localizar Marcas'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Left = 31
    Top = 8
    Width = 40
    Alignment = taRightJustify
    Caption = 'Marca:'
    ExplicitLeft = 31
    ExplicitTop = 8
    ExplicitWidth = 40
  end
  inherited edtPesquisar: TEdit
    CharCase = ecUpperCase
  end
  inherited grdDados: TDBGrid
    Left = 18
    Top = 40
    DataSource = dmModuloDados1.dsMarcas
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_MARCA'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_MARCA'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o da Marca'
        Width = 455
        Visible = True
      end>
  end
  inherited btnOk: TBitBtn
    OnClick = btnOkClick
  end
end
