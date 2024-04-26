program Hiodontolz;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, u_Principal, zcomponent, u_dmprincipal, u_formPadrao, u_cadPacientes,
  datetimectrls, tachartlazaruspkg, u_cadconvenio, u_cadprofissionais,
  u_cadTratamentos, u_cadProcedimentos, u_consultapadrao, u_consultapaciente,
  u_cadEmpresa, u_consultaprocedimento, u_consultaprofissional, rxnew,
  u_consultatratamento, u_cadOrcamentos, u_consultaOrcamento, u_Movimento,
  indylaz, u_RelatorioMovimento, u_login, u_cadGerente, u_cadusuario, 
u_cadPerfil, u_cadTipocontato, u_consultaPacientetratamento;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TF_login, F_login);
  Application.CreateForm(Tf_principal, f_principal);
  Application.CreateForm(TF_ConsultaPacienteTratamento, 
    F_ConsultaPacienteTratamento);
  Application.Run;
end.

