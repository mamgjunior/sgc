unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TfrmCadFuncionarios = class(TfrmMestreCadastro)
    lblMatricula: TLabel;
    edtMatricula: TDBEdit;
    lblFuncionario: TLabel;
    edtFuncionario: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    lblCEP: TLabel;
    edtCEP: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblDepartamento: TLabel;
    lblCargo: TLabel;
    edtNumero: TDBEdit;
    edtBairro: TDBEdit;
    lblBairro: TLabel;
    lcbEstados: TDBLookupComboBox;
    lcbDepartamento: TDBLookupComboBox;
    lcbCargo: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtMatriculaEnter(Sender: TObject);
    procedure edtMatriculaExit(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

{$R *.dfm}

uses
  uDMModulo1, uRotinasGenericas;

{ TfrmCadFuncionarios }

procedure TfrmCadFuncionarios.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsFuncionarios.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar novo registro!');
      end;
    end
    else
    if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsFuncionarios.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entra no modo de edição!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadFuncionarios.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.Prior;
    if dmModuloDados1.sdsFuncionarios.Bof then
    begin
      MsgStatus('Inicio da tabela ...');
      dmModuloDados1.sdsFuncionarios.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadFuncionarios.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsFuncionarios.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsFuncionarios.CancelUpdates;
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

procedure TfrmCadFuncionarios.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsFuncionarios.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsFuncionarios.Post;

  dmModuloDados1.sdsFuncionarios.ApplyUpdates(-1);

  try
    dmModuloDados1.sdsFuncionarios.Delete;
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadFuncionarios.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsFuncionarios.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsFuncionarios.Post;
        dmModuloDados1.sdsFuncionarios.ApplyUpdates(-1);
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

procedure TfrmCadFuncionarios.btnLocalizarClick(Sender: TObject);
var
  intRegistro: Integer;
begin
  inherited;
    intRegistro := dmModuloDados1.sdsFuncionarios.RecNo;
//    Application.CreateForm(TfrmLocalizarFuncionario, frmLocalizarFuncionario);
//    if frmLocalizarFuncionario.ShowModal = mrOk then
//    begin
//      dmModuloDados1.sdsFuncionarios.IndexFieldNames := 'Matricula_Funcionario';
//      dmModuloDados1.sdsFuncionarios.FindKey([frmLocalizarFuncionario.strValor]);
//      dmModuloDados1.sdsFuncionarios.IndexFieldNames := EmptyStr;
//    end
//    else
//      dmModuloDados1.sdsFuncionarios.RecNo := intRegistro;
//
//    frmLocalizarFuncionario.Destroy;
end;

procedure TfrmCadFuncionarios.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.First;
    MoveFoco;
end;

procedure TfrmCadFuncionarios.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.Next;
    if dmModuloDados1.sdsFuncionarios.Eof then
    begin
      MsgStatus('Fim da tabela ...');
      dmModuloDados1.sdsFuncionarios.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadFuncionarios.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.Last;
    MoveFoco;
end;

procedure TfrmCadFuncionarios.edtMatriculaEnter(Sender: TObject);
begin
  inherited;
    CorEntrada(Sender);
end;

procedure TfrmCadFuncionarios.edtMatriculaExit(Sender: TObject);
begin
  inherited;
    CorSaida(Sender);
end;

procedure TfrmCadFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsEstados.Close;
  dmModuloDados1.sdsDepartamentos.Close;
  dmModuloDados1.sdsCargos.Close;
  dmModuloDados1.sdsFuncionarios.Close;
  inherited;
end;

procedure TfrmCadFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsEstados.Open;
    dmModuloDados1.sdsDepartamentos.Open;
    dmModuloDados1.sdsCargos.Open;
    dmModuloDados1.sdsFuncionarios.Open;

    if dmModuloDados1.sdsFuncionarios.IsEmpty then
    begin
      BloquearCampos(False);
      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;
      chrModo := 'I';
      dmModuloDados1.sdsFuncionarios.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadFuncionarios.MoveFoco;
begin
  edtMatricula.SetFocus;
end;

end.
