unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, jpeg, DBCtrls,
  StdCtrls, Mask;

type
  TFormBuku = class(TForm)
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Button2: TButton;
    btnTambah: TButton;
    dblPenerbit: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Button6: TButton;
    GroupBox2: TGroupBox;
    Image1: TImage;
    GroupBox1: TGroupBox;
    dbgrid_anggota: TSMDBGrid;
    Button1: TButton;
    SMDBNavigator1: TSMDBNavigator;
    btnBuku: TButton;
    btnPinjam: TButton;
    Button3: TButton;
    GroupBox5: TGroupBox;
    Button4: TButton;
    btnEdit: TButton;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtJudul: TEdit;
    edtPenulis: TEdit;
    edtStok: TEdit;
    cbJenis: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblPenerbit2: TDBLookupComboBox;
    DBJudul: TDBEdit;
    DBPenulis: TDBEdit;
    edtStok2: TDBEdit;
    dbcbJenis: TDBComboBox;
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAnggotaClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnPinjamClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuku: TFormBuku;

implementation

uses Unit6, Unit1, Unit7, Unit3, UASpas;

{$R *.dfm}

procedure TFormBuku.btnTambahClick(Sender: TObject);
begin
  if edtJudul.Text = '' then
  begin
    ShowMessage('Judul wajib diisi!');
    Exit;
  end;

  if dblPenerbit.KeyValue = Null then
  begin
    ShowMessage('Penerbit wajib dipilih!');
    Exit;
  end;

  with DM_perpus127.zq_buku127 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'INSERT INTO buku ' +
      '(judul, penulis, jenis, stok, id_penerbit) ' +
      'VALUES (:judul, :penulis, :jenis, :stok, :id_penerbit)'
    );

    ParamByName('judul').AsString := edtJudul.Text;
    ParamByName('penulis').AsString := edtPenulis.Text;
    ParamByName('jenis').AsString := cbJenis.Text;
    ParamByName('stok').AsInteger := StrToIntDef(edtStok.Text, 0);
    ParamByName('id_penerbit').AsInteger := dblPenerbit.KeyValue;

    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT * FROM buku');
    Open;
  end;

  ShowMessage('Data buku berhasil ditambahkan!');
end;

procedure TFormBuku.btnEditClick(Sender: TObject);
begin
 if DM_perpus127.zq_buku127.IsEmpty then Exit;

  if dblPenerbit2.KeyValue = Null then
  begin
    ShowMessage('Penerbit wajib dipilih!');
    Exit;
  end;

  with DM_perpus127.zq_buku127 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'UPDATE buku SET ' +
      'judul = :judul, ' +
      'penulis = :penulis, ' +
      'jenis = :jenis, ' +
      'stok = :stok, ' +
      'id_penerbit = :id_penerbit ' +
      'WHERE id_buku = :id_buku'
    );

    ParamByName('judul').AsString := DBJudul.Text;
    ParamByName('penulis').AsString := DBPenulis.Text;
    ParamByName('jenis').AsString := dbcbJenis.Text;
    ParamByName('stok').AsInteger := StrToIntDef(edtStok2.Text, 0);
    ParamByName('id_penerbit').AsInteger := dblPenerbit2.KeyValue;
    ParamByName('id_buku').AsInteger :=
      DM_perpus127.zq_buku127.FieldByName('id_buku').AsInteger;

    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT * FROM buku');
    Open;
  end;

  ShowMessage('Data buku berhasil diperbarui!');
end;

procedure TFormBuku.Button1Click(Sender: TObject);
begin
 if DM_perpus127.zq_buku127.IsEmpty then Exit;

  if MessageDlg('Hapus data buku ini?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    DM_perpus127.zq_buku127.Close;
    DM_perpus127.zq_buku127.SQL.Clear;
    DM_perpus127.zq_buku127.SQL.Add(
      'DELETE FROM buku WHERE id_buku = :id_buku'
    );
    DM_perpus127.zq_buku127.ParamByName('id_buku').AsInteger :=
      DM_perpus127.zq_buku127.FieldByName('id_buku').AsInteger;
    DM_perpus127.zq_buku127.ExecSQL;

    DM_perpus127.zq_buku127.SQL.Clear;
    DM_perpus127.zq_buku127.SQL.Add('SELECT * FROM buku');
    DM_perpus127.zq_buku127.Open;
  end;
end;

procedure TFormBuku.FormCreate(Sender: TObject);
begin
  DM_perpus127.zq_buku127.Active := True;
  DM_perpus127.zq_penerbit127.Active := True;
end;

procedure TFormBuku.btnAnggotaClick(Sender: TObject);
begin
Self.Hide;
FormAnggota.Show;
end;

procedure TFormBuku.btnUserClick(Sender: TObject);
begin
Self.Hide;
FormUser.Show;
end;

procedure TFormBuku.btnPinjamClick(Sender: TObject);
begin
Self.Hide;
FormPeminjaman.Show;
end;

procedure TFormBuku.Button6Click(Sender: TObject);
begin
  DM_Perpus127.ZConnection1.Disconnect;
  FormLogin.Show;
  Self.Hide;
end;

end.
