unit u_dmprincipal;

{$mode objfpc}{$H+}

interface

uses
  IniFiles, Classes, SysUtils, DB,Dialogs, ZConnection, ZDataset, ZAbstractDataset, ZSqlUpdate;

type

  { TdmPrincipal }

  TdmPrincipal = class(TDataModule)
    conexao: TZConnection;
    dsTipoContato: TDataSource;
    dsPerfil: TDataSource;
    dsUsuarios: TDataSource;
    dsGerentes: TDataSource;
    dsLogin: TDataSource;
    dsSomacartaodebito: TDataSource;
    dsSomaTotalGeral: TDataSource;
    dsMovimento: TDataSource;
    dsFuncao: TDataSource;
    dsSomaTratamento: TDataSource;
    dsEmpresa: TDataSource;
    dsCidade: TDataSource;
    dsConvenio: TDataSource;
    dsItensOrcamentos: TDataSource;
    dsProfissionais: TDataSource;
    dsPacientes: TDataSource;
    dsProcedimentos: TDataSource;
    dsItenstratamentos: TDataSource;
    dsConsultatratamentos: TDataSource;
    dsTratamentos: TDataSource;
    dsOrcamentos: TDataSource;
    FloatField2: TFloatField;
    qryCidadeCODIGO: TLongintField;
    qryCidadeCODIGO_IBGE: TStringField;
    qryCidadeNOME: TStringField;
    qryCidadePAIS: TStringField;
    qryCidadeUF: TStringField;
    qryConsultatratamentosHORA: TTimeField;
    qryConsultatratamentosIDTRATAMENTOS: TLongintField;
    qryConsultatratamentosPAC_IDPACIENTE: TLongintField;
    qryConsultatratamentosPAC_NOME: TStringField;
    qryConsultatratamentosPROFIS_IDPROFISSIONAL: TLongintField;
    qryConsultatratamentosSITUACAO: TStringField;
    qryConsultatratamentosTOTALGERAL: TFloatField;
    qryConsultatratamentosTRATAM_DATA: TDateField;
    qryConvenioCONVENIO: TStringField;
    qryConvenioCONVENIO_DATA: TDateField;
    qryConvenioIDCONVENIO: TLongintField;
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
    qryFuncaoFUNCAO: TStringField;
    qryFuncaoIDFUNCAO: TLongintField;
    qryItensorcamentosDATA_ITENORCAMENTO: TDateField;
    qryItensorcamentosIDITEM: TLongintField;
    qryItensorcamentosIDITENSORCAMENTO: TLongintField;
    qryItensorcamentosPROCED_ID: TLongintField;
    qryItensorcamentosPROCED_VALOR: TFloatField;
    qryItenstratamentosFACE: TStringField;
    qryItenstratamentosIDDENTE: TLongintField;
    qryItenstratamentosIDITEM: TLargeintField;
    qryItenstratamentosIDITEMTRATAMENTO: TLongintField;
    qryItenstratamentosIDPROCEDIMENTO: TLongintField;
    qryItenstratamentosITENS_DATA: TDateField;
    qryItenstratamentosITTENS_HORA: TTimeField;
    qryItenstratamentosPROCED_VALOR: TFloatField;
    qryItenstratamentosPROFIS_IDPROFISSIONAL: TLongintField;
    qryItenstratamentosSITUACAO: TStringField;
    qryLoginPERFIL_ID: TLongintField;
    qryLoginPER_AGENDA: TStringField;
    qryLoginPER_CADCONVENIO: TStringField;
    qryLoginPER_CADDEPARTAMENTO: TStringField;
    qryLoginPER_CADEMPRESA: TStringField;
    qryLoginPER_CADGERENTES: TStringField;
    qryLoginPER_CADORCAMENTO: TStringField;
    qryLoginPER_CADPAC: TStringField;
    qryLoginPER_CADPERFIL: TStringField;
    qryLoginPER_CADPROCEDIMENTO: TStringField;
    qryLoginPER_CADPROD: TStringField;
    qryLoginPER_CADPROF: TStringField;
    qryLoginPER_CADTRATAM: TStringField;
    qryLoginPER_CADUSUARIOS: TStringField;
    qryLoginPER_CAIXA: TStringField;
    qryLoginPER_CONTAPAG: TStringField;
    qryLoginPER_CONTAREG: TStringField;
    qryLoginPER_DATA_ALT: TDateField;
    qryLoginPER_DATA_HAB: TDateField;
    qryLoginPER_DATA_INC: TDateField;
    qryLoginPER_MARCA: TStringField;
    qryLoginPER_MOVIMENTO: TStringField;
    qryLoginPER_NIVEL: TStringField;
    qryLoginPER_NIVELDESCRICAO: TStringField;
    qryLoginPER_OCULTAR: TStringField;
    qryLoginPER_PROC: TStringField;
    qryLoginPER_STATUS: TStringField;
    qryLoginPER_TIPOCONTATO: TStringField;
    qryLoginUSU_DATAALT: TDateField;
    qryLoginUSU_DATACAD: TDateField;
    qryLoginUSU_DATAHAB: TDateField;
    qryLoginUSU_DEPARTAMENTO_ID: TLongintField;
    qryLoginUSU_IDUSUARIO: TLongintField;
    qryLoginUSU_LOGIN: TStringField;
    qryLoginUSU_MARCA: TStringField;
    qryLoginUSU_NIVEL: TStringField;
    qryLoginUSU_NOME: TStringField;
    qryLoginUSU_SENHA: TStringField;
    qryMovimentoC_VALOR_RESTO: TCurrencyField;
    qryMovimentoIDMOVIMENTO: TLongintField;
    qryMovimentoIDPACIENTE: TLongintField;
    qryMovimentoIDTRATAMENTO: TLongintField;
    qryMovimentoMEIO_PAGAMENTO: TStringField;
    qryMovimentoMOV_DATA: TDateField;
    qryMovimentoMOV_HORA: TTimeField;
    qryMovimentoN_PACELAS: TLongintField;
    qryMovimentoPAC_NOME: TStringField;
    qryMovimentoSITUACAO: TStringField;
    qryMovimentoTOTALCARTAOCREDITO: TFloatField;
    qryMovimentoTOTALCARTAODEBITO: TFloatField;
    qryMovimentoTOTALDIHEIRO: TFloatField;
    qryMovimentoTOTALGERAL: TFloatField;
    qryMovimentoTOTALPIX: TFloatField;
    qryMovimentoVALOR_RECEBIDO: TFloatField;
    qryMovimentoVALOR_RESTO: TFloatField;
    qryOrcamentosIDORCAMENTO: TLongintField;
    qryOrcamentosIDPACIENTE: TLongintField;
    qryOrcamentosORCAM_DATA: TDateField;
    qryOrcamentosORCAM_HORA: TTimeField;
    qryOrcamentosPAC_NOME: TStringField;
    qryOrcamentosTOTALORCAMENTO: TFloatField;
    qryPacientesCODIGO_PACIENTE: TLongintField;
    qryPacientesESTA_EM_TRATAMENTO_MEDICO: TStringField;
    qryPacientesESTA_GRAVIDA: TStringField;
    qryPacientesE_DIABETICO: TStringField;
    qryPacientesE_HEMOFILICO: TStringField;
    qryPacientesE_HIPERTENSO: TStringField;
    qryPacientesJA_SUBMETIDO_ANESTESIA: TStringField;
    qryPacientesJA_TEVE_ALGUMA_DOENCA: TStringField;
    qryPacientesJA_TEVE_HEMORRAGIA: TStringField;
    qryPacientesPAC_ANIVERSARIO: TDateField;
    qryPacientesPAC_BAIRRO: TStringField;
    qryPacientesPAC_CEL: TStringField;
    qryPacientesPAC_CEP: TStringField;
    qryPacientesPAC_CIDADECODIGO: TLongintField;
    qryPacientesPAC_CODIGO: TLongintField;
    qryPacientesPAC_CODIGOAUXILIAR: TStringField;
    qryPacientesPAC_COMPLEMENTO: TStringField;
    qryPacientesPAC_CPFCNPJ: TStringField;
    qryPacientesPAC_DATACAD: TDateField;
    qryPacientesPAC_DATANASC: TDateField;
    qryPacientesPAC_EMAIL: TStringField;
    qryPacientesPAC_ENDERECO: TStringField;
    qryPacientesPAC_ESTADOCIVIL: TStringField;
    qryPacientesPAC_FACEBOOK: TStringField;
    qryPacientesPAC_IDCONVENIO: TLongintField;
    qryPacientesPAC_IDPACIENTE: TLongintField;
    qryPacientesPAC_INDICADO_POR: TStringField;
    qryPacientesPAC_INSTAGRAM: TStringField;
    qryPacientesPAC_MUNICIPIO: TStringField;
    qryPacientesPAC_NOME: TStringField;
    qryPacientesPAC_NUMERO: TStringField;
    qryPacientesPAC_OBSERVACOES: TBlobField;
    qryPacientesPAC_PROFISSAO: TStringField;
    qryPacientesPAC_SEXO: TStringField;
    qryPacientesPAC_SITUACAO: TStringField;
    qryPacientesPAC_TIPOCONTATO: TStringField;
    qryPacientesPAC_UF: TStringField;
    qryPacientesQUAL_ALERGIA: TStringField;
    qryPacientesQUAL_DOENCA: TStringField;
    qryPacientesQUAL_DOENCA_CORACAO: TStringField;
    qryPacientesQUAL_MEDICAMENTO: TStringField;
    qryPacientesQUAL_TRATAMENTO_MEDICO: TStringField;
    qryPacientesQUANDO_FERE: TStringField;
    qryPacientesSEUS_PES_INCHAM: TStringField;
    qryPacientesSOFRE_DOENCA_CORACAO: TStringField;
    qryPacientesSOFRE_EPILEPSIA: TStringField;
    qryPacientesTEM_ALGO_DECLARAR: TStringField;
    qryPacientesTEM_ALGUM_ALERGIA: TStringField;
    qryPacientesTEM_ALGUM_VICIO: TStringField;
    qryPacientesTEM_TOSSE_PERSISTENTE: TStringField;
    qryPacientesTOMA_ALGUM_MEDICAMENTO: TStringField;
    qryPacientesVICIO_QUAL: TStringField;
    qryPerfilPERFIL_ID: TLongintField;
    qryPerfilPER_AGENDA: TStringField;
    qryPerfilPER_CADCONVENIO: TStringField;
    qryPerfilPER_CADDEPARTAMENTO: TStringField;
    qryPerfilPER_CADEMPRESA: TStringField;
    qryPerfilPER_CADGERENTES: TStringField;
    qryPerfilPER_CADORCAMENTO: TStringField;
    qryPerfilPER_CADPAC: TStringField;
    qryPerfilPER_CADPERFIL: TStringField;
    qryPerfilPER_CADPROCEDIMENTO: TStringField;
    qryPerfilPER_CADPROD: TStringField;
    qryPerfilPER_CADPROF: TStringField;
    qryPerfilPER_CADTRATAM: TStringField;
    qryPerfilPER_CADUSUARIOS: TStringField;
    qryPerfilPER_CAIXA: TStringField;
    qryPerfilPER_CONTAPAG: TStringField;
    qryPerfilPER_CONTAREG: TStringField;
    qryPerfilPER_DATA_ALT: TDateField;
    qryPerfilPER_DATA_HAB: TDateField;
    qryPerfilPER_DATA_INC: TDateField;
    qryPerfilPER_MARCA: TStringField;
    qryPerfilPER_MOVIMENTO: TStringField;
    qryPerfilPER_NIVEL: TStringField;
    qryPerfilPER_NIVELDESCRICAO: TStringField;
    qryPerfilPER_OCULTAR: TStringField;
    qryPerfilPER_PROC: TStringField;
    qryPerfilPER_STATUS: TStringField;
    qryPerfilPER_TIPOCONTATO: TStringField;
    qryProcedimentosPROCEDIMENTO: TStringField;
    qryProcedimentosPROCED_DATA: TDateField;
    qryProcedimentosPROCED_ID: TLongintField;
    qryProcedimentosVALOR: TFloatField;
    qryProfissionais: TZQuery;
    qryProfissionaisPROFIS_APELIDO: TStringField;
    qryProfissionaisPROFIS_BAIRRO: TStringField;
    qryProfissionaisPROFIS_CEL: TStringField;
    qryProfissionaisPROFIS_CEP: TStringField;
    qryProfissionaisPROFIS_CPF: TStringField;
    qryProfissionaisPROFIS_CRO: TStringField;
    qryProfissionaisPROFIS_DATACAD: TDateField;
    qryProfissionaisPROFIS_DATANASC: TDateField;
    qryProfissionaisPROFIS_EMAIL: TStringField;
    qryProfissionaisPROFIS_ENDERECO: TStringField;
    qryProfissionaisPROFIS_FOTO: TBlobField;
    qryProfissionaisPROFIS_IDCIDADE: TLongintField;
    qryProfissionaisPROFIS_IDFUNCAO: TLongintField;
    qryProfissionaisPROFIS_IDPROFISSIONAL: TLongintField;
    qryProfissionaisPROFIS_MUNICIPIO: TStringField;
    qryProfissionaisPROFIS_NOME: TStringField;
    qryConvenio: TZQuery;
    qryEmpresa: TZQuery;
    qryProcedimentos: TZQuery;
    qryPerfil: TZQuery;
    qrySomaTratamentoSubtotal: TFloatField;
    qryTipoContatoCONTATO: TStringField;
    qryTipoContatoIDTIPO_CONTATO: TLongintField;
    qryTratamentos: TZQuery;
    qryOrcamentos: TZQuery;
    qryItenstratamentos: TZQuery;
    qryTratamentosHORA: TTimeField;
    qryTratamentosIDTRATAMENTOS: TLongintField;
    qryTratamentosPAC_IDPACIENTE: TLongintField;
    qryTratamentosPAC_NOME: TStringField;
    qryTratamentosPROFIS_IDPROFISSIONAL: TLongintField;
    qryTratamentosSITUACAO: TStringField;
    qryTratamentosTOTALGERAL: TFloatField;
    qryTratamentosTRATAM_DATA: TDateField;
    qryUsuariosUSU_DATAALT: TDateField;
    qryUsuariosUSU_DATACAD: TDateField;
    qryUsuariosUSU_DATAHAB: TDateField;
    qryUsuariosUSU_DEPARTAMENTO_ID: TLongintField;
    qryUsuariosUSU_IDUSUARIO: TLongintField;
    qryUsuariosUSU_LOGIN: TStringField;
    qryUsuariosUSU_MARCA: TStringField;
    qryUsuariosUSU_NIVEL: TStringField;
    qryUsuariosUSU_NOME: TStringField;
    qryUsuariosUSU_SENHA: TStringField;
    SomacartaodebitoSomacartaodebito: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    qryItensorcamentos: TZQuery;
    StringField3: TStringField;
    qryTipoContato: TZQuery;
    qryConsultatratamentos: TZQuery;
    qrySomaTratamento: TZQuery;
    qryPacientes: TZQuery;
    qryFuncao: TZQuery;
    qryMovimento: TZQuery;
    qrySomatotalGeral: TZQuery;
    Somacartaodebito: TZQuery;
    qryLogin: TZQuery;
    upLogin: TZUpdateSQL;
    qryGerentes: TZQuery;
    qryUsuarios: TZQuery;

    procedure qryConvenioAfterPost(DataSet: TDataSet);
    procedure qryEmpresaAfterPost(DataSet: TDataSet);
    procedure qryFuncaoAfterPost(DataSet: TDataSet);
    procedure qryItensorcamentosAfterPost(DataSet: TDataSet);
    procedure qryItensorcamentosAfterScroll(DataSet: TDataSet);
    procedure qryItenstratamentosAfterPost(DataSet: TDataSet);
    procedure qryLoginAfterPost(DataSet: TDataSet);
    procedure qryMovimentoAfterPost(DataSet: TDataSet);
    procedure qryMovimentoCalcFields(DataSet: TDataSet);
    Procedure Conectardb;
    procedure qryOrcamentosAfterPost(DataSet: TDataSet);
    procedure qryPacientesAfterPost(DataSet: TDataSet);
    procedure qryPerfilAfterPost(DataSet: TDataSet);
    procedure qryProcedimentosAfterPost(DataSet: TDataSet);
    procedure qryProfissionaisAfterPost(DataSet: TDataSet);
    procedure qryTipoContatoAfterPost(DataSet: TDataSet);
    procedure qryTratamentosAfterPost(DataSet: TDataSet);
    procedure qryUsuariosAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.lfm}

{ TdmPrincipal }
Procedure TdmPrincipal.Conectardb;
var
  ArquivoINI : TIniFile;
  begin

    try

       with Conexao do
       begin
        ArquivoINI := TIniFile.Create('c:\hiodontoLz\hiodontolz.ini');

        conexao.Connected       := False;
        conexao.hostname        := ArquivoINI.ReadString('hiodontoLZ', 'hostname','');
        conexao.port            := ArquivoINI.ReadInteger('hiodontoLz', 'port', 0);
        conexao.LibraryLocation := ArquivoINI.ReadString('hiodontoLz', 'libratylocation', '');
        conexao.database        := ArquivoINI.ReadString('hiodontoLz', 'database', '');
//        conexao.user            := ArquivoINI.ReadString('hiodonto', 'user', '');
//        conexao.password        := ArquivoINI.ReadString('hiodonto', 'password', '');
        conexao.Connected       := True;
        end
    except
         on E:Exception do
         MessageDlg('Erro ao conectar!'#13'Erro: ' + e.Message, mtError, [mbOK], 0);
    end;

     FreeAndNil(ArquivoINI);

end;

procedure TdmPrincipal.qryOrcamentosAfterPost(DataSet: TDataSet);
begin
    qryOrcamentos.ApplyUpdates;
end;

procedure TdmPrincipal.qryPacientesAfterPost(DataSet: TDataSet);
begin
   qryPacientes.ApplyUpdates;
end;

procedure TdmPrincipal.qryPerfilAfterPost(DataSet: TDataSet);
begin
    qryPerfil.ApplyUpdates;
end;

procedure TdmPrincipal.qryProcedimentosAfterPost(DataSet: TDataSet);
begin
    qryProcedimentos.ApplyUpdates;
end;

procedure TdmPrincipal.qryProfissionaisAfterPost(DataSet: TDataSet);
begin
    qryProfissionais.ApplyUpdates;
end;

procedure TdmPrincipal.qryTipoContatoAfterPost(DataSet: TDataSet);
begin
    qryTipoContato.ApplyUpdates;
end;

procedure TdmPrincipal.qryTratamentosAfterPost(DataSet: TDataSet);
begin
    qryTratamentos.ApplyUpdates;
end;

procedure TdmPrincipal.qryUsuariosAfterPost(DataSet: TDataSet);
begin
    qryUsuarios.ApplyUpdates;
end;

procedure TdmPrincipal.qryItensorcamentosAfterScroll(DataSet: TDataSet);
begin
    qryItensorcamentos.Edit;
end;

procedure TdmPrincipal.qryItenstratamentosAfterPost(DataSet: TDataSet);
begin
   qryItenstratamentos.ApplyUpdates;

end;

procedure TdmPrincipal.qryLoginAfterPost(DataSet: TDataSet);
begin
    qryLogin.ApplyUpdates;
end;

procedure TdmPrincipal.qryMovimentoAfterPost(DataSet: TDataSet);
begin
   qryMovimento.ApplyUpdates;
end;

procedure TdmPrincipal.qryConvenioAfterPost(DataSet: TDataSet);
begin
   qryConvenio.ApplyUpdates;
end;

procedure TdmPrincipal.qryEmpresaAfterPost(DataSet: TDataSet);
begin
  qryEmpresa.ApplyUpdates;
end;

procedure TdmPrincipal.qryFuncaoAfterPost(DataSet: TDataSet);
begin
    qryFuncao.ApplyUpdates;
end;

procedure TdmPrincipal.qryItensorcamentosAfterPost(DataSet: TDataSet);
begin
     qryItensorcamentos.ApplyUpdates;
end;

procedure TdmPrincipal.qryMovimentoCalcFields(DataSet: TDataSet);
begin
   qryMovimentoC_VALOR_RESTO.Value:= qryMovimentoVALOR_RECEBIDO.Value - qryMovimentoTOTALGERAL.Value;
end;

end.

