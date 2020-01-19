inherited frmCadDepartametos: TfrmCadDepartametos
  Caption = 'Cadastro de Departamentos'
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
      inherited btnLocalizar: TToolButton
        Visible = False
      end
    end
  end
  inherited pgDados: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblDepartamento: TLabel
        Left = 16
        Top = 24
        Width = 76
        Height = 13
        Caption = 'Departamento: '
      end
      object edtDepartamento: TDBEdit
        Left = 98
        Top = 21
        Width = 425
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_DEPARTAMENTO'
        DataSource = dmModuloDados1.dsDepartaentos
        TabOrder = 0
      end
    end
    object tabListaRegistros: TTabSheet
      Caption = 'Lista de Registros'
      ImageIndex = 1
      object grdDados: TDBGrid
        Left = 3
        Top = 3
        Width = 427
        Height = 214
        DataSource = dmModuloDados1.dsDepartaentos
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdDadosDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO_DEPARTAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_DEPARTAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Departamento'
            Visible = True
          end>
      end
    end
  end
end
