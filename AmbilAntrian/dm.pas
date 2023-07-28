unit dm;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TfDM = class(TDataModule)
    ZConnection1: TZConnection;
    qResepNonRacikan: TZQuery;
    dsResep: TDataSource;
    qAntriNonRacikan: TZQuery;
    dsAntri: TDataSource;
    qLapAntrian: TZQuery;
    qSetting: TZQuery;
    qSettingnama_instansi: TStringField;
    qSettingalamat_instansi: TStringField;
    qSettinglogo: TBlobField;
    qAntrianRajal: TZQuery;
    DataSource1: TDataSource;
    qResepRacikan: TZQuery;
    qAntrianRacikan: TZQuery;
    qResepNonRacikanno_rawat: TStringField;
    qResepNonRacikanno_resep: TStringField;
    qResepNonRacikannm_pasien: TStringField;
    qResepRacikanno_rawat: TStringField;
    qResepRacikanno_resep: TStringField;
    qResepRacikannm_pasien: TStringField;
    qAntriNonRacikanno_antrian: TStringField;
    qAntrianRacikanno_antrian: TStringField;
    qAntrianRajalno_rawat: TStringField;
    qAntrianRajalno_resep: TStringField;
    qAntrianRajalno_antrian: TStringField;
    qAntrianRajalstatus: TStringField;
    qAntrianRajaltgl_antri: TDateField;
    qAntrianRajalresep: TStringField;
    qLapAntrianno_rawat: TStringField;
    qLapAntrianno_resep: TStringField;
    qLapAntrianno_antrian: TStringField;
    qLapAntrianstatus: TStringField;
    qLapAntriantgl_antri: TDateField;
    qLapAntrianresep: TStringField;
    qLapAntriannm_pasien: TStringField;
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
