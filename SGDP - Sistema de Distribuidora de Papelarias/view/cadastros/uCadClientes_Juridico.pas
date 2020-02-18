unit uCadClientes_Juridico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestreCadastro, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmCadClientes_Juridico = class(TfrmMestreCadastro)
    tsEndereco: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes_Juridico: TfrmCadClientes_Juridico;

implementation

uses
  uDMModulo1, uRotinasGenericas;

{$R *.dfm}

end.
