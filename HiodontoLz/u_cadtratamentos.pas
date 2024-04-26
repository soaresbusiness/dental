unit u_cadTratamentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, StdCtrls, DBCtrls, DBGrids, u_formPadrao, ZDataset, RxDBGrid,
  rxlookup, LR_Class, LR_DBSet, ACBrEnterTab, db, LR_DSet;

type

  { TF_cadTratamentos }

  TF_cadTratamentos = class(TF_Padrao)
    act_procurapaciente: TAction;
    act_faturar: TAction;
    act_odontograma: TAction;
    act_consultar: TAction;
    act_imprimir: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnfaturar: TBitBtn;
    btnOdontograma: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    dsEmpresa: TDataSource;
    dsqryImpPacientes: TDataSource;
    dsqryImpItensTratamentos: TDataSource;
    dsImpTratamentos: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    frDBPaciente: TfrDBDataSet;
    frDBImpTratamentos: TfrDBDataSet;
    frDBItensTratamentos: TfrDBDataSet;
    frDBEmpresa: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qryEmpresaBAIRRO: TStringField;
    qryEmpresaCEP: TStringField;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaCOMPLEMENTO: TStringField;
    qryEmpresaDATACAD: TDateField;
    qryEmpresaEMAIL: TStringField;
    qryEmpresaEMPRESA_ID: TLongintField;
    qryEmpresaENDERECO: TStringField;
    qryEmpresaFONE1: TStringField;
    qryEmpresaFONE2: TStringField;
    qryEmpresaFONE3: TStringField;
    qryEmpresaLOGO: TBlobField;
    qryEmpresaMUNICIPIO: TStringField;
    qryEmpresaNOME_FANT: TStringField;
    qryEmpresaNUMERO: TStringField;
    qryEmpresaRAZAO_SOC: TStringField;
    qryEmpresaSITE: TStringField;
    qryEmpresaUF: TStringField;
    qryImpItensTratamentosFACE: TStringField;
    qryImpItensTratamentosIDDENTE: TLongintField;
    qryImpItensTratamentosIDITEM: TLargeintField;
    qryImpItensTratamentosIDITEMTRATAMENTO: TLongintField;
    qryImpItensTratamentosIDPROCEDIMENTO: TLongintField;
    qryImpItensTratamentosITENS_DATA: TDateField;
    qryImpItensTratamentosITTENS_HORA: TTimeField;
    qryImpItensTratamentosPROCED_VALOR: TFloatField;
    qryImpItensTratamentosPROFIS_IDPROFISSIONAL: TLongintField;
    qryImpItensTratamentosSITUACAO: TStringField;
    qryImpPacientesCONVENIO: TStringField;
    qryImpPacientesIDTRATAMENTOS: TLongintField;
    qryImpPacientesPAC_CEL: TStringField;
    qryImpPacientesPAC_DATANASC: TDateField;
    qryImpPacientesPAC_IDCONVENIO: TLongintField;
    qryImpPacientesPAC_IDPACIENTE: TLongintField;
    qryImpPacientesPAC_NOME: TStringField;
    qryImpPacientesPAC_PROFISSAO: TStringField;
    qryImptratamentosHORA: TTimeField;
    qryImptratamentosIDTRATAMENTOS: TLongintField;
    qryImptratamentosPAC_IDPACIENTE: TLongintField;
    qryImptratamentosPAC_NOME: TStringField;
    qryImptratamentosPROFIS_IDPROFISSIONAL: TLongintField;
    qryImptratamentosSITUACAO: TStringField;
    qryImptratamentosTOTALGERAL: TFloatField;
    qryImptratamentosTRATAM_DATA: TDateField;
    RxDBGrid1: TRxDBGrid;
    qryImptratamentos: TZQuery;
    qryImpItensTratamentos: TZQuery;
    qryImpPacientes: TZQuery;
    qryEmpresa: TZQuery;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_consultarExecute(Sender: TObject);
    procedure act_faturarExecute(Sender: TObject);
    procedure act_imprimirExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_odontogramaExecute(Sender: TObject);
    procedure act_procurapacienteExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure salvapreco;
    procedure SomaTratamento;
    Procedure _VerificaSituacao;
  private

  public

  end;

var
  F_cadTratamentos: TF_cadTratamentos;

implementation

{$R *.lfm}
uses
   u_consultatratamento, u_consultaPacientetratamento ,u_dmprincipal, u_dente, u_relTratamentos;

{ TF_cadTratamentos }
Procedure TF_cadTratamentos._VerificaSituacao;
begin
   if  DMPrincipal.qryTratamentosSITUACAO.value = 'Faturado' then
     begin

        begin
            btnFaturar.Enabled     := False;
            btnOdontograma.Enabled := false;
            botaoalterar.Enabled   := False;
        end;
     end;

   if  DMPrincipal.qryTratamentosSITUACAO.value = 'Digitado' then
      begin

         btnOdontograma.enabled := true;
         btnFaturar.enabled := true;
         HabilitaBotoes;

       end;
end;



procedure TF_cadTratamentos.salvapreco;
begin
     with DMPrincipal do
      begin
          qryItenstratamentos.First;
              while not qryItenstratamentos.Eof do
                  begin
                  if qryItenstratamentos.state in [dsEdit] then
                    begin
                     qryItenstratamentosPROCED_VALOR.Value :=  RxDBGrid1.Columns.Items[4].field.AsFloat;
                     qryItenstratamentos.Next;
                    end
                    else
                    begin
                      qryItenstratamentos.Edit;
                      qryItenstratamentosPROCED_VALOR.Value :=  RxDBGrid1.Columns.Items[4].field.AsFloat;
                     qryItenstratamentos.Next;
                    end;
                  end;

          end;

end;
procedure TF_cadTratamentos.SomaTratamento;
var
  soma : Currency;
begin
   soma  := 0;
   with DMPrincipal do
      begin
        qryItenstratamentos.First;
        While not qryItenstratamentos.Eof do
          begin
              soma := soma + qryItensTratamentosPROCED_VALOR.Value;
              qryItenstratamentos.Next;
          end;
           qryTratamentos.Edit;
           qryTratamentosTOTALGERAL.AsCurrency := soma;
      end;

end;

procedure TF_cadTratamentos.act_NovoExecute(Sender: TObject);
var
  id : Integer;
begin
  with dmprincipal do
    begin
      if qryTratamentos.State in [dsInsert, dsEdit] then
          begin

              qryTratamentosTRATAM_DATA.value := date;
              qryTratamentosHORA.Value        := time;
              qrytratamentos.Post;
              qryTratamentos.CommitUpdates;

              qryItenstratamentos.open;
              qryItenstratamentos.edit;
              //qryItenstratamentosIDTRATAMENTOS.value := qryTratamentosIDTRATAMENTOS.value;

          end
       else
          begin
              qryTratamentos.Insert;
              qryTratamentosSITUACAO.value := 'Digitado';
              qryitenstratamentos.Open;
              qryItenstratamentos.edit;

              //qryItenstratamentosIDTRATAMENTOS.value := qryTratamentosIDTRATAMENTOS.value;

              qryTratamentosTRATAM_DATA.value := date;
              qryTratamentosHORA.Value        := time;
              qrytratamentos.Post;
              qryTratamentos.CommitUpdates;
              qryTratamentos.Edit;

   end;
       HabilitaControle;
       DesabilitaBotoes;
 end;

end;

procedure TF_cadTratamentos.act_odontogramaExecute(Sender: TObject);
begin
   with DMPrincipal do
     begin
       qryItensTratamentos.Cancel;
     end;
   HabilitaControle;
   Desabilitabotoes;

   f_dente := Tf_dente.create(self);
   f_dente.ShowModal;



end;

procedure TF_cadTratamentos.act_procurapacienteExecute(Sender: TObject);
begin
   F_ConsultaPacienteTratamento := TF_ConsultaPacienteTratamento.Create(Self);
   F_ConsultaPacienteTratamento.showmodal;
end;

procedure TF_cadTratamentos.act_SalvarExecute(Sender: TObject);
begin
      with DMPrincipal do
          begin
            qryTratamentos.Edit;
            qryTratamentosPAC_NOME.AsString := RxDBLookupCombo1.Text;

            qryItensTratamentos.Edit;
            qryItenstratamentosIDITEMTRATAMENTO.Value := qryTratamentosIDTRATAMENTOS.value;
            salvapreco;
            qryTratamentos.Edit;
            SomaTratamento;

            qryTratamentos.Post;
            qryItenstratamentos.Edit;
            qryItenstratamentos.Post;

        end;

     HabilitaBotoes;
     DesabilitaControle;
 End;

procedure TF_cadTratamentos.DBEdit1Change(Sender: TObject);
begin
  _VerificaSituacao;
end;

procedure TF_cadTratamentos.DBLookupComboBox1CloseUp(Sender: TObject);
var
  idtratam : Integer;
begin
    with dmprincipal do
       begin
       if dsItenstratamentos.State in [dsInactive] then
         begin

         qryTratamentos.Post;
         qryItenstratamentos.open;
         qryItenstratamentos.Insert;
         idtratam:= qryTratamentosIDTRATAMENTOS.value;
         //qryItenstratamentosIDTRATAMENTOS.value := idtratam;


         end;

       end;
end;

procedure TF_cadTratamentos.act_AlterarExecute(Sender: TObject);
begin
   if  DMPrincipal.qryTratamentosSITUACAO.value = 'Faturado' then
     begin
       if MessageDlg('Não é possível alteração com Tratamento já faturado', mtWarning, [mbOK],0) = mrOk then

     end
   Else
    begin
      with dmPrincipal do
         begin
           qryTratamentos.edit;
           qryItensTratamentos.Edit;
     end;

     HabilitaControle;
     DesabilitaBotoes;
end;
end;

procedure TF_cadTratamentos.act_CancelarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
        qryTratamentos.Cancel;
        qryItensTratamentos.Cancel;
      end;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_cadTratamentos.act_consultarExecute(Sender: TObject);
begin
    F_consultaTratamento := TF_consultaTratamento.create(self);
    f_consultatratamento.ShowModal;
end;

procedure TF_cadTratamentos.act_faturarExecute(Sender: TObject);
begin
   with dmprincipal do
      begin
      if MessageDlg('Deseja realmente Fatura esse Tratamento', mtWarning, [mbYes, mbNo],0) = mrYes then
          begin
           qryTratamentos.Edit;
           qryTratamentosSITUACAO.value := 'Faturado';
           btnOdontograma.Enabled:=False;
           qryMovimento.Open;
           qryMovimento.Insert;

           qryMovimento['IDTRATAMENTO'] :=  qryTratamentos['IDTRATAMENTOS'];
           qryMovimento['MOV_DATA']     :=  qryTratamentos['TRATAM_DATA'];
           qryMovimento['MOV_HORA']     :=  qryTratamentos['HORA'];
           qryMovimento['PAC_NOME']     :=  qryTratamentos['PAC_NOME'];
           qryMovimento['IDPACIENTE']   :=  qryTratamentos['PAC_IDPACIENTE'];
           qryMovimento['TOTALGERAL']   :=  qryTratamentos['TOTALGERAL'];
           qryMovimentoSITUACAO.Value := 'Pendente';

           qryTratamentos.Post;
           qryTratamentos.ApplyUpdates;
           qryMovimento.Post;
           qryMovimento.ApplyUpdates;
           qryMovimento.CommitUpdates;
           btnfaturar.Enabled  := False;
           botaoAlterar.Enabled := False;
          end
       else
         begin
           qryTratamentos.edit;
           qryTratamentosSITUACAO.value := 'Digitado';
           qrytratamentos.Post;
           btnOdontograma.Enabled:=True;
      end;
    end;
end;

procedure TF_cadTratamentos.act_imprimirExecute(Sender: TObject);
begin

    qryEmpresa.Open;

    Edit1.Text := dbedit1.Text;
    Edit2.Text := DBEdit2.Text;

    begin

       qryImptratamentos.Close;
       qryImptratamentos.SQL.Clear;
      // qryImptratamentos.SQL.Add('select * from  tratamentos Where IDTRATAMENTOS like = '+#39+edit1.Text+#39);
       qryImptratamentos.SQL.Text := 'select * from  TRATAMENTOS where idtratamentos = '+ QuotedStr(edit1.Text);
       qryImptratamentos.open;
       qryImpItensTratamentos.Close;
       qryImpItensTratamentos.Open;

       qryImpPacientes.Close;
       qryImpPacientes.SQL.Clear;
       qryImpPacientes.SQL.Text := 'select * from  view_paciente where pac_idpaciente = '+ QuotedStr(edit2.Text);
       qryImpPacientes.Open;


     end;
  frReport1.LoadFromFile('C:\Hiodontolz\Relatorioslz\Tratamento.lrf');
  frReport1.ShowReport;




end;

procedure TF_cadTratamentos.FormShow(Sender: TObject);
begin
  with dmPrincipal do
    begin
      qryPacientes.Open;
      qryProfissionais.Open;
      qryProcedimentos.Open;
      qryTratamentos.Open;
      qryItenstratamentos.Open;

    end;
    _VerificaSituacao;

   HabilitaBotoes;
   DesabilitaControle;
end;

end.

