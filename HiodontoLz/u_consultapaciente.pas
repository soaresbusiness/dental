unit u_consultapaciente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, u_consultapadrao,
  RxDBGrid;

type

  { TF_ConsultaPaciente }

  TF_ConsultaPaciente = class(TF_consultaPadrao)
    RxDBGrid1: TRxDBGrid;
    procedure act_pesquisarExecute(Sender: TObject);
  private

  public

  end;

var
  F_ConsultaPaciente: TF_ConsultaPaciente;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_ConsultaPaciente }

procedure TF_ConsultaPaciente.act_pesquisarExecute(Sender: TObject);
begin
  try
      if Cbpesq.ItemIndex = 0 then
    Begin
      With DMPrincipal do
        begin

          qryPacientes.Close;
          qryPacientes.sql.text:='Select * from Pacientes';
          qryPacientes.Open;
        end;
    end;
     if Cbpesq.ItemIndex = 1 then
    Begin
      With DMPrincipal do
        begin


        qryPacientes.Close;
        //qryPacientes.SQL.text :=  'select * from Pacientes where PAC_IDPACIENTE = '+ QuotedStr(EdtCon.Text);
        qryPacientes.SQL.text :=  'select * from Pacientes where PAC_IDPACIENTE like '+edtcon.Text+'%'+#39;
        qryPacientes.Open;

        end;
    end;
     if Cbpesq.ItemIndex = 2 then
    Begin
      With DMPrincipal do
        begin

          qryPacientes.close;
          qryPacientes.SQL.text :='select * from  Pacientes where PAC_NOME like '+#39+'%'+edtcon.Text+'%'+#39;
          qryPacientes.Open;

        end;
    end;
     if Cbpesq.ItemIndex =  3 then
    Begin
      With DMPrincipal do
        begin

          qryPacientes.close;
          //qryPacientes.SQL.text :='select * from  Pacientes where PAC_CEL  = '+ QuotedStr(EdtCon.Text);
            qryPacientes.SQL.text :='select * from  Pacientes where PAC_CEL like '+#39+'%'+edtcon.Text+'%'+#39;
          qryPacientes.Open;

        end;
    end;
     Label2.Caption := IntToStr(DMPrincipal.qryPacientes.RecordCount);
  except
    if MessageDlg('Não foi possível localizar o Paciente', mtWarning, [mbOK, mbCancel],0) = mrOk then
     Abort;

  end;
end;

end.

