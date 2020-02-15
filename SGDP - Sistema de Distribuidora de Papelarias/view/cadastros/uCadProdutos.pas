unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Data.DB;

type
  TfrmCadProdutos = class(TfrmMestreCadastro)
    edtCodigoBarras: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    edtCusto: TDBEdit;
    edtLucro: TDBEdit;
    DBEdit6: TDBEdit;
    edtCMS: TDBEdit;
    edtVenda: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    lblCodigoBarras: TLabel;
    lblDescricao: TLabel;
    lblModelo: TLabel;
    lccbDescricao: TDBLookupComboBox;
    lblMedida: TLabel;
    lblGrupo: TLabel;
    lcbbGrupo: TDBLookupComboBox;
    lcbbCategoria: TDBLookupComboBox;
    lblCategoria: TLabel;
    lblFamilia: TLabel;
    lcbbFamilia: TDBLookupComboBox;
    lcbbMarca: TDBLookupComboBox;
    lblMarca: TLabel;
    lblCusto: TLabel;
    lblMargem: TLabel;
    lblVenda: TLabel;
    lblICMS: TLabel;
    lblIPI: TLabel;
    lblEstoqueAtual: TLabel;
    lblEstoqueMinimo: TLabel;
    lblCustoMedio: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoBarrasEnter(Sender: TObject);
    procedure edtCodigoBarrasExit(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

uses
  uDMModulo1, uRotinasGenericas, uLocalizaProduto;

{$R *.dfm}

{ TfrmCadProdutos }

procedure TfrmCadProdutos.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsCatalogo.Append;
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar um novo registro!');
    end;
  end
  else if Sender = btnEditar then
  begin
    try
      dmModuloDados1.sdsCatalogo.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entrar no modo de edição!');
    end;
  end;

  MoveFoco;
end;

procedure TfrmCadProdutos.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsCatalogo.Prior;

  if dmModuloDados1.sdsCatalogo.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsCatalogo.First;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadProdutos.btnDesfazerClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsCatalogo.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsCatalogo.CancelUpdates;
      MsgStatus('Alteraçoes desfeitas com sucesso...');
    except
      Mensagem('Impossível desfazer alterações!');
    end;
  end
  else
    Mensagem('Não há alteração a serem desfeitas!');

  BloquearCampos(True);
  MoveFoco;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsCategorias.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsCatalogo.Post;

  try
    dmModuloDados1.sdsCatalogo.Delete;
    dmModuloDados1.sdsCatalogo.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadProdutos.btnGravarClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsCatalogo.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_INTERNO.AsInteger := dmModuloDados1.sdsControleCODIGO_INTERNO.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsCatalogoCODIGO_INTERNO.AsInteger := dmModuloDados1.sdsControleCODIGO_INTERNO.AsInteger;
      end;
      dmModuloDados1.sdsCatalogo.Post;
      dmModuloDados1.sdsCatalogo.ApplyUpdates(-1);
      chrModo := EmptyStr;
      MsgStatus('Dados gravados com sucesso...');
    except
      Mensagem('Não foi possível efetuar a gravação dos dados!');
    end;
  end
  else
    Mensagem('Não há alterações a serem gravadas!');

  BloquearCampos(True);
  MoveFoco;
end;

procedure TfrmCadProdutos.btnLocalizarClick(Sender: TObject);
var
  registro: Integer;
begin
  inherited;
  registro := dmModuloDados1.sdsCatalogo.RecNo;
  Application.CreateForm(TfrmLocalizaProduto, frmLocalizaProduto);
  if frmLocalizaProduto.ShowModal = mrOk then
  begin
    dmModuloDados1.sdsCatalogo.IndexFieldNames := 'Codigo_Interno';
    dmModuloDados1.sdsCatalogo.FindKey([frmLocalizaProduto.strValor]);
    dmModuloDados1.sdsCatalogo.IndexFieldNames := EmptyStr;
  end
  else
    dmModuloDados1.sdsCatalogo.RecNo := registro;
  frmLocalizaProduto.Destroy;
end;

procedure TfrmCadProdutos.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsCatalogo.First;
  MoveFoco;
end;

procedure TfrmCadProdutos.btnProximoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsCatalogo.Next;

  if dmModuloDados1.sdsCatalogo.Eof then
  begin
    MsgStatus('Fim da tabela...');
    dmModuloDados1.sdsCatalogo.Last;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadProdutos.btnUltimoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsCatalogo.Last;
  MoveFoco;
end;

procedure TfrmCadProdutos.edtCodigoBarrasEnter(Sender: TObject);
begin
  inherited;
  CorEntrada(Sender);
end;

procedure TfrmCadProdutos.edtCodigoBarrasExit(Sender: TObject);
var
  precoVenda: Currency;
  margemLucro: Currency;
begin
  inherited;
  CorSaida(Sender);
  if (Sender = edtCusto) or (Sender = edtLucro) then
  begin
    if dmModuloDados1.sdsCatalogoPRECO_CUSTO.AsCurrency <> 0 then
    begin
      if dmModuloDados1.sdsCatalogoMARGEM_LUCRO.AsCurrency <> 0 then
        precoVenda := (dmModuloDados1.sdsCatalogoPRECO_CUSTO.AsCurrency * (1 + (dmModuloDados1.sdsCatalogoMARGEM_LUCRO.AsCurrency / 100)))
      else
        precoVenda := dmModuloDados1.sdsCatalogoPRECO_CUSTO.AsCurrency;

      if not (dmModuloDados1.sdsCatalogo.State in [dsEdit, dsInsert]) then
        dmModuloDados1.sdsCatalogo.Edit;

      dmModuloDados1.sdsCatalogoPRECO_VENDA.AsCurrency := precoVenda;
    end;
  end
  else if (Sender = edtVenda) then
  begin
    if (dmModuloDados1.sdsCatalogoPRECO_CUSTO.AsCurrency <> 0) and (dmModuloDados1.sdsCatalogoPRECO_VENDA.AsCurrency <> 0) then
    begin
      margemLucro := (((dmModuloDados1.sdsCatalogoPRECO_VENDA.AsCurrency / dmModuloDados1.sdsCatalogoPRECO_CUSTO.AsCurrency) - 1) * 100);

      if not (dmModuloDados1.sdsCatalogo.State in [dsEdit, dsInsert]) then
        dmModuloDados1.sdsCatalogo.Edit;

      dmModuloDados1.sdsCatalogoMARGEM_LUCRO.AsCurrency := margemLucro;
    end;
  end;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsGrupos.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsCategorias.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsFamilias.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsMarcas.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsDescricao.IndexFieldNames := EmptyStr;

  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsGrupos.Close;
  dmModuloDados1.sdsCategorias.Close;
  dmModuloDados1.sdsFamilias.Close;
  dmModuloDados1.sdsMarcas.Close;
  dmModuloDados1.sdsDescricao.Close;
  dmModuloDados1.sdsCatalogo.Close;

  inherited;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsControle.Open;
  dmModuloDados1.sdsGrupos.Open;
  dmModuloDados1.sdsCategorias.Open;
  dmModuloDados1.sdsFamilias.Open;
  dmModuloDados1.sdsMarcas.Open;
  dmModuloDados1.sdsDescricao.Open;
  dmModuloDados1.sdsCatalogo.Open;

  dmModuloDados1.sdsGrupos.IndexFieldNames := 'Descricao_Grupo';
  dmModuloDados1.sdsCategorias.IndexFieldNames := 'Descricao_Categoria';
  dmModuloDados1.sdsFamilias.IndexFieldNames := 'Descricao_Familia';
  dmModuloDados1.sdsMarcas.IndexFieldNames := 'Descricao_Marca';
  dmModuloDados1.sdsDescricao.IndexFieldNames := 'Descricao';

  if dmModuloDados1.sdsCatalogo.IsEmpty then
  begin
    BloquearCampos(False);

    btnAdicionar.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnGravar.Enabled := True;

    chrModo := 'I';

    dmModuloDados1.sdsCatalogo.Append;
  end
  else
    chrModo := EmptyStr;

  MoveFoco;
end;

procedure TfrmCadProdutos.MoveFoco;
begin
  edtCodigoBarras.SetFocus;
end;

end.

