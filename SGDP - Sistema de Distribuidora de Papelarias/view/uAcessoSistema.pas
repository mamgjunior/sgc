unit uAcessoSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.Buttons;

type
  TfrmAcessoSistema = class(TForm)
    imgAcesso: TImage;
    shpAcesso: TShape;
    lblIdUsuario: TLabel;
    lblSenha: TLabel;
    edtIdUsuario: TEdit;
    medtSenha: TMaskEdit;
    btnOK: TBitBtn;
    btnCencelar: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure btnCencelarClick(Sender: TObject);
    procedure edtIdUsuarioEnter(Sender: TObject);
    procedure edtIdUsuarioExit(Sender: TObject);
    procedure medtSenhaEnter(Sender: TObject);
    procedure medtSenhaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    Facesso_liberado: Boolean;
    Fcodigo_usuario: Integer;
    procedure Setacesso_liberado(const Value: Boolean);
    procedure Setcodigo_usuario(const Value: Integer);
    procedure cancelar;
    procedure acessar;
  public
    property acesso_liberado: Boolean read Facesso_liberado write Setacesso_liberado;
    property codigo_usuario: Integer read Fcodigo_usuario write Setcodigo_usuario;
  end;

var
  frmAcessoSistema: TfrmAcessoSistema;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

procedure TfrmAcessoSistema.btnCencelarClick(Sender: TObject);
begin
  cancelar;
end;

procedure TfrmAcessoSistema.btnOKClick(Sender: TObject);
begin
  acessar;
end;

procedure TfrmAcessoSistema.cancelar;
begin
  Facesso_liberado := False;
  Fcodigo_usuario := 0;
end;

procedure TfrmAcessoSistema.edtIdUsuarioEnter(Sender: TObject);
begin
  CorEntrada(Sender);
end;

procedure TfrmAcessoSistema.edtIdUsuarioExit(Sender: TObject);
begin
  CorSaida(Sender);
end;

procedure TfrmAcessoSistema.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAcessoSistema.medtSenhaEnter(Sender: TObject);
begin
  CorEntrada(Sender);
end;

procedure TfrmAcessoSistema.medtSenhaExit(Sender: TObject);
begin
  CorSaida(Sender);
end;

procedure TfrmAcessoSistema.Setacesso_liberado(const Value: Boolean);
begin
  Facesso_liberado := Value;
end;

procedure TfrmAcessoSistema.Setcodigo_usuario(const Value: Integer);
begin
  Fcodigo_usuario := Value;
end;

procedure TfrmAcessoSistema.acessar;
begin
  Facesso_liberado := False;
  Fcodigo_usuario := 0;
  dmModuloDados1.sdsUsuarios.Open;
  dmModuloDados1.sdsUsuarios.IndexFieldNames := 'identificacao_usuario';

  if not (dmModuloDados1.sdsUsuarios.FindKey([edtIdUsuario.Text])) then
    Mensagem('Usuário não cadastrado!!!')
  else
  begin
    if (Trim(dmModuloDados1.sdsUsuariosSENHA_ACESSO.AsString) <> Trim(medtSenha.Text)) then
      Mensagem('Senha não inválida!!!')
    else
    begin
      Facesso_liberado := True;
      Fcodigo_usuario := dmModuloDados1.sdsUsuariosCODIGO_USUARIO.AsInteger;
    end;
  end;

  dmModuloDados1.sdsUsuarios.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsUsuarios.Close;
end;

end.

