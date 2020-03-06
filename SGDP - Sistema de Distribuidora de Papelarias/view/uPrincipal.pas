unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    clbFerramentas: TCoolBar;
    imagens: TImageList;
    tlbFerramentas: TToolBar;
    mnuPrincipal: TMainMenu;
    opcArquivo: TMenuItem;
    opcSair: TMenuItem;
    btnSair: TToolButton;
    StatusBar1: TStatusBar;
    stbPrincipal: TStatusBar;
    tmrPrincipal: TTimer;
    imgFundo: TImage;
    mnuCadastro: TMenuItem;
    opcCadDepartamentos: TMenuItem;
    opcCadCargos: TMenuItem;
    opcCadFuncionarios: TMenuItem;
    opcCadFornecedores: TMenuItem;
    opcProdutos: TMenuItem;
    opcGrupos: TMenuItem;
    opcCategorias: TMenuItem;
    opcFamilias: TMenuItem;
    opcMarcas: TMenuItem;
    opcDescricao: TMenuItem;
    opcCatalogo: TMenuItem;
    Clientes1: TMenuItem;
    opcCadClienteJuridico: TMenuItem;
    N1: TMenuItem;
    btnSeparador: TToolButton;
    btnClientes: TToolButton;
    btnFornecedores: TToolButton;
    btnProdutos: TToolButton;
    imgDesabilitadas: TImageList;
    opcCadPerfilUsuario: TMenuItem;
    opcCadUsuario: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure opcSairClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure opcCadDepartamentosClick(Sender: TObject);
    procedure opcCadCargosClick(Sender: TObject);
    procedure opcCadFuncionariosClick(Sender: TObject);
    procedure opcCadFornecedoresClick(Sender: TObject);
    procedure opcGruposClick(Sender: TObject);
    procedure opcCategoriasClick(Sender: TObject);
    procedure opcFamiliasClick(Sender: TObject);
    procedure opcDescricaoClick(Sender: TObject);
    procedure opcCatalogoClick(Sender: TObject);
    procedure opcMarcasClick(Sender: TObject);
    procedure opcCadClienteJuridicoClick(Sender: TObject);
    procedure opcCadPerfilUsuarioClick(Sender: TObject);
    procedure opcCadUsuarioClick(Sender: TObject);
  private
    procedure MostrarDicas(Sender: TObject);
    procedure Acesso;
    procedure ConfiguraSistema(codigoUsuario: Integer);
    procedure ConfiguracaoMenus;
    procedure ConfiguracaoBotoes;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uRotinasGenericas, uCadDepartametos, uCadCargos, uCadFuncionarios, uCadFornecedores, uCadGrupoas, uCadCategorias, uCadProdutos, uCadDescricao, uCadFamilia, uCadMarcas, uCadClientes_Juridico, uAcessoSistema, uDMModulo1, uCadPerfil, CadUsuarios;

procedure TfrmPrincipal.Acesso;
var
  intCodigoUsuario: Integer;
  blnAcessoLiberado: Boolean;
begin
  Application.CreateForm(TfrmAcessoSistema, frmAcessoSistema);
  frmAcessoSistema.ShowModal;

  intCodigoUsuario := frmAcessoSistema.codigo_usuario;
  blnAcessoLiberado := frmAcessoSistema.acesso_liberado;
  frmAcessoSistema.Destroy;

  if blnAcessoLiberado then
  begin
    with frmPrincipal do
    begin
      Top := 0;
      Left := 0;
      Width := Screen.Width;
      Height := Screen.Height;
    end;

    stbPrincipal.Panels[0].Text := MostrarData;
    Application.ShowMainForm := True;
    ShowWindow(Application.Handle, SW_RESTORE);
    ConfiguraSistema(intCodigoUsuario);
  end
  else
    Application.Terminate;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.ConfiguraSistema(codigoUsuario: Integer);
begin
  dmModuloDados1.sdsUsuarios.Open;
  dmModuloDados1.sdsPerfilUsuario.Open;

  dmModuloDados1.sdsUsuarios.IndexFieldNames := 'codigo_usuario';
  dmModuloDados1.sdsPerfilUsuario.IndexFieldNames := 'codigo_perfil';

  dmModuloDados1.sdsUsuarios.FindKey([codigoUsuario]);
  dmModuloDados1.sdsPerfilUsuario.FindKey([dmModuloDados1.sdsUsuariosCODIGO_PERFIL.AsInteger]);

  ConfiguracaoMenus;
  ConfiguracaoBotoes;

  dmModuloDados1.sdsUsuarios.IndexFieldNames := EmptyStr;
  dmModuloDados1.sdsPerfilUsuario.IndexFieldNames := EmptyStr;

  dmModuloDados1.sdsUsuarios.Close;
  dmModuloDados1.sdsPerfilUsuario.Close;
end;

procedure TfrmPrincipal.ConfiguracaoMenus;
const
  SIM = 'S';
begin
  frmPrincipal.opcProdutos.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_PRODUTOS.AsString = SIM);
  frmPrincipal.opcCadCargos.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_FUNCIONARIOS.AsString = SIM);
  frmPrincipal.opcCadClienteJuridico.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_CLIENTES.AsString = SIM);
  frmPrincipal.opcCadFuncionarios.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_FUNCIONARIOS.AsString = SIM);
  frmPrincipal.opcCadFornecedores.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_FORNECEDORES.AsString = SIM);
  frmPrincipal.opcCadDepartamentos.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_FUNCIONARIOS.AsString = SIM);
end;

procedure TfrmPrincipal.ConfiguracaoBotoes;
const
  SIM = 'S';
begin
  frmPrincipal.btnClientes.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_CLIENTES.AsString = SIM);
  frmPrincipal.btnProdutos.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_PRODUTOS.AsString = SIM);
  frmPrincipal.btnFornecedores.Enabled := (dmModuloDados1.sdsPerfilUsuarioCADASTRO_FORNECEDORES.AsString = SIM);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Acesso;
end;

procedure TfrmPrincipal.opcCadClienteJuridicoClick(Sender: TObject);
var
  formulario: TfrmCadClientes_Juridico;
begin
  if (Application.FindComponent('frmCadClientes_Juridico') = nil) then
  begin
    formulario := TfrmCadClientes_Juridico.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.MostrarDicas(Sender: TObject);
begin
  stbPrincipal.Panels[3].Text := Application.Hint;
end;

procedure TfrmPrincipal.opcCadCargosClick(Sender: TObject);
var
  formulario: TfrmCadCargos;
begin
  if (Application.FindComponent('frmCadCargos') = nil) then
  begin
    formulario := TfrmCadCargos.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCadDepartamentosClick(Sender: TObject);
var
  formulario: TfrmCadDepartametos;
begin
  if (Application.FindComponent('frmCadDepartametos') = nil) then
  begin
    formulario := TfrmCadDepartametos.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCadFornecedoresClick(Sender: TObject);
var
  formulario: TfrmCadFornecedores;
begin
  if (Application.FindComponent('frmCadFornecedores') = nil) then
  begin
    formulario := TfrmCadFornecedores.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCadFuncionariosClick(Sender: TObject);
var
  formulario: TfrmCadFuncionarios;
begin
  if (Application.FindComponent('frmCadFuncionarios') = nil) then
  begin
    formulario := TfrmCadFuncionarios.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCadPerfilUsuarioClick(Sender: TObject);
var
  formulario: TfrmCadPerfil;
begin
  if (Application.FindComponent('TfrmCadPerfil') = nil) then
  begin
    formulario := TfrmCadPerfil.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCadUsuarioClick(Sender: TObject);
var
  formulario: TfrmCadUsuarios;
begin
  if (Application.FindComponent('frmCadUsuarios') = nil) then
  begin
    formulario := TfrmCadUsuarios.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCatalogoClick(Sender: TObject);
var
  formulario: TfrmCadProdutos;
begin
  if (Application.FindComponent('frmCadProdutos') = nil) then
  begin
    formulario := TfrmCadProdutos.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcCategoriasClick(Sender: TObject);
var
  formulario: TfrmCadCategorias;
begin
  if (Application.FindComponent('frmCadCategorias') = nil) then
  begin
    formulario := TfrmCadCategorias.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcDescricaoClick(Sender: TObject);
var
  formulario: TfrmCadDescricao;
begin
  if (Application.FindComponent('frmCadDescricao') = nil) then
  begin
    formulario := TfrmCadDescricao.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcFamiliasClick(Sender: TObject);
var
  formulario: TfrmCadFamilia;
begin
  if (Application.FindComponent('frmCadFamilia') = nil) then
  begin
    formulario := TfrmCadFamilia.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcGruposClick(Sender: TObject);
var
  formulario: TfrmCadGrupoas;
begin
  if (Application.FindComponent('frmCadGrupoas') = nil) then
  begin
    formulario := TfrmCadGrupoas.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcMarcasClick(Sender: TObject);
var
  formulario: TfrmCadMarcas;
begin
  if (Application.FindComponent('frmCadMarcas') = nil) then
  begin
    formulario := TfrmCadMarcas.Create(Application);
    formulario.Top := 0;
    formulario.Left := 0;
  end;
end;

procedure TfrmPrincipal.opcSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  stbPrincipal.Panels[1].Text := TimeToStr(Time);
end;

end.
