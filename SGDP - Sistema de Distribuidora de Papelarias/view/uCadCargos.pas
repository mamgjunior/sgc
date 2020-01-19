unit uCadCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadCargos = class(TfrmMestreCadastro)
    tabListaRegistros: TTabSheet;
    lblCargo: TLabel;
    edtCargo: TDBEdit;
    cbkVendedorInterno: TDBCheckBox;
    ckbVendedorExterno: TDBCheckBox;
    grdDados: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
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
  frmCadCargos: TfrmCadCargos;

implementation

{$R *.dfm}

uses
  uDMModulo1, uRotinasGenericas;

{ TfrmCadCargos }

procedure TfrmCadCargos.btnAdicionarClick(Sender: TObject);
begin
  inherited;

    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsCargos.Append;
        dmModuloDados1.sdsCargosVENDEDOR_EXTERNO.AsString := 'N';
        dmModuloDados1.sdsCargosVENDEDOR_INTERNO.AsString := 'N';
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsCargos.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entrar no modo de edição!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadCargos.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCargos.Prior;

    if dmModuloDados1.sdsCargos.Bof then
    begin
      MsgStatus('Início da tabela...');
      dmModuloDados1.sdsCargos.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadCargos.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsCargos.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsCargos.CancelUpdates;
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

procedure TfrmCadCargos.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsCargos.State in [dsEdit, dsInsert] then
  begin
    dmModuloDados1.sdsCargos.Post;
    dmModuloDados1.sdsCargos.ApplyUpdates(-1);
  end;

  try
    dmModuloDados1.sdsCargos.Delete;
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;

  inherited;
end;

procedure TfrmCadCargos.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsCargos.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_CARGO.AsInteger := dmModuloDados1.sdsControleCODIGO_CARGO.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsCargosCODIGO_CARGO.AsInteger := dmModuloDados1.sdsControleCODIGO_CARGO.AsInteger;
        end;
        dmModuloDados1.sdsCargos.Post;
        dmModuloDados1.sdsCargos.ApplyUpdates(-1);
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

procedure TfrmCadCargos.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCargos.First;
    MoveFoco;
end;

procedure TfrmCadCargos.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCargos.Next;

    if dmModuloDados1.sdsCargos.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsCargos.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadCargos.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsCargos.Last;
    MoveFoco;
end;

procedure TfrmCadCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsCargos.Close;
  inherited;
end;

procedure TfrmCadCargos.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsCargos.Open;

    if dmModuloDados1.sdsCargos.IsEmpty then
    begin
      BloquearCampos(False);

      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;

      chrModo := 'I';

      dmModuloDados1.sdsControle.Edit;
      dmModuloDados1.sdsControleCODIGO_CARGO.AsInteger := 0;
      dmModuloDados1.sdsControle.Post;
      dmModuloDados1.sdsCargos.Append;
      dmModuloDados1.sdsCargosVENDEDOR_EXTERNO.AsString := 'N';
      dmModuloDados1.sdsCargosVENDEDOR_INTERNO.AsString := 'N';
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadCargos.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  pgDados.ActivePageIndex := 0;
  MoveFoco;
end;

procedure TfrmCadCargos.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if ((Shift = [ssCtrl]) and (Key = VK_DELETE)) then
      Key := 0;
end;

procedure TfrmCadCargos.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtCargo.SetFocus;
end;

end.
