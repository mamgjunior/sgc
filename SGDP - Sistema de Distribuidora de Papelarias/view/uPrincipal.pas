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
  private
    procedure MostrarDicas(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uRotinasGenericas, uCadDepartametos, uCadCargos, uCadFuncionarios, uCadFornecedores, uCadGrupoas, uCadCategorias, uCadProdutos, uCadDescricao, uCadFamilia, uCadMarcas, uCadClientes_Juridico;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  with frmPrincipal do
  begin
    Top := 0;
    Left := 0;
    Width := Screen.Width;
    Height := Screen.Height;
  end;
//  clbFerramentas.Bitmap.LoadFromFile('FUNDOBARRA.BMP');
  stbPrincipal.Panels[0].Text := MostrarData;
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
