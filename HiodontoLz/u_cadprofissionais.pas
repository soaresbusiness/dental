unit u_cadprofissionais;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, DBCtrls, StdCtrls, DBExtCtrls, MaskEdit, ExtDlgs, ComCtrls,
  u_formPadrao, RxDBGrid, ACBrEnterTab, ACBrValidador, ACBrCEP, ACBrSocket;

type

  { TF_cadProfissionais }

  TF_cadProfissionais = class(TF_Padrao)
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    act_validar_CPF: TAction;
    act_consulta: TAction;
    act_carregaFoto: TAction;
    act_BuscaCep: TAction;
    BitBtn2: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    Edtcon: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    odfoto: TOpenPictureDialog;
    PageControl1: TPageControl;
    RxDBGrid1: TRxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_BuscaCepExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_consultaExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);

    procedure act_SalvarExecute(Sender: TObject);
    procedure act_validar_CPFExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_cadProfissionais: TF_cadProfissionais;

implementation

{$R *.lfm}
uses
  u_dmprincipal, u_consultaprofissional;

{ TF_cadProfissionais }


procedure TF_cadProfissionais.FormShow(Sender: TObject);
begin
    With dmPrincipal do
      begin
        //qryProfissionais.Active:= True;
      end;
    PageControl1.ActivePageIndex := 0;
    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_cadProfissionais.act_NovoExecute(Sender: TObject);
begin
  with dmprincipal do
  begin
    qryprofissionais.Active := True;
     qryProfissionais.Insert;
     qryProfissionaisPROFIS_DATACAD.Value:= date;
  end;
  PageControl1.ActivePageIndex:= 1;
  HabilitaControle;
  DesabilitaBotoes;
end;



procedure TF_cadProfissionais.act_SalvarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
         qryprofissionais.Post;
      end;
     PageControl1.ActivePageIndex:= 1;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_cadProfissionais.act_validar_CPFExecute(Sender: TObject);
begin
    //bFormatarClick( Sender );

  ACBrValidador1.Documento   := Dbedit2.Text ;


  if ACBrValidador1.Validar then
   begin
   Dbedit2.Font.Color:= clBlue;
   Dbedit5.SetFocus;

   end
  else
   ShowMessage(ACBrValidador1.MsgErro) ;
end;

procedure TF_cadProfissionais.act_AlterarExecute(Sender: TObject);
begin
    with DMPrincipal do
    begin
      qryProfissionais.Edit;
    end;
    PageControl1.ActivePageIndex:=1;
    HabilitaControle;
    DesabilitaBotoes;
end;

procedure TF_cadProfissionais.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  I : Integer ;
  v_cep, v_logradouro, v_bairro, v_municipio, v_uf : String;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage( 'Nenhum Endereço encontrado' )
  else
   begin
     //Memo1.Lines.Add( IntToStr(ACBrCEP1.Enderecos.Count) + ' Endereço(s) encontrado(s)');
     //Memo1.Lines.Add('');

     For I := 0 to ACBrCEP1.Enderecos.Count-1 do
     begin
       with ACBrCEP1.Enderecos[I] do
       begin
          v_cep         := (CEP);
          v_logradouro  := ( Tipo_Logradouro  + Logradouro);
          v_bairro      := (Bairro);
          v_uf          := (UF);
          v_municipio   := (Municipio);

          dbedit5.Text:= v_cep;
          dbedit6.Text:= v_logradouro;
          DBEdit12.text := v_bairro;
          DBEdit7.Text:= v_municipio;

       end ;
     end ;
   end ;

end;

procedure TF_cadProfissionais.act_BuscaCepExecute(Sender: TObject);
begin
  try
     ACBrCEP1.BuscarPorCEP(DBEdit5.Text);
      except
         On E : Exception do
         begin
         ShowMessage(E.Message);
         end ;

      end ;

end;

procedure TF_cadProfissionais.act_CancelarExecute(Sender: TObject);
begin
     with DMPrincipal do
       begin
         qryProfissionais.Cancel;
       end;
     PageControl1.ActivePageIndex:=0;
     HabilitaBotoes;
     DesabilitaControle;
end;

procedure TF_cadProfissionais.act_consultaExecute(Sender: TObject);
begin
  try
    Begin
      With DMPrincipal do
        begin
        qryProfissionais.Close;
        qryProfissionais.SQL.text :=  'select * from Profissionais where Profis_nome like '+#39+'%'+edtcon.Text+'%'+#39;
        qryProfissionais.Open;
        end;
    end;

  except
    if MessageDlg('Não foi possível localizar o Profissional', mtWarning, [mbOK, mbCancel],0) = mrOk then
     Abort;

  end;
end;

end.

