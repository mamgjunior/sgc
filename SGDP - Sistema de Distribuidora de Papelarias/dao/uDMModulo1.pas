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
    procedure sdsDepartamentosBeforeDelete(DataSet: TDataSet);
    procedure sdsFornecedoresBeforeDelete(DataSet: TDataSet);
    procedure sdsCargosBeforeDelete(DataSet: TDataSet);
    procedure sdsFuncionariosBeforeDelete(DataSet: TDataSet);
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

procedure TdmModuloDados1.sdsDepartamentosBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFornecedoresBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

procedure TdmModuloDados1.sdsFuncionariosBeforeDelete(DataSet: TDataSet);
begin
  if Confirmar('Deseja excluir esse registro?') <> IDYES then
    Abort
end;

end.
