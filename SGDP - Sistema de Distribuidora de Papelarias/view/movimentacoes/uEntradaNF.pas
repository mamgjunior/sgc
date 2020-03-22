unit uEntradaNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEntradaNF = class(TForm)
    grpDadosNF: TGroupBox;
    btnFornecedor: TSpeedButton;
    lblFornecedor: TLabel;
    mskNumeroNF: TMaskEdit;
    lblNumeroNF: TLabel;
    lblDataEmissao: TLabel;
    mskDataEmissao: TMaskEdit;
    lblValor: TLabel;
    edtValor: TEdit;
    btnIncluir: TBitBtn;
    grpItensNF: TGroupBox;
    pnlBotoes: TPanel;
    btnIncluirItem: TSpeedButton;
    btnAlterarItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    btnGravarItem: TSpeedButton;
    btnProduto: TSpeedButton;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    mskQuantidade: TMaskEdit;
    lblPrecoUnitario: TLabel;
    edtPreocoUnitario: TEdit;
    lblValorTotal: TLabel;
    fldValorTotal: TLabel;
    fldProduto: TLabel;
    grdItensNF: TDBGrid;
    btnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mskNumeroNFEnter(Sender: TObject);
    procedure mskNumeroNFExit(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnAlterarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnGravarItemClick(Sender: TObject);
    procedure grdItensNFDblClick(Sender: TObject);
    procedure grdItensNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
  private
    procedure LimparNotaFical;
    procedure LimparProduto;
    procedure ConfiguracaoInicial;
    procedure ConfiguracaoFinal(var Action: TCloseAction);
    procedure produto;
    procedure IncluirFornecedor;
    procedure Fornecedor;
    procedure IncluirItemNotaFiscal;
    procedure AlterarItemNotaFiscal;
    procedure DeletarItemNotaFiscal;
    procedure GravarItemNtaFiscal;
  public
    { Public declarations }
  end;

var
  frmEntradaNF: TfrmEntradaNF;

implementation

uses
  uDMModulo1, uRotinasGenericas, uLocalizarFornecedor, uLocalizaProduto;

{$R *.dfm}

{ TfrmEntradaNF }

procedure TfrmEntradaNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConfiguracaoFinal(Action);
end;

procedure TfrmEntradaNF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmEntradaNF.FormShow(Sender: TObject);
begin
  ConfiguracaoInicial;
end;

procedure TfrmEntradaNF.LimparNotaFical;
begin
  lblFornecedor.Caption := 'Fornecedor:';
  mskNumeroNF.Text := EmptyStr;
  mskDataEmissao.Text := EmptyStr;
  edtValor.Text := EmptyStr;
end;

procedure TfrmEntradaNF.LimparProduto;
begin
  fldProduto.Caption := EmptyStr;
  mskQuantidade.Text := EmptyStr;
  edtPreocoUnitario.Text := EmptyStr;
  fldValorTotal.Caption := '0,00';
end;

procedure TfrmEntradaNF.mskNumeroNFEnter(Sender: TObject);
begin
  CorEntrada(Sender);
end;

procedure TfrmEntradaNF.mskNumeroNFExit(Sender: TObject);
var
  quantidade: Integer;
  valorTotal: Currency;
  precoUnitario: Currency;
begin
  CorSaida(Sender);
  if (Sender = mskQuantidade) or (Sender = edtPreocoUnitario) then
  begin
    if Trim(mskQuantidade.Text) <> EmptyStr then
      quantidade := StrToInt(Trim(mskQuantidade.Text))
    else
      quantidade := 0;

    if Trim(edtPreocoUnitario.Text) <> EmptyStr then
      precoUnitario := StrToCurr(Trim(edtPreocoUnitario.Text))
    else
      precoUnitario := 0;

    valorTotal := precoUnitario * quantidade;
    fldValorTotal.Caption := Format('%10.2f', [edtValor]);

    if Sender = edtPreocoUnitario then
      mskQuantidade.SetFocus;
  end;
end;

procedure TfrmEntradaNF.ConfiguracaoInicial;
begin
  dmModuloDados1.sdsControle.Open;
  dmModuloDados1.sdsFornecedores.Open;
  dmModuloDados1.sdsDescricao.Open;
  dmModuloDados1.sdsCatalogo.Open;
  fldProduto.Caption := EmptyStr;
  fldValorTotal.Caption := '0,00';
  grpItensNF.Enabled := False;
end;

procedure TfrmEntradaNF.btnAlterarItemClick(Sender: TObject);
begin
  AlterarItemNotaFiscal;
end;

procedure TfrmEntradaNF.btnExcluirItemClick(Sender: TObject);
begin
  DeletarItemNotaFiscal;
end;

procedure TfrmEntradaNF.btnFornecedorClick(Sender: TObject);
begin
  Fornecedor;
end;

procedure TfrmEntradaNF.btnGravarItemClick(Sender: TObject);
begin
  GravarItemNtaFiscal;
end;

procedure TfrmEntradaNF.btnIncluirClick(Sender: TObject);
begin
  IncluirFornecedor;
end;

procedure TfrmEntradaNF.btnIncluirItemClick(Sender: TObject);
begin
  IncluirItemNotaFiscal;
end;

procedure TfrmEntradaNF.btnProdutoClick(Sender: TObject);
begin
  produto;
end;

procedure TfrmEntradaNF.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntradaNF.ConfiguracaoFinal(var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsFornecedores.Close;
  dmModuloDados1.sdsDescricao.Close;
  dmModuloDados1.sdsCatalogo.Close;
  Action := caFree;
end;

procedure TfrmEntradaNF.produto;
var
  codigo_produto: Integer;
  codigo_descricao: Integer;
begin
  Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto);
  if frmLocalizaProduto.ShowModal = mrOk then
  begin
    codigo_produto := StrToInt(frmLocalizaProduto.strValor);
    dmModuloDados1.sdsCatalogo.IndexFieldNames := 'codigo_interno';
    dmModuloDados1.sdsCatalogo.FindKey([codigo_produto]);
    codigo_descricao := dmModuloDados1.sdsCatalogoCODIGO_DESCRICAO.AsInteger;
    dmModuloDados1.sdsDescricao.IndexFieldNames := 'codigo_descricao';
    dmModuloDados1.sdsDescricao.FindKey([codigo_descricao]);
    fldProduto.Caption := Trim(dmModuloDados1.sdsDescricaoDESCRICAO.AsString) + ' ' + Trim(dmModuloDados1.sdsCatalogoMODELO.AsString);
    dmModuloDados1.sdsCatalogo.IndexFieldNames := EmptyStr;
    dmModuloDados1.sdsDescricao.IndexFieldNames := EmptyStr;
    mskQuantidade.SetFocus;
  end;
  frmLocalizaProduto.Destroy;
end;

procedure TfrmEntradaNF.IncluirFornecedor;
begin
  dmModuloDados1.sdsEntradaNF.Filter := 'codigo_fornecedor' + dmModuloDados1.sdsFornecedoresCODIGO_FORNECEDOR.AsString + ' and numero_notafiscal = ' + '''' + mskNumeroNF.Text + '''';
  dmModuloDados1.sdsEntradaNF.Filtered := True;
  dmModuloDados1.sdsEntradaNF.Open;
  grpDadosNF.Enabled := False;
  grpItensNF.Enabled := True;
  mskQuantidade.SetFocus;
end;

procedure TfrmEntradaNF.Fornecedor;
var
  codigoFornecedor: string;
begin
  Application.CreateForm(TfrmLocalizarFornecedor, frmLocalizarFornecedor);
  if frmLocalizarFornecedor.ShowModal = mrOk then
  begin
    codigoFornecedor := frmLocalizarFornecedor.strValor;
    dmModuloDados1.sdsFornecedores.IndexFieldNames := 'codigo_fornecedor';
    dmModuloDados1.sdsFornecedores.FindKey([codigoFornecedor]);
    lblFornecedor.Caption := 'Fornecedor: ' + dmModuloDados1.sdsFornecedoresRAZAO_SOCIAL.AsString;
    dmModuloDados1.sdsFornecedores.IndexFieldNames := EmptyStr;
    mskNumeroNF.SetFocus;
  end;
  frmLocalizarFornecedor.Destroy;
end;

procedure TfrmEntradaNF.IncluirItemNotaFiscal;
var
  registro: Integer;
  valorTotal: Currency;
  incluirItem: Boolean;
  quantidade: Integer;
  precoUnitario: Currency;
begin
  incluirItem := True;

  quantidade := 0;
  if Trim(mskQuantidade.Text) <> EmptyStr then
    quantidade := StrToInt(Trim(mskQuantidade.Text));

  precoUnitario := 0;
  if Trim(edtPreocoUnitario.Text) <> EmptyStr then
    precoUnitario := StrToCurr(Trim(edtPreocoUnitario.Text));

  if quantidade = 0 then
  begin
    incluirItem := False;
    Mensagem('Digite um valor para a "Quantidade"!');
    mskQuantidade.SetFocus;
  end
  else if precoUnitario = 0 then
  begin
    incluirItem := False;
    Mensagem('Digite um valor para "preço unitário"!');
    edtPreocoUnitario.SetFocus;
  end;

  if incluirItem then
  begin
    dmModuloDados1.sdsControle.Edit;
    dmModuloDados1.sdsControleREGISTRO_ENTRADA_NF.AsInteger := dmModuloDados1.sdsControleREGISTRO_ENTRADA_NF.AsInteger + 1;
    dmModuloDados1.sdsControle.Post;
    dmModuloDados1.sdsControle.ApplyUpdates(-1);

    registro := dmModuloDados1.sdsControleREGISTRO_ENTRADA_NF.AsInteger;
    valorTotal := quantidade * precoUnitario;

    dmModuloDados1.sdsEntradaNF.Append;
    dmModuloDados1.sdsEntradaNFREGISTRO.AsInteger := registro;
    dmModuloDados1.sdsEntradaNFCODIGO_FORNECEDOR.AsInteger := dmModuloDados1.sdsFornecedoresCODIGO_FORNECEDOR.AsInteger;
    dmModuloDados1.sdsEntradaNFNUMERO_NOTA_FISCAL.AsString := mskNumeroNF.Text;
    dmModuloDados1.sdsEntradaNFCODIGO_PRODUTO.AsInteger := dmModuloDados1.sdsCatalogoCODIGO_INTERNO.AsInteger;
    dmModuloDados1.sdsEntradaNFDESCRICAO_PRODUTOS.AsString := fldProduto.Caption;
    dmModuloDados1.sdsEntradaNFQUANTIDADE.AsInteger := quantidade;
    dmModuloDados1.sdsEntradaNFPRECO_UNITARIO.AsCurrency := precoUnitario;
    dmModuloDados1.sdsEntradaNFVALOR_TOTAL.AsCurrency := valorTotal;
    dmModuloDados1.sdsEntradaNF.Post;
    dmModuloDados1.sdsEntradaNF.ApplyUpdates(-1);
    LimparProduto;
  end;
end;

procedure TfrmEntradaNF.AlterarItemNotaFiscal;
begin
  dmModuloDados1.sdsEntradaNF.Edit;
  dmModuloDados1.sdsEntradaNFCODIGO_PRODUTO.AsInteger := dmModuloDados1.sdsCatalogoCODIGO_INTERNO.AsInteger;
  dmModuloDados1.sdsEntradaNFDESCRICAO_PRODUTOS.AsString := fldProduto.Caption;
  dmModuloDados1.sdsEntradaNFQUANTIDADE.AsInteger := StrToInt(Trim(mskQuantidade.Text));
  dmModuloDados1.sdsEntradaNFPRECO_UNITARIO.AsCurrency := StrToFloat(Trim(edtPreocoUnitario.Text));
  dmModuloDados1.sdsEntradaNFVALOR_TOTAL.AsCurrency := (dmModuloDados1.sdsEntradaNFQUANTIDADE.AsInteger * dmModuloDados1.sdsEntradaNFPRECO_UNITARIO.AsCurrency);
  dmModuloDados1.sdsEntradaNF.Post;
  dmModuloDados1.sdsEntradaNF.ApplyUpdates(-1);
  LimparProduto;
end;

procedure TfrmEntradaNF.DeletarItemNotaFiscal;
begin
  dmModuloDados1.sdsEntradaNF.Delete;
  dmModuloDados1.sdsEntradaNF.ApplyUpdates(-1);
end;

procedure TfrmEntradaNF.GravarItemNtaFiscal;
begin
  dmModuloDados1.sdsCatalogo.IndexFieldNames := 'codigo_interno';
  dmModuloDados1.sdsEntradaNF.DisableControls;
  dmModuloDados1.sdsEntradaNF.First;

  while not (dmModuloDados1.sdsEntradaNF.Eof) do
  begin
    dmModuloDados1.sdsCatalogo.FindKey([dmModuloDados1.sdsEntradaNFCODIGO_PRODUTO.AsInteger]);
    dmModuloDados1.sdsCatalogo.Edit;
    dmModuloDados1.sdsCatalogoESTOQUE_ATUAL.AsInteger := (dmModuloDados1.sdsCatalogoESTOQUE_ATUAL.AsInteger + dmModuloDados1.sdsEntradaNFQUANTIDADE.AsInteger);
    dmModuloDados1.sdsCatalogo.Post;
    dmModuloDados1.sdsCatalogo.ApplyUpdates(-1);
    dmModuloDados1.sdsEntradaNF.Next;
  end;

  dmModuloDados1.sdsCatalogo.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsEntradaNF.EnableControls;
  dmModuloDados1.sdsEntradaNF.Close;
  dmModuloDados1.sdsEntradaNF.Filter := EmptyStr;
  dmModuloDados1.sdsEntradaNF.Filtered := False;
  LimparNotaFical;
  LimparProduto;
  grpItensNF.Enabled := False;
  grpDadosNF.Enabled := True;
  mskNumeroNF.SetFocus;
end;

procedure TfrmEntradaNF.grdItensNFDblClick(Sender: TObject);
var
  codigoProduto: Integer;
  codigoDescricao: Integer;
begin
  codigoProduto := dmModuloDados1.sdsEntradaNFCODIGO_PRODUTO.AsInteger;
  dmModuloDados1.sdsCatalogo.IndexFieldNames := 'codigo_interno';
  dmModuloDados1.sdsCatalogo.FindKey([codigoProduto]);
  codigoDescricao := dmModuloDados1.sdsCatalogoCODIGO_DESCRICAO.AsInteger;
  dmModuloDados1.sdsDescricao.IndexFieldNames := 'codigo_descricao';
  dmModuloDados1.sdsDescricao.FindKey([codigoDescricao]);

  dmModuloDados1.sdsCatalogo.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsDescricao.IndexFieldNames := EmptyStr;

  fldProduto.Caption := dmModuloDados1.sdsEntradaNFDESCRICAO_PRODUTOS.AsString;
  mskQuantidade.Text := dmModuloDados1.sdsEntradaNFQUANTIDADE.AsString;
  edtPreocoUnitario.Text := Format('%8.2f', [dmModuloDados1.sdsEntradaNFPRECO_UNITARIO.AsFloat]);
  fldValorTotal.Caption := Format('%10.2f', [dmModuloDados1.sdsEntradaNFVALOR_TOTAL.AsFloat]);
end;

procedure TfrmEntradaNF.grdItensNFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0;
end;

end.
