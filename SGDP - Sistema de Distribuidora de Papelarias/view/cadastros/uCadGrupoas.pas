unit uCadGrupoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadGrupoas = class(TfrmMestreCadastro)
    tabListaRegistros: TTabSheet;
    lblGrupo: TLabel;
    edtGrupo: TDBEdit;
    grdDados: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure grdDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadGrupoas: TfrmCadGrupoas;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

{ TfrmCadGrupoas }

procedure TfrmCadGrupoas.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsGrupos.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsGrupos.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entrar no modo de edição!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadGrupoas.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsGrupos.Prior;

    if dmModuloDados1.sdsGrupos.Bof then
    begin
      MsgStatus('Início da tabela...');
      dmModuloDados1.sdsGrupos.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadGrupoas.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsGrupos.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsGrupos.CancelUpdates;
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

procedure TfrmCadGrupoas.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsGrupos.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsGrupos.Post;

  try
    dmModuloDados1.sdsGrupos.Delete;
    dmModuloDados1.sdsGrupos.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadGrupoas.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsGrupos.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger := dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsGruposCODIGO_GRUPO.AsInteger := dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger;
        end;
        dmModuloDados1.sdsGrupos.Post;
        dmModuloDados1.sdsGrupos.ApplyUpdates(-1);
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

procedure TfrmCadGrupoas.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsGrupos.First;
    MoveFoco;
end;

procedure TfrmCadGrupoas.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsGrupos.Next;

    if dmModuloDados1.sdsGrupos.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsGrupos.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadGrupoas.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsGrupos.Last;
    MoveFoco;
end;

procedure TfrmCadGrupoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsGrupos.Close;
  inherited;
end;

procedure TfrmCadGrupoas.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsGrupos.Open;

    if dmModuloDados1.sdsGrupos.IsEmpty then
    begin
      BloquearCampos(False);

      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;

      chrModo := 'I';

      dmModuloDados1.sdsControle.Edit;
      dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger := 0;
      dmModuloDados1.sdsControle.Post;
      dmModuloDados1.sdsGrupos.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadGrupoas.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    pgDados.ActivePageIndex := 0;
    MoveFoco;
end;

procedure TfrmCadGrupoas.grdDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
      Key := 0;
end;

procedure TfrmCadGrupoas.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtGrupo.SetFocus;
end;

end.
