unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadCategorias = class(TfrmMestreCadastro)
    lblCategoria: TLabel;
    edtCategoria: TDBEdit;
    tsListaRegistro: TTabSheet;
    grdDados: TDBGrid;
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
    procedure grdDadosDblClick(Sender: TObject);
    procedure grdDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

{ TfrmCadCategorias }

procedure TfrmCadCategorias.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsCategorias.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsCategorias.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entrar no modo de edição!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadCategorias.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCategorias.Prior;

    if dmModuloDados1.sdsCategorias.Bof then
    begin
      MsgStatus('Início da tabela...');
      dmModuloDados1.sdsCategorias.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadCategorias.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsCategorias.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsCategorias.CancelUpdates;
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

procedure TfrmCadCategorias.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsCategorias.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsCategorias.Post;

  try
    dmModuloDados1.sdsCategorias.Delete;
    dmModuloDados1.sdsCategorias.ApplyUpdates(-1);
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsCategorias.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger := dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsCategoriasCODIGO_CATEGORIA.AsInteger := dmModuloDados1.sdsControleCODIGO_GRUPO.AsInteger;
        end;
        dmModuloDados1.sdsCategorias.Post;
        dmModuloDados1.sdsCategorias.ApplyUpdates(-1);
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

procedure TfrmCadCategorias.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCategorias.First;
    MoveFoco;
end;

procedure TfrmCadCategorias.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCategorias.Next;

    if dmModuloDados1.sdsCategorias.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsCategorias.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadCategorias.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCategorias.Last;
    MoveFoco;
end;

procedure TfrmCadCategorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsCategorias.Close;
  inherited;
end;

procedure TfrmCadCategorias.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsCategorias.Open;

    if dmModuloDados1.sdsCategorias.IsEmpty then
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
      dmModuloDados1.sdsCategorias.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadCategorias.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    pgDados.ActivePageIndex := 0;
    MoveFoco;
end;

procedure TfrmCadCategorias.grdDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0;
end;

procedure TfrmCadCategorias.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtCategoria.SetFocus;
end;

end.
