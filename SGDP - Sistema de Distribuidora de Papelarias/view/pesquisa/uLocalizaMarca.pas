unit uLocalizaMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreLocalizar, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizaMarca = class(TfrmMestreLocalizar)
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizaMarca: TfrmLocalizaMarca;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

procedure TfrmLocalizaMarca.btnOkClick(Sender: TObject);
begin
  inherited;
    strValor := dmModuloDados1.sdsMarcasCODIGO_MARCA.AsString;
end;

procedure TfrmLocalizaMarca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    dmModuloDados1.sdsMarcas.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizaMarca.FormShow(Sender: TObject);
begin
  inherited;
    dmModuloDados1.sdsMarcas.IndexFieldNames := 'Descricao_Marca';
end;

procedure TfrmLocalizaMarca.grdDadosDblClick(Sender: TObject);
begin
  inherited;
    btnOk.Click;
end;

end.
