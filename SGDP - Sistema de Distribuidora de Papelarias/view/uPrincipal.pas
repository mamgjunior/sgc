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
    procedure FormShow(Sender: TObject);
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure opcSairClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure opcCadDepartamentosClick(Sender: TObject);
    procedure opcCadCargosClick(Sender: TObject);
    procedure opcCadFuncionariosClick(Sender: TObject);
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
  uRotinasGenericas, uCadDepartametos, uCadCargos, uCadFuncionarios;

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

procedure TfrmPrincipal.opcSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  stbPrincipal.Panels[1].Text := TimeToStr(Time);
end;

end.
