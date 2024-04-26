unit u_cadconvenio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, DBGrids, StdCtrls, DBCtrls, ComCtrls, u_formPadrao, RxDBGrid,
  ACBrEnterTab;

type

  { TF_CadConvenio }

  TF_CadConvenio = class(TF_Padrao)
    act_consultar: TAction;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Edtcon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;

    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_consultarExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_CadConvenio: TF_CadConvenio;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_CadConvenio }

procedure TF_CadConvenio.FormShow(Sender: TObject);
begin
    dmprincipal.qryConvenio.Active := True;
    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_CadConvenio.act_NovoExecute(Sender: TObject);
begin
   with dmPrincipal do
     Begin
       qryConvenio.Open;
       qryConvenio.Insert;
       qryConvenioCONVENIO_DATA.Value:= Date;
       PageControl1.ActivePage := TabSheet2;
       DBEdit2.SetFocus;
     end;
    HabilitaControle;
    DesabilitaBotoes;
end;

procedure TF_CadConvenio.act_SalvarExecute(Sender: TObject);
begin
   try
    with dmPrincipal do
      begin
        qryConvenio.post;
        qryConvenio.ApplyUpdates;
        HabilitaBotoes;
        DesabilitaControle;
        PageControl1.ActivePageIndex:= 0;
      end;
   except
     if MessageDlg('Não foi possível salvar os dados', mtWarning, [mbOK],0) = mrOk then
     begin
          Abort;
          HabilitaBotoes;
          DesabilitaControle;

     end;


   end;

end;

procedure TF_CadConvenio.act_AlterarExecute(Sender: TObject);
begin
   with dmPrincipal do
     begin
       qryConvenio.Edit;
     end;
   PageControl1.ActivePageIndex:=1;
   HabilitaControle;
   DesabilitaBotoes;
end;

procedure TF_CadConvenio.act_CancelarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
        qryConvenio.Cancel;
      end;
    HabilitaBotoes;
    DesabilitaControle;

end;

procedure TF_CadConvenio.act_consultarExecute(Sender: TObject);
begin
   try
    Begin
      With DMPrincipal do
        begin
        qryconvenio.Close;
        //qryconvenio.SQL.text :=  'select * from Convenios where CONVENIO = '+ QuotedStr(EdtCon.Text);
        qryconvenio.SQL.text :=  'select * from CONVENIOS where CONVENIO like '+#39+'%'+edtcon.Text+'%'+#39;
        qryconvenio.Open;
        end;
    end;

  except
    if MessageDlg('Não foi possível localizar o Convènio', mtWarning, [mbOK, mbCancel],0) = mrOk then
     Abort;

  end;
end;

end.

