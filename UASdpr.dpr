program UASdpr;

uses
  Forms,
  UASpas in '..\..\..\..\..\..\Program Files (x86)\Borland\Delphi7\Projects\UASpas.pas' {FormLogin},
  UAS in '..\..\..\..\..\..\Program Files (x86)\Borland\Delphi7\Projects\UAS.pas' {FormDashboard},
  Unit1 in 'Unit1.pas' {FormAnggota},
  Unit2 in 'Unit2.pas' {FormBuku},
  Unit3 in 'Unit3.pas' {FormPeminjaman},
  Unit5 in 'Unit5.pas' {FormLoginDB},
  Unit6 in 'Unit6.pas' {DM_perpus127: TDataModule};

{$E .env}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Librarika';
  Application.CreateForm(TDM_perpus127, DM_perpus127);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormDashboard, FormDashboard);
  Application.CreateForm(TFormAnggota, FormAnggota);
  Application.CreateForm(TFormBuku, FormBuku);
  Application.CreateForm(TFormPeminjaman, FormPeminjaman);
  Application.CreateForm(TFormLoginDB, FormLoginDB);
//  Application.CreateForm(TDM_perpus127, DM_perpus127);
  Application.Run;
end.
