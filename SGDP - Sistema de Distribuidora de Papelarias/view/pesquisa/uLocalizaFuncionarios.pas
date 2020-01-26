unit uLocalizaFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreLocalizar, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizaFuncionarios = class(TfrmMestreLocalizar)
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
  frmLocalizaFuncionarios: TfrmLocalizaFuncionarios;

implementation

{$R *.dfm}

uses
  uDMModulo1, uRotinasGenericas;

procedure TfrmLocalizaFuncionarios.btnOkClick(Sender: TObject);
begin
  inherited;
    strValor :=  dmModuloDados1.sdsFuncionarios.FieldByName('matricula_funcionario').AsString;
end;

procedure TfrmLocalizaFuncionarios.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizaFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsFuncionarios.IndexFieldNames := 'Nome_Funcionario';
end;

procedure TfrmLocalizaFuncionarios.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    btnOk.Click;
end;

end.
