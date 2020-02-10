inherited frmCadFamilia: TfrmCadFamilia
  Caption = 'frmCadFamilia'
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
      ExplicitLeft = 5
      ExplicitTop = 28
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblFamilia: TLabel
        Left = 6
        Top = 16
        Width = 103
        Height = 13
        Caption = 'Descri'#231#227'o da Fam'#237'lia: '
      end
      object edtFamilia: TDBEdit
        Left = 115
        Top = 13
        Width = 387
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_FAMILIA'
        DataSource = dmModuloDados1.dsFamilias
        TabOrder = 0
      end
    end
    object tsListaRegistros: TTabSheet
      Caption = 'Lista de Registros'
      ImageIndex = 1
      ExplicitLeft = 5
      ExplicitTop = 28
      object grdDados: TDBGrid
        Left = 16
        Top = 24
        Width = 633
        Height = 345
        DataSource = dmModuloDados1.dsFamilias
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdDadosDblClick
        OnKeyDown = grdDadosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_FAMILIA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_FAMILIA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o da Fam'#237'lia'
            Width = 400
            Visible = True
          end>
      end
    end
  end
end
