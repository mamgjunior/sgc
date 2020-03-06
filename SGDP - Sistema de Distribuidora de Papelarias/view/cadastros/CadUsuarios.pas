unit CadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TfrmCadUsuarios = class(TfrmMestreCadastro)
    lblFuncionario: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblPerfil: TLabel;
    cbbFuncionario: TDBLookupComboBox;
    edtUsuario: TDBEdit;
    edtSenha: TDBEdit;
    cbbPerfil: TDBLookupComboBox;
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
    procedure edtUsuarioEnter(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
  private
    procedure MoveFoco;
    procedure ConfiguracaoInicial;
    procedure ConfiguracoesFinais;
    procedure AdicionarRegistros(Sender: TObject);
    procedure PrimeiroRegistro;
    procedure RegistroAnterior;
    procedure ProximoRegistro;
    procedure UltimoRegistro;
    procedure DesfazerAlteracoes;
    procedure GravarRegistros;
    procedure ExcluirRegistros;
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

{ TfrmCadUsuarios }

procedure TfrmCadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConfiguracoesFinais;
  inherited;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguracaoInicial;
end;

procedure TfrmCadUsuarios.MoveFoco;
begin
  cbbFuncionario.SetFocus;
end;

procedure TfrmCadUsuarios.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  AdicionarRegistros(Sender);
end;

procedure TfrmCadUsuarios.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  RegistroAnterior;
end;

procedure TfrmCadUsuarios.btnDesfazerClick(Sender: TObject);
begin
  inherited;
  DesfazerAlteracoes;
end;

procedure TfrmCadUsuarios.btnExcluirClick(Sender: TObject);
begin
  ExcluirRegistros;
  inherited;
end;

procedure TfrmCadUsuarios.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistros;
end;

procedure TfrmCadUsuarios.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  PrimeiroRegistro;
end;

procedure TfrmCadUsuarios.btnProximoClick(Sender: TObject);
begin
  inherited;
  ProximoRegistro;
end;

procedure TfrmCadUsuarios.btnUltimoClick(Sender: TObject);
begin
  inherited;
  UltimoRegistro;
end;

procedure TfrmCadUsuarios.ConfiguracaoInicial;
begin
  dmModuloDados1.sdsControle.Open;
  dmModuloDados1.sdsUsuarios.Open;
  dmModuloDados1.sdsFuncionarios.Open;
  dmModuloDados1.sdsPerfilUsuario.Open;
  if dmModuloDados1.sdsUsuarios.IsEmpty then
  begin
    BloquearCampos(False);
    btnAdicionar.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnGravar.Enabled := True;
    chrModo := 'I';
    dmModuloDados1.sdsControle.Edit;
    dmModuloDados1.sdsControleCODIGO_USUARIO.AsInteger := 0;
    dmModuloDados1.sdsControle.Post;
    dmModuloDados1.sdsControle.Append;
  end
  else
    chrModo := EmptyStr;
  MoveFoco;
end;

procedure TfrmCadUsuarios.ConfiguracoesFinais;
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsUsuarios.Close;
  dmModuloDados1.sdsFuncionarios.Close;
  dmModuloDados1.sdsPerfilUsuario.Close;
end;

procedure TfrmCadUsuarios.AdicionarRegistros(Sender: TObject);
begin
  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsUsuarios.Append;
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar um novo registro!');
    end;
  end
  else if Sender = btnEditar then
  begin
    try
      dmModuloDados1.sdsUsuarios.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entra em modo de edição!');
    end;
  end;
  MoveFoco;
end;

procedure TfrmCadUsuarios.PrimeiroRegistro;
begin
  dmModuloDados1.sdsUsuarios.First;
  MoveFoco;
end;

procedure TfrmCadUsuarios.RegistroAnterior;
begin
  dmModuloDados1.sdsUsuarios.Prior;
  if dmModuloDados1.sdsUsuarios.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsUsuarios.First;
  end
  else
    MsgStatus(EmptyStr);
  MoveFoco;
end;

procedure TfrmCadUsuarios.ProximoRegistro;
begin
  dmModuloDados1.sdsUsuarios.Next;
  if dmModuloDados1.sdsUsuarios.Eof then
  begin
    MsgStatus('Fim da tabela...');
    dmModuloDados1.sdsUsuarios.Last;
  end
  else
    MsgStatus(EmptyStr);
  MoveFoco;
end;

procedure TfrmCadUsuarios.UltimoRegistro;
begin
  dmModuloDados1.sdsUsuarios.Last;
  MoveFoco;
end;

procedure TfrmCadUsuarios.DesfazerAlteracoes;
begin
  if dmModuloDados1.sdsUsuarios.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsUsuarios.CancelUpdates;
      MsgStatus('Alterações desfeitas com sucesso...');
    except
      Mensagem('Impossível de desfazer as alterações!');
    end;
  end
  else
    Mensagem('Não há alterações a serem desfeitas...');
  MoveFoco;
end;

procedure TfrmCadUsuarios.edtSenhaEnter(Sender: TObject);
begin
  inherited;
  CorEntrada(Sender);
end;

procedure TfrmCadUsuarios.edtSenhaExit(Sender: TObject);
begin
  inherited;
  CorSaida(Sender);
end;

procedure TfrmCadUsuarios.edtUsuarioEnter(Sender: TObject);
begin
  inherited;
  CorEntrada(Sender);
end;

procedure TfrmCadUsuarios.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  CorSaida(Sender);
end;

procedure TfrmCadUsuarios.GravarRegistros;
begin
  if dmModuloDados1.sdsUsuarios.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_USUARIO.AsInteger := dmModuloDados1.sdsControleCODIGO_USUARIO.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsUsuariosCODIGO_USUARIO.AsInteger := dmModuloDados1.sdsControleCODIGO_USUARIO.AsInteger;
      end;
      dmModuloDados1.sdsUsuarios.Post;
      dmModuloDados1.sdsUsuarios.ApplyUpdates(-1);
      chrModo := EmptyStr;
      MsgStatus('Dados gravados com sucesso...');
    except
      Mensagem('Não foi possível efetuar a gravação dos dados!');
    end;
  end
  else
    MsgStatus('Não ha alterações a serem gravadas...');
  MoveFoco;
end;

procedure TfrmCadUsuarios.ExcluirRegistros;
begin
  if dmModuloDados1.sdsUsuarios.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsUsuarios.Post;
  try
    dmModuloDados1.sdsUsuarios.Delete;
    dmModuloDados1.sdsUsuarios.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;
  BloquearCampos(True);
  MoveFoco;
end;

end.

