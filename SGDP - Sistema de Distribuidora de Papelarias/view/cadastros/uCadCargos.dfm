inherited frmCadCargos: TfrmCadCargos
  Caption = 'Cadastro de Cargos'
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
    ActivePage = tabListaRegistros
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblCargo: TLabel
        Left = 6
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Descri'#231#227'o do cargo: '
      end
      object edtCargo: TDBEdit
        Left = 110
        Top = 13
        Width = 387
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_CARGO'
        DataSource = dmModuloDados1.dsCargos
        TabOrder = 0
      end
      object cbkVendedorInterno: TDBCheckBox
        Left = 8
        Top = 64
        Width = 115
        Height = 17
        Caption = 'Vendedor Interno'
        DataField = 'VENDEDOR_INTERNO'
        DataSource = dmModuloDados1.dsCargos
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object ckbVendedorExterno: TDBCheckBox
        Left = 8
        Top = 100
        Width = 115
        Height = 17
        Caption = 'Vendedor Externo'
        DataField = 'VENDEDOR_EXTERNO'
        DataSource = dmModuloDados1.dsCargos
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object tabListaRegistros: TTabSheet
      Caption = 'Lista de Registros'
      ImageIndex = 1
      object grdDados: TDBGrid
        Left = 3
        Top = 22
        Width = 664
        Height = 302
        DataSource = dmModuloDados1.dsMarcas
        ReadOnly = True
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
            Alignment = taCenter
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
            Title.Caption = 'Descri'#231#227'o'
            Width = 430
            Visible = True
          end>
      end
    end
  end
end
