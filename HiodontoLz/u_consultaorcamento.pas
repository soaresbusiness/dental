unit u_consultaOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ActnList, Buttons, rxctrls, RxDBGrid, DateTimePicker;

type

  { TF_ConsultaOrcamento }

  TF_ConsultaOrcamento = class(TForm)
    ActionList1: TActionList;
    act_consultar: TAction;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Edtcon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxRadioGroup1: TRxRadioGroup;
    procedure act_consultarExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_ConsultaOrcamento: TF_ConsultaOrcamento;

implementation

{$R *.lfm}

{ TF_ConsultaOrcamento }
uses
  u_dmprincipal;

procedure TF_ConsultaOrcamento.act_consultarExecute(Sender: TObject);
begin
  if CheckBox1.Checked = true then
    begin

       with dmprincipal do
          begin
              qryOrcamentos.close;
              qryOrcamentos.SQL.clear;
              qryOrcamentos.sql.Add('select * from Orcamentos O ');
              qryOrcamentos.SQL.Add('where O.orcam_data between :dtinicial and :dtfinal order by O.orcam_data');
              qryOrcamentos.ParamByName('dtinicial').AsDate := (DateTimePicker1.Date);
              qryOrcamentos.ParamByName('dtfinal').AsDate:= (DateTimePicker2.Date);
              qryOrcamentos.Open;

          end;
  end
  else
  try
   if RxRadioGroup1.ItemIndex = 0 then
    begin
       with DMPrincipal do
        begin
          qryOrcamentos.close;
          qryOrcamentos.SQL.Clear;
          qryOrcamentos.SQL.add('select * from  ORCAMENTOS where IDORCAMENTO like '+#39+'%'+edtcon.Text+'%'+#39);
          qryOrcamentos.Open;

        end;
    end;

    if RxRadioGroup1.ItemIndex = 1 then
    begin
       with DMPrincipal do
        begin
           qryOrcamentos.close;
           qryOrcamentos.SQL.clear;
           qryOrcamentos.SQL.add('select * from orcamentos');
           qryOrcamentos.SQL.Add('where PAC_NOME like '+#39+'%'+edtcon.Text+'%'+#39);
           qryOrcamentos.Open;

        end;
    end
    except
      begin

         if MessageDlg('Não possível encontrar o Paciente', mtWarning, [mbOK],0) = mrOk then

  end;

  end;
     Label4.caption := IntToStr(dmprincipal.qryOrcamentos.RecordCount);
end;

procedure TF_ConsultaOrcamento.CheckBox1Click(Sender: TObject);
begin
    DateTimePicker1.Enabled:= True;
    DateTimePicker2.Enabled:= True;
end;

procedure TF_ConsultaOrcamento.FormShow(Sender: TObject);
begin
    if CheckBox1.Checked = false then
      begin
         DateTimePicker1.Enabled:= false;
         DateTimePicker2.Enabled:= false;
      end
      else
       begin
        DateTimePicker1.Enabled := True;
        DateTimePicker2.Enabled := True;
    end;

end;

end.

