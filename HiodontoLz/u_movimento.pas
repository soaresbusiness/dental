unit u_Movimento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, StdCtrls, DBCtrls, ComCtrls, DateTimePicker, TADbSource, ACBrEnterTab, RxDBGrid,
  rxdbcomb, rxtooledit,  DB,  LR_Class, LR_Desgn   ;

type

  { TF_Movimento }

  TF_Movimento = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    act_filtrarSituacao: TAction;
    act_ativadatas: TAction;
    act_Imprimir: TAction;
    act_somapix: TAction;
    act_somacartaoCredito: TAction;
    act_somacartaodebito: TAction;
    act_somatotalGeral: TAction;
    act_pesquisar: TAction;
    act_verificasituacao: TAction;
    act_DarBaixa: TAction;
    act_Fechar: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Button1: TButton;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Lbdatafinal1: TLabel;
    Lbdatainicial: TLabel;
    Lbdatafinal: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    RxDateEdit1: TRxDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure act_DarBaixaExecute(Sender: TObject);
    procedure act_FecharExecute(Sender: TObject);
    procedure act_filtrarSituacaoExecute(Sender: TObject);
    procedure act_pesquisarExecute(Sender: TObject);
    procedure act_somatotalGeralExecute(Sender: TObject);
    procedure act_verificasituacaoExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBComboBox1Click(Sender: TObject);


  private

  public

  end;

var
  F_Movimento: TF_Movimento;

implementation

{$R *.lfm}




{ TF_Movimento }
uses
  u_dmprincipal, u_RelatorioMovimento;

procedure TF_Movimento.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Movimento.DBEdit1Exit(Sender: TObject);
begin
  with dmPrincipal  do
    begin
      qryMovimento.post;
      qryMovimento.Edit;
    end;
end;

procedure TF_Movimento.FormShow(Sender: TObject);
begin
   with dmPrincipal  do
     begin
     PageControl1.ActivePageIndex:=0;
     end;
   with PageControl1 do
     begin
       DateTimePicker1.Date:= now;
       DateTimePicker2.Date:= Now;
     end;

end;



procedure TF_Movimento.RxDBComboBox1Click(Sender: TObject);
begin
  with dmPrincipal do
    if qryMovimento.State in [dsInsert,dsEdit] then
     begin
      F_Movimento.RxDBComboBox1.setfocus;
     end
    else
    begin
      qryMovimento.Edit;
      F_Movimento.RxDBComboBox1.SetFocus;
    end;
end;

procedure TF_Movimento.act_FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TF_Movimento.act_filtrarSituacaoExecute(Sender: TObject);
begin
   with dmPrincipal do
     begin
       with qryMovimento do
       begin
          Filtered:= False;
          Filter:= 'situacao like'+ QuotedStr(ComboBox1.Text);
          Filtered:= True;
       end;
       act_somatotalGeralExecute(sender);
       Label7.caption := IntToStr(dmprincipal.qryMovimento.RecordCount);
     end;
end;

procedure TF_Movimento.act_pesquisarExecute(Sender: TObject);
begin
   with dmprincipal do
      begin
        with qryMovimento do
          begin
            close;
            Filtered:= false;
            SQL.clear;
            sql.add('select * from Movimento');
            SQL.add('where MOV_data between :datainicial and :datafinal order by MOV_data');
            ParamByName('datainicial').AsDate := (DateTimePicker1.Date);
            ParamByName('datafinal').AsDate   := (DateTimePicker2.Date);
            Prepare;
            Open;
        end;
       act_somatotalGeralExecute(sender);
     Label7.caption := IntToStr(dmprincipal.qryMovimento.RecordCount);
    end;

end;

procedure TF_Movimento.act_somatotalGeralExecute(Sender: TObject);
var
  soma : Currency;
begin
   soma  := 0;
   with DMPrincipal do
      begin
        qryMovimento.First;
        While not qryMovimento.Eof do
          begin
              soma := soma + qryMovimentoTOTALGERAL.value;
              qryMovimento.Next;
          end;
           qryMovimento.Edit;
           qryMovimentoTOTALDIHEIRO.value := soma;
           qryMovimento.Post;


      end;

     Label7.caption := IntToStr(dmprincipal.qryMovimento.RecordCount);
end;

procedure TF_Movimento.act_verificasituacaoExecute(Sender: TObject);
begin
     with dmPrincipal  do
      begin
        if  qryMovimentosituacao.Value = 'Baixado' then
           begin
              RxDBComboBox1.Enabled:= False;
              DBEdit1.Enabled:=False;
              DBEdit9.Enabled:=False;
              DBEdit4.Enabled:=False;
           end
        else
         begin
              RxDBComboBox1.Enabled:= True;
              DBEdit1.Enabled:=True;
              DBEdit9.Enabled:=True;
              DBEdit4.Enabled:=True;
         end;
      end;

end;

procedure TF_Movimento.act_DarBaixaExecute(Sender: TObject);
begin
    with dmPrincipal  do
         if  qrymovimento.state in [dsInsert,dsEdit] then
          begin
            qryMovimentoSITUACAO.value := 'Baixado';
            RxDBComboBox1.Enabled:= False;
            DBEdit1.Enabled:=False;
            DBEdit9.Enabled:=False;
            DBEdit4.Enabled:=False;
            qryMovimento.post;
          end
        else
         begin
            qryMovimento.Edit;
            qryMovimentoSITUACAO.value := 'Baixado';
            RxDBComboBox1.Enabled:= False;
            DBEdit1.Enabled:=False;
            DBEdit9.Enabled:=False;
            DBEdit4.Enabled:=False;
            qryMovimento.Post;
         end;

end;


end.


