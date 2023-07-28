unit UPanggilAntrian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, IniFiles, StdCtrls, MMSystem, ExtCtrls;

type
  TForm1 = class(TForm)
    pJudul: TPanel;
    RDNonRacik: TRadioButton;
    RDRacik: TRadioButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    lNoResep: TLabel;
    lNamaPasien: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lResep: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    lNoRawat: TLabel;
    Label10: TLabel;
    btnPanggil: TButton;
    btnUlang: TButton;
    eNoAntrian: TEdit;
    procedure eNoAntrianChange(Sender: TObject);
    procedure btnPanggilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RDNonRacikClick(Sender: TObject);
    procedure RDRacikClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure segar;

    procedure Puluhan;
    procedure Panggil;
    Procedure Koneksi;


    Procedure NonRacik;
    Procedure Racik;
    Procedure AntriNonRacik;
    Procedure AntriRacik;
    Procedure TampilNonRacik;
    Procedure TampilRacik;
    Procedure Update;
  end;

var
  Form1: TForm1;
  c, b, j : string;
  a : Integer;
  kode, appPathFile, NoRawat, Lvideo:string;

implementation

uses uDisplay, UDm;

{$R *.dfm}

procedure TForm1.AntriNonRacik;
begin
  fDM.qAntriNonRacik.Close;
  fDM.qAntriNonRacik.Active:=False;
  fDM.qAntriNonRacik.SQL.Clear;
  fDM.qAntriNonRacik.SQL.Add('select a.*, d.nm_pasien');
  fDM.qAntriNonRacik.SQL.Add('from antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasien d');
  fDM.qAntriNonRacik.SQL.Add('where  a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_rkm_medis=d.no_rkm_medis');
  fDM.qAntriNonRacik.SQL.Add('and a.status=''1'' and a.resep=''Non Racik'' and a.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY a.no_resep order by a.no_antrian asc');
  fDM.qAntriNonRacik.Active:=True;
  fDM.qAntriNonRacik.Open;
end;

procedure TForm1.AntriRacik;
begin
  fDM.qAntriRacik.Close;
  fDM.qAntriRacik.Active:=False;
  fDM.qAntriRacik.SQL.Clear;
  fDM.qAntriRacik.SQL.Add('select a.*, d.nm_pasien');
  fDM.qAntriRacik.SQL.Add('from antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasien d');
  fDM.qAntriRacik.SQL.Add('where  a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_rkm_medis=d.no_rkm_medis');
  fDM.qAntriRacik.SQL.Add('and a.status=''1'' and a.resep=''Racik'' and a.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY a.no_resep order by a.no_antrian asc');
  fDM.qAntriRacik.Active:=True;
  fDM.qAntriRacik.Open;
end;

procedure TForm1.btnPanggilClick(Sender: TObject);
begin
if RDNonRacik.Checked=True then
begin
  NonRacik;
  if fDM.qResepNonRacik.IsEmpty=true then
  begin
    MessageDlg('Data Belum Ada..!!!',mtError, [MBOK],0);
    exit;
  end else
  begin
    Update;
    AntriNonRacik;
    fDM.qAntriNonRacik.Last;
    fDisplay.pAntrianNonRacik.Caption:=fDM.qAntriNonRacikno_antrian.AsString;
      if fDisplay.pAntrianNonRacik.Caption<>'' then
      begin
          kode:=appPathFile+'audio\in.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          kode:=appPathFile+'audio\antrian.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          c:=fDisplay.pAntrianNonRacik.Caption;
          a:=StrToInt(c);
          Panggil;
      end;
    segar;
  end;
end else
begin
Racik;
  if fDM.qResepRacik.IsEmpty=true then
  begin
    MessageDlg('Data Belum Ada..!!!',mtError, [MBOK],0);
    exit;
  end else
  begin
    Update;
    AntriRacik;
    fDM.qAntriRacik.Last;
    fDisplay.pAntrianRacik.Caption:=fDM.qAntriRacikno_antrian.AsString;
      if fDisplay.pAntrianRacik.Caption<>'' then
      begin
          kode:=appPathFile+'audio\in.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          kode:=appPathFile+'audio\antrian.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          c:=fDisplay.pAntrianRacik.Caption;
          a:=StrToInt(c);
          Panggil;
      end;
    segar;
  end;
end;
end;

procedure TForm1.btnUlangClick(Sender: TObject);
begin
if RDNonRacik.Checked=True then
begin
  if fDisplay.pAntrianNonRacik.Caption='000' then
  begin
    MessageDlg('Data Belum Ada..!!!',mtError, [MBOK],0);
    exit;
  end else
  begin
      if fDisplay.pAntrianNonRacik.Caption<>'' then
      begin
          kode:=appPathFile+'audio\in.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          kode:=appPathFile+'audio\antrian.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          c:=fDisplay.pAntrianNonRacik.Caption;
          a:=StrToInt(c);
          Panggil;
      end;
    segar;
  end;
end else
begin
  if fDisplay.pAntrianRacik.Caption='000' then
  begin
    MessageDlg('Data Belum Ada..!!!',mtError, [MBOK],0);
    exit;
  end else
  begin
      if fDisplay.pAntrianRacik.Caption<>'' then
      begin
          kode:=appPathFile+'audio\in.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          kode:=appPathFile+'audio\antrian.wav';
          PlaySound(pchar(kode),0,SND_FILENAME);
          c:=fDisplay.pAntrianRacik.Caption;
          a:=StrToInt(c);
          Panggil;
      end;
    segar;
  end;
end;
end;

procedure TForm1.eNoAntrianChange(Sender: TObject);
var
jKarakter:string;
begin
jKarakter:=eNoAntrian.Text;
if length(jKarakter)>=4 then
  begin
  if RDNonRacik.Checked=True then
  begin
    TampilNonRacik;
  end else
  begin
    TampilRacik;
  end;
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
appPathFile := ExtractFilePath(Application.ExeName);
RDNonRacik.Checked:=False;
RDRacik.Checked:=False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Left:=LongInt(Screen.Width)-Form1.Width;
top :=LongInt(Screen.Height)- Form1.Height-40;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Koneksi;
fDisplay.Show;
segar;
end;

procedure TForm1.Koneksi;
var koneksi : TIniFile;
begin
koneksi := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'conf.ini'); //tipe single database
if (fDM.ZConnection1.Connected) then
fDM.ZConnection1.Disconnect;
fDM.ZConnection1.HostName         := koneksi.ReadString('Database','Hostname','');
fDM.ZConnection1.User             := koneksi.ReadString('Database','User','');
fDM.ZConnection1.Password         := koneksi.ReadString('Database','Password','');
fDM.ZConnection1.Port             := 3306;
fDM.ZConnection1.Database         := koneksi.ReadString('Database','Database','');
fDM.ZConnection1.Protocol         := koneksi.ReadString('Database','Protokol','');
fDM.ZConnection1.LibraryLocation  := ExtractFilePath(Application.ExeName)+'\libmysql.dll';
Lvideo    := koneksi.ReadString('Database','Video','');
 try
  fDM.ZConnection1.Connect;
  fDM.ZConnection1.Connected  :=True;
  fDM.qResepNonRacik.Active   :=True;
  fDM.qResepRacik.Active      :=True;
  fDM.qAntriNonRacik.Active   :=True;
  fDM.qAntriRacik.Active      :=True;
  fDM.qLaporan.Active         :=True;
  fDM.qAntrianFarmasi.Active  :=True;

 if (fDM.ZConnection1.Connected)  then
 begin
  MessageDlg('Koneksi Database Sukses',mtWarning, [MBOK],0);
  exit;
 end;
 except
  MessageDlg('Koneksi Database Gagal',mtError, [MBOK],0);
  exit;
 end;
end;

procedure TForm1.NonRacik;
begin
  fDM.qResepNonRacik.Close;
  fDM.qResepNonRacik.Active:=False;
  fDM.qResepNonRacik.SQL.Clear;
  fDM.qResepNonRacik.SQL.Add('select a.*, d.nm_pasien');
  fDM.qResepNonRacik.SQL.Add('from antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasien d');
  fDM.qResepNonRacik.SQL.Add('where  a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_rkm_medis=d.no_rkm_medis');
  fDM.qResepNonRacik.SQL.Add('and a.status=''0'' and a.resep=''Non Racik'' and a.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY a.no_resep order by a.no_antrian asc');
  fDM.qResepNonRacik.Active:=True;
  fDM.qResepNonRacik.Open;
end;

procedure TForm1.Racik;
begin
  fDM.qResepRacik.Close;
  fDM.qResepRacik.Active:=False;
  fDM.qResepRacik.SQL.Clear;
  fDM.qResepRacik.SQL.Add('select a.*, d.nm_pasien');
  fDM.qResepRacik.SQL.Add('from antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasien d');
  fDM.qResepRacik.SQL.Add('where  a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_rkm_medis=d.no_rkm_medis');
  fDM.qResepRacik.SQL.Add('and a.status=''0'' and a.resep=''Racik'' and a.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY a.no_resep order by a.no_antrian asc');
  fDM.qResepRacik.Active:=True;
  fDM.qResepRacik.Open;
end;

procedure TForm1.RDNonRacikClick(Sender: TObject);
begin
Panel1.Enabled:=True;
NonRacik;
fDM.qResepNonRacik.First;
TampilNonRacik;
end;

procedure TForm1.RDRacikClick(Sender: TObject);
begin
Panel1.Enabled:=True;
Racik;
fDM.qResepRacik.First;
TampilRacik;
end;

procedure TForm1.Panggil;
begin
if a<=100 then
begin
    if a=100 then
    begin
    kode:=appPathFile+'audio\100.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    Puluhan;
    end;
end else
begin
    if a<=200 then
    begin
    if a=200 then
    begin
    kode:=appPathFile+'audio\200.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\100.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-100;
    Puluhan;
    end;
end else
begin
    if a<=300 then
    begin
    if a=300 then
    begin
    kode:=appPathFile+'audio\300.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\200.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-200;
    Puluhan;
    end;
end else
begin
    if a<=400 then
    begin
    if a=400 then
    begin
    kode:=appPathFile+'audio\400.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\300.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-300;
    Puluhan;
    end;
end else
begin
    if a<=500 then
    begin
    if a=500 then
    begin
    kode:=appPathFile+'audio\500.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\400.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-400;
    Puluhan;
    end;
end else
begin
    if a<=600 then
    begin
    if a=600 then
    begin
    kode:=appPathFile+'audio\600.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\500.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-500;
    Puluhan;
    end;
end else
begin
    if a<=700 then
    begin
    if a=700 then
    begin
    kode:=appPathFile+'audio\700.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\600.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-600;
    Puluhan;
    end;
end else
begin
    if a<=800 then
    begin
    if a=800 then
    begin
    kode:=appPathFile+'audio\800.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\700.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-700;
    Puluhan;
    end;
end else
begin
    if a<=900 then
    begin
    if a=900 then
    begin
    kode:=appPathFile+'audio\900.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    end else
    begin
    kode:=appPathFile+'audio\800.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-800;
    Puluhan;
    end;
end else
begin
    if a<1000 then
    begin
    kode:=appPathFile+'audio\900.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
    a:=a-900;
    Puluhan;
    end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
    kode:=appPathFile+'audio\counter.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);

if RDNonRacik.Checked=True then
begin
    kode:=appPathFile+'audio\1.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
end else
begin
    kode:=appPathFile+'audio\2.wav';
    PlaySound(pchar(kode),0,SND_FILENAME);
end;
end;

procedure TForm1.Puluhan;
begin
if a<=10 then
  begin
    if a=10 then
      begin
      kode:=appPathFile+'audio\10.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\'+IntToStr(a)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=20 then
  begin
    if a=20 then
      begin
      kode:=appPathFile+'audio\20.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\'+IntToStr(a)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=30 then
  begin
    if a=30 then
      begin
      kode:=appPathFile+'audio\30.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\20.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-20)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=40 then
  begin
    if a=40 then
      begin
      kode:=appPathFile+'audio\40.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\30.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-30)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=50 then
  begin
    if a=50 then
      begin
      kode:=appPathFile+'audio\50.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\40.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-40)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=60 then
  begin
    if a=60 then
      begin
      kode:=appPathFile+'audio\60.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\50.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-50)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=70 then
  begin
    if a=70 then
      begin
      kode:=appPathFile+'audio\70.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\60.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-60)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=80 then
  begin
    if a=80 then
      begin
      kode:=appPathFile+'audio\80.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\70.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-70)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=90 then
  begin
    if a=90 then
      begin
      kode:=appPathFile+'audio\90.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        end else
        begin
        kode:=appPathFile+'audio\80.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-80)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
  end else
  begin
if a<=100 then
  begin
      kode:=appPathFile+'audio\90.wav';
      PlaySound(pchar(kode),0,SND_FILENAME);
        kode:=appPathFile+'audio\'+IntToStr(a-90)+'.wav';
        PlaySound(pchar(kode),0,SND_FILENAME);
        end;
end;
end;
end;
end;
end;
end;
end;
end;
end;
end;

procedure TForm1.segar;
begin
if RDNonRacik.Checked=True then
begin
NonRacik;
fDM.qResepNonRacik.First;
TampilNonRacik;
end else
begin
Racik;
fDM.qResepRacik.First;
TampilRacik;
end;

fDM.qAntriNonRacik.Last;
fDM.qAntriRacik.Last;

if fDM.qAntriNonRacik.IsEmpty=True then
begin
  fDisplay.pAntrianNonRacik.Caption:='000';
  end else
  begin
  fDisplay.pAntrianNonRacik.Caption:=fDM.qAntriNonRacikno_antrian.AsString;
  end;

if fDM.qAntriRacik.IsEmpty=True then
begin
  fDisplay.pAntrianRacik.Caption:='000';
  end else
  begin
  fDisplay.pAntrianRacik.Caption:=fDM.qAntriRacikno_antrian.AsString;
  end;
end;

procedure TForm1.Update;
begin
fDM.qAntrianFarmasi.SQL.Clear;
fDM.qAntrianFarmasi.SQL.Add('UPDATE antrian_farmasi_rajal  SET '+
                                'no_resep     ='+QuotedStr(lNoResep.Caption)+','+
                                'no_antrian   ='+QuotedStr(eNoAntrian.Text)+','+
                                'status       ='+QuotedStr('1')+','+
                                'tgl_antri    ='+QuotedStr(FormatDateTime('YYYY-mm-dd',Now))+','+
                                'resep        ='+QuotedStr(lResep.Caption)+' WHERE '+
                                'no_rawat     ='+QuotedStr(lNoRawat.Caption)+'');
fDM.qAntrianFarmasi.ExecSQL;
end;



procedure TForm1.TampilNonRacik;
begin
if fDM.qResepNonRacik.IsEmpty=True then
begin
  eNoAntrian.Text     :='0';
  lNamaPasien.Caption :='Null';
  lNoResep.Caption    :='Null';
  lResep.Caption      :='Null';
  lNoRawat.Caption      :='Null';
  end else
  begin
  eNoAntrian.Text     :=fDM.qResepNonRacikno_antrian.AsString;
  lNamaPasien.Caption :=fDM.qResepNonRaciknm_pasien.AsString;
  lNoResep.Caption    :=fDM.qResepNonRacikno_resep.AsString;
  lResep.Caption      :=fDM.qResepNonRacikresep.AsString;
  lNoRawat.Caption      :=fDM.qResepNonRacikno_rawat.AsString;
  end;
end;

procedure TForm1.TampilRacik;
begin
if fDM.qResepRacik.IsEmpty=True then
begin
  eNoAntrian.Text     :='0';
  lNamaPasien.Caption :='Null';
  lNoResep.Caption    :='Null';
  lResep.Caption      :='Null';
  lNoRawat.Caption      :='Null';
  end else
  begin
  eNoAntrian.Text     :=fDM.qResepRacikno_antrian.AsString;
  lNamaPasien.Caption :=fDM.qResepRaciknm_pasien.AsString;
  lNoResep.Caption    :=fDM.qResepRacikno_resep.AsString;
  lResep.Caption      :=fDM.qResepRacikresep.AsString;
  lNoRawat.Caption      :=fDM.qResepRacikno_rawat.AsString;
  end;
end;

end.
