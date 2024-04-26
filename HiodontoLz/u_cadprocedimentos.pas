unit u_cadProcedimentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, ComCtrls, DBGrids, StdCtrls, DB, DBCtrls, u_formPadrao, RxDBGrid,
  ACBrEnterTab;

type

  { TF_cadProcedimento }

  TF_cadProcedimento = class(TF_Padrao)
    act_consultar: TAction;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edtcon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_consultarExecute(Sender: TObject);
    procedure act_FecharExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_cadProcedimento: TF_cadProcedimento;

implementation

{$R *.lfm}

{ TF_cadProcedimento }
uses

  u_dmprincipal;

procedure TF_cadProcedimento.act_FecharExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TF_cadProcedimento.act_AlterarExecute(Sender: TObject);
begin
    with dmPrincipal do
     begin
       qryProcedimentos.Edit;
     end;
    PageControl1.ActivePageIndex:=1;
    HabilitaControle;
    DesabilitaBotoes;
end;

procedure TF_cadProcedimento.act_CancelarExecute(Sender: TObject);
begin
    with dmPrincipal do
    begin
      qryProcedimentos.Cancel;
    end;
    PageControl1.ActivePageIndex:=0;
    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_cadProcedimento.act_consultarExecute(Sender: TObject);
begin
  try
    Begin
      With DMPrincipal do
        begin
        qryprocedimentos.Close;
        //qryconvenio.SQL.text :=  'select * from Convenios where CONVENIO = '+ QuotedStr(EdtCon.Text);
        qryProcedimentos.SQL.text :=  'select * from PROCEDIMENTOS where PROCEDIMENTO like '+#39+'%'+edtcon.Text+'%'+#39;
        qryProcedimentos.Open;
        end;
    end;

  except
    if MessageDlg('Não foi possível localizar o Procedimento', mtWarning, [mbOK, mbCancel],0) = mrOk then
     Abort;

  end;
end;

procedure TF_cadProcedimento.act_NovoExecute(Sender: TObject);
begin
   with dmPrincipal do
    begin
      qryProcedimentos.Insert;
      qryProcedimentosPROCED_DATA.value := date;

    end;
   PageControl1.ActivePageIndex:= 1;
   HabilitaControle;
   DesabilitaBotoes;
end;

procedure TF_cadProcedimento.act_SalvarExecute(Sender: TObject);
begin
    with dmPrincipal do
    begin
       if qryProcedimentos.State in [dsEdit] then
        begin
          qryProcedimentos.Post;
          qryProcedimentos.ApplyUpdates;

       end
      else
       begin
          qryProcedimentos.edit;
          qryProcedimentos.post;
          qryProcedimentos.ApplyUpdates;

        end;

    end;
      PageControl1.ActivePageIndex:=0;
        HabilitaBotoes;
        DesabilitaControle;
end;

procedure TF_cadProcedimento.FormShow(Sender: TObject);
begin
    with dmPrincipal do
     begin
       qryProcedimentos.Active := True;
     end;
    HabilitaBotoes;
    DesabilitaControle;
end;

end.

