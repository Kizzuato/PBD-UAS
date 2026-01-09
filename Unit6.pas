unit Unit6;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDM_perpus127 = class(TDataModule)
    ZConnection1: TZConnection;
    ZQueryLogin: TZQuery;
    ds_anggota127: TDataSource;
    zq_anggota127: TZQuery;
    zq_buku127: TZQuery;
    ds_buku127: TDataSource;
    zq_peminjaman127: TZQuery;
    ds_peminjaman127: TDataSource;
    zq_penerbit127: TZQuery;
    ds_penerbit127: TDataSource;
    zq_peminjaman127id_peminjaman: TIntegerField;
    zq_peminjaman127id_anggota: TIntegerField;
    zq_peminjaman127id_buku: TIntegerField;
    zq_peminjaman127tanggal_pinjam: TDateField;
    zq_peminjaman127tanggal_kembali: TDateField;
    zq_peminjaman127status: TStringField;
    zq_users127: TZQuery;
    ds_users127: TDataSource;
    zq_users127id_user: TIntegerField;
    zq_users127username: TStringField;
    zq_users127password: TStringField;
    zq_users127role: TStringField;
    zq_buku127id_buku: TIntegerField;
    zq_buku127judul: TStringField;
    zq_buku127penulis: TStringField;
    zq_buku127jenis: TStringField;
    zq_buku127stok: TIntegerField;
    zq_buku127id_penerbit: TIntegerField;
    zq_penerbit127id_penerbit: TIntegerField;
    zq_penerbit127nama_penerbit: TStringField;
    zq_del_anggota: TZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    zq_del_buku: TZQuery;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    zq_del_peminjaman: TZQuery;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField7: TStringField;
    zq_del_users: TZQuery;
    IntegerField8: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    zq_anggota127id_anggota: TIntegerField;
    zq_anggota127nama: TStringField;
    zq_anggota127alamat: TStringField;
    zq_anggota127no_hp: TStringField;
  private
    { Private declarations }
  public
    UserID: Integer;     // ? TAMBAH
    UserRole: string;
    { Public declarations }
  end;

var
  DM_perpus127: TDM_perpus127;

implementation

{$R *.dfm}

end.
