unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, jpeg, Mask,
  DBCtrls, StdCtrls, SMDBComb;

type
  TFormUser = class(TForm)
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Button2: TButton;
    btnTambah: TButton;
    edtUsername: TEdit;
    edtPass: TEdit;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button4: TButton;
    dbPassword: TDBEdit;
    dbUsername: TDBEdit;
    btnEdit: TButton;
    GroupBox3: TGroupBox;
    Button6: TButton;
    GroupBox2: TGroupBox;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Button1: TButton;
    SMDBNavigator1: TSMDBNavigator;
    btnUser: TButton;
    btnAnggota: TButton;
    Button3: TButton;
    gridUser: TSMDBGrid;
    lblUsername: TLabel;
    cbRole: TComboBox;
    dbRole: TSMDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAnggotaClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnBukuClick(Sender: TObject);
    procedure btnPinjamClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUser: TFormUser;

implementation

uses Unit6, Unit1, UASpas, Unit2, Unit3;

{$R *.dfm}

procedure TFormUser.FormCreate(Sender: TObject);
begin
  DM_perpus127.zq_users127.Active := True;
end;

procedure TFormUser.btnTambahClick(Sender: TObject);
begin
with DM_perpus127.zq_users127 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'INSERT INTO users ' +
      '(username, password, role) ' +
      'VALUES (:username, :password, :role)'
    );

    ParamByName('username').AsString  := edtUsername.Text;
    ParamByName('password').AsString  := edtPass.Text;
    ParamByName('role').AsString  := cbRole.Text;

    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT * FROM users');
    Open;
  end;

  ShowMessage('Data user berhasil ditambahkan!');
end;

procedure TFormUser.btnEditClick(Sender: TObject);
begin
if DM_perpus127.zq_users127.IsEmpty then Exit;

  with DM_perpus127.zq_users127 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'UPDATE buku SET ' +
      'username = :username, ' +
      'password = :password, ' +
      'role = :role, ' +
      'WHERE id_user = :id_user'
    );

    ParamByName('username').AsString := dbUsername.Text;
    ParamByName('password').AsString := dbPassword.Text;
    ParamByName('role').AsString := dbRole.Text;

    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT * FROM users');
    Open;
  end;

  ShowMessage('Data user berhasil diperbarui!');
end;

procedure TFormUser.btnAnggotaClick(Sender: TObject);
begin
  FormAnggota.Show;
  Self.Hide;
end;

procedure TFormUser.Button6Click(Sender: TObject);
begin
  DM_Perpus127.ZConnection1.Disconnect;
  FormLogin.Show;
  Self.Hide;
end;


procedure TFormUser.btnBukuClick(Sender: TObject);
begin
  FormBuku.Show;
  Self.Hide;
end;

procedure TFormUser.btnPinjamClick(Sender: TObject);
begin
  FormPeminjaman.Show;
  Self.Hide;
end;

procedure TFormUser.Button1Click(Sender: TObject);
var
  selectedID: Integer;
begin
  if DM_perpus127.zq_users127.IsEmpty then
  begin
    ShowMessage('Data User belum dipilih!');
    Exit;
  end;

  selectedID :=
    DM_perpus127.zq_users127.FieldByName('id_user').AsInteger;

    with DM_perpus127.zq_del_users do   // ?? PAKAI QUERY EKSEKUSI
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'DELETE FROM users WHERE id_user = :id'
      );
      ParamByName('id').AsInteger := selectedID;
      ExecSQL;
    end;

    ShowMessage('Data User berhasil dihapus!');

  // refresh grid users
  DM_perpus127.zq_users127.Close;
  DM_perpus127.zq_users127.Open;
end;

end.
