unit uMestreLocalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMestreLocalizar = class(TForm)
    lblPesquisar: TLabel;
    edtPesquisar: TEdit;
    grdDados: TDBGrid;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    strValor: string;
  end;

var
  frmMestreLocalizar: TfrmMestreLocalizar;

implementation

{$R *.dfm}

uses
  uRotinasGenericas;

procedure TfrmMestreLocalizar.btnCancelarClick(Sender: TObject);
begin
  strValor := EmptyStr;
end;

procedure TfrmMestreLocalizar.edtPesquisarEnter(Sender: TObject);
begin
  CorEntrada(Sender);
end;

procedure TfrmMestreLocalizar.edtPesquisarExit(Sender: TObject);
begin
  CorSaida(Sender);
end;

procedure TfrmMestreLocalizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
