unit u_cadEmpresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ActnList, StdCtrls, DBCtrls, ExtDlgs, u_formPadrao, ACBrEnterTab,
  ACBrValidador, ACBrCEP, ACBrSocket;

type

  { TF_cadEmpresa }

  TF_cadEmpresa = class(TF_Padrao)
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    act_carregaFoto: TAction;
    act_buscacep: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLogo: TDBImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    odfoto: TOpenPictureDialog;
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure act_AlterarExecute(Sender: TObject);
    procedure act_buscacepExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_carregaFotoExecute(Sender: TObject);
    procedure act_NovoExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_cadEmpresa: TF_cadEmpresa;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_cadEmpresa }

procedure TF_cadEmpresa.FormShow(Sender: TObject);
begin
   With dmPrincipal do
    begin
      qryEmpresa.Active:= True;
    end;
   Panel1.SetFocus;
   HabilitaBotoes;
   DesabilitaControle;
end;

procedure TF_cadEmpresa.act_NovoExecute(Sender: TObject);
begin
   with dmPrincipal do
    begin
      qryempresa.Open;
      qryEmpresa.Insert;
      qryEmpresaDATACAD.Value:= date;
      DBEdit2.SetFocus;
    end;
     HabilitaControle;
     DesabilitaBotoes;
end;

procedure TF_cadEmpresa.act_SalvarExecute(Sender: TObject);
begin
try
   with dmPrincipal do
    begin
      qryEmpresa.Post;
    end;
 except
  if MessageDlg('Não foi possível salvar os dados.', mtWarning, [mbOK, mbCancel],0) = mrOk then
  begin
    Abort;
    end;

 end;
  HabilitaBotoes;
  DesabilitaControle;
end;

procedure TF_cadEmpresa.act_AlterarExecute(Sender: TObject);
begin
   with dmPrincipal do
     begin
       qryEmpresa.Edit;
     end;
   HabilitaControle;
   DesabilitaBotoes;
end;

procedure TF_cadEmpresa.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

          DBEdit11.Text := v_cep;
          DBEdit8.Text  := v_bairro;
          DBEdit5.Text  := v_logradouro;
          DBEdit10.Text := v_uf;
          DBEdit9.Text  := v_municipio;

       end ;
     end ;
   end ;

end;

procedure TF_cadEmpresa.act_buscacepExecute(Sender: TObject);
begin
   try
     ACBrCEP1.BuscarPorCEP(DBEdit11.Text);

      except
         On E : Exception do
         begin
         ShowMessage(E.Message);
         end ;

      end ;
      DBEdit6.SetFocus;
end;

procedure TF_cadEmpresa.act_CancelarExecute(Sender: TObject);
begin
    with dmPrincipal do
      begin
        qryEmpresa.Cancel;
      end;
    HabilitaBotoes;
    DesabilitaControle;
end;

procedure TF_cadEmpresa.act_carregaFotoExecute(Sender: TObject);
begin
   try
    odfoto.execute;
    DBLogo.Picture.LoadFromFile(odfoto.FileName);
   except
     ShowMessage('Arquivo de foto não encontrado');
   end;
end;

end.

