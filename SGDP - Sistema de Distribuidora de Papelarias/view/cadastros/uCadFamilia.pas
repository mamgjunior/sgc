unit uCadFamilia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadFamilia = class(TfrmMestreCadastro)
    lblFamilia: TLabel;
    edtFamilia: TDBEdit;
    tsListaRegistros: TTabSheet;
    grdDados: TDBGrid;
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
    procedure grdDadosDblClick(Sender: TObject);
    procedure grdDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadFamilia: TfrmCadFamilia;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

{ TfrmCadFamilia }

procedure TfrmCadFamilia.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsFamilias.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsFamilias.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entrar no modo de edição!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadFamilia.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFamilias.Prior;

    if dmModuloDados1.sdsFamilias.Bof then
    begin
      MsgStatus('Início da tabela...');
      dmModuloDados1.sdsFamilias.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadFamilia.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsFamilias.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsFamilias.CancelUpdates;
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

procedure TfrmCadFamilia.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsFamilias.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsFamilias.Post;

  try
    dmModuloDados1.sdsFamilias.Delete;
    dmModuloDados1.sdsFamilias.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadFamilia.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsFamilias.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_FAMILIA.AsInteger := dmModuloDados1.sdsControleCODIGO_FAMILIA.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsFamiliasCODIGO_FAMILIA.AsInteger := dmModuloDados1.sdsControleCODIGO_FAMILIA.AsInteger;
        end;
        dmModuloDados1.sdsFamilias.Post;
        dmModuloDados1.sdsFamilias.ApplyUpdates(-1);
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

procedure TfrmCadFamilia.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFamilias.First;
    MoveFoco;
end;

procedure TfrmCadFamilia.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFamilias.Next;

    if dmModuloDados1.sdsFamilias.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsFamilias.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadFamilia.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFamilias.Last;
    MoveFoco;
end;

procedure TfrmCadFamilia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsFamilias.Close;
  inherited;
end;

procedure TfrmCadFamilia.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsFamilias.Open;

    if dmModuloDados1.sdsFamilias.IsEmpty then
    begin
      BloquearCampos(False);

      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;

      chrModo := 'I';

      dmModuloDados1.sdsControle.Edit;
      dmModuloDados1.sdsControleCODIGO_FAMILIA.AsInteger := 0;
      dmModuloDados1.sdsControle.Post;
      dmModuloDados1.sdsFamilias.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadFamilia.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    pgDados.ActivePageIndex := 0;
    MoveFoco;
end;

procedure TfrmCadFamilia.grdDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0;
end;

procedure TfrmCadFamilia.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtFamilia.SetFocus;
end;

end.
