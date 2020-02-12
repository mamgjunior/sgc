unit uCadMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadMarcas = class(TfrmMestreCadastro)
    lblMarca: TLabel;
    edtMarcas: TDBEdit;
    tsListaRegistro: TTabSheet;
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
    procedure btnLocalizarClick(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadMarcas: TfrmCadMarcas;

implementation

uses
  uDMModulo1, uRotinasGenericas, uLocalizaMarca;

{$R *.dfm}

{ TfrmCadMarcas }

procedure TfrmCadMarcas.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsMarcas.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Imposs�vel adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsMarcas.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Imposs�vel entrar no modo de edi��o!');
      end;
    end;

    MoveFoco;
end;

procedure TfrmCadMarcas.btnAnteriorClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsMarcas.Prior;

    if dmModuloDados1.sdsMarcas.Bof then
    begin
      MsgStatus('In�cio da tabela...');
      dmModuloDados1.sdsMarcas.First;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadMarcas.btnDesfazerClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsMarcas.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsMarcas.CancelUpdates;
        MsgStatus('Altera�oes desfeitas com sucesso...');
      except
        Mensagem('Imposs�vel desfazer altera��es!');
      end;
    end
    else
      Mensagem('N�o h� altera��o a serem desfeitas!');

    BloquearCampos(True);
    MoveFoco;
end;

procedure TfrmCadMarcas.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsMarcas.State in [dsEdit, dsInsert] then
    dmModuloDados1.sdsMarcas.Post;

  try
    dmModuloDados1.sdsMarcas.Delete;
    dmModuloDados1.sdsMarcas.ApplyUpdates(-1);
    MsgStatus('Registro exclu�do com sucesso...');
  except
    Mensagem('Registro n�o foi exclu�do!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadMarcas.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsMarcas.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_MARCA.AsInteger := dmModuloDados1.sdsControleCODIGO_MARCA.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsMarcasCODIGO_MARCA.AsInteger := dmModuloDados1.sdsControleCODIGO_MARCA.AsInteger;
        end;
        dmModuloDados1.sdsMarcas.Post;
        dmModuloDados1.sdsMarcas.ApplyUpdates(-1);
        chrModo := EmptyStr;
        MsgStatus('Dados gravados com sucesso...');
      except
        Mensagem('N�o foi poss�vel efetuar a grava��o dos dados!');
      end;
    end
    else
      Mensagem('N�o h� altera��es a serem gravadas!');

    BloquearCampos(True);
    MoveFoco;
end;

procedure TfrmCadMarcas.btnLocalizarClick(Sender: TObject);
var
  registro: Integer;
begin
  inherited;
    registro := dmModuloDados1.sdsMarcas.RecNo;
    Application.CreateForm(TfrmLocalizaMarca, frmLocalizaMarca);
    if frmLocalizaMarca.ShowModal = mrOk then
    begin
      dmModuloDados1.sdsMarcas.IndexFieldNames := 'Codigo_Marca';
      dmModuloDados1.sdsMarcas.FindKey([frmLocalizaMarca.strValor]);
      dmModuloDados1.sdsMarcas.IndexFieldNames := EmptyStr;
    end
    else
      dmModuloDados1.sdsMarcas.RecNo := registro;
    frmLocalizaMarca.Destroy;
end;

procedure TfrmCadMarcas.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsMarcas.First;
    MoveFoco;
end;

procedure TfrmCadMarcas.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsMarcas.Next;

    if dmModuloDados1.sdsMarcas.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsMarcas.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadMarcas.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsMarcas.Last;
    MoveFoco;
end;

procedure TfrmCadMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsMarcas.Close;
  inherited;
end;

procedure TfrmCadMarcas.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsMarcas.Open;

    if dmModuloDados1.sdsMarcas.IsEmpty then
    begin
      BloquearCampos(False);

      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;

      chrModo := 'I';

      dmModuloDados1.sdsControle.Edit;
      dmModuloDados1.sdsControleCODIGO_MARCA.AsInteger := 0;
      dmModuloDados1.sdsControle.Post;
      dmModuloDados1.sdsMarcas.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadMarcas.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtMarcas.SetFocus;
end;

end.
