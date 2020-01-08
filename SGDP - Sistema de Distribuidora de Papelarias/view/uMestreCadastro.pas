unit uMestreCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmMestreCadastro = class(TForm)
    stbMensagens: TStatusBar;
    clbCadastro: TCoolBar;
    tlbCadastro: TToolBar;
    imgHabilitadas: TImageList;
    imgDesabilitadas: TImageList;
    btnAdicionar: TToolButton;
    btnPrimeiro: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    btnLocalizar: TToolButton;
    btnEditar: TToolButton;
    btnDesfazer: TToolButton;
    btnGravar: TToolButton;
    btnExcluir: TToolButton;
    btnSair: TToolButton;
    pgDados: TPageControl;
    TabSheet1: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMestreCadastro: TfrmMestreCadastro;

implementation

{$R *.dfm}

uses
  uRotinasGenericas;

end.
