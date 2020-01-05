unit uRotinasGenericas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls;

  { *** Procedimentos para serem usadas em todo os sistema ***}
  procedure Mensagem(const pTexto: string);

  { *** Funções para serem usadas em todo os sistema ***}
  function MostrarData: string;
  function Confirmar(const pTexto: string): Integer;
  function StrZero(const pValor: string; pComprimento: Integer): string;

implementation


function MostrarData: string;
begin
  Result := System.SysUtils.FormatSettings.LongDayNames[DayOfWeek(Now())] + ' - ' + DateToStr(Now());
end;

function Confirmar(const pTexto: string): Integer;
begin
  Result := Application.MessageBox(PChar(pTexto), 'CONFIRMAÇÃO', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
end;

function StrZero(const pValor: string; pComprimento: Integer): string;
var
  lcontador: Integer;
begin
  Result := '';
  for lcontador := 1 to pComprimento do
    Result := Result + '0';
  Result := Copy((Trim(Result) + Trim(pValor)), (Length(Trim(pValor)) + 1), pComprimento);
end;

procedure Mensagem(const pTexto: string);
begin
  Application.MessageBox(PChar(pTexto), 'MENSAGEM', MB_OK + MB_ICONEXCLAMATION);
end;

end.
