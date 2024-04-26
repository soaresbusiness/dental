unit u_cadPacientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, ActnList, ComCtrls, DBExtCtrls, u_formPadrao, ZDataset, DB,
  DBDateTimePicker, LR_Class, LR_DBSet, ACBrEnterTab, ACBrCEP, LR_DSet;

type

  { TF_cadPaciente }

  TF_cadPaciente = class(TF_Padrao)
    ACBrCEP1: TACBrCEP;
    act_Imprimiranaminiese: TAction;
    act_buscarCep: TAction;
    act_imprimir: TAction;
    act_consultar: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    botaoConsultar: TBitBtn;
    DBEdit10: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    dsEmpresa: TDataSource;
    DBEdit23: TDBEdit;
    dsImppaciente: TDataSource;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup14: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBText1: TDBText;
    edtcon: TEdit;
    frDBCidade: TfrDBDataSet;
    frDBImpPacientes: TfrDBDataSet;
    frDBEmpresa: TfrDBDataSet;
    frDBPaciente: TfrDBDataSet;
    frReport1: TfrReport;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    qryImpPacientesCODIGO_PACIENTE: TLongintField;
    qryImpPacientesESTA_EM_TRATAMENTO_MEDICO: TStringField;
    qryImpPacientesESTA_GRAVIDA: TStringField;
    qryImpPacientesE_DIABETICO: TStringField;
    qryImpPacientesE_HEMOFILICO: TStringField;
    qryImpPacientesE_HIPERTENSO: TStringField;
    qryImpPacientesJA_SUBMETIDO_ANESTESIA: TStringField;
    qryImpPacientesJA_TEVE_ALGUMA_DOENCA: TStringField;
    qryImpPacientesJA_TEVE_HEMORRAGIA: TStringField;
    qryImpPacientesPAC_ANIVERSARIO: TDateField;
    qryImpPacientesPAC_BAIRRO: TStringField;
    qryImpPacientesPAC_CEL: TStringField;
    qryImpPacientesPAC_CEP: TStringField;
    qryImpPacientesPAC_CIDADECODIGO: TLongintField;
    qryImpPacientesPAC_CODIGO: TLongintField;
    qryImpPacientesPAC_CODIGOAUXILIAR: TStringField;
    qryImpPacientesPAC_COMPLEMENTO: TStringField;
    qryImpPacientesPAC_CPFCNPJ: TStringField;
    qryImpPacientesPAC_DATACAD: TDateField;
    qryImpPacientesPAC_DATANASC: TDateField;
    qryImpPacientesPAC_EMAIL: TStringField;
    qryImpPacientesPAC_ENDERECO: TStringField;
    qryImpPacientesPAC_ESTADOCIVIL: TStringField;
    qryImpPacientesPAC_FACEBOOK: TStringField;
    qryImpPacientesPAC_IDCONVENIO: TLongintField;
    qryImpPacientesPAC_IDPACIENTE: TLongintField;
    qryImpPacientesPAC_INDICADO_POR: TStringField;
    qryImpPacientesPAC_INSTAGRAM: TStringField;
    qryImpPacientesPAC_MUNICIPIO: TStringField;
    qryImpPacientesPAC_NOME: TStringField;
    qryImpPacientesPAC_NUMERO: TStringField;
    qryImpPacientesPAC_OBSERVACOES: TBlobField;
    qryImpPacientesPAC_PROFISSAO: TStringField;
    qryImpPacientesPAC_SEXO: TStringField;
    qryImpPacientesPAC_SITUACAO: TStringField;
    qryImpPacientesPAC_TIPOCONTATO: TStringField;
    qryImpPacientesPAC_UF: TStringField;
    qryImpPacientesQUAL_ALERGIA: TStringField;
    qryImpPacientesQUAL_DOENCA: TStringField;
    qryImpPacientesQUAL_DOENCA_CORACAO: TStringField;
    qryImpPacientesQUAL_MEDICAMENTO: TStringField;
    qryImpPacientesQUAL_TRATAMENTO_MEDICO: TStringField;
    qryImpPacientesQUANDO_FERE: TStringField;
    qryImpPacientesSEUS_PES_INCHAM: TStringField;
    qryImpPacientesSOFRE_DOENCA_CORACAO: TStringField;
    qryImpPacientesSOFRE_EPILEPSIA: TStringField;
    qryImpPacientesTEM_ALGO_DECLARAR: TStringField;
    qryImpPacientesTEM_ALGUM_ALERGIA: TStringField;
    qryImpPacientesTEM_ALGUM_VICIO: TStringField;
    qryImpPacientesTEM_TOSSE_PERSISTENTE: TStringField;
    qryImpPacientesTOMA_ALGUM_MEDICAMENTO: TStringField;
    qryImpPacientesVICIO_QUAL: TStringField;
    TabAnaminese: TTabSheet;
    Tabdados: TTabSheet;
    TabSheet1: TTabSheet;
    qryImpPacientes: TZQuery;

    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_buscarCepExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_consultarExecute(Sender: TObject);
    procedure act_ImprimiranaminieseExecute(Sender: TObject);
    procedure act_imprimirExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public

  end;

var
  F_cadPaciente: TF_cadPaciente;

implementation

{$R *.lfm}
uses
  u_dmprincipal, u_consultapaciente;

{ TF_cadPaciente }


procedure TF_cadPaciente.act_consultarExecute(Sender: TObject);
begin
   F_ConsultaPaciente := TF_ConsultaPaciente.Create(Self);
   F_ConsultaPaciente.ShowModal;
end;

procedure TF_cadPaciente.act_ImprimiranaminieseExecute(Sender: TObject);
begin
  edtcon.Text := DBEdit1.Text;
  With dmprincipal do
    begin
      qryImpPacientes.Close;
      qryImpPacientes.SQL.Text := 'select * from Pacientes where PAC_IDPACIENTE = '+ QuotedStr(EdtCon.Text);
      qryImpPacientes.Open;
    end;


  frReport1.LoadFromFile('c:\Hiodontolz\Relatorioslz\Anaminese.lrf');
  frReport1.ShowReport;
end;

procedure TF_cadPaciente.act_imprimirExecute(Sender: TObject);
begin
  frReport1.LoadFromFile('c:\Hiodontolz\Relatorioslz\Pacientes.lrf');
  frReport1.ShowReport;
end;

procedure TF_cadPaciente.act_AlterarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
         qryPacientes.Edit;
      end;
    HabilitaControle;
    DesabilitaBotoes;

end;

procedure TF_cadPaciente.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  I : Integer ;
  v_cep, v_logradouro, v_bairro, v_municipio, v_uf : String;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage( 'Nenhum Endereço encontrado' )
  else
   begin
     //Memo1.Lines.Add( IntToStr(ACBrCEP1.Enderecos.Count) + ' Endereço(s) encontrado(s)');
     //Memo1.Lines.Add('');

     For I := 0 to ACBrCEP1.Enderecos.Count-1 do
     begin
       with ACBrCEP1.Enderecos[I] do
       begin
          v_cep         := (CEP);
          v_logradouro  := ( Tipo_Logradouro  + Logradouro);
          v_bairro      := (Bairro);
          v_uf          := (UF);
          v_municipio   := (Municipio);

          DBEdit8.Text := v_cep;
          DBEdit7.Text  := v_bairro;
          DBEdit4.Text  := v_logradouro;
          DBEdit10.Text := v_uf;
          DBEdit9.Text  := v_municipio;

       end ;
     end ;
   end ;

end;


procedure TF_cadPaciente.act_buscarCepExecute(Sender: TObject);
begin
   try
     ACBrCEP1.BuscarPorCEP(DBEdit8.Text);

      except
         On E : Exception do
         begin
         ShowMessage(E.Message);
         end ;

      end ;
      DBEdit5.SetFocus;
end;

procedure TF_cadPaciente.act_CancelarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
         qryPacientes.Cancel;
      end;
    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_cadPaciente.act_NovoExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
         qryPacientes.open;
         qryPacientes.Insert;
         qryPacientesPAC_DATACAD.Value:= date;
         DBEdit2.SetFocus;

      end;
     HabilitaControle;
     DesabilitaBotoes;
end;

procedure TF_cadPaciente.act_SalvarExecute(Sender: TObject);
begin
 // try
     with dmPrincipal do
       begin
         if qryPacientes.State in [dsInsert,dsEdit] then
           begin
            qryPacientes.Post;

           end
         else
           begin
             qryPacientes.Edit;
             qryPacientes.Post;

       end;
  // except
     //if MessageDlg('Não foi possível Salvar os dados.', mtWarning, [mbOK, mbCancel],0) = mrOk then
     // Abort ;
   //   On e: Exception do
   //     begin
   //       ShowMessage(e.ClassName + #13 + e.Message );
   //     end;
   //end;
   HabilitaBotoes;
   DesabilitaControle;
end;

end;

procedure TF_cadPaciente.FormShow(Sender: TObject);
begin
   With dmPrincipal do
     begin
         qryTipoContato.Active:= True;
         qryConvenio.Active   := True;

     end;
   PageControl1.ActivePageIndex:=0;
   HabilitaBotoes;
   DesabilitaControle;
end;

end.

