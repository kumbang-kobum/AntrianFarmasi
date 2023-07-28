program AplikasiAmbilAntrian;

uses
  Forms,
  dm in 'dm.pas' {fDM: TDataModule},
  uLaporan in 'uLaporan.pas' {fLaporan},
  uAmbilAntrian in 'uAmbilAntrian.pas' {fAmbilAntrian};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfAmbilAntrian, fAmbilAntrian);
  Application.CreateForm(TfDM, fDM);
  Application.CreateForm(TfLaporan, fLaporan);
  Application.Run;
end.
