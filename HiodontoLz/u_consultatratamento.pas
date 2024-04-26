unit u_consultatratamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ActnList, Buttons, rxctrls, RxDBGrid, DateTimePicker;

type

  { TF_consultaTratamento }

  TF_consultaTratamento = class(TForm)
    act_pesquisar: TAction;
    ActionList1: TActionList;
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
    procedure act_pesquisarExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_consultaTratamento: TF_consultaTratamento;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_consultaTratamento }

procedure TF_consultaTratamento.act_pesquisarExecute(Sender: TObject);
begin
    if CheckBox1.Checked = true then
    begin

       with dmprincipal do
          begin
              qrytratamentos.close;
              qrytratamentos.SQL.clear;
              qrytratamentos.sql.Add('select * from tratamentos T ');
              qrytratamentos.SQL.Add('where t.tratam_data between :dtinicial and :dtfinal order by T.tratam_data');
              qrytratamentos.ParamByName('dtinicial').AsDate := (DateTimePicker1.Date);
              qrytratamentos.ParamByName('dtfinal').AsDate:= (DateTimePicker2.Date);
              qrytratamentos.Open;

          end;
  end
  else
  try
   if RxRadioGroup1.ItemIndex = 0 then
    begin
       with DMPrincipal do
        begin
          qrytratamentos.close;
          qrytratamentos.SQL.text :='select * from  TRATAMENTOS where idtratamentos like '+#39+'%'+edtcon.Text+'%'+#39;
          qryTratamentos.Open;

        end;
    end;

    if RxRadioGroup1.ItemIndex = 1 then
    begin
       with DMPrincipal do
        begin
           qrytratamentos.close;
           qrytratamentos.SQL.text :='select * from  TRATAMENTOS where PAC_NOME like '+#39+'%'+edtcon.Text+'%'+#39;
           qrytratamentos.Open;

        end;
    end
    except
      begin

         if MessageDlg('Não possível encontrar o Paciente', mtWarning, [mbOK],0) = mrOk then

      end;
      end;
     Label4.caption := IntToStr(dmprincipal.qrytratamentos.RecordCount);
end;

procedure TF_consultaTratamento.CheckBox1Click(Sender: TObject);
begin
   DateTimePicker1.Enabled:= True;
   DateTimePicker2.Enabled:= True;
end;

procedure TF_consultaTratamento.FormShow(Sender: TObject);
begin
  Label4.Caption := IntToStr(DMPrincipal.qrytratamentos.RecordCount);
end;

end.

