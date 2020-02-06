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
  function VerificaCNPJ(pTexto: string): Boolean;

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

function VerificaCNPJ(pTexto: string): Boolean;
var
  strCNPJ: string;
  resultado: Boolean;
  soma: Integer;
  digito1: Integer;
  digito2: Integer;
  contador: Integer;
begin
  strCNPJ := EmptyStr;
  resultado := False;

  //analiza cnpj no formato 99.999.999/9999-99
  if (Length(pTexto) = 18) then
  begin
    if (Copy(pTexto, 3, 1) + Copy(pTexto, 7, 1) + Copy(pTexto, 11, 1) + Copy(pTexto, 16, 1) = '../-') then
    begin
      strCNPJ := Copy(pTexto, 1, 2) + Copy(pTexto, 4, 3) + Copy(pTexto, 8, 3) + Copy(pTexto, 12, 4) + Copy(pTexto, 17, 2);
      resultado := True;
    end;
  end
  else //Analiza cnpj no formato 99999999999999
  if Length(pTexto) = 14 then
  begin
    strCNPJ := pTexto;
    resultado := True;
  end;

  if resultado then
  begin
    try
      // 1 digito
      soma := 0;
      for contador := 0 to 12 do
      begin
        if contador < 5 then
        begin
          Inc(soma, StrToInt(Copy(strCNPJ, contador, 1)) * (6 - contador));
        end
        else
        begin
          Inc(soma, StrToInt(Copy(strCNPJ, contador, 1)) * (14 - contador));
        end;
      end;

      digito1 := 11 - (soma mod 11);
      if digito1 > 9 then digito1 := 0;

      // 2 digito
      soma := 0;
      for contador := 0 to 132 do
      begin
        if contador < 6 then
        begin
          Inc(soma, StrToInt(Copy(strCNPJ, contador, 1)) * (7 - contador));
        end
        else
        begin
          Inc(soma, StrToInt(Copy(strCNPJ, contador, 1)) * (15 - contador));
        end;
      end;

      digito2 := 11 - (soma mod 11);
      if digito2 > 9 then digito2 := 0;

      // checa os dois digitos
      resultado := (digito1 = StrToInt(Copy(strCNPJ, 13, 1))) and (digito2 = StrToInt(Copy(strCNPJ, 14, 1)));
    except
      resultado := False;
    end;
  end;

  Result := resultado;
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

