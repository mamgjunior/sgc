unit uCadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadFornecedores = class(TfrmMestreCadastro)
    tsEndereco: TTabSheet;
    tsProdutos: TTabSheet;
    lblRazaoSocial: TLabel;
    lblNomeFantasia: TLabel;
    lblCnpj: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtRAZAO_SOCIAL: TDBEdit;
    edtNOME_FANTASIA: TDBEdit;
    edtCNPJ: TDBEdit;
    edtHOME_PAGE: TDBEdit;
    edtEMAIL: TDBEdit;
    edtINSCRICAO_ESTADUAL: TDBEdit;
    lblEndereco: TLabel;
    lblComplemento: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblCEP: TLabel;
    lblTelefone: TLabel;
    lblContComercial: TLabel;
    lblFoneComercial: TLabel;
    lblBairro: TLabel;
    edtENDERECO: TDBEdit;
    edtCOMPLEMENTO: TDBEdit;
    edtCIDADE: TDBEdit;
    edtCEP: TDBEdit;
    edtTELEFONE: TDBEdit;
    edtNUMERO: TDBEdit;
    edtBAIRRO: TDBEdit;
    cbbESTADO: TDBLookupComboBox;
    lblFax: TLabel;
    edtFAX: TDBEdit;
    edtCONTATO_COMERCIAL: TDBEdit;
    edtFONE_COMERCIAL: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadFornecedores: TfrmCadFornecedores;

implementation

uses
  uRotinasGenericas, uDMModulo1;

{$R *.dfm}

{ TfrmCadFornecedores }

procedure TfrmCadFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsControle.Close;
  dmModuloDados1.sdsEstados.Close;
  dmModuloDados1.sdsFornecedores.Close;
  inherited;
end;

procedure TfrmCadFornecedores.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsControle.Open;
    dmModuloDados1.sdsEstados.Open;
    dmModuloDados1.sdsFornecedores.Open;

    if dmModuloDados1.sdsFornecedores.IsEmpty then
    begin
      BloquearCampos(False);
      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;
      chrModo := 'I';
      dmModuloDados1.sdsFornecedores.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadFornecedores.MoveFoco;
begin
  case pgDados.ActivePageIndex of
    0:
      edtRAZAO_SOCIAL.SetFocus;
    1:
      edtENDERECO.SetFocus;
  end;
end;

end.
