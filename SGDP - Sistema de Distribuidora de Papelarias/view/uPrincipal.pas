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
    procedure FormShow(Sender: TObject);
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure opcSairClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
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
  uRotinasGenericas;

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

procedure TfrmPrincipal.opcSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  stbPrincipal.Panels[1].Text := TimeToStr(Time);
end;

end.
