unit u_Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ActnList,
  StdCtrls, ExtCtrls, SpkToolbar, spkt_Tab, spkt_Pane, spkt_Buttons;

type

  { Tf_principal }

  Tf_principal = class(TForm)
    act_TipoContato: TAction;
    act_Perfil: TAction;
    act_Usuarios: TAction;
    act_movimento: TAction;
    act_Sair: TAction;
    act_cadEmpresa: TAction;
    act_cadOrcamentos: TAction;
    act_Profissionais: TAction;
    act_Tratamentos: TAction;
    act_Procedimentos: TAction;
    act_Convenios: TAction;
    act_Pacientes: TAction;
    ActionList1: TActionList;
    Image32x32: TImageList;
    SpkLargeButton1: TSpkLargeButton;
    SpkLargeButton10: TSpkLargeButton;
    SpkLargeButton11: TSpkLargeButton;
    SpkLargeButton12: TSpkLargeButton;
    SpkLargeButton2: TSpkLargeButton;
    SpkLargeButton3: TSpkLargeButton;
    SpkLargeButton4: TSpkLargeButton;
    SpkLargeButton5: TSpkLargeButton;
    SpkLargeButton6: TSpkLargeButton;
    SpkLargeButton7: TSpkLargeButton;
    SpkLargeButton8: TSpkLargeButton;
    SpkLargeButton9: TSpkLargeButton;
    SpkPane1: TSpkPane;
    SpkPane2: TSpkPane;
    SpkTab1: TSpkTab;
    SpkTab2: TSpkTab;
    SpkToolbar1: TSpkToolbar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure act_cadEmpresaExecute(Sender: TObject);
    procedure act_cadEmpresaUpdate(Sender: TObject);
    procedure act_cadOrcamentosExecute(Sender: TObject);
    procedure act_cadOrcamentosUpdate(Sender: TObject);
    procedure act_ConveniosExecute(Sender: TObject);
    procedure act_ConveniosUpdate(Sender: TObject);
    procedure act_movimentoExecute(Sender: TObject);
    procedure act_movimentoUpdate(Sender: TObject);
    procedure act_PacientesExecute(Sender: TObject);
    procedure act_PacientesUpdate(Sender: TObject);
    procedure act_PerfilExecute(Sender: TObject);
    procedure act_PerfilUpdate(Sender: TObject);
    procedure act_ProcedimentosExecute(Sender: TObject);
    procedure act_ProcedimentosUpdate(Sender: TObject);
    procedure act_ProfissionaisExecute(Sender: TObject);
    procedure act_ProfissionaisUpdate(Sender: TObject);
    procedure act_SairExecute(Sender: TObject);
    procedure act_TipoContatoExecute(Sender: TObject);
    procedure act_TipoContatoUpdate(Sender: TObject);
    procedure act_TratamentosExecute(Sender: TObject);
    procedure act_TratamentosUpdate(Sender: TObject);
    procedure act_UsuariosExecute(Sender: TObject);
    procedure act_UsuariosUpdate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  f_principal: Tf_principal;

implementation

{$R *.lfm}
uses
   u_cadpacientes, u_cadusuario ,u_cadconvenio, u_cadprofissionais, u_cadtratamentos,
   u_cadProcedimentos, u_cadperfil, u_cadEmpresa, u_cadOrcamentos,
   u_Movimento, u_dmprincipal, u_cadTipocontato;






{ Tf_principal }



procedure Tf_principal.act_PacientesExecute(Sender: TObject);
begin
   F_CadPaciente := TF_CadPaciente.Create(Self);
   F_CadPaciente.ShowModal;
end;

procedure Tf_principal.act_PacientesUpdate(Sender: TObject);
begin
    if DMPrincipal.QryLogin.FieldByName('PER_CADPAC').AsString = 'S' then
      act_Pacientes.Enabled := True
    else
       act_Pacientes.Enabled := False;
end;

procedure Tf_principal.act_PerfilExecute(Sender: TObject);
begin
   F_Perfil := TF_Perfil.create(self);
   f_perfil.showmodal;
end;

procedure Tf_principal.act_PerfilUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_CADPERFIL').AsString = 'S' then
      act_Tratamentos.Enabled := True
    else
      act_Tratamentos.Enabled := False;

end;

procedure Tf_principal.act_ProcedimentosExecute(Sender: TObject);
begin
   F_cadProcedimento := TF_cadProcedimento.create(Self);
   F_cadProcedimento.ShowModal;
end;

procedure Tf_principal.act_ProcedimentosUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_CADPROCEDIMENTO').AsString = 'S' then
      act_Procedimentos.Enabled := True
    else
       act_Procedimentos.Enabled := False;
end;

procedure Tf_principal.act_ProfissionaisExecute(Sender: TObject);
begin
    F_cadProfissionais := TF_CadProfissionais.Create(Self);
    F_cadProfissionais.ShowModal;
end;

procedure Tf_principal.act_ProfissionaisUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_CADPROF').AsString = 'S' then
      act_Profissionais.Enabled := True
    else
       act_Profissionais.Enabled := False;
end;

procedure Tf_principal.act_SairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tf_principal.act_TipoContatoExecute(Sender: TObject);
begin
  F_CadTipoContato := TF_CadTipoContato.create(Self);
  F_CadTipoContato.ShowModal;
end;

procedure Tf_principal.act_TipoContatoUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_TIPOCONTATO').AsString = 'S' then
      act_TipoContato.Enabled := True
    else
       act_TipoContato.Enabled := False;
end;

procedure Tf_principal.act_TratamentosExecute(Sender: TObject);
begin
     F_CadTratamentos := TF_CadTratamentos.Create(Self);
     F_CadTratamentos.ShowModal;
end;

procedure Tf_principal.act_TratamentosUpdate(Sender: TObject);
begin
    if DMPrincipal.QryLogin.FieldByName('PER_CADTRATAM').AsString = 'S' then
      act_Tratamentos.Enabled := True
    else
      act_Tratamentos.Enabled := False;
end;

procedure Tf_principal.act_UsuariosExecute(Sender: TObject);
begin
    F_cadUsuario := TF_cadUsuario.create(self);
    F_cadUsuario.ShowModal;
end;

procedure Tf_principal.act_UsuariosUpdate(Sender: TObject);
begin
  if DMPrincipal.QryLogin.FieldByName('PER_CADUSUARIOS').AsString = 'S' then
      act_Usuarios.Enabled := True
    else
      act_Usuarios.Enabled := False;
end;



procedure Tf_principal.FormActivate(Sender: TObject);
begin
with DMPrincipal do
     begin
        with StatusBar1 do
        begin
          Panels[0].Text := '  ' + FormatDateTime(' hh:nn:ss ', Now);
          Panels[1].Text := FormatDateTime(' dddd ", " dd " de " mmmm " de " yyyy', Now);
          //Panels[2].Text := '  ' +'Usuário: '+ QryLoginUSU_LOGIN.Value;
        end;

     end;
end;

procedure Tf_principal.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    Application.Terminate;
end;

procedure Tf_principal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := '  ' + FormatDateTime(' hh:nn:ss', Now);
end;

procedure Tf_principal.act_ConveniosExecute(Sender: TObject);
begin
    F_CadConvenio := TF_CadConvenio.Create(Self);
    F_CadConvenio.ShowModal;
end;

procedure Tf_principal.act_ConveniosUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_CADCONVENIO').AsString = 'S' then
      act_Convenios.Enabled := True
    else
       act_Convenios.Enabled := False;
end;

procedure Tf_principal.act_movimentoExecute(Sender: TObject);
begin
    F_Movimento := TF_Movimento.Create(self);
    F_Movimento.ShowModal;
end;

procedure Tf_principal.act_movimentoUpdate(Sender: TObject);
begin
     if DMPrincipal.QryLogin.FieldByName('PER_MOVIMENTO').AsString = 'S' then
      act_movimento.Enabled := True
    else
       act_movimento.Enabled := False;
end;

procedure Tf_principal.act_cadEmpresaExecute(Sender: TObject);
begin
    F_cadEmpresa := TF_cadEmpresa.Create(Self);
    F_cadEmpresa.ShowModal;
end;

procedure Tf_principal.act_cadEmpresaUpdate(Sender: TObject);
begin
   if DMPrincipal.QryLogin.FieldByName('PER_CADEMPRESA').AsString = 'S' then
      act_cadEmpresa.Enabled := True
    else
       act_cadEmpresa.Enabled := False;
end;

procedure Tf_principal.act_cadOrcamentosExecute(Sender: TObject);
begin
   F_cadOrcamentos := TF_cadOrcamentos.create(Self);
   F_cadOrcamentos.ShowModal;
end;

procedure Tf_principal.act_cadOrcamentosUpdate(Sender: TObject);
begin
    if DMPrincipal.QryLogin.FieldByName('PER_CADORCAMENTO').AsString = 'S' then
      act_cadOrcamentos.Enabled := True
    else
       act_cadOrcamentos.Enabled := False;
end;

end.

