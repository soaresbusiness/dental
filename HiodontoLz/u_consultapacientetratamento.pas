unit u_consultaPacientetratamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, u_consultapaciente;

type

  { TF_ConsultaPacienteTratamento }

  TF_ConsultaPacienteTratamento = class(TF_ConsultaPaciente)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  F_ConsultaPacienteTratamento: TF_ConsultaPacienteTratamento;

implementation

{$R *.lfm}

{ TF_ConsultaPacienteTratamento }
uses
  u_cadTratamentos, u_dmprincipal;

procedure TF_ConsultaPacienteTratamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
 var
   codPaciente : Integer;
begin
    codPaciente := RxDBGrid1.Columns.Items[0].Field.AsInteger;

    begin
        with dmPrincipal  do
          begin
            qryTratamentos.edit;
            qryTratamentosPAC_IDPACIENTE.value := codPaciente;
          end;

    end;
end;

end.

