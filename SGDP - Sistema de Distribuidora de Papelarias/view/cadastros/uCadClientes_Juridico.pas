unit uCadClientes_Juridico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, DB;

type
  TfrmCadClientes_Juridico = class(TfrmMestreCadastro)
    tsEndereco: TTabSheet;
    lblDataCadastro: TLabel;
    lblNomeCliente: TLabel;
    lblCNPJ: TLabel;
    lblInscEstadual: TLabel;
    lblEmail: TLabel;
    lblLimiteCredito: TLabel;
    dbtxtDataCadastro: TDBText;
    dbedtNome: TDBEdit;
    dbedtCNPJ: TDBEdit;
    dbedtInscEstadual: TDBEdit;
    dbedtEmail: TDBEdit;
    dbedtLimite: TDBEdit;
    dbrgrpTipoCobranca: TDBRadioGroup;
    lblDebito: TLabel;
    dbtxtDebito: TDBText;
    lblEndereco: TLabel;
    lblComplemento: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblCEP: TLabel;
    lblTelefone: TLabel;
    lblContComercial: TLabel;
    lblFoneComercial: TLabel;
    lblBairro: TLabel;
    lblFax: TLabel;
    dbedtENDERECO: TDBEdit;
    dbedtCOMPLEMENTO: TDBEdit;
    edtCIDADE: TDBEdit;
    dbedtCEP: TDBEdit;
    dbedtTELEFONE: TDBEdit;
    dbedtNUMERO: TDBEdit;
    dbedtBAIRRO: TDBEdit;
    dblkcbbESTADO: TDBLookupComboBox;
    dbedtFAX: TDBEdit;
    dbedtCONTATO: TDBEdit;
    dbedtTELEFONE_CONTATO: TDBEdit;
    lblNumero: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbedtNomeEnter(Sender: TObject);
    procedure dbedtNomeExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadClientes_Juridico: TfrmCadClientes_Juridico;

implementation

uses
  uDMModulo1, uRotinasGenericas, uLocalizarCliente;

{$R *.dfm}

{ TfrmCadClientes_Juridico }

procedure TfrmCadClientes_Juridico.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsClientes.Append;
      dmModuloDados1.sdsClientesDATA_CADASTRO.AsDateTime := Date;
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar novo registro!');
    end;
  end
  else if Sender = btnEditar then
  begin
    try
      dmModuloDados1.sdsClientes.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entra no modo de edição!');
    end;
  end;

  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsClientes.Prior;
  if dmModuloDados1.sdsClientes.Bof then
  begin
    MsgStatus('Início da tabela');
    dmModuloDados1.sdsClientes.First;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.btnDesfazerClick(Sender: TObject);
begin
  inherited;

  if dmModuloDados1.sdsClientes.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsClientes.CancelUpdates;
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

procedure TfrmCadClientes_Juridico.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsClientes.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsClientes.Post;

  try
    dmModuloDados1.sdsClientes.Delete;
    dmModuloDados1.sdsClientes.ApplyUpdates(-1);
    MsgStatus('Registro exluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadClientes_Juridico.btnGravarClick(Sender: TObject);
begin
  inherited;

  if dmModuloDados1.sdsClientes.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_CLIENTE.AsInteger := dmModuloDados1.sdsControleCODIGO_CLIENTE.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsClientesCODIGO_CLIENTE.AsInteger := dmModuloDados1.sdsControleCODIGO_CLIENTE.AsInteger;
      end;

      dmModuloDados1.sdsClientes.Post;
      dmModuloDados1.sdsClientes.ApplyUpdates(-1);
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

procedure TfrmCadClientes_Juridico.btnLocalizarClick(Sender: TObject);
var
  registro: Integer;
begin
  inherited;
  registro := dmModuloDados1.sdsClientes.RecNo;
  Application.CreateForm(TfrmLocalizarCliente, frmLocalizarCliente);
  if frmLocalizarCliente.ShowModal = mrOk then
  begin
    dmModuloDados1.sdsClientes.IndexFieldNames := 'Codigo_Cliente';
    dmModuloDados1.sdsClientes.FindKey([frmLocalizarCliente.strValor]);
    dmModuloDados1.sdsClientes.IndexFieldNames := EmptyStr;
  end
  else
    dmModuloDados1.sdsClientes.RecNo := registro;
  frmLocalizarCliente.Destroy;
end;

procedure TfrmCadClientes_Juridico.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsClientes.First;
  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.btnProximoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsClientes.Next;
  if dmModuloDados1.sdsClientes.Eof then
  begin
    MsgStatus('Fim da tabela');
    dmModuloDados1.sdsClientes.Last;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.btnUltimoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsClientes.Last;
  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.dbedtNomeEnter(Sender: TObject);
begin
  inherited;
  CorEntrada(Sender);
end;

procedure TfrmCadClientes_Juridico.dbedtNomeExit(Sender: TObject);
begin
  inherited;
  CorSaida(Sender);
  if Sender = dbedtCNPJ then
  begin
    if not VerificaCNPJ(dbedtCNPJ.Text) then
    begin
      Mensagem('CNPJ inválido!' + #13 + 'Digite novamente...');
      dbedtCNPJ.SetFocus;
    end;
  end;
end;

procedure TfrmCadClientes_Juridico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsEstados.Close;
  dmModuloDados1.sdsClientes.Close;
  inherited;
end;

procedure TfrmCadClientes_Juridico.FormShow(Sender: TObject);
begin
  inherited;

  dmModuloDados1.sdsControle.Open;
  dmModuloDados1.sdsEstados.Open;
  dmModuloDados1.sdsClientes.Open;

  if dmModuloDados1.sdsClientes.IsEmpty then
  begin
    BloquearCampos(False);
    btnAdicionar.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnGravar.Enabled := True;
    chrModo := 'I';
    dmModuloDados1.sdsClientes.Append;
    dmModuloDados1.sdsClientesDATA_CADASTRO.AsDateTime := Date;
  end
  else
    chrModo := EmptyStr;

  MoveFoco;
end;

procedure TfrmCadClientes_Juridico.MoveFoco;
begin
  case pgDados.ActivePageIndex of
    0:
      dbedtNome.SetFocus;
    1:
      dbedtENDERECO.SetFocus;
  end;
end;

end.

