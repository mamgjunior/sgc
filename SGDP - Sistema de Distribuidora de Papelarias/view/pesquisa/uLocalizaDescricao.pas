unit uLocalizaDescricao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uMestreLocalizar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLocalizaDescricao = class(TfrmMestreLocalizar)
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
  frmLocalizaDescricao: TfrmLocalizaDescricao;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

procedure TfrmLocalizaDescricao.btnOkClick(Sender: TObject);
begin
  inherited;
  strValor := dmModuloDados1.sdsDescricaoCODIGO_DESCRICAO.AsString;
end;

procedure TfrmLocalizaDescricao.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  dmModuloDados1.sdsDescricao.FindNearest([edtPesquisar.Text]);
end;

procedure TfrmLocalizaDescricao.FormShow(Sender: TObject);
begin
  inherited;
  dmModuloDados1.sdsDescricao.IndexFieldNames := 'Descricao';
end;

procedure TfrmLocalizaDescricao.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  btnOk.Click;
end;

end.

