unit uDMModulo1;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Data.DBXFirebird,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  SimpleDS;

type
  TdmModuloDados1 = class(TDataModule)
    sdsFornecedores: TSimpleDataSet;
    dsFornecedores: TDataSource;
    sdsControle: TSimpleDataSet;
    dsControle: TDataSource;
    sdsDepartamentos: TSimpleDataSet;
    sdsCargos: TSimpleDataSet;
    sdsFuncionarios: TSimpleDataSet;
    dsDepartaentos: TDataSource;
    dsCargos: TDataSource;
    dsFuncionarios: TDataSource;
    sdsDepartamentosCODIGO_DEPARTAMENTO: TIntegerField;
    sdsDepartamentosNOME_DEPARTAMENTO: TStringField;
    sdsControleREGISTRO: TStringField;
    sdsControleCODIGO_CARGO: TIntegerField;
    sdsControleCODIGO_INTERNO: TIntegerField;
    sdsControleCODIGO_CATEGORIA: TIntegerField;
    sdsControleCODIGO_CLIENTE: TIntegerField;
    sdsControleCODIGO_DEPARTAMENTO: TIntegerField;
    sdsControleCODIGO_DESCRICAO: TIntegerField;
    sdsControleCODIGO_FAMILIA: TIntegerField;
    sdsControleREGISTRO_FORNECEDOR: TIntegerField;
    sdsControleCODIGO_FORNECEDOR: TIntegerField;
    sdsControleCODIGO_GRUPO: TIntegerField;
    sdsControleCODIGO_MARCA: TIntegerField;
    sdsEstados: TSimpleDataSet;
    dsEstados: TDataSource;
    sdsEstadosSIGLA_ESTADO: TStringField;
    sdsEstadosESTADO: TStringField;
    sdsCargosCODIGO_CARGO: TIntegerField;
    sdsCargosDESCRICAO_CARGO: TStringField;
    sdsCargosVENDEDOR_EXTERNO: TStringField;
    sdsCargosVENDEDOR_INTERNO: TStringField;
    sdsFuncionariosMATRICULA_FUNCIONARIO: TStringField;
    sdsFuncionariosNOME_FUNCIONARIO: TStringField;
    sdsFuncionariosENDERECO: TStringField;
    sdsFuncionariosNUMERO: TStringField;
    sdsFuncionariosCOMPLEMENTO: TStringField;
    sdsFuncionariosBAIRRO: TStringField;
    sdsFuncionariosCIDADE: TStringField;
    sdsFuncionariosESTADO: TStringField;
    sdsFuncionariosCEP: TStringField;
    sdsFuncionariosTELEFONE: TStringField;
    sdsFuncionariosEMAIL: TStringField;
    sdsFuncionariosCODIGO_DEPARTAMENTO: TIntegerField;
    sdsFuncionariosCODIGO_CARGO: TIntegerField;
    sdsFornecedoresCODIGO_FORNECEDOR: TIntegerField;
    sdsFornecedoresRAZAO_SOCIAL: TStringField;
    sdsFornecedoresNOME_FANTASIA: TStringField;
    sdsFornecedoresENDERECO: TStringField;
    sdsFornecedoresNUMERO: TStringField;
    sdsFornecedoresCOMPLEMENTO: TStringField;
    sdsFornecedoresBAIRRO: TStringField;
    sdsFornecedoresCIDADE: TStringField;
    sdsFornecedoresESTADO: TStringField;
    sdsFornecedoresCEP: TStringField;
    sdsFornecedoresINSCRICAO_ESTADUAL: TStringField;
    sdsFornecedoresTELEFONE: TStringField;
    sdsFornecedoresCONTATO_COMERCIAL: TStringField;
    strngfldFornecedoresCNPJ: TStringField;
    strngfldFornecedoresEMAIL: TStringField;
    strngfldFornecedoresHOME_PAGE: TStringField;
    strngfldFornecedoresFAX: TStringField;
    strngfldFornecedoresFONE_COMERCIAL: TStringField;
    sdsGrupos: TSimpleDataSet;
    sdsCategorias: TSimpleDataSet;
    sdsFamilias: TSimpleDataSet;
    sdsMarcas: TSimpleDataSet;
    sdsDescricao: TSimpleDataSet;
    sdsCatalogo: TSimpleDataSet;
    sdsFornecedorProduto: TSimpleDataSet;
    sdsGruposCODIGO_GRUPO: TIntegerField;
    sdsGruposDESCRICAO_GRUPO: TStringField;
    sdsCategoriasCODIGO_CATEGORIA: TIntegerField;
    sdsCategoriasDESCRICAO_CATEGORIA: TStringField;
    sdsFamiliasCODIGO_FAMILIA: TIntegerField;
    sdsFamiliasDESCRICAO_FAMILIA: TStringField;
    sdsMarcasCODIGO_MARCA: TIntegerField;
    sdsMarcasDESCRICAO_MARCA: TStringField;
    sdsDescricaoCODIGO_DESCRICAO: TIntegerField;
    sdsDescricaoDESCRICAO: TStringField;
    sdsCatalogoCODIGO_INTERNO: TIntegerField;
    sdsCatalogoCODIGO_BARRAS: TStringField;
    sdsCatalogoCODIGO_DESCRICAO: TIntegerField;
    sdsCatalogoMODELO: TStringField;
    sdsCatalogoUNIDADE_MEDIDA: TStringField;
    sdsCatalogoCODIGO_GRUPO: TIntegerField;
    sdsCatalogoCODIGO_CATEGORIA: TIntegerField;
    sdsCatalogoCODIGO_FAMILIA: TIntegerField;
    sdsCatalogoCODIGO_MARCA: TIntegerField;
    sdsCatalogoPRECO_CUSTO: TFMTBCDField;
    sdsCatalogoICMS: TFMTBCDField;
    sdsCatalogoIPI: TFMTBCDField;
    sdsCatalogoMARGEM_LUCRO: TFMTBCDField;
    sdsCatalogoPRECO_VENDA: TFMTBCDField;
    sdsCatalogoCONSUMO_MEDIO: TIntegerField;
    sdsCatalogoESTOQUE_ATUAL: TIntegerField;
    sdsCatalogoESTOQUE_MINIMO: TIntegerField;
    sdsFornecedorProdutoREGISTRO: TIntegerField;
    sdsFornecedorProdutoCODIGO_FORNECEDOR: TIntegerField;
    sdsFornecedorProdutoFORNECEDOR: TStringField;
    sdsFornecedorProdutoCODIGO_PRODUTO: TIntegerField;
    sdsFornecedorProdutoDESCRICAO_PRODUTO: TStringField;
    dsGrupos: TDataSource;
    dsCategorias: TDataSource;
    dsFamilias: TDataSource;
    dsMarcas: TDataSource;
    dsDescricao: TDataSource;
    dsCatalogo: TDataSource;
    dsFornecedorProduto: TDataSource;
    sdsProdutos: TSimpleDataSet;
    dsProdutos: TDataSource;
    sdsProdutosCODIGO_INTERNO: TIntegerField;
    sdsProdutosCODIGO_BARRAS: TStringField;
    sdsProdutosCODIGO_DESCRICAO: TIntegerField;
    sdsProdutosMODELO: TStringField;
    sdsProdutosUNIDADE_MEDIDA: TStringField;
    sdsProdutosCODIGO_GRUPO: TIntegerField;
    sdsProdutosCODIGO_CATEGORIA: TIntegerField;
    sdsProdutosCODIGO_FAMILIA: TIntegerField;
    sdsProdutosCODIGO_MARCA: TIntegerField;
    sdsProdutosPRECO_CUSTO: TFMTBCDField;
    sdsProdutosICMS: TFMTBCDField;
    sdsProdutosIPI: TFMTBCDField;
    sdsProdutosMARGEM_LUCRO: TFMTBCDField;
    sdsProdutosPRECO_VENDA: TFMTBCDField;
    sdsProdutosCONSUMO_MEDIO: TIntegerField;
    sdsProdutosESTOQUE_ATUAL: TIntegerField;
    sdsProdutosESTOQUE_MINIMO: TIntegerField;
    sdsClientes: TSimpleDataSet;
    dsClientes: TDataSource;
    sdsClientesCODIGO_CLIENTE: TIntegerField;
    sdsClientesNOME_CLIENTE: TStringField;
    sdsClientesCNPJ: TStringField;
    sdsClientesINSCRICAO_ESTADUAL: TStringField;
    sdsClientesENDERECO: TStringField;
    sdsClientesNUMERO: TStringField;
    sdsClientesCOMPLEMENTO: TStringField;
    sdsClientesBAIRRO: TStringField;
    sdsClientesCIDADE: TStringField;
    sdsClientesESTADO: TStringField;
    sdsClientesCEP: TStringField;
    sdsClientesTELEFONE: TStringField;
    sdsClientesFAX: TStringField;
    sdsClientesEMAIL: TStringField;
    sdsClientesTELEFONE_CONTATO: TStringField;
    sdsClientesCONTATO: TStringField;
    sdsClientesDATA_CADASTRO: TDateField;
    sdsClientesLIMITE_CREDITO: TFMTBCDField;
    sdsClientesVALOR_ABERTO: TFMTBCDField;
    sdsClientesTIPO_COBRANCA: TStringField;
    procedure sdsDepartamentosBeforeDelete(DataSet: TDataSet);
    procedure sdsFornecedoresBeforeDelete(DataSet: TDataSet);
    procedure sdsCargosBeforeDelete(DataSet: TDataSet);
    procedure sdsFuncionariosBeforeDelete(DataSet: TDataSet);
    procedure sdsGruposBeforeDelete(DataSet: TDataSet);
    procedure sdsCategoriasBeforeDelete(DataSet: TDataSet);
    procedure sdsFamiliasBeforeDelete(DataSet: TDataSet);
    procedure sdsMarcasBeforeDelete(DataSet: TDataSet);
    procedure sdsDescricaoBeforeDelete(DataSet: TDataSet);
    procedure sdsCatalogoBeforeDelete(DataSet: TDataSet);
    procedure sdsFornecedorProdutoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmModuloDados1: TdmModuloDados1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  uRotinasGenericas;

{$R *.dfm}

procedure TdmModuloDados1.sdsCargosBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsCatalogoBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsCategoriasBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsDepartamentosBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsDescricaoBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFamiliasBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFornecedoresBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFornecedorProdutoBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFuncionariosBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsGruposBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsMarcasBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

end.
