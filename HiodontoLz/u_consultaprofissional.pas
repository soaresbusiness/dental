unit u_consultaprofissional;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, u_consultapadrao,
  RxDBGrid;

type

  { TF_consultaProfissional }

  TF_consultaProfissional = class(TF_consultaPadrao)
    RxDBGrid1: TRxDBGrid;
    procedure act_pesquisarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
   var
    codprofis:Integer;
  end;

var
  F_consultaProfissional: TF_consultaProfissional;

implementation

{$R *.lfm}
uses
  u_dmprincipal, u_dente;

{ TF_consultaProfissional }

procedure TF_consultaProfissional.act_pesquisarExecute(Sender: TObject);
begin
  try
      if Cbpesq.ItemIndex = 0 then
    Begin
      With DMPrincipal do
        begin

          qryProfissionais.Close;
          qryProfissionais.sql.text:= 'Select * from Profissionais';
          qryProfissionais.Open;
        end;
    end;
     if Cbpesq.ItemIndex = 1 then
    Begin
      With DMPrincipal do
        begin


        qryProfissionais.Close;
        //qryProfissionais.SQL.text :=  'select * from profissionais where PROFIS_IDPROFISSIONAL';
        qryProfissionais.SQL.text :=  'select * from Profissonais where Profis_Apelido like '+edtcon.Text+'%'+#39;
        qryProfissionais.Open;

        end;
    end;
     if Cbpesq.ItemIndex = 2 then
    Begin
      With DMPrincipal do
        begin

          qryProfissionais.close;
          qryProfissionais.SQL.text :='select * from  profissionais where PROFIS_NOME = '+ QuotedStr(EdtCon.Text);
          qryProfissionais.Open;

        end;
    end;

   except
     if MessageDlg('O Profissional não foi encontrado.', mtWarning, [mbOK, mbCancel],0) = mrOk then
       abort;
   end;
end;

procedure TF_consultaProfissional.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  codprofis := RxDBGrid1.Columns.Items[0].Field.AsInteger;
  with f_dente do
    begin

    with dmPrincipal  do
      begin
      qryItenstratamentos.edit;
      qryItenstratamentosPROFIS_IDPROFISSIONAL.value := codprofis;

      end;


     DBEdit2.SetFocus;

    end;
end;

procedure TF_consultaProfissional.FormShow(Sender: TObject);
begin
  Label2.Caption := IntToStr(DMPrincipal.qryProfissionais.RecordCount);
end;

end.

