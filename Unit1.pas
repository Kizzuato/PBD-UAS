unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, DB, StdCtrls, Grids, DBGrids, SMDBGrid,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, jpeg;

type
  DM_perpus127 = class(TDataModule);
  TFormAnggota = class(TForm)
    GroupBox1: TGroupBox;
    dbgrid_anggota: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    Button2: TButton;
    Button1: TButton;
    edtNomor: TEdit;
    edtAlamat: TEdit;
    edtNama: TEdit;
    Image2: TImage;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    btnUser: TButton;
    btnAnggota: TButton;
    btnBuku: TButton;
    btnPinjam: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnggota: TFormAnggota;

implementation

uses Unit6;

{$R *.dfm}

procedure TFormAnggota.Button1Click(Sender: TObject);
begin
//  zq_anggota127.SQL.Text :=
//    'INSERT INTO anggota (nama, alamat, no_hp) VALUES (:n,:a,:h)';
//  DM_perpus127.zq_anggota127.FieldByName('nama').AsString := edtNama.Text;
//  DM_perpus127.zq_anggota127.FieldByName('alamat').AsString := edtAlamat.Text;
//  DM_perpus127.zq_anggota127.FieldByName('no_hp').AsString := edtNomor.Text;
//  DM_perpus127.zq_anggota127.post;
//
//  ShowMessage('Data tersimpan');
//
//  DM_perpus127.zq_anggota127.SQL.Text := 'SELECT * FROM anggota';
//  DM_perpus127.zq_anggota127.Open;
end;

end.
