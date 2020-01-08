unit uRotinasGenericas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls, Vcl.DBCtrls;

  { *** Procedimentos para serem usadas em todo os sistema ***}
  procedure Mensagem(const pTexto: string);
  procedure CorEntrada(Sender: TObject);
  procedure CorSaida(Sender: TObject);

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

procedure CorEntrada(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    if (Sender as TEdit).Tag = 0 then
      (Sender as TEdit).Color := clYellow
    else
      (Sender as TEdit).Color := clAqua;
  end
  else if Sender is TMaskEdit then
  begin
    if (Sender as TMaskEdit).Tag = 0 then
      (Sender as TMaskEdit).Color := clYellow
    else
      (Sender as TMaskEdit).Color := clAqua;
  end
  else if Sender is TMemo then
  begin
    (Sender as TMemo).Color := clYellow;
  end
  else if Sender is TDBEdit then
  begin
    if (Sender as TDBEdit).Tag = 0 then
      (Sender as TDBEdit).Color := clYellow
    else
      (Sender as TDBEdit).Color := clAqua;
  end
  else if Sender is TDBMemo then
  begin
    (Sender as TDBMemo).Color := clYellow;
  end;
end;

procedure CorSaida(Sender: TObject);
begin
  if Sender is TEdit then
    (Sender as TEdit).Color := clWindow
  else if Sender is TMaskEdit then
    (Sender as TMaskEdit).Color := clWindow
  else if Sender is TMemo then
    (Sender as TMemo).Color := clWindow
  else if Sender is TDBEdit then
    (Sender as TDBEdit).Color := clWindow
  else if Sender is TDBMemo then
    (Sender as TDBMemo).Color := clWindow;
end;

end.

