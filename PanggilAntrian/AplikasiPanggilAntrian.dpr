program AplikasiPanggilAntrian;

uses
  Forms,
  UPanggilAntrian in 'UPanggilAntrian.pas' {Form1},
  UDm in 'UDm.pas' {fDM: TDataModule},
  uDisplay in 'uDisplay.pas' {fDisplay};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfDisplay, fDisplay);
  Application.CreateForm(TfDM, fDM);
  Application.Run;
end.
