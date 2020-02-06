unit uCadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TfrmCadFornecedores = class(TfrmMestreCadastro)
    tsEndereco: TTabSheet;
    tsProdutos: TTabSheet;
    lblRazaoSocial: TLabel;
    lblNomeFantasia: TLabel;
    lblCnpj: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtRAZAO_SOCIAL: TDBEdit;
    edtNOME_FANTASIA: TDBEdit;
    edtCNPJ: TDBEdit;
    edtHOME_PAGE: TDBEdit;
    edtEMAIL: TDBEdit;
    edtINSCRICAO_ESTADUAL: TDBEdit;
    lblEndereco: TLabel;
    lblComplemento: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblCEP: TLabel;
    lblTelefone: TLabel;
    lblContComercial: TLabel;
    lblFoneComercial: TLabel;
    lblBairro: TLabel;
    edtENDERECO: TDBEdit;
    edtCOMPLEMENTO: TDBEdit;
    edtCIDADE: TDBEdit;
    edtCEP: TDBEdit;
    edtTELEFONE: TDBEdit;
    edtNUMERO: TDBEdit;
    edtBAIRRO: TDBEdit;
    cbbESTADO: TDBLookupComboBox;
    lblFax: TLabel;
    edtFAX: TDBEdit;
    edtCONTATO_COMERCIAL: TDBEdit;
    edtFONE_COMERCIAL: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtRAZAO_SOCIALEnter(Sender: TObject);
    procedure edtRAZAO_SOCIALExit(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadFornecedores: TfrmCadFornecedores;

implementation

uses
  uRotinasGenericas, uDMModulo1;

{$R *.dfm}

{ TfrmCadFornecedores }

procedure TfrmCadFornecedores.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsFornecedores.Append;
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar novo registro!');
    end;
  end
  else if Sender =  btnEditar then
  begin
    try
      dmModuloDados1.sdsFornecedores.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entra no modo de edição!');
    end;
  end;

  MoveFoco;
end;

procedure TfrmCadFornecedores.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsFornecedores.Prior;
  if dmModuloDados1.sdsFornecedores.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsFornecedores.First;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadFornecedores.btnDesfazerClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsFornecedores.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsFornecedores.CancelUpdates;
      MsgStatus('Alterações desfeitas com sucesso...');
    except
      Mensagem('Impossível desfazer alterações!');
    end;
  end
  else
    Mensagem('Não há alterações a serem desfeitas!');

  BloquearCampos(True);
  MoveFoco;
end;

procedure TfrmCadFornecedores.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsFornecedores.State in [dsEdit, dsInsert] then
  begin
    dmModuloDados1.sdsFornecedores.Post;
    dmModuloDados1.sdsFornecedores.ApplyUpdates(-1);
  end;

  try
    dmModuloDados1.sdsFornecedores.Delete;
    MsgStatus('Registro excluído co sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadFornecedores.btnGravarClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsFornecedores.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_FORNECEDOR.AsInteger := dmModuloDados1.sdsControleCODIGO_FORNECEDOR.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsFornecedoresCODIGO_FORNECEDOR.AsInteger := dmModuloDados1.sdsControleCODIGO_FORNECEDOR.AsInteger;
      end;

      dmModuloDados1.sdsFornecedores.Post;
      dmModuloDados1.sdsFornecedores.ApplyUpdates(-1);
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

procedure TfrmCadFornecedores.btnLocalizarClick(Sender: TObject);
var
  registro: Integer;
begin
  inherited;
//  registro := dmModuloDados1.sdsFornecedores.RecNo;
//  Application.CreateForm(TfrmLocalizaFornecedor, frmLocalizaFornecedor);
//  if frmLocalizaFornecedor.ShowModal = mrOk then
//  begin
//    dmModuloDados1.sdsFornecedores.IndexFieldNames := 'codigo_fornecedor';
//    dmModuloDados1.sdsFornecedores.FindKey([frmLocalizaFornecedor.strValor]);
//    dmModuloDados1.sdsFornecedores.IndexFieldNames := EmptyStr;
//  end
//  else
//    uDMModulo1.sdsFornecedores.RecNo := registro;
//
//  frmLocalizaFornecedor.Destroy;
end;

procedure TfrmCadFornecedores.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsFornecedores.First;
  MoveFoco;
end;

procedure TfrmCadFornecedores.btnProximoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsFornecedores.Next;
  if dmModuloDados1.sdsFornecedores.Eof then
  begin
    MsgStatus('Fim da tabela...');
    dmModuloDados1.sdsFornecedores.Last;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadFornecedores.btnUltimoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsFornecedores.Last;
  MoveFoco;
end;

procedure TfrmCadFornecedores.edtRAZAO_SOCIALEnter(Sender: TObject);
begin
  inherited;
  CorEntrada(Sender);
end;

procedure TfrmCadFornecedores.edtRAZAO_SOCIALExit(Sender: TObject);
begin
  inherited;
  CorSaida(Sender);
  if Sender = edtCNPJ then
  begin
    if not VerificaCNPJ(edtCNPJ.Text) then
    begin
      Mensagem('CNPJ inválido!' + #13 + 'Digite novamente...');
    end;
  end;
end;

procedure TfrmCadFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsEstados.Close;
  dmModuloDados1.sdsFornecedores.Close;
  inherited;
end;

procedure TfrmCadFornecedores.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsEstados.Open;
    dmModuloDados1.sdsFornecedores.Open;

    if dmModuloDados1.sdsFornecedores.IsEmpty then
    begin
      BloquearCampos(False);
      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;
      chrModo := 'I';
      dmModuloDados1.sdsFornecedores.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadFornecedores.MoveFoco;
begin
  case pgDados.ActivePageIndex of
    0:
      edtRAZAO_SOCIAL.SetFocus;
    1:
      edtENDERECO.SetFocus;
  end;
end;

end.
