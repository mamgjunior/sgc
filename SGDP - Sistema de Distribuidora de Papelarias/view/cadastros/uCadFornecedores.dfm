inherited frmCadFornecedores: TfrmCadFornecedores
  Caption = 'Cadastro de Fornecedores'
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
    ActivePage = tsProdutos
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 395
      object lblRazaoSocial: TLabel
        Left = 19
        Top = 40
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Raz'#227'o Social:'
      end
      object lblNomeFantasia: TLabel
        Left = 8
        Top = 72
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Fantasia:'
      end
      object lblCnpj: TLabel
        Left = 42
        Top = 116
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'C.N.P.J:'
      end
      object Label3: TLabel
        Left = 25
        Top = 154
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Home Page:'
      end
      object Label4: TLabel
        Left = 51
        Top = 192
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'E-mail:'
      end
      object Label5: TLabel
        Left = 276
        Top = 116
        Width = 72
        Height = 13
        Caption = 'Insc. Estadual:'
      end
      object edtRAZAO_SOCIAL: TDBEdit
        Left = 89
        Top = 45
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RAZAO_SOCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 0
        OnEnter = edtRAZAO_SOCIALEnter
        OnExit = edtRAZAO_SOCIALExit
      end
      object edtNOME_FANTASIA: TDBEdit
        Left = 89
        Top = 75
        Width = 440
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_FANTASIA'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 1
      end
      object edtCNPJ: TDBEdit
        Left = 89
        Top = 113
        Width = 175
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CNPJ'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 2
      end
      object edtHOME_PAGE: TDBEdit
        Left = 89
        Top = 151
        Width = 440
        Height = 21
        CharCase = ecLowerCase
        DataField = 'HOME_PAGE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 4
      end
      object edtEMAIL: TDBEdit
        Left = 89
        Top = 189
        Width = 440
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 5
      end
      object edtINSCRICAO_ESTADUAL: TDBEdit
        Left = 354
        Top = 113
        Width = 175
        Height = 21
        CharCase = ecUpperCase
        DataField = 'INSCRICAO_ESTADUAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 3
      end
    end
    object tsEndereco: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object lblEndereco: TLabel
        Left = 34
        Top = 31
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o:'
      end
      object lblComplemento: TLabel
        Left = 12
        Top = 67
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Complemento:'
      end
      object lblCidade: TLabel
        Left = 44
        Top = 113
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade:'
      end
      object lblEstado: TLabel
        Left = 359
        Top = 113
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado:'
      end
      object lblCEP: TLabel
        Left = 58
        Top = 153
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'CEP:'
      end
      object lblTelefone: TLabel
        Left = 217
        Top = 153
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone:'
      end
      object lblContComercial: TLabel
        Left = 1
        Top = 196
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cont. Comercial:'
      end
      object lblFoneComercial: TLabel
        Left = 4
        Top = 237
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fone Comercial:'
      end
      object lblBairro: TLabel
        Left = 364
        Top = 67
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro:'
      end
      object lblFax: TLabel
        Left = 441
        Top = 153
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fax:'
      end
      object edtENDERECO: TDBEdit
        Left = 89
        Top = 28
        Width = 443
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 0
      end
      object edtCOMPLEMENTO: TDBEdit
        Left = 87
        Top = 64
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 2
      end
      object edtCIDADE: TDBEdit
        Left = 87
        Top = 110
        Width = 265
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 4
      end
      object edtCEP: TDBEdit
        Left = 87
        Top = 150
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 6
      end
      object edtTELEFONE: TDBEdit
        Left = 268
        Top = 150
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 7
      end
      object edtNUMERO: TDBEdit
        Left = 538
        Top = 28
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 1
      end
      object edtBAIRRO: TDBEdit
        Left = 402
        Top = 64
        Width = 208
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 3
      end
      object cbbESTADO: TDBLookupComboBox
        Left = 402
        Top = 110
        Width = 207
        Height = 21
        DataField = 'ESTADO'
        DataSource = dmModuloDados1.dsFornecedores
        KeyField = 'SIGLA_ESTADO'
        ListField = 'ESTADO'
        ListSource = dmModuloDados1.dsEstados
        TabOrder = 5
      end
      object edtFAX: TDBEdit
        Left = 469
        Top = 150
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 8
      end
      object edtCONTATO_COMERCIAL: TDBEdit
        Left = 87
        Top = 193
        Width = 522
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CONTATO_COMERCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 9
      end
      object edtFONE_COMERCIAL: TDBEdit
        Left = 87
        Top = 234
        Width = 140
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FONE_COMERCIAL'
        DataSource = dmModuloDados1.dsFornecedores
        TabOrder = 10
      end
    end
    object tsProdutos: TTabSheet
      Caption = 'Lista de Produtos'
      ImageIndex = 2
      ExplicitLeft = 5
      ExplicitTop = 28
      object btnNovoProduto: TSpeedButton
        Left = 7
        Top = 16
        Width = 50
        Height = 50
        Caption = 'Inserir'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A47158A47158A47158A4
          7158A47158A47158A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A37085BD9D
          85BD9D85BD9D85BD9D85BD9D85BD9D56A26EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF56A26C84D5B15ED09D5ED09D5ED09D5ED09D70C79C53A06AFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF53A0698CD8B662D19F62D19F62D19F62D19F73C89E50
          9E67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF509D6592DBBA67D2A267D2A267D2
          A267D2A275C9A04D9B63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D9A6097DDBE
          6CD3A56CD3A56CD3A56CD3A57ACBA24A985EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF49975C99DEC072D5A872D5A872D5A872D5A87FCBA546955AFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF4593579ADFC078D6AC78D6AC78D6AC78D6AC84CDA942
          9155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A370
          56A26C53A069509D654D9A6049975C4593573E8E5098DEBF7ED8B07ED8B07ED8
          B07ED8B08ACFAB3E8E5042915546955A4A985E4D9B63509E6753A06A56A26E58
          A47158A471A7E6CA74CAA072C89D74C99F78CBA17ECBA482CCA888CFAA8ED0AD
          85DAB485DAB485DAB485DAB477C9A072C89D74C99F78CBA17ECBA482CCA888CF
          AA8ED0AD85BD9D58A47158A471A7E6CA8CDCB88CDCB88CDCB88CDCB88CDCB88C
          DCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB8
          8CDCB88CDCB88CDCB88CDCB885BD9D58A47158A471A7E6CA93DDBC93DDBC93DD
          BC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93
          DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC85BD9D58A47158A471A7E6CA
          99DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DF
          C099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC085BD9D58
          A47158A471A7E6CAA0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4
          A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1
          C4A0E1C485BD9D58A47158A471A7E6CA94DDBD98DEBF9ADFC099DEC097DDBE92
          DBBA8CD8B684D5B1A7E3C8A7E3C8A7E3C8A7E3C87AD0A69ADFC09ADFC099DEC0
          97DDBE92DBBA8CD8B684D5B185BD9D58A47158A47156A26E53A06A509E674D9B
          634A985E46955A4291553E8E508CD8B6ADE5CCADE5CCADE5CCADE5CC80D1A93E
          8E5045935749975C4D9A60509D6553A06956A26C58A37058A471FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45935792DBBAB3E6D0B3E6D0B3E6
          D0B3E6D087D1AC429155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49975C97DDBE
          B9E8D3B9E8D3B9E8D3B9E8D38CD2AE46955AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF4D9A6099DEC0BEE9D6BEE9D6BEE9D6BEE9D691D3B14A985EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF509D659ADFC0C3EAD9C3EAD9C3EAD9C3EAD996D3B24D
          9B63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53A06998DEBFC7EBDBC7EBDBC7EB
          DBC7EBDB9BD4B5509E67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56A26C94DDBD
          CAECDDCAECDDCAECDDCAECDD9ED5B753A06AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF58A370A7E6CAA7E6CAA7E6CAA7E6CAA7E6CAA7E6CA56A26EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF58A47158A47158A47158A47158A47158A47158A47158
          A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = btnNovoProdutoClick
      end
      object btnExcluirProduto: TSpeedButton
        Left = 63
        Top = 16
        Width = 50
        Height = 50
        Caption = 'Excluir'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE0E0E0ABABABB8B8B8C6C6C6CECECECECECECACA
          CAC3C3C3BABABAB0B0B0AAAAAAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191EBEBEBFCFCFCF4F4F4
          ECECECE2E2E2DADADAD1D1D1CACACAC5C5C5C6C6C68B8B8BAEAEAEFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC0C0C0B3B3B3A8
          CEB23DB6633DBB6944C07497CAAC61C78B47C37842BE6F4DB770A2AEA6ACACAC
          959595B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
          E6AEAEAEE0E0E04FB4683AB45C39B6613FBC6A91C3A35CC18241BE6E3DBA6740
          B3635CAE72D9D9D9A2A2A29F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBCBCBCCACACAC7D5CA44B15C69C280B0D9BCA6CFB3BACABFA6C3
          B06FBD8883BE954BB1672CA94ABCCBBFCACACA838383F9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF9F9F9A0A0A0D4D4D49CC6A330A74736AC50C7E3CD
          E3E9E4E2E2E2DADADAC9CFCBADC4B22DA94A27A5428ABE93D4D4D4858585BDBD
          BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFA8A8A8D5D5D596C59D2F
          A4412FA64543AF59E2E8E4E2E2E2DADADAD0D1D051AF6524A23D23A0398ABA91
          D5D5D59B9B9BA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9B9B9
          B9D5D5D5C1D6C431A13F279F39A1D2A9EBEBEBE2E2E2D9D9D9D0D0D09ABDA038
          A2482F9F3EBBC3BCD5D5D5B3B3B3939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFABABABC8C8C8D8D8D8D1DDD2D0E3D2D5EBD8A5D2AA59B164DDE0DEB5CE
          B943A6513BA1488EB292A3BAA6C6C6C6D8D8D8C7C7C77E7E7EFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF8F8F8A0A0A0D3D3D3DADADAE6E6E6F0F0F064B569108F1A
          11911D89BF8E8ABD8F12911E11901C309737BEC0BEC8C8C8D9D9D9D3D3D38888
          88F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFECECECA5A5A5D6D6D6DCDCDCE6E6E6F2
          F2F2ACD6AE08880D0B8A111A902028962E0B8B120A8A1063A365ACBDACCCCCCC
          DADADAD6D6D69D9D9DECECECFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFB3B3B3D7D7
          D7DDDDDDE6E6E6F3F3F3FBFCFB4FA64F038304038305188C191A8C1B439A44BC
          BEBCC4C4C4CECECEDADADAD7D7D7B3B3B3DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF
          D3D3D3BCBCBCDADADADDDDDDE5E5E5F4F4F4FCFCFCF0F2F0C9DCC9C6D6C6C3D1
          C3CACECAC8C8C8BFBFBFC5C5C5D1D1D1DBDBDBDADADABCBCBCD3D3D3FFFFFFFF
          FFFFFFFFFFFFFFFFC8C8C8C2C2C2DEDEDEDBDBDBE8E8E8E2EDE3ABD5B181C18D
          7BBC8959AC6D5AAB6F79B7897EB88C9BC2A4C8D3CAD8D8D8DBDBDBDEDEDEC2C2
          C2C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFC1C1C1C9C9C9E9ECE98BBC9050A85A35
          9D455CAE695EAE6D5DAC6E50A4654EA36459A46C5AA36B57A068459856569D63
          94BD99E6EAE7C9C9C9C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8C6D9C62F98
          364CA9545AAD6447A7556FB47A86B89089B3929EB2A395AA9B79A0836F9B7A56
          9665368F49549B5F5097582F8236BDCFBEC8C8C8FFFFFFFFFFFFFFFFFFFFFFFF
          D0D9D01C8F2151AA5769B66F9FC7A4D5DBD6DDDDDDD5D5D5CBCBCBC1C1C1B6B6
          B6ACACACA1A1A19898988F93906B8D7057975E4B935117731DC8D2C8FFFFFFFF
          FFFFFFFFFFFFFFFF76B3792B98318FC392E7E9E7DFDFDFE2E2E2E4E4E4DCDCDC
          D4D4D4CACACABFBFBFB5B5B5AAAAAAA1A1A199999995959593939382A7852F82
          34649A66FFFFFFFFFFFFFFFFFFFFFFFF439C4638953C5A935EEAEAEAE2E2E2E5
          E5E5E8E8E8E3E3E3DBDBDBD2D2D2C8C8C8BEBEBEB3B3B3A9A9A9A1A1A19B9B9B
          9797975A835E3E8242307C32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF428D450A64
          0F2A7931C2D1C4E6E6E6E9E9E9E6E6E6E0E0E0D8D8D8CFCFCFC5C5C5BABABAB0
          B0B0A7A7A78E9A90307139125C19356F37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4F8F42B772F0B68130E6E19227D30559B6184B68E99C0A2CFD7D1CCD0
          CC8CB49576A7824C915D267C38166E2614651F286A2EEFF3EFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66A16B10701B10741F127A2515802B
          1785301988341A8A371B8A371A8635197F3118772C176F275F9667FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9F584
          B88C3F944F278A3B218A391988341A8A37248F3F2A8F4343975784B78FEFF5F0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        OnClick = btnExcluirProdutoClick
      end
      object grdProdutos: TDBGrid
        Left = 3
        Top = 72
        Width = 657
        Height = 315
        DataSource = dmModuloDados1.dsFornecedorProduto
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_FORNECEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Produto'
            Width = 450
            Visible = True
          end>
      end
    end
  end
end
