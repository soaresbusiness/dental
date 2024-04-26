unit u_dente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ActnList, ExtCtrls, JvDBLookup, rxctrls, rxlookup, RxDBGrid, db;

type

  { Tf_dente }

  Tf_dente = class(TForm)
    act_procuraprofissional: TAction;
    act_excluir: TAction;
    act_alterar: TAction;
    act_novo: TAction;
    act_salvar: TAction;
    act_procurarproced: TAction;
    ActionList1: TActionList;
    btnNovoDente: TBitBtn;
    BtnAlterarDente: TBitBtn;
    btnSalvardente: TBitBtn;
    botaoprocuraprof: TBitBtn;
    botaoprocurar: TBitBtn;
    d11: TImage;
    d12: TImage;
    d13: TImage;
    d14: TImage;
    d15: TImage;
    d16: TImage;
    d17: TImage;
    d18: TImage;
    d21: TImage;
    d22: TImage;
    d23: TImage;
    d24: TImage;
    d25: TImage;
    d26: TImage;
    d27: TImage;
    d28: TImage;
    d31: TImage;
    d32: TImage;
    d33: TImage;
    d34: TImage;
    d35: TImage;
    d36: TImage;
    d37: TImage;
    d38: TImage;
    d41: TImage;
    d42: TImage;
    d43: TImage;
    d44: TImage;
    d45: TImage;
    d46: TImage;
    d47: TImage;
    d48: TImage;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Image2: TImage;
    JvDBLookupCombo1: TJvDBLookupCombo;
    JvDBLookupCombo2: TJvDBLookupCombo;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    RxDBGrid1: TRxDBGrid;

    RxLabel1: TRxLabel;
    RxSpeedButton1: TRxSpeedButton;

    procedure act_procuraprofissionalExecute(Sender: TObject);
    procedure act_salvarExecute(Sender: TObject);
    procedure btnSalvardenteClick(Sender: TObject);
    procedure BtnAlterarDenteClick(Sender: TObject);
    procedure btnNovoDenteClick(Sender: TObject);
    procedure d21Click(Sender: TObject);
    procedure d22Click(Sender: TObject);
    procedure d23Click(Sender: TObject);
    procedure d24Click(Sender: TObject);
    procedure d25Click(Sender: TObject);
    procedure d26Click(Sender: TObject);
    procedure d27Click(Sender: TObject);
    procedure d28Click(Sender: TObject);
    procedure d31Click(Sender: TObject);
    procedure d32Click(Sender: TObject);
    procedure d33Click(Sender: TObject);
    procedure d34Click(Sender: TObject);
    procedure d35Click(Sender: TObject);
    procedure d36Click(Sender: TObject);
    procedure d37Click(Sender: TObject);
    procedure d38Click(Sender: TObject);
    procedure d41Click(Sender: TObject);
    procedure d42Click(Sender: TObject);
    procedure d43Click(Sender: TObject);
    procedure d44Click(Sender: TObject);
    procedure d45Click(Sender: TObject);
    procedure d46Click(Sender: TObject);
    procedure d47Click(Sender: TObject);
    procedure d48Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure act_procurarprocedExecute(Sender: TObject);
    procedure act_procuraprofExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure d11Click(Sender: TObject);
    procedure d12Click(Sender: TObject);
    procedure d13Click(Sender: TObject);
    procedure d14Click(Sender: TObject);
    procedure d15Click(Sender: TObject);
    procedure d16Click(Sender: TObject);
    procedure d17Click(Sender: TObject);
    procedure d18Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  f_dente: Tf_dente;

implementation

{$R *.lfm}

uses
   u_cadtratamentos,u_dmprincipal, u_consultaprocedimento, u_consultaprofissional;

{ Tf_dente }

procedure Tf_dente.act_salvarExecute(Sender: TObject);
begin
     with dmPrincipal  do
     begin

        qryItensTratamentos.post;
        qryItensTratamentos.ApplyUpdates;
        //qryItensTratamentos.Edit;

        qryItenstratamentos.close;
        qryItensTratamentos.Open;
     end;

end;

procedure Tf_dente.act_procuraprofissionalExecute(Sender: TObject);
begin
    F_consultaProfissional := TF_consultaProfissional.create(self);
    F_consultaProfissional.showmodal;
end;

procedure Tf_dente.btnSalvardenteClick(Sender: TObject);
begin
    with DMPrincipal do
    begin
      qryItensTratamentos.Post;
    end;


end;

procedure Tf_dente.BtnAlterarDenteClick(Sender: TObject);
begin
    with F_cadTratamentos do
       begin
          with DMPrincipal do
            begin
               qryTratamentos.Edit;
               qryItensTratamentos.Edit;
             end;
          HabilitaControle;
          Desabilitabotoes;
     end;
end;

procedure Tf_dente.btnNovoDenteClick(Sender: TObject);
begin
    with F_cadTratamentos do
       begin
        with DMPrincipal do
       if qryImpItenstratamentos.State in [dsInsert] then
            begin

               qryItensTratamentosITENS_DATA.Value := Date;
               qryItensTratamentosITTENS_HORA.Value := Time;

             end
             else
             begin

               qryItensTratamentos.Insert;
               qryItensTratamentosITENS_DATA.Value := Date;
               qryItensTratamentosITTENS_HORA.Value := Time;
             end;


          HabilitaControle;
          DesabilitaBotoes;
       end;
end;

procedure Tf_dente.d21Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do

        begin
	    numdente := 21;
            qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d22Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
       begin
       numdente := 22;
         qryitenstratamentosiddente.value := numdente;
       end;
end;

procedure Tf_dente.d23Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	 numdente := 23;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d24Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	  begin
          numdente := 24;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d25Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	  numdente := 25;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d26Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	  begin
           numdente := 26;
           qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d27Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	 numdente := 27;
         qryitenstratamentosiddente.value := numdente;
       end;
end;

procedure Tf_dente.d28Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	  begin
	   numdente := 28;
           qryitenstratamentosiddente.value := numdente;
       end;
end;

procedure Tf_dente.d31Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	  numdente := 31;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d32Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	 numdente := 32;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d33Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	numdente := 33;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d34Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	 numdente := 34;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d35Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	 numdente := 35;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d36Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	   begin
	  numdente := 36;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d37Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	 numdente := 37;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d38Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	 numdente := 38;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d41Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	  numdente := 41;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d42Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	 numdente := 42;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d43Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	 begin
	  numdente := 43;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d44Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	   numdente := 44;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d45Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	  begin
	   numdente := 45;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d46Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	  begin
	     numdente := 46;
         qryitenstratamentosiddente.value := numdente;
       end;
end;

procedure Tf_dente.d47Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
       begin
	 numdente := 47;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d48Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
	   numdente := 48;
           qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d11Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
        begin
	 numdente := 11;
         qryitenstratamentosiddente.value := numdente;
       end;
    end;


procedure Tf_dente.d12Click(Sender: TObject);
var
  numdente : integer;
begin
    with dmprincipal do
    begin

           numdente := 12;
           qryItensTratamentosIDDENTE.Value := numdente;

    end;
end;

procedure Tf_dente.d13Click(Sender: TObject);
var
    numdente : integer;
    begin
       with dmprincipal do
        begin
           numdente :=  13;
           qryitenstratamentosiddente.value := numdente;

       end;

end;

procedure Tf_dente.d14Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
	begin
         numdente := 14;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d15Click(Sender: TObject);
var
   numdente : integer;
    begin
      with dmprincipal do
        begin
          numdente := 15;
         qryitenstratamentosiddente.value := numdente;
       end;

end;

procedure Tf_dente.d16Click(Sender: TObject);
var
   numdente : integer;
   begin
     with dmprincipal do
	begin
	  numdente := 16;
          qryItensTratamentosIDDENTE.Value := numdente;
       end;


end;

procedure Tf_dente.d17Click(Sender: TObject);
var
  numdente : Integer;
begin
   with DMPrincipal do
    begin
      numdente := 17;
       qryItensTratamentosIDDENTE.Value := numdente;
    end;
end;

procedure Tf_dente.d18Click(Sender: TObject);
var
  numdente : integer;
begin
  with DMPrincipal do
    begin
      numdente := 18;
       qryItensTratamentosIDDENTE.Value := numdente;
    end;
end;

procedure Tf_dente.RxSpeedButton1Click(Sender: TObject);
begin
  f_dente.close;
end;

procedure Tf_dente.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  with F_cadTratamentos do
    begin
   HabilitaControle;
   DesabilitaBotoes;

    end;
end;

procedure Tf_dente.act_procurarprocedExecute(Sender: TObject);
begin
  F_consultaProcedimentos := TF_consultaProcedimentos.create(self);
  F_consultaProcedimentos.showmodal;
end;

procedure Tf_dente.act_procuraprofExecute(Sender: TObject);
begin
  F_consultaProfissional := TF_consultaProfissional.create(Self);
  F_ConsultaProfissional.showmodal;
end;

procedure Tf_dente.FormShow(Sender: TObject);
begin
   with dmPrincipal do
     begin
        qryProcedimentos.Open;
        qryProfissionais.Open;

        qryTratamentos.edit;
        qryItenstratamentos.Open;
        qryItensTratamentos.edit;
     end;
     btnNovoDente.Enabled:=True;
     BtnAlterarDente.Enabled:=True;
     btnSalvardente.Enabled:=False;

end;

end.

