unit u_cadTipocontato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, DBCtrls,
  StdCtrls, u_formPadrao, RxDBGrid;

type

  { TF_CadTipoContato }

  TF_CadTipoContato = class(TF_Padrao)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_CadTipoContato: TF_CadTipoContato;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_CadTipoContato }

procedure TF_CadTipoContato.act_NovoExecute(Sender: TObject);
begin
   with dmprincipal do
     with qryTipoContato  do
       begin
         Insert;
         PageControl1.ActivePageIndex:=1;
       end;
   HabilitaControle;
   DesabilitaBotoes;
end;

procedure TF_CadTipoContato.act_SalvarExecute(Sender: TObject);
begin
  with dmPrincipal do
   with qryTipoContato do

     begin
         Post;
         PageControl1.ActivePageIndex:=0;
       end;

    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_CadTipoContato.FormShow(Sender: TObject);
begin
     with dmPrincipal do
       with qryTipoContato do
       begin
         Active:= true;
         PageControl1.ActivePageIndex:=0;
       end;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_CadTipoContato.act_AlterarExecute(Sender: TObject);
begin
    with dmprincipal do
       with qryTipoContato do
         begin
          Edit;
          PageControl1.ActivePageIndex:=1;
         end;
    HabilitaControle;
    DesabilitaBotoes;


end;

procedure TF_CadTipoContato.act_CancelarExecute(Sender: TObject);
begin
     with dmPrincipal do
       with qryTipoContato do
       begin
         Cancel;
         PageControl1.ActivePageIndex:=0;
       end;
     HabilitaBotoes;
     DesabilitaControle;
end;

end.

