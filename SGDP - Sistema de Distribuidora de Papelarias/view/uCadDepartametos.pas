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
  private
    procedure MoveFoco;
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

procedure TfrmCadDepartametos.MoveFoco;
begin
  if pgDados.ActivePageIndex = 0 then
    edtDepartamento.SetFocus;
end;

end.
