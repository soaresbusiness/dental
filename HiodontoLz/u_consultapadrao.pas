unit u_consultapadrao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBGrids, ComboEx, ActnList;

type

  { TF_consultaPadrao }

  TF_consultaPadrao = class(TForm)
    act_pesquisar: TAction;
    ActionList1: TActionList;
    Cbpesq: TComboBox;
    EdtCon: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;

    procedure CbpesqChange(Sender: TObject);
  private

  public

  end;

var
  F_consultaPadrao: TF_consultaPadrao;

implementation

{$R *.lfm}
uses
  u_dmprincipal;

{ TF_consultaPadrao }

procedure TF_consultaPadrao.CbpesqChange(Sender: TObject);
begin
   EdtCon.Clear;
   EdtCon.SetFocus;
end;

end.

