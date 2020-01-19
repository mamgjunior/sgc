unit uCadDepartametos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadDepartametos = class(TfrmMestreCadastro)
    lblDepartamento: TLabel;
    edtDepartamento: TDBEdit;
    tabListaRegistros: TTabSheet;
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
  private
    procedure MoveFoco;
    function DataInvertida(const dtData: TDateTime): string;
  public
    { Public declarations }
  end;

var
  frmCadDepartametos: TfrmCadDepartametos;

implementation

{$R *.dfm}

uses
  uDMModulo1, uRotinasGenericas;

{ TfrmCadDepartametos }

procedure TfrmCadDepartametos.btnAdicionarClick(Sender: TObject);
begin
  inherited;
    if Sender = btnAdicionar then
    begin
      try
        dmModuloDados1.sdsDepartamentos.Append;
        chrModo := 'I';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível adicionar um novo registro!');
      end;
    end
    else if Sender = btnEditar then
    begin
      try
        dmModuloDados1.sdsDepartamentos.Edit;
        chrModo := 'A';
      except
        MsgStatus(EmptyStr);
        Mensagem('Impossível entrar no modo de edição!');
      end;
    end;
    MoveFoco;
end;

procedure TfrmCadDepartametos.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDepartamentos.Prior;

  if dmModuloDados1.sdsDepartamentos.Bof then
  begin
    MsgStatus('Início da tabela...');
    dmModuloDados1.sdsDepartamentos.First;
  end
  else
    MsgStatus(EmptyStr);

  MoveFoco;
end;

procedure TfrmCadDepartametos.btnDesfazerClick(Sender: TObject);
begin
  inherited;

    if dmModuloDados1.sdsDepartamentos.State in [dsEdit, dsInsert] then
    begin
      try
        dmModuloDados1.sdsDepartamentos.CancelUpdates;
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

procedure TfrmCadDepartametos.btnExcluirClick(Sender: TObject);
begin
  if dmModuloDados1.sdsDepartamentos.State in [dsEdit, dsInsert] then
  begin
    dmModuloDados1.sdsDepartamentos.Post;
    dmModuloDados1.sdsControle.ApplyUpdates(-1);
  end;

  try
    dmModuloDados1.sdsDepartamentos.Delete;
    MsgStatus('Registro excluído com sucesso...');
  except
    Mensagem('Registro não foi excluído!');
  end;

  BloquearCampos(True);
  MoveFoco;
  inherited;
end;

procedure TfrmCadDepartametos.btnGravarClick(Sender: TObject);
begin
  inherited;
    if dmModuloDados1.sdsDepartamentos.State in [dsEdit, dsInsert] then
    begin
      try
        if chrModo = 'I' then
        begin
          dmModuloDados1.sdsControle.Edit;
          dmModuloDados1.sdsControleCODIGO_DEPARTAMENTO.AsInteger := dmModuloDados1.sdsControleCODIGO_DEPARTAMENTO.AsInteger + 1;
          dmModuloDados1.sdsControle.Post;
          dmModuloDados1.sdsControle.ApplyUpdates(-1);
          dmModuloDados1.sdsDepartamentosCODIGO_DEPARTAMENTO.AsInteger := dmModuloDados1.sdsControleCODIGO_DEPARTAMENTO.AsInteger;
        end;
        dmModuloDados1.sdsDepartamentos.Post;
        dmModuloDados1.sdsDepartamentos.ApplyUpdates(-1);
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

procedure TfrmCadDepartametos.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsDepartamentos.First;
    MoveFoco;
end;

procedure TfrmCadDepartametos.btnProximoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsDepartamentos.Prior;

    if dmModuloDados1.sdsDepartamentos.Eof then
    begin
      MsgStatus('Fim da tabela...');
      dmModuloDados1.sdsDepartamentos.Last;
    end
    else
      MsgStatus(EmptyStr);

    MoveFoco;
end;

procedure TfrmCadDepartametos.btnUltimoClick(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsDepartamentos.Last;
    MoveFoco;
end;

function TfrmCadDepartametos.DataInvertida(const dtData: TDateTime): string;
var
  wrdDia: Word;
  wrdMes: Word;
  wrdAno: Word;
  strDia: string;
  strMes: string;
  strAno: string;
  strData: string;
begin
  DecodeDate(dtData, wrdAno, wrdMes, wrdDia);
  strDia := IntToStr(wrdDia);
  strMes := IntToStr(wrdMes);
  strAno := IntToStr(wrdAno);
  strData := strAno + '/' + strMes + '/' + strDia;
  Result := strData;
end;

procedure TfrmCadDepartametos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsDepartamentos.Close;
  inherited;
end;

procedure TfrmCadDepartametos.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsDepartamentos.Open;

    if dmModuloDados1.sdsDepartamentos.IsEmpty then
    begin
      BloquearCampos(False);

      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;

      chrModo := 'I';

      dmModuloDados1.sdsControle.Edit;
      dmModuloDados1.sdsControleCODIGO_DEPARTAMENTO.AsInteger := 0;
      dmModuloDados1.sdsControle.Post;
      dmModuloDados1.sdsDepartamentos.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadDepartametos.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    pgDados.ActivePageIndex := 0;
    MoveFoco;
end;

procedure TfrmCadDepartametos.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtDepartamento.SetFocus;
end;

end.
