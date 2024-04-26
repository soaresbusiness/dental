unit u_consultaprocedimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, u_consultapadrao,
  RxDBGrid;

type

  { TF_consultaProcedimentos }

  TF_consultaProcedimentos = class(TF_consultaPadrao)
    RxDBGrid1: TRxDBGrid;
    procedure act_pesquisarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
   var
    codProced, codprofis : Integer;

  end;

var
  F_consultaProcedimentos: TF_consultaProcedimentos;


implementation

{$R *.lfm}
uses
  u_dmprincipal, u_dente;

{ TF_consultaProcedimentos }

procedure TF_consultaProcedimentos.act_pesquisarExecute(Sender: TObject);
begin
  try
      if Cbpesq.ItemIndex = 0 then
    Begin
      With DMPrincipal do
        begin

          qryProcedimentos.Close;
          qryProcedimentos.sql.text:='Select * from procedimentos';
          qryProcedimentos.Open;
        end;
    end;
     if Cbpesq.ItemIndex = 1 then
    Begin
      With DMPrincipal do
        begin


        qryProcedimentos.Close;
        qryProcedimentos.SQL.text :=  'select * from procedimentos where proced_id = '+ QuotedStr(EdtCon.Text);
        //qryPacientes.SQL.text :=  'select * from Pacientes where PAC_IDPACIENTE like '+edtcon.Text+'%'+#39;
        qryProcedimentos.Open;

        end;
    end;
     if Cbpesq.ItemIndex = 2 then
    Begin
      With DMPrincipal do
        begin

          qryProcedimentos.close;
          qryProcedimentos.SQL.text :='select * from  procedimentos where procedimento like '+#39+'%'+edtcon.Text+'%'+#39;
          qryProcedimentos.Open;

        end;
    end;

   except
     if MessageDlg('O procedimento não foi encontrado.', mtWarning, [mbOK, mbCancel],0) = mrOk then
       abort;
   end;
  end;

procedure TF_consultaProcedimentos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  codProced := RxDBGrid1.Columns.Items[0].Field.AsInteger;
  with f_dente do
    begin
        with dmPrincipal  do
          begin
            qryItenstratamentos.edit;
            qryItenstratamentosIDPROCEDIMENTO.value := codProced;
          end;
      DBEdit1.SetFocus;
    end;
end;

procedure TF_consultaProcedimentos.FormShow(Sender: TObject);
begin
  Label2.Caption := IntToStr(DMPrincipal.qryProcedimentos.RecordCount);
end;

end.

