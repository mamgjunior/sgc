unit uLocalizarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreLocalizar, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizarCliente = class(TfrmMestreLocalizar)
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarCliente: TfrmLocalizarCliente;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

procedure TfrmLocalizarCliente.btnOkClick(Sender: TObject);
begin
  inherited;
  strValor := dmModuloDados1.sdsClientesCODIGO_CLIENTE.AsString;
end;

procedure TfrmLocalizarCliente.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  dmModuloDados1.sdsClientes.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizarCliente.FormShow(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsClientes.IndexFieldNames := 'Nome_Cliente';
end;

procedure TfrmLocalizarCliente.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  btnOk.Click;
end;

end.
