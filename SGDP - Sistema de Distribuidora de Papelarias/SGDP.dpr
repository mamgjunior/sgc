program SGDP;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uRotinasGenericas in 'controller\uRotinasGenericas.pas',
  uDMModulo1 in 'dao\uDMModulo1.pas' {dmModuloDados1: TDataModule},
  uMestreCadastro in 'view\uMestreCadastro.pas' {frmMestreCadastro},
  uMestreLocalizar in 'view\uMestreLocalizar.pas' {frmMestreLocalizar},
  uCadFuncionarios in 'view\cadastros\uCadFuncionarios.pas' {frmCadFuncionarios},
  uCadCargos in 'view\cadastros\uCadCargos.pas' {frmCadCargos},
  uCadDepartametos in 'view\cadastros\uCadDepartametos.pas' {frmCadDepartametos},
  uLocalizaFuncionarios in 'view\pesquisa\uLocalizaFuncionarios.pas' {frmLocalizaFuncionarios},
  uCadFornecedores in 'view\cadastros\uCadFornecedores.pas' {frmCadFornecedores},
  uLocalizarFornecedor in 'view\pesquisa\uLocalizarFornecedor.pas' {frmLocalizarFornecedor},
  uCadGrupoas in 'view\cadastros\uCadGrupoas.pas' {frmCadGrupoas},
  uCadCategorias in 'view\cadastros\uCadCategorias.pas' {frmCadCategorias},
  uCadFamilia in 'view\cadastros\uCadFamilia.pas' {frmCadFamilia},
  uCadMarcas in 'view\cadastros\uCadMarcas.pas' {frmCadMarcas},
  uLocalizaMarca in 'view\pesquisa\uLocalizaMarca.pas' {frmLocalizaMarca},
  uCadDescricao in 'view\cadastros\uCadDescricao.pas' {frmCadDescricao},
  uLocalizaDescricao in 'view\pesquisa\uLocalizaDescricao.pas' {frmLocalizaDescricao},
  uCadProdutos in 'view\cadastros\uCadProdutos.pas' {frmCadProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmModuloDados1, dmModuloDados1);
  Application.Run;
end.
