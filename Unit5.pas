unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TFormLoginDB = class(TForm)
    GroupBox1: TGroupBox;
    Image2: TImage;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edtPass: TEdit;
    btnLogin: TButton;
    btnSignIn: TButton;
    edtHost: TEdit;
    edtPort: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    edtUser: TEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure btnSignInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoginDB: TFormLoginDB;

implementation

uses Unit6, UASpas;

{$R *.dfm}

procedure TFormLoginDB.btnLoginClick(Sender: TObject);
begin
  DM_Perpus127.ZConnection1.Disconnect;
  DM_Perpus127.ZConnection1.HostName := edtHost.Text;
  DM_Perpus127.ZConnection1.Port := StrToInt(edtPort.Text);
  DM_Perpus127.ZConnection1.User := edtUser.Text;
  DM_Perpus127.ZConnection1.Password := edtPass.Text;
  try
    DM_Perpus127.ZConnection1.Connect;
  except
    ShowMessage('Koneksi Gagal');
  end;
  if DM_Perpus127.ZConnection1.Connected then
  Close;
  ModalResult := mrOk;
  FormLogin.Show;
end;

procedure TFormLoginDB.btnSignInClick(Sender: TObject);
begin
  Close;
  FormLogin.Show;
end;

end.
