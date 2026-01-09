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
   with DM_Perpus127.ZConnection1 do
  begin
    Disconnect;
    HostName := edtHost.Text;
    Port     := StrToIntDef(edtPort.Text, 3306);
    User     := edtUser.Text;
    Password := edtPass.Text;

    try
      Connect;
      ShowMessage('Koneksi database berhasil');

      DM_perpus127.zq_anggota127.Active := True;
      DM_perpus127.zq_users127.Active := True;
      DM_perpus127.zq_penerbit127.Active := True;
      DM_perpus127.zq_buku127.Active := True;
      DM_perpus127.zq_peminjaman127.Active := True;
      FormLogin.btnLogin.Enabled  := True;

      Hide; // ? BUKAN Close
    except
      ShowMessage('Koneksi database gagal');
    end;
  end;
end;

procedure TFormLoginDB.btnSignInClick(Sender: TObject);
begin
    Hide;
end;

end.
