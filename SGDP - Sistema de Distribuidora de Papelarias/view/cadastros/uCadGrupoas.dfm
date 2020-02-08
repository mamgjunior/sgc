inherited frmCadGrupoas: TfrmCadGrupoas
  Caption = 'Cadastro de Grupos de Produtos'
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
      object lblGrupo: TLabel
        Left = 14
        Top = 24
        Width = 97
        Height = 13
        Caption = 'Descri'#231#227'o do Grupo:'
      end
      object edtGrupo: TDBEdit
        Left = 119
        Top = 21
        Width = 497
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_GRUPO'
        DataSource = dmModuloDados1.dsGrupos
        TabOrder = 0
      end
    end
    object tabListaRegistros: TTabSheet
      Caption = 'Lista de Registros'
      ImageIndex = 1
      object grdDados: TDBGrid
        Left = 16
        Top = 24
        Width = 633
        Height = 345
        DataSource = dmModuloDados1.dsGrupos
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
            FieldName = 'CODIGO_GRUPO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_GRUPO'
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
