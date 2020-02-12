inherited frmLocalizaDescricao: TfrmLocalizaDescricao
  Caption = 'frmLocalizaDescricao'
  ClientWidth = 635
  OnShow = FormShow
  ExplicitWidth = 641
  PixelsPerInch = 96
  TextHeight = 16
  inherited lblPesquisar: TLabel
    Width = 175
    Caption = 'Descri'#231#227'o / Nome do Produto:'
    ExplicitWidth = 175
  end
  inherited edtPesquisar: TEdit
    Left = 8
    Top = 34
    Width = 617
    OnKeyPress = edtPesquisarKeyPress
    ExplicitLeft = 8
    ExplicitTop = 34
    ExplicitWidth = 617
  end
  inherited grdDados: TDBGrid
    Left = 10
    Top = 65
    Width = 617
    Height = 313
    DataSource = dmModuloDados1.dsDescricao
    OnDblClick = grdDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o / Nome do Produto'
        Width = 585
        Visible = True
      end>
  end
  inherited btnOk: TBitBtn
    Left = 449
    Top = 383
    OnClick = btnOkClick
    ExplicitLeft = 449
    ExplicitTop = 383
  end
  inherited btnCancelar: TBitBtn
    Left = 540
    ExplicitLeft = 540
  end
end
