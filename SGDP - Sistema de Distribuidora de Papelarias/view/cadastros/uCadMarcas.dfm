inherited frmCadMarcas: TfrmCadMarcas
  Caption = 'Cadastro de Marcas de Produtos'
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
    end
  end
  inherited pgDados: TPageControl
    inherited TabSheet1: TTabSheet
      object lblMarca: TLabel
        Left = 6
        Top = 16
        Width = 100
        Height = 13
        Caption = 'Descri'#231#227'o da Marca: '
      end
      object edtMarcas: TDBEdit
        Left = 112
        Top = 13
        Width = 387
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_MARCA'
        DataSource = dmModuloDados1.dsMarcas
        TabOrder = 0
      end
    end
    object tsListaRegistro: TTabSheet
      Caption = 'tsListaRegistro'
      ImageIndex = 1
      object grdDados: TDBGrid
        Left = 16
        Top = 24
        Width = 633
        Height = 345
        DataSource = dmModuloDados1.dsMarcas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_MARCA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_MARCA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o do Grupo'
            Width = 400
            Visible = True
          end>
      end
    end
  end
end
