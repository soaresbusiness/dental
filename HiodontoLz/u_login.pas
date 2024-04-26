unit u_login;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ExtDlgs, Buttons, DBGrids, ACBrEnterTab;

type

  { TF_login }

  TF_login = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    botaoEntrar: TBitBtn;
    botaoCancelar: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure botaoEntrarClick(Sender: TObject);
    procedure botaoCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);

  private

  public

  end;

var
  F_login: TF_login;
  Key :String;
implementation

{$R *.lfm}


{ TF_login }
uses
  u_dmprincipal, u_Principal;


procedure TF_login.botaoCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_login.FormShow(Sender: TObject);
begin

  with dmPrincipal  do
    begin
     Conectardb;
     qryLogin.Open;
    end;
end;

procedure TF_login.Image1Click(Sender: TObject);
begin

end;



procedure TF_login.botaoEntrarClick(Sender: TObject);
var
  strsqllog, mensagem : string;
begin

    strsqllog := 'Select * from USUARIOS,PERFIL WHERE USUARIOS.USU_NIVEL = PERFIL.PERFIL_ID';
    strsqllog := strsqllog +' and USU_LOGIN = '+ #39 + (edit1.text) + #39;
    strsqllog := strsqllog +' and USU_SENHA = '+ #39 + (edit2.text) + #39;

  with dmPrincipal do
    begin
       QryLogin.Close;
       QryLogin.SQL.Clear;
       QryLogin.SQL.Add(strsqllog);
       QryLogin.Open;

      if QryLogin.FieldByName('per_status').AsString = 'N' then
      begin
        mensagem := 'Você está cadastrado no sistema mais não ' +#13
        + 'possui autorização para usá-lo neste momento. ' + #13
        + 'Consulte o administrador do sistema.';
      end;

     if (QryLogin.RecordCount) = 0 then
     begin
       mensagem := 'O Nome ou senha do usuário inválidos.' + #13 + #13
       + 'Se você esqueceu a senha, consulte ' + #13
       + 'o administrador do sistema.';

      if MessageDlg('Login não Autorizado', mtWarning, [mbOK],0) = mrOk then

        Edit1.Text := '';
        Edit1.SetFocus;
        Application.Terminate;
     end;

     if (QryLogin.RecordCount) = 1 then
     begin
        F_Principal.StatusBar1.Panels[2].Text :='  ' + 'Usuário:  ' + F_Login.Edit1.Text;
     end;
       F_login.Destroy;
       f_principal.ShowModal;
    end;



  end;

end.

