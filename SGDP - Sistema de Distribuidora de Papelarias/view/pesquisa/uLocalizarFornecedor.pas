unit uLocalizarFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreLocalizar, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizarFornecedor = class(TfrmMestreLocalizar)
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TEdit;
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeFantasiaEnter(Sender: TObject);
    procedure edtNomeFantasiaExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarFornecedor: TfrmLocalizarFornecedor;

implementation

uses
  uRotinasGenericas, uDMModulo1;

{$R *.dfm}

procedure TfrmLocalizarFornecedor.btnOkClick(Sender: TObject);
begin
  inherited;
    strValor := dmModuloDados1.sdsFornecedoresCODIGO_FORNECEDOR.AsString;
end;

procedure TfrmLocalizarFornecedor.edtNomeFantasiaEnter(Sender: TObject);
begin
  inherited;
    CorEntrada(Sender);
    dmModuloDados1.sdsFornecedores.IndexFieldNames := 'Nome_Fantasia';
end;

procedure TfrmLocalizarFornecedor.edtNomeFantasiaExit(Sender: TObject);
begin
  inherited;
    CorSaida(Sender);
end;

procedure TfrmLocalizarFornecedor.edtNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    dmModuloDados1.sdsFornecedores.FindNearest([edtNomeFantasia.Text]);
end;

procedure TfrmLocalizarFornecedor.edtPesquisarEnter(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFornecedores.IndexFieldNames := 'Razao_Social';
end;

procedure TfrmLocalizarFornecedor.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    dmModuloDados1.sdsFornecedores.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizarFornecedor.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    btnOk.Click;
end;

end.
