unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadFuncionarios = class(TfrmMestreCadastro)
    lblMatricula: TLabel;
    edtMatricula: TDBEdit;
    lblFuncionario: TLabel;
    edtFuncionario: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblEstado: TLabel;
    lblCEP: TLabel;
    edtCEP: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblDepartamento: TLabel;
    lblCargo: TLabel;
    edtNumero: TDBEdit;
    edtBairro: TDBEdit;
    lblBairro: TLabel;
    lcbEstados: TDBLookupComboBox;
    lcbDepartamento: TDBLookupComboBox;
    lcbCargo: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure MoveFoco;
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

{$R *.dfm}

uses
  uDMModulo1, uRotinasGenericas;

{ TfrmCadFuncionarios }

procedure TfrmCadFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmModuloDados1.sdsEstados.Close;
  dmModuloDados1.sdsDepartamentos.Close;
  dmModuloDados1.sdsCargos.Close;
  dmModuloDados1.sdsFuncionarios.Close;
  inherited;
end;

procedure TfrmCadFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsEstados.Open;
    dmModuloDados1.sdsDepartamentos.Open;
    dmModuloDados1.sdsCargos.Open;
    dmModuloDados1.sdsFuncionarios.Open;

    if dmModuloDados1.sdsFuncionarios.IsEmpty then
    begin
      BloquearCampos(False);
      btnAdicionar.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled := True;
      chrModo := 'I';
      dmModuloDados1.sdsFuncionarios.Append;
    end
    else
      chrModo := EmptyStr;

    MoveFoco;
end;

procedure TfrmCadFuncionarios.MoveFoco;
begin
  edtMatricula.SetFocus;
end;

end.
