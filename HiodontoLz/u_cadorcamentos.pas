unit u_cadOrcamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ActnList, u_formPadrao,  LR_DBSet, LR_Class, ZDataset,
  rxlookup, RxDBGrid, DB;

type

  { TF_cadOrcamentos }

  TF_cadOrcamentos = class(TF_Padrao)
    act_Consultar: TAction;
    act_imprimir: TAction;
    BitBtn1: TBitBtn;
    btnImprimir: TBitBtn;
    DBText1: TDBText;
    dsImpOrcamentos: TDataSource;
    dsImpItensOrcamentos: TDataSource;
    dsImpPacientes: TDataSource;
    dsEmpresa: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    frDBOrcamentos: TfrDBDataSet;
    frDBImpItensOrcamentos: TfrDBDataSet;
    frDBImpPacientes: TfrDBDataSet;
    frDBImpEmpresa: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
    qryImpItensOrcamentosDATA_ITENORCAMENTO: TDateField;
    qryImpItensOrcamentosIDITEM: TLongintField;
    qryImpItensOrcamentosIDITENSORCAMENTO: TLongintField;
    qryImpItensOrcamentosPROCED_ID: TLongintField;
    qryImpItensOrcamentosPROCED_VALOR: TFloatField;
    qryImpOrcamentosIDORCAMENTO: TLongintField;
    qryImpOrcamentosIDPACIENTE: TLongintField;
    qryImpOrcamentosORCAM_DATA: TDateField;
    qryImpOrcamentosORCAM_HORA: TTimeField;
    qryImpOrcamentosPAC_NOME: TStringField;
    qryImpOrcamentosTOTALORCAMENTO: TFloatField;
    qryImpPacientesIDTRATAMENTOS: TLongintField;
    qryImpPacientesPAC_CEL: TStringField;
    qryImpPacientesPAC_DATANASC: TDateField;
    qryImpPacientesPAC_IDPACIENTE: TLongintField;
    qryImpPacientesPAC_NOME: TStringField;
    qryImpPacientesPAC_PROFISSAO: TStringField;
    RxDBGrid1: TRxDBGrid;
    qryImpOrcamentos: TZQuery;
    qryImpItensOrcamentos: TZQuery;
    qryImpPacientes: TZQuery;
    qryEmpresa: TZQuery;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_ConsultarExecute(Sender: TObject);
    procedure act_FecharExecute(Sender: TObject);
    procedure act_imprimirExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1ClosePopup(Sender: TObject; SearchResult: boolean
      );
    procedure SomaOrcamento;
    procedure salvapreco;
  private

  public

  end;

var
  F_cadOrcamentos: TF_cadOrcamentos;

implementation

{$R *.lfm}
uses
  u_dmprincipal, u_consultaOrcamento;

{ TF_cadOrcamentos }


procedure TF_cadOrcamentos.salvapreco;
begin
  with DMPrincipal do
      begin
      qryItensOrcamentos.First;
        while not qryItensOrcamentos.Eof do
            begin
            if qryItensOrcamentos.state in [dsEdit] then
              begin
               qryItensOrcamentosPROCED_VALOR.Value :=  RxDBGrid1.Columns.Items[2].field.AsFloat;
               qryItensOrcamentos.Next;
              end
              else
              begin
                qryItensOrcamentos.Edit;
                qryItensOrcamentosPROCED_VALOR.Value :=  RxDBGrid1.Columns.Items[2].field.AsFloat;
               qryItensOrcamentos.Next;
              end;
            end;

      end;

end;

procedure TF_cadOrcamentos.SomaOrcamento;
var
  soma : Currency;
begin
   soma  := 0;
   with DMPrincipal do
      begin
        qryItensorcamentos.First;
        While not qryItensorcamentos.Eof do
          begin
              soma := soma + qryItensOrcamentosPROCED_VALOR.Value;
              qryItensorcamentos.Next;
          end;
           qryOrcamentos.Edit;
            qryOrcamentosTOTALORCAMENTO.AsCurrency := soma;
      end;

end;

procedure TF_cadOrcamentos.act_NovoExecute(Sender: TObject);
begin
  with DMPrincipal do
    begin
      qryOrcamentos.Close;
      qryOrcamentos.Open;
      qryOrcamentos.Insert;
      qryOrcamentosORCAM_DATA.Value := date;
      qryOrcamentosORCAM_HORA.Value := time;

      qryItensOrcamentos.Close;

    end;
    HabilitaControle;
    Desabilitabotoes;
end;

procedure TF_cadOrcamentos.act_SalvarExecute(Sender: TObject);
begin
  
 // try
    begin
        with DMPrincipal do
         begin
            qryOrcamentos.Edit;
            qryItensOrcamentos.Edit;
            qryOrcamentosPAC_NOME.AsString  :=  RxDBLookupCombo1.Text;
            qryItensOrcamentosIDITENSORCAMENTO.Value := qryOrcamentosIDORCAMENTO.value;
            qryOrcamentosTOTALORCAMENTO.AsFloat := qryItensOrcamentosPROCED_VALOR.Value;

            salvapreco;
            qryOrcamentos.Edit;
            SomaOrcamento;

            qryOrcamentos.Post;
            qryItensOrcamentos.Edit;
            qryItensOrcamentos.Post;

            end;
    //      end
     //except
     //  begin
     //   if MessageDlg('Não possível salvar os dados', mtWarning, [mbOK],0) = mrOk then
     //end;
 //  end;
     HabilitaBotoes;
     DesabilitaControle;
end;

end;

procedure TF_cadOrcamentos.FormShow(Sender: TObject);
begin
  with dmPrincipal do
   begin
     qryPacientes.Active:= True;
     qryOrcamentos.Active:= True;
     qryItensorcamentos.Active:= True;
   End;

    HabilitaBotoes;
    DesabilitaControle;

end;

procedure TF_cadOrcamentos.RxDBLookupCombo1ClosePopup(Sender: TObject;
  SearchResult: boolean);
begin
    with dmprincipal do
       begin
      if  qryOrcamentos.State in [dsInsert,dsEdit] then
         begin
         qryItensorcamentos.close;
         qryItensorcamentos.open;
         qryItensorcamentos.Insert;
         qryItensorcamentosIDITENSORCAMENTO.value := qryOrcamentosIDORCAMENTO.value;

         qryOrcamentos.post;
         qryOrcamentos.Edit;
         qryItensorcamentos.Edit;



         end
       else
        begin
         qryOrcamentos.Edit;;
         qryItensorcamentos.close;
         qryItensorcamentos.open;
         qryItensorcamentos.Insert;
         qryItensorcamentosIDITENSORCAMENTO.value := qryOrcamentosIDORCAMENTO.value;

         qryOrcamentos.post;
         qryOrcamentos.Edit;
         qryItensorcamentos.Edit;


        end;


  end;

end;

procedure TF_cadOrcamentos.act_AlterarExecute(Sender: TObject);
begin
   with DMPrincipal do
    begin
      qryOrcamentos.Edit;
      qryItensorcamentos.Edit;
    end;
    HabilitaControle;
    Desabilitabotoes;
end;

procedure TF_cadOrcamentos.act_CancelarExecute(Sender: TObject);
begin
  with DMPrincipal do
   begin
     qryOrcamentos.Cancel;
     qryItensorcamentos.Cancel;
   end;
   HabilitaBotoes;
   DesabilitaControle;
end;

procedure TF_cadOrcamentos.act_ConsultarExecute(Sender: TObject);
begin
  F_ConsultaOrcamento := TF_ConsultaOrcamento.create(Self);
  F_ConsultaOrcamento.Showmodal;
end;

procedure TF_cadOrcamentos.act_FecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TF_cadOrcamentos.act_imprimirExecute(Sender: TObject);
begin

    qryEmpresa.Open;
    Edit1.Text := dbedit1.Text;
    Edit2.Text := dbedit2.Text;
    begin

       qryImpOrcamentos.Close;
       qryImpOrcamentos.SQL.Text := 'select * from  Orcamentos where idOrcamento = '+ QuotedStr(edit1.Text);
       qryImpOrcamentos.open;

       qryImpPacientes.Close;
       qryImpPacientes.SQL.Text := 'select * from  view_paciente where pac_idpaciente = '+ QuotedStr(edit2.Text);
       qryImpPacientes.Open;

     end;


  frReport1.LoadFromFile('C:\Hiodontolz\Relatorioslz\Orcamento.lrf');
  frReport1.ShowReport;
end;

end.

