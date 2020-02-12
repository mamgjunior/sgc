inherited frmCadDescricao: TfrmCadDescricao
  Caption = 'frmCadDescricao'
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
      object lblDescricao: TLabel
        Left = 13
        Top = 24
        Width = 122
        Height = 13
        Caption = 'Descri'#231#227'o/Nome Produto:'
      end
      object edtDescricao: TDBEdit
        Left = 141
        Top = 21
        Width = 497
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dmModuloDados1.dsDescricao
        TabOrder = 0
      end
    end
    object tsListaRegistro: TTabSheet
      Caption = 'Lista de Registros'
      ImageIndex = 1
      object grdDados: TDBGrid
        Left = 16
        Top = 24
        Width = 633
        Height = 345
        DataSource = dmModuloDados1.dsDescricao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_DESCRICAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o / Nome do Produto'
            Width = 400
            Visible = True
          end>
      end
    end
  end
end
