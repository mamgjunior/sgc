unit uCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TfrmCadPerfil = class(TfrmMestreCadastro)
    lblIdPerfil: TLabel;
    edtIdPerfil: TDBEdit;
    pgPerfil: TPageControl;
    tsCadastro: TTabSheet;
    chkCADASTRO_FORNECEDORES: TDBCheckBox;
    chkCADASTRO_PRODUTOS: TDBCheckBox;
    chkCADASTRO_FUNCIONARIOS: TDBCheckBox;
    chkCADASTRO_CLIENTES: TDBCheckBox;
    chkCADASTRO_USUARIOS: TDBCheckBox;
    tsMovimentos: TTabSheet;
    fldEntradaEstoque: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    procedure MoveFoco;
    procedure ConfiguracaoInicial;
    procedure ConfiguracaoFinal;
  public
    { Public declarations }
  end;

var
  frmCadPerfil: TfrmCadPerfil;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

{ TfrmCadPerfil }

procedure TfrmCadPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConfiguracaoFinal;
  inherited;
end;

procedure TfrmCadPerfil.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguracaoInicial;
end;

procedure TfrmCadPerfil.MoveFoco;
begin
  edtIdPerfil.SetFocus;
end;

procedure TfrmCadPerfil.ConfiguracaoInicial;
begin
  dmModuloDados1.sdsControle.Open;
  dmModuloDados1.sdsPerfilUsuario.Open;
  if dmModuloDados1.sdsPerfilUsuario.IsEmpty then
  begin
    BloquearCampos(False);
    btnAdicionar.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnGravar.Enabled := True;
    chrModo := 'I';
    dmModuloDados1.sdsControle.Edit;
    dmModuloDados1.sdsControleCODIGO_PERFIL.AsInteger := 0;
    dmModuloDados1.sdsControle.Post;
    dmModuloDados1.sdsPerfilUsuario.Append;
    dmModuloDados1.sdsPerfilUsuarioCADASTRO_FORNECEDORES.AsString := 'N';
    dmModuloDados1.sdsPerfilUsuarioCADASTRO_PRODUTOS.AsString := 'N';
    dmModuloDados1.sdsPerfilUsuarioCADASTRO_CLIENTES.AsString := 'N';
    dmModuloDados1.sdsPerfilUsuarioCADASTRO_FUNCIONARIOS.AsString := 'N';
    dmModuloDados1.sdsPerfilUsuarioCADASTRO_USUARIOS.AsString := 'N';
  end
  else
    chrModo := EmptyStr;
  MoveFoco;
end;

procedure TfrmCadPerfil.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsPerfilUsuario.Append;
      dmModuloDados1.sdsPerfilUsuarioCADASTRO_FORNECEDORES.AsString := 'N';
      dmModuloDados1.sdsPerfilUsuarioCADASTRO_PRODUTOS.AsString := 'N';
      dmModuloDados1.sdsPerfilUsuarioCADASTRO_CLIENTES.AsString := 'N';
      dmModuloDados1.sdsPerfilUsuarioCADASTRO_FUNCIONARIOS.AsString := 'N';
      dmModuloDados1.sdsPerfilUsuarioCADASTRO_USUARIOS.AsString := 'N';
      dmModuloDados1.sdsPerfilUsuarioENTRADA_ESTOQUE.AsString := 'N';
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar novo registro!');
    end;
  end
  else if Sender = btnEditar then
  begin
    try
      dmModuloDados1.sdsPerfilUsuario.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entra no modo de edição!');
    end;
  end;
  MoveFoco;
end;

procedure TfrmCadPerfil.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsPerfilUsuario.Prior;
  if dmModuloDados1.sdsPerfilUsuario.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsPerfilUsuario.First;
  end
  else
    MsgStatus(EmptyStr);
  MoveFoco;
end;

procedure TfrmCadPerfil.btnDesfazerClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsPerfilUsuario.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsPerfilUsuario.CancelUpdates;
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

procedure TfrmCadPerfil.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsPerfilUsuario.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsPerfilUsuario.Post;

  try
    dmModuloDados1.sdsPerfilUsuario.Delete;
    dmModuloDados1.sdsPerfilUsuario.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadPerfil.btnGravarClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsPerfilUsuario.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_PERFIL.AsInteger := dmModuloDados1.sdsControleCODIGO_PERFIL.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsPerfilUsuarioCODIGO_PERFIL.AsInteger := dmModuloDados1.sdsControleCODIGO_PERFIL.AsInteger;
      end;
      dmModuloDados1.sdsPerfilUsuario.Post;
      dmModuloDados1.sdsPerfilUsuario.ApplyUpdates(-1);
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

procedure TfrmCadPerfil.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsPerfilUsuario.First;
  MoveFoco;
end;

procedure TfrmCadPerfil.btnProximoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsPerfilUsuario.Next;
  if dmModuloDados1.sdsPerfilUsuario.Eof then
  begin
    MsgStatus('Fim da tabela...');
    dmModuloDados1.sdsPerfilUsuario.Last;
  end
  else
    MsgStatus(EmptyStr);
  MoveFoco;
end;

procedure TfrmCadPerfil.btnUltimoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsPerfilUsuario.Last;
  MoveFoco;
end;

procedure TfrmCadPerfil.ConfiguracaoFinal;
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsPerfilUsuario.Close;
end;

end.

