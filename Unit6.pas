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
