inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblCodigoBarras: TLabel
        Left = 16
        Top = 24
        Width = 82
        Height = 13
        Caption = 'C'#243'digo de Barras'
      end
      object lblDescricao: TLabel
        Left = 230
        Top = 24
        Width = 83
        Height = 13
        Caption = 'Descri'#231#227'o / Nome'
      end
      object lblModelo: TLabel
        Left = 16
        Top = 72
        Width = 110
        Height = 13
        Caption = 'Modelo / Caracteristica'
      end
      object lblMedida: TLabel
        Left = 536
        Top = 72
        Width = 91
        Height = 13
        Caption = 'Unidade de Medida'
      end
      object lblGrupo: TLabel
        Left = 16
        Top = 119
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object lblCategoria: TLabel
        Left = 347
        Top = 119
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object lblFamilia: TLabel
        Left = 16
        Top = 167
        Width = 32
        Height = 13
        Caption = 'Familia'
      end
      object lblMarca: TLabel
        Left = 347
        Top = 166
        Width = 29
        Height = 13
        Caption = 'Marca'
      end
      object lblCusto: TLabel
        Left = 16
        Top = 215
        Width = 71
        Height = 13
        Caption = 'Pre'#231'o de custo'
      end
      object lblMargem: TLabel
        Left = 192
        Top = 217
        Width = 67
        Height = 13
        Caption = 'Margem Lucro'
      end
      object lblVenda: TLabel
        Left = 363
        Top = 215
        Width = 75
        Height = 13
        Caption = 'Pre'#231'o de Venda'
      end
      object lblICMS: TLabel
        Left = 536
        Top = 217
        Width = 41
        Height = 13
        Caption = 'I.C.M.S.'
      end
      object lblIPI: TLabel
        Left = 16
        Top = 267
        Width = 26
        Height = 13
        Caption = 'I.P.I.'
      end
      object lblEstoqueAtual: TLabel
        Left = 192
        Top = 269
        Width = 67
        Height = 13
        Caption = 'Estoque Atual'
      end
      object lblEstoqueMinimo: TLabel
        Left = 363
        Top = 267
        Width = 74
        Height = 13
        Caption = 'Estoque M'#237'nimo'
      end
      object lblCustoMedio: TLabel
        Left = 536
        Top = 267
        Width = 95
        Height = 13
        Caption = 'Custo M'#233'dio Mensal'
      end
      object edtCodigoBarras: TDBEdit
        Left = 16
        Top = 44
        Width = 193
        Height = 21
        DataField = 'CODIGO_BARRAS'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 0
        OnEnter = edtCodigoBarrasEnter
        OnExit = edtCodigoBarrasExit
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 92
        Width = 498
        Height = 21
        DataField = 'MODELO'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 536
        Top = 91
        Width = 121
        Height = 21
        DataField = 'UNIDADE_MEDIDA'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 2
      end
      object edtCusto: TDBEdit
        Left = 16
        Top = 234
        Width = 121
        Height = 21
        DataField = 'PRECO_CUSTO'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 3
      end
      object edtLucro: TDBEdit
        Left = 192
        Top = 236
        Width = 121
        Height = 21
        DataField = 'MARGEM_LUCRO'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 286
        Width = 121
        Height = 21
        DataField = 'IPI'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 5
      end
      object edtCMS: TDBEdit
        Left = 536
        Top = 236
        Width = 121
        Height = 21
        DataField = 'ICMS'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 6
      end
      object edtVenda: TDBEdit
        Left = 363
        Top = 234
        Width = 121
        Height = 21
        DataField = 'PRECO_VENDA'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 192
        Top = 286
        Width = 121
        Height = 21
        DataField = 'ESTOQUE_ATUAL'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 363
        Top = 285
        Width = 121
        Height = 21
        DataField = 'ESTOQUE_MINIMO'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 536
        Top = 286
        Width = 121
        Height = 21
        DataField = 'CONSUMO_MEDIO'
        DataSource = dmModuloDados1.dsCatalogo
        TabOrder = 10
      end
      object lccbDescricao: TDBLookupComboBox
        Left = 230
        Top = 43
        Width = 427
        Height = 21
        DataField = 'CODIGO_DESCRICAO'
        DataSource = dmModuloDados1.dsCatalogo
        KeyField = 'CODIGO_DESCRICAO'
        ListField = 'DESCRICAO'
        ListSource = dmModuloDados1.dsDescricao
        TabOrder = 11
      end
      object lcbbGrupo: TDBLookupComboBox
        Left = 16
        Top = 138
        Width = 310
        Height = 21
        DataField = 'CODIGO_GRUPO'
        DataSource = dmModuloDados1.dsCatalogo
        KeyField = 'CODIGO_GRUPO'
        ListField = 'DESCRICAO_GRUPO'
        ListSource = dmModuloDados1.dsGrupos
        TabOrder = 12
      end
      object lcbbCategoria: TDBLookupComboBox
        Left = 347
        Top = 137
        Width = 310
        Height = 21
        DataField = 'CODIGO_CATEGORIA'
        DataSource = dmModuloDados1.dsCatalogo
        KeyField = 'CODIGO_CATEGORIA'
        ListField = 'DESCRICAO_CATEGORIA'
        ListSource = dmModuloDados1.dsCategorias
        TabOrder = 13
      end
      object lcbbFamilia: TDBLookupComboBox
        Left = 16
        Top = 188
        Width = 310
        Height = 21
        DataField = 'CODIGO_FAMILIA'
        DataSource = dmModuloDados1.dsCatalogo
        KeyField = 'CODIGO_FAMILIA'
        ListField = 'DESCRICAO_FAMILIA'
        ListSource = dmModuloDados1.dsFamilias
        TabOrder = 14
      end
      object lcbbMarca: TDBLookupComboBox
        Left = 347
        Top = 185
        Width = 310
        Height = 21
        DataField = 'CODIGO_MARCA'
        DataSource = dmModuloDados1.dsCatalogo
        KeyField = 'CODIGO_MARCA'
        ListField = 'DESCRICAO_MARCA'
        ListSource = dmModuloDados1.dsMarcas
        TabOrder = 15
      end
    end
  end
end
