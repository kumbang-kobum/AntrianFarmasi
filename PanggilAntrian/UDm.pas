unit UDm;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TfDM = class(TDataModule)
    ZConnection1: TZConnection;
    qResepNonRacik: TZQuery;
    dsResepNonRacik: TDataSource;
    qAntriNonRacik: TZQuery;
    qLaporan: TZQuery;
    qLaporanno_antrian: TStringField;
    qLaporanno_resep: TStringField;
    qLaporanstatus: TStringField;
    qLaporantgl_antri: TDateField;
    qLaporannm_pasien: TStringField;
    qLaporanno_rawat: TStringField;
    qSetting: TZQuery;
    qSettingnama_instansi: TStringField;
    qResepRacik: TZQuery;
    qResepNonRacikno_rawat: TStringField;
    qResepNonRacikno_resep: TStringField;
    qResepNonRacikno_antrian: TStringField;
    qResepNonRacikstatus: TStringField;
    qResepNonRaciktgl_antri: TDateField;
    qResepNonRacikresep: TStringField;
    qResepNonRaciknm_pasien: TStringField;
    qResepRacikno_rawat: TStringField;
    qResepRacikno_resep: TStringField;
    qResepRacikno_antrian: TStringField;
    qResepRacikstatus: TStringField;
    qResepRaciktgl_antri: TDateField;
    qResepRacikresep: TStringField;
    qResepRaciknm_pasien: TStringField;
    qAntriRacik: TZQuery;
    qAntriNonRacikno_rawat: TStringField;
    qAntriNonRacikno_resep: TStringField;
    qAntriNonRacikno_antrian: TStringField;
    qAntriNonRacikstatus: TStringField;
    qAntriNonRaciktgl_antri: TDateField;
    qAntriNonRacikresep: TStringField;
    qAntriNonRaciknm_pasien: TStringField;
    qAntriRacikno_rawat: TStringField;
    qAntriRacikno_resep: TStringField;
    qAntriRacikno_antrian: TStringField;
    qAntriRacikstatus: TStringField;
    qAntriRaciktgl_antri: TDateField;
    qAntriRacikresep: TStringField;
    qAntriRaciknm_pasien: TStringField;
    qAntrianFarmasi: TZQuery;
    qAntrianFarmasino_rawat: TStringField;
    qAntrianFarmasino_resep: TStringField;
    qAntrianFarmasino_antrian: TStringField;
    qAntrianFarmasistatus: TStringField;
    qAntrianFarmasitgl_antri: TDateField;
    qAntrianFarmasiresep: TStringField;
    dsResepRacik: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDM: TfDM;

implementation

{$R *.dfm}

end.
