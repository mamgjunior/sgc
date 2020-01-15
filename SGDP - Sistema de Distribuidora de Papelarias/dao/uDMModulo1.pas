unit uDMModulo1;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Data.DBXFirebird,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  SimpleDS;

type
  TdmModuloDados1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    tblFornecedores: TSQLDataSet;
    dspFornecedores: TDataSetProvider;
    cdsFornecedores: TClientDataSet;
    dsFornecedores: TDataSource;
    sdsFornecedores: TSimpleDataSet;
    dsFornecedores2: TDataSource;
    sdsControle: TSimpleDataSet;
    dsControle: TDataSource;
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
    sdsDepartamentos: TSimpleDataSet;
    sdsCargos: TSimpleDataSet;
    sdsFuncionarios: TSimpleDataSet;
    dsDepartaentos: TDataSource;
    dsCargos: TDataSource;
    dsFuncionarios: TDataSource;
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
