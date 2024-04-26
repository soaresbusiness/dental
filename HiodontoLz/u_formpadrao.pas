unit u_formPadrao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, StdCtrls, DBCtrls, rxlookup, ACBrEnterTab;

type

  { TF_Padrao }

  TF_Padrao = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    act_Novo: TAction;
    act_Alterar: TAction;
    act_Cancelar: TAction;
    act_Salvar: TAction;
    act_Fechar: TAction;
    ActionList1: TActionList;
    botaoNovo: TBitBtn;
    botaoAlterar: TBitBtn;
    botaoCancelar: TBitBtn;
    botaoSalvar: TBitBtn;
    botaoFechar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;
    procedure HabilitaControle;
    procedure DesabilitaControle;
    procedure act_FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);



  private


  public

  end;

var
  F_Padrao: TF_Padrao;

implementation

{$R *.lfm}



{ TF_Padrao }

procedure TF_Padrao.HabilitaBotoes;
begin
   botaoNovo.Enabled:= True;
   botaoAlterar.Enabled:= True;
  //botaoCancelar.Enabled:= True;
end;

procedure TF_Padrao.DesabilitaBotoes;
begin
   botaoNovo.Enabled:= False;
   botaoAlterar.Enabled:= False;
   //botaoCancelar.Enabled:= False;
end;
procedure TF_Padrao.HabilitaControle;
begin
   botaoCancelar.Enabled:= True;
   botaoSalvar.Enabled:= True;
end;
procedure TF_Padrao.DesabilitaControle;
begin
   botaoCancelar.Enabled:= False;
   botaoSalvar.Enabled:= False;
end;

procedure TF_Padrao.act_FecharExecute(Sender: TObject);
begin
    Close;
end;

procedure TF_Padrao.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   Action.Free;
end;

end.

