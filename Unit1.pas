unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, DB, StdCtrls, Grids, DBGrids, SMDBGrid,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, jpeg, Mask, DBCtrls;

type
  TFormAnggota = class(TForm)
    GroupBox1: TGroupBox;
    dbgrid_anggota: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    btnUser: TButton;
    btnAnggota: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Button2: TButton;
    btnTambah: TButton;
    edtNomor: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtNama: TEdit;
    edtAlamat: TEdit;
    Image1: TImage;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button4: TButton;
    Button6: TButton;
    dbedtNomor: TDBEdit;
    dbEdtAlamat: TDBEdit;
    dbedtNama: TDBEdit;
    btnEdit: TButton;
    Button1: TButton;
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnBukuClick(Sender: TObject);
    procedure btnPinjamClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrid_anggotaCellClick(Column: TColumn);
  private
    FIdAnggota: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnggota: TFormAnggota;

implementation

uses Unit6, Unit2, UASpas, Unit3, Unit7;

{$R *.dfm}

procedure TFormAnggota.btnTambahClick(Sender: TObject);
begin
if (edtNama.Text = '') then
  begin
    ShowMessage('Nama harus diisi!');
    Exit;
  end;

  DM_perpus127.zq_anggota127.SQL.Clear;
  DM_perpus127.zq_anggota127.SQL.Text :=
    'INSERT INTO anggota (nama, alamat, no_hp) VALUES (:nama, :alamat, :no_hp)';
  DM_perpus127.zq_anggota127.ParamByName('nama').AsString := edtNama.Text;
  DM_perpus127.zq_anggota127.ParamByName('alamat').AsString := edtAlamat.Text;
  DM_perpus127.zq_anggota127.ParamByName('no_hp').AsString := edtNomor.Text;
  DM_perpus127.zq_anggota127.ExecSQL;

  DM_perpus127.zq_anggota127.SQL.Text := 'SELECT * FROM anggota';
  DM_perpus127.zq_anggota127.Open;

  ShowMessage('Data berhasil ditambahkan');
end;


procedure TFormAnggota.btnEditClick(Sender: TObject);
var
  selectedID: string;
begin
selectedID :=
    DM_perpus127.zq_anggota127.FieldByName('id_anggota').AsString;

  if selectedID = '' then
  begin
    ShowMessage('Data belum dipilih!');
    Exit;
  end;

  DM_perpus127.zq_anggota127.Edit;
  DM_perpus127.zq_anggota127.Post;

   ShowMessage('Data berhasil diupdate');
end;

procedure TFormAnggota.Button1Click(Sender: TObject);
var
  selectedID: Integer;
begin
  if DM_perpus127.zq_anggota127.IsEmpty then
  begin
    ShowMessage('Data anggota belum dipilih!');
    Exit;
  end;

  // Ambil ID langsung dari baris aktif di dataset
  selectedID := DM_perpus127.zq_anggota127.FieldByName('id_anggota').AsInteger;

  ShowMessage('ID yang akan dihapus: ' + IntToStr(selectedID));

  with DM_perpus127.zq_del_anggota do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SET FOREIGN_KEY_CHECKS = 0;');
    ExecSQL;

    SQL.Clear;
    SQL.Add('DELETE FROM anggota WHERE id_anggota = :id');
    ParamByName('id').AsInteger := selectedID; // gunakan selectedID
    ExecSQL;

    SQL.Clear;
    SQL.Add('SET FOREIGN_KEY_CHECKS = 1;');
    ExecSQL;
  end;

  ShowMessage('Data anggota berhasil dihapus!');

  // refresh data grid
  DM_perpus127.zq_anggota127.Close;
  DM_perpus127.zq_anggota127.Open;
end;


procedure TFormAnggota.btnUserClick(Sender: TObject);
begin
      FormUser.Show;
      Self.Hide;
end;

procedure TFormAnggota.btnBukuClick(Sender: TObject);
begin
      FormBuku.Show;
      Self.Hide;
end;

procedure TFormAnggota.btnPinjamClick(Sender: TObject);
begin
      FormPeminjaman.Show;
      Self.Hide;
end;

procedure TFormAnggota.Button6Click(Sender: TObject);
begin
  DM_Perpus127.ZConnection1.Disconnect;
  FormLogin.Show;
  Self.Hide;
end;

procedure TFormAnggota.FormCreate(Sender: TObject);
begin
  DM_perpus127.zq_anggota127.Active := True;
end;

procedure TFormAnggota.dbgrid_anggotaCellClick(Column: TColumn);
begin
  FIdAnggota := DM_perpus127.zq_anggota127.FieldByName('id_anggota').AsInteger;
end;

end.
