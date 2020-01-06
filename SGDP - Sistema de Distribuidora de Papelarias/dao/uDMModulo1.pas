unit uDMModulo1;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, SimpleDS;

type
  TdmModuloDados1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    tblFornecedores: TSQLDataSet;
    dspFornecedores: TDataSetProvider;
    cdsFornecedores: TClientDataSet;
    dsFornecedores: TDataSource;
    sdsFornecedores: TSimpleDataSet;
    dsFornecedores2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmModuloDados1: TdmModuloDados1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
