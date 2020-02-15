unit uLocalizaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreLocalizar, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmLocalizaProduto = class(TfrmMestreLocalizar)
    lcbbNomeProduto: TDBLookupComboBox;
    lblNomeProduto: TLabel;
    procedure lcbbNomeProdutoExit(Sender: TObject);
    procedure lcbbNomeProdutoEnter(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizaProduto: TfrmLocalizaProduto;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

procedure TfrmLocalizaProduto.btnOkClick(Sender: TObject);
begin
  inherited;
  strValor := dmModuloDados1.sdsProdutosCODIGO_INTERNO.AsString;
  dmModuloDados1.sdsProdutos.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsProdutos.Close;
end;

procedure TfrmLocalizaProduto.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  dmModuloDados1.sdsProdutos.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizaProduto.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  btnOk.Click;
end;

procedure TfrmLocalizaProduto.lcbbNomeProdutoEnter(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsProdutos.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsProdutos.Close;
end;

procedure TfrmLocalizaProduto.lcbbNomeProdutoExit(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsProdutos.DataSet.CommandText := Format('SELECT * FROM catalogo_produtos WHERE codigo_descricao = %s', [QuotedStr(dmModuloDados1.sdsDescricaoCODIGO_DESCRICAO.AsString)]);
  dmModuloDados1.sdsProdutos.IndexFieldNames := 'Modelo';
  dmModuloDados1.sdsProdutos.Open;
end;

end.

