unit uCadDescricao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreCadastro, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadDescricao = class(TfrmMestreCadastro)
    lblDescricao: TLabel;
    edtDescricao: TDBEdit;
    tsListaRegistro: TTabSheet;
    grdDados: TDBGrid;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadDescricao: TfrmCadDescricao;

implementation

uses
  uDMModulo1, uRotinasGenericas, uLocalizaDescricao;

{$R *.dfm}

{ TfrmCadDescricao }

procedure TfrmCadDescricao.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if Sender = btnAdicionar then
  begin
    try
      dmModuloDados1.sdsDescricao.Append;
      chrModo := 'I';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível adicionar um novo registro!');
    end;
  end
  else if Sender = btnEditar then
  begin
    try
      dmModuloDados1.sdsDescricao.Edit;
      chrModo := 'A';
    except
      MsgStatus(EmptyStr);
      Mensagem('Impossível entrar no modo de edição!');
    end;
  end;

  MoveFoco;
end;

procedure TfrmCadDescricao.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDescricao.Prior;

  if dmModuloDados1.sdsDescricao.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsDescricao.First;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadDescricao.btnDesfazerClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsDescricao.State in [dsEdit, dsInsert] then
  begin
    try
      dmModuloDados1.sdsDescricao.CancelUpdates;
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

procedure TfrmCadDescricao.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsDescricao.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsDescricao.Post;

  try
    dmModuloDados1.sdsDescricao.Delete;
    dmModuloDados1.sdsDescricao.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadDescricao.btnGravarClick(Sender: TObject);
begin
  inherited;
  if dmModuloDados1.sdsDescricao.State in [dsEdit, dsInsert] then
  begin
    try
      if chrModo = 'I' then
      begin
        dmModuloDados1.sdsControle.Edit;
        dmModuloDados1.sdsControleCODIGO_DESCRICAO.AsInteger := dmModuloDados1.sdsControleCODIGO_DESCRICAO.AsInteger + 1;
        dmModuloDados1.sdsControle.Post;
        dmModuloDados1.sdsControle.ApplyUpdates(-1);
        dmModuloDados1.sdsDescricaoCODIGO_DESCRICAO.AsInteger := dmModuloDados1.sdsControleCODIGO_DESCRICAO.AsInteger;
      end;
      dmModuloDados1.sdsDescricao.Post;
      dmModuloDados1.sdsDescricao.ApplyUpdates(-1);
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

procedure TfrmCadDescricao.btnLocalizarClick(Sender: TObject);
var
  registro: Integer;
begin
  inherited;
  registro := dmModuloDados1.sdsDescricao.RecNo;
  Application.CreateForm(TfrmLocalizaDescricao, frmLocalizaDescricao);
  if frmLocalizaDescricao.ShowModal = mrOk then
  begin
    dmModuloDados1.sdsDescricao.IndexFieldNames := 'Codigo_Descricao';
    dmModuloDados1.sdsDescricao.FindKey([frmLocalizaDescricao.strValor]);
    dmModuloDados1.sdsDescricao.IndexFieldNames := EmptyStr;
  end
  else
    dmModuloDados1.sdsDescricao.RecNo := registro;
  frmLocalizaDescricao.Destroy;
end;

procedure TfrmCadDescricao.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDescricao.First;
  MoveFoco;
end;

procedure TfrmCadDescricao.btnProximoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDescricao.Next;

  if dmModuloDados1.sdsDescricao.Eof then
  begin
    MsgStatus('Fim da tabela...');
    dmModuloDados1.sdsDescricao.Last;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadDescricao.btnUltimoClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDescricao.Last;
  MoveFoco;
end;

procedure TfrmCadDescricao.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtDescricao.SetFocus;
end;

end.

