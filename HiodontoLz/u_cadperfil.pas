unit u_cadPerfil;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ComCtrls, u_formPadrao, RxDBGrid;

type

  { TF_Perfil }

  TF_Perfil = class(TF_Padrao)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  F_Perfil: TF_Perfil;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_Perfil }

procedure TF_Perfil.act_FecharExecute(Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TF_Perfil.act_AlterarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
       with qryPerfil do
         begin
            Edit;
         end;

    end;
    PageControl1.ActivePageIndex:= 1;
    HabilitaControle;
    DesabilitaBotoes;

end;

procedure TF_Perfil.act_CancelarExecute(Sender: TObject);
begin
   with dmPrincipal do
     begin
      with qryPerfil do
        begin
          Cancel;
        end;
     end;
   HabilitaBotoes;
   DesabilitaControle;
end;

procedure TF_Perfil.act_NovoExecute(Sender: TObject);
begin
  with dmPrincipal do
    begin
     with qryPerfil do
       begin
          Open;
          Insert;
    end;
     PageControl1.ActivePageIndex := 0;
     HabilitaControle;
     DesabilitaBotoes;
  end;

end;

procedure TF_Perfil.act_SalvarExecute(Sender: TObject);
begin
     with dmPrincipal do
       begin
        with qryPerfil do
          begin
           post;
           ApplyUpdates;
          end;
       end;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_Perfil.FormShow(Sender: TObject);
begin
   with dmPrincipal do
     begin
      with qryPerfil  do
        begin
         Active:=True;
        end;
     end;
   HabilitaBotoes;
   DesabilitaControle;
end;

end.

