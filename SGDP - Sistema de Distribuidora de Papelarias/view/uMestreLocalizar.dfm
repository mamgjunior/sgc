object frmMestreLocalizar: TfrmMestreLocalizar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Localizar'
  ClientHeight = 421
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object lblPesquisar: TLabel
    Left = 13
    Top = 12
    Width = 58
    Height = 16
    Caption = 'Pesquisar'
  end
  object edtPesquisar: TEdit
    Left = 77
    Top = 9
    Width = 628
    Height = 24
    TabOrder = 0
    OnEnter = edtPesquisarEnter
    OnExit = edtPesquisarExit
  end
  object grdDados: TDBGrid
    Left = 13
    Top = 39
    Width = 692
    Height = 338
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
  end
  object btnOk: TBitBtn
    Left = 528
    Top = 384
    Width = 85
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnCancelar: TBitBtn
    Left = 620
    Top = 384
    Width = 85
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
