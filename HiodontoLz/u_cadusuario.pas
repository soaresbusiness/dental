unit u_cadusuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, DBCtrls,
  StdCtrls, u_formPadrao, RxDBGrid;

type

  { TF_cadUsuario }

  TF_cadUsuario = class(TF_Padrao)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_FecharExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_cadUsuario: TF_cadUsuario;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_cadUsuario }

procedure TF_cadUsuario.act_FecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TF_cadUsuario.act_AlterarExecute(Sender: TObject);
begin
   with dmPrincipal do
      begin
        qryUsuarios.Edit;
      end;
     HabilitaControle;
     DesabilitaBotoes;
end;

procedure TF_cadUsuario.act_CancelarExecute(Sender: TObject);
begin
   with dmPrincipal do
      begin
        qryUsuarios.Cancel;
      end;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_cadUsuario.act_NovoExecute(Sender: TObject);
begin
  with dmPrincipal do
   begin
     qryUsuarios.Insert;
     qryUsuariosUSU_DATACAD.Value:= Date;
   end;
      HabilitaControle;
      DesabilitaBotoes;

end;

procedure TF_cadUsuario.act_SalvarExecute(Sender: TObject);
begin
  with dmPrincipal do
   begin
     qryUsuarios.Post;
     qryUsuarios.ApplyUpdates;
   end;
   HabilitaBotoes;
   DesabilitaControle;
end;

procedure TF_cadUsuario.FormShow(Sender: TObject);
begin
   with dmPrincipal  do
    begin
      qryUsuarios.Active:= True;
      qryPerfil.Active:= True;
    end;
   HabilitaBotoes;
   DesabilitaControle;
end;

end.

