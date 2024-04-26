unit u_consultaTratamentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ActnList, u_consultapadrao, ZDataset;

type

  { TF_consultatratamentos }

  TF_consultatratamentos = class(TF_consultaPadrao)
    procedure act_pesquisarExecute(Sender: TObject);
  private

  public

  end;

var
  F_consultatratamentos: TF_consultatratamentos;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_consultatratamentos }

procedure TF_consultatratamentos.act_pesquisarExecute(Sender: TObject);
begin
  try
      if Cbpesq.ItemIndex = 0 then
    Begin
      With DMPrincipal do
        begin

          qryTratamentos.Close;
          qryTratamentos.sql.text:='Select * from tratamentos';
          qryTratamentos.Open;
        end;
    end;
     if Cbpesq.ItemIndex = 1 then
    Begin
      With DMPrincipal do
        begin


        qrytratamentos.Close;
        qryTratamentos.sql.Clear;
        //qrytratamentos.SQL.text :=  'select * from tratamentos where PAC_NOME = '+ QuotedStr(EdtCon.Text);
        qryTratamentos.SQL.add ('select * from tratamentos as t '+
                                'where t.PAC_IDPACIENTE = (Select p.PAC_IDPACIENTE  from pacientes as p where p.pac_nome = '+ QuotedStr(EdtCon.Text));
                                //'where t.PAC_IDPACIENTE = (Select p.PAC_IDPACIENTE  from pacientes as p where p.pac_nome like '+#39+'%'+edtcon.Text+'%'+#39';
        qrytratamentos.Open;

        end;
    end;
     if Cbpesq.ItemIndex = 2 then
    Begin
      With DMPrincipal do
        begin

          qrytratamentos.close;
          qrytratamentos.SQL.text :='select * from  tratamentos where PROFIS_NOME like '+#39+'%'+edtcon.Text+'%'+#39;
          qrytratamentos.Open;

        end;
    end;

     Label2.Caption := IntToStr(DMPrincipal.qryConsultatratamentos.RecordCount);
  except
    if MessageDlg('Não foi possível localizar o Paciente', mtWarning, [mbOK, mbCancel],0) = mrOk then
     Abort;

  end;
end;

end.

