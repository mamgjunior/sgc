unit uMestreCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;

type
  TfrmMestreCadastro = class(TForm)
    stbMensagens: TStatusBar;
    clbCadastro: TCoolBar;
    tlbCadastro: TToolBar;
    imgHabilitadas: TImageList;
    imgDesabilitadas: TImageList;
    btnAdicionar: TToolButton;
    btnPrimeiro: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    btnLocalizar: TToolButton;
    btnEditar: TToolButton;
    btnDesfazer: TToolButton;
    btnGravar: TToolButton;
    btnExcluir: TToolButton;
    btnSair: TToolButton;
    pgDados: TPageControl;
    TabSheet1: TTabSheet;
    function ChecaObrigatorio(Sender: TObject; chrModo: Char): Boolean;
    procedure MsgStatus(const strMensagem: string);
    procedure ConfiguraBotoes(Sender: TObject; blnValor: Boolean);
    procedure BloquearCampos(blnModo: Boolean);
    procedure DesativarDBCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    chrModo: string;
    blnExcluir: Boolean;
  end;

var
  frmMestreCadastro: TfrmMestreCadastro;

implementation

{$R *.dfm}

uses
  uRotinasGenericas;

{ TfrmMestreCadastro }


{ TfrmMestreCadastro }

procedure TfrmMestreCadastro.BloquearCampos(blnModo: Boolean);
var
  intContador: Integer;
begin
  for intContador := 0 to ((ComponentCount) - 1) do
  begin
    if (Components[intContador].ClassName = 'TDBEdit') then
      TDBEdit(Components[intContador]).ReadOnly := blnModo;

    if (Components[intContador].ClassName = 'TDBCheckBox') then
    begin
      if (TDBCheckBox(Components[intContador]).Tag <> 2) then
        TDBCheckBox(Components[intContador]).ReadOnly := blnModo;
    end;

    if (Components[intContador].ClassName = 'TDBLookupComboBox') then
      TDBLookupComboBox(Components[intContador]).ReadOnly := blnModo;

    if (Components[intContador].ClassName = 'TDBComboBox') then
      TDBComboBox(Components[intContador]).ReadOnly := blnModo;

    if (Components[intContador].ClassName = 'TDBRadioGroup') then
      TDBRadioGroup(Components[intContador]).ReadOnly := blnModo;

    if (Components[intContador].ClassName = 'TSpeedButton') then
      TSpeedButton(Components[intContador]).Enabled := (not blnModo);
  end;
end;

procedure TfrmMestreCadastro.btnAdicionarClick(Sender: TObject);
begin
  if Sender = btnAdicionar then
    MsgStatus('Adição de um nvo registro')
  else if Sender = btnEditar then
    MsgStatus('Edição de dados do registro corrente...');

  ConfiguraBotoes(Sender, False);
  BloquearCampos(False);
  btnGravar.Enabled := True;
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmMestreCadastro.btnDesfazerClick(Sender: TObject);
begin
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  btnProximo.Enabled := True;
  btnUltimo.Enabled := True;
  btnAdicionar.Enabled := True;
  btnLocalizar.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnGravar.Enabled := False;
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmMestreCadastro.btnExcluirClick(Sender: TObject);
begin
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmMestreCadastro.btnGravarClick(Sender: TObject);
begin
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  btnProximo.Enabled := True;
  btnUltimo.Enabled := True;
  btnAdicionar.Enabled := True;
  btnLocalizar.Enabled := True;
  btnEditar.Enabled := True;
  btnExcluir.Enabled := True;
  btnGravar.Enabled := False;
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmMestreCadastro.btnLocalizarClick(Sender: TObject);
begin
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmMestreCadastro.btnPrimeiroClick(Sender: TObject);
begin
  MsgStatus('Primeiro registro da tabela...');
end;

procedure TfrmMestreCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMestreCadastro.btnUltimoClick(Sender: TObject);
begin
  MsgStatus('Último registro da tabela...');
end;

function TfrmMestreCadastro.ChecaObrigatorio(Sender: TObject; chrModo: Char): Boolean;
var
  strValorCampo: string;
  blnChecar: Boolean;
  blnRetorno: Boolean;
begin
  blnRetorno := True;

  if chrModo <> ' ' then
  begin
    blnChecar := False;
    if Sender is TEdit then
    begin
      blnChecar := ((Sender as TEdit).Tag <> 0);
      strValorCampo := (Sender as TEdit).Text;
    end
    else if Sender is TMaskEdit then
    begin
      blnChecar := ((Sender as TMaskEdit).Tag <> 0);
      strValorCampo := (Sender as TMaskEdit).Text;
    end
    else if Sender is TDBEdit then
    begin
      blnChecar := ((Sender as TDBEdit).Tag <> 0);
      strValorCampo := (Sender as TDBEdit).Text;
    end
    else if Sender is TDBCheckBox then
    begin
      blnChecar := ((Sender as TDBCheckBox).Tag <> 0);
      strValorCampo := (Sender as TDBCheckBox).ValueChecked;
    end;

    if blnChecar then
    begin
      if ( (Trim(strValorCampo) = '') or (strValorCampo = '   .   .   -  ') or (strValorCampo = '  .   .   /    -  ') or (strValorCampo = '   .   .   .   ') or (strValorCampo = '    -   ')) then
      begin
        Mensagem('Campo de preenchimento obrigatório!');
        if Sender is TEdit then
          (Sender as TEdit).SetFocus
        else if Sender is TMaskEdit then
          (Sender as TMaskEdit).SetFocus
        else if Sender is TDBEdit then
          (Sender as TDBEdit).SetFocus
        else if Sender is TDBCheckBox then
          (Sender as TDBCheckBox).SetFocus;

        CorEntrada(Sender);
        blnRetorno := False;
      end;
    end;
  end;

  Result := blnRetorno;
end;

procedure TfrmMestreCadastro.ConfiguraBotoes(Sender: TObject; blnValor: Boolean);
begin
  btnPrimeiro.Enabled := blnValor;
  btnAnterior.Enabled := blnValor;
  btnProximo.Enabled := blnValor;
  btnUltimo.Enabled := blnValor;
  btnAdicionar.Enabled := blnValor;
  btnLocalizar.Enabled := blnValor;
  btnEditar.Enabled := blnValor;
  btnExcluir.Enabled := blnValor;
end;

procedure TfrmMestreCadastro.DesativarDBCheckBox;
var
  intContador: Integer;
begin
  for intContador := 0 to ((ComponentCount) - 1) do
  begin
    if (Components[intContador].ClassName = 'TDBCheckBox') then
    begin
      if (not (TDBCheckBox(Components[intContador]).ReadOnly)) then
      begin
        if (TDBCheckBox(Components[intContador]).Tag = 0) then
          TDBCheckBox(Components[intContador]).Checked := False;
      end;
    end;
  end;
end;

procedure TfrmMestreCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMestreCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMestreCadastro.FormShow(Sender: TObject);
begin
  btnGravar.Enabled := False;
  pgDados.ActivePageIndex := 0;
  BloquearCampos(True);
end;

procedure TfrmMestreCadastro.MsgStatus(const strMensagem: string);
begin
  stbMensagens.SimpleText := strMensagem;
end;

end.
