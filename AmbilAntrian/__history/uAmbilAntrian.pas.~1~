unit uAmbilAntrian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, ZAbstractTable, StdCtrls, ExtCtrls, ComCtrls,
  inifiles;

type
  TfAmbilAntrian = class(TForm)
    pJudul: TPanel;
    lJudul: TLabel;
    pNomor: TPanel;
    pKiri: TPanel;
    pKanan: TPanel;
    lNoAntrianNonRacik: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    lNoAntrianRacik: TLabel;
    pBtsAtas: TPanel;
    pBawah: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    lNoResep: TLabel;
    lNamaPasien: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lStatusRacikan: TLabel;
    Label10: TLabel;
    pTengah: TPanel;
    lNoRawat: TLabel;
    eNoRawat: TEdit;
    btnCetak: TButton;
    procedure btnCetakClick(Sender: TObject);
    procedure eNoRawatChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eNoRawatKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure InResepRacikan;
    Procedure InResepNonRacikan;
    Procedure NoAntrianRacikan;
    Procedure NoAntrianNonRacikan;
    Procedure LapAntrian;
    Procedure Bersih;
    Procedure Simpan;
    Procedure Cetak;
    Procedure Koneksi;
  end;

var
  fAmbilAntrian: TfAmbilAntrian;
  NoAntri:string;

implementation

uses dm, uLaporan;

{$R *.dfm}

procedure TfAmbilAntrian.Bersih;
begin
eNoRawat.Text           :='';
lNoResep.Caption        :='';
lNamaPasien.Caption     :='';
lStatusRacikan.Caption  :='';
lNoAntrianNonRacik.Caption  :='';
lNoAntrianRacik.Caption  :='';
NoAntri:='';
eNoRawat.SetFocus;
end;

procedure TfAmbilAntrian.btnCetakClick(Sender: TObject);
begin
InResepRacikan;
InResepNonRacikan;
if (fDM.qResepNonRacikan.Locate('no_rawat',eNoRawat.Text,[])) or (fDM.qResepRacikan.Locate('no_rawat',eNoRawat.Text,[])) then
begin
Simpan;
Cetak;
FormActivate(Sender);
end else
begin
MessageDlg('Data Belum Ada..!!!',mtWarning, [MBOK],0);
exit;
end;
end;

procedure TfAmbilAntrian.Cetak;
begin
  fDM.qLapAntrian.Close;
  fDM.qLapAntrian.Active:=False;
  fDM.qLapAntrian.SQL.Clear;
  fDM.qLapAntrian.SQL.Add('SELECT a.*, b.nm_pasien');
  fDM.qLapAntrian.SQL.Add('FROM  antrian_farmasi_rajal a, pasien b, reg_periksa c');
  fDM.qLapAntrian.SQL.Add('WHERE a.no_rawat=c.no_rawat and c.no_rkm_medis=b.no_rkm_medis and a.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+'''');
  fDM.qLapAntrian.SQL.Add('and a.no_rawat='''+eNoRawat.Text+''' GROUP BY a.no_resep order by a.no_antrian asc');
  fDM.qLapAntrian.Active:=True;
  fDM.qLapAntrian.Open;
  fDM.qSetting.Close;
  fDM.qSetting.Open;

fLaporan.qrAntrian.Preview;
end;

procedure TfAmbilAntrian.eNoRawatChange(Sender: TObject);
var
jKarakter:string;
begin
jKarakter:=eNoRawat.Text;

if length(jKarakter)>14 then
  begin
  InResepRacikan;
  if fDM.qResepRacikan.Locate('no_rawat',eNoRawat.Text,[]) then
    begin
      lNamaPasien.Caption :=fDM.qResepRacikannm_pasien.AsString;
      lNoResep.Caption    :=fDM.qResepRacikanno_resep.AsString;
      NoAntri             :=lNoAntrianRacik.Caption;
      lStatusRacikan.Caption:='Racik';
    end else
    begin
      InResepNonRacikan;
      if fDM.qResepNonRacikan.Locate('no_rawat',eNoRawat.Text,[]) then
      begin
        lNamaPasien.Caption :=fDM.qResepNonRacikannm_pasien.AsString;
        lNoResep.Caption    :=fDM.qResepNonRacikanno_resep.AsString;
        NoAntri             :=lNoAntrianNonRacik.Caption;
        lStatusRacikan.Caption:='Non Racik';
      end else
      begin
      NoAntri             :='';
      lNoResep.Caption    :='';
      lNamaPasien.Caption :='';
      lStatusRacikan.Caption :='';
      end;
    end;
  end;
end;

procedure TfAmbilAntrian.eNoRawatKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  btnCetak.Click;
end;
end;

procedure TfAmbilAntrian.FormActivate(Sender: TObject);
begin
Bersih;
InResepRacikan;
InResepNonRacikan;
NoAntrianRacikan;
NoAntrianNonRacikan;
end;

procedure TfAmbilAntrian.FormCreate(Sender: TObject);
begin
fAmbilAntrian.Height:=(LongInt(Screen.Height)div 2)+100;
fAmbilAntrian.Width:=(LongInt(Screen.Width)div 2);
pJudul.Height:=fAmbilAntrian.Height div 6;
pBtsAtas.Height:=fAmbilAntrian.Height div 16;
pNomor.Height:=fAmbilAntrian.Height div 6;
pKiri.Width:=fAmbilAntrian.Width div 2;
pBawah.Height:=fAmbilAntrian.Height div 4;
Label5.Top:=pBawah.Height div 2;
Label6.Top:=Label5.Top-20;
Label8.Top:=Label5.Top+20;
Label5.Left:=(pBawah.Width div 2)-Label5.Width-20;
Label6.Left:=(pBawah.Width div 2)-Label6.Width-20;
Label8.Left:=(pBawah.Width div 2)-Label8.Width-20;

Label7.Top:=pBawah.Height div 2;
Label4.Top:=Label5.Top-20;
Label10.Top:=Label5.Top+20;
Label7.Left:=pBawah.Width div 2;
Label4.Left:=Label7.Left;
Label10.Left:=Label7.Left;

lNamaPasien.Top:=pBawah.Height div 2;
lNoResep.Top:=Label5.Top-25;
lStatusRacikan.Top:=Label5.Top+25;
lNamaPasien.Left:=(pBawah.Width div 2)+20;
lNoResep.Left:=(pBawah.Width div 2)+20;
lStatusRacikan.Left:=(pBawah.Width div 2)+20;

eNoRawat.Top:=pTengah.Height div 2;
lNoRawat.Top:=eNoRawat.Top-30;
btnCetak.Top:=eNoRawat.Top+35;
eNoRawat.Left:=(pTengah.Width div 2)-(eNoRawat.Width div 2);
lNoRawat.Left:=(pTengah.Width div 2)-(lNoRawat.Width div 2);
btnCetak.Left:=(pTengah.Width div 2)-(btnCetak.Width div 2);

end;

procedure TfAmbilAntrian.FormShow(Sender: TObject);
begin
Koneksi;
eNoRawat.SetFocus;

end;

procedure TfAmbilAntrian.InResepNonRacikan;
begin
fDM.qResepNonRacikan.Close;
fDM.qResepNonRacikan.Active:=False;
fDM.qResepNonRacikan.SQL.Clear;
fDM.qResepNonRacikan.SQL.Add('select b.no_rawat, b.no_resep, c.nm_pasien');
fDM.qResepNonRacikan.SQL.Add('from reg_periksa a, resep_obat b, pasien c');
fDM.qResepNonRacikan.SQL.Add('where b.no_rawat=a.no_rawat and a.no_rkm_medis=c.no_rkm_medis');
fDM.qResepNonRacikan.SQL.Add('and b.no_resep not in(select distinct resep_dokter_racikan.no_resep from resep_dokter_racikan)');
fDM.qResepNonRacikan.SQL.Add('and b.jam_peresepan<>''00:00:00'' and b.status=''ralan'' and NOT EXISTS (SELECT * FROM  antrian_farmasi_rajal d WHERE d.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' and d.no_resep= b.no_resep)');
fDM.qResepNonRacikan.SQL.Add('and b.tgl_peresepan='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY b.no_resep order by b.jam_peresepan desc ');
fDM.qResepNonRacikan.Active:=True;
fDM.qResepNonRacikan.Open;
end;

procedure TfAmbilAntrian.InResepRacikan;
begin
fDM.qResepRacikan.Close;
fDM.qResepRacikan.Active:=False;
fDM.qResepRacikan.SQL.Clear;
fDM.qResepRacikan.SQL.Add('select b.no_rawat, b.no_resep, c.nm_pasien');
fDM.qResepRacikan.SQL.Add('from reg_periksa a, resep_obat b, pasien c');
fDM.qResepRacikan.SQL.Add('where b.no_rawat=a.no_rawat and a.no_rkm_medis=c.no_rkm_medis');
fDM.qResepRacikan.SQL.Add('and b.no_resep in(select distinct resep_dokter_racikan.no_resep from resep_dokter_racikan)');
fDM.qResepRacikan.SQL.Add('and b.jam_peresepan<>''00:00:00'' and b.status=''ralan'' and NOT EXISTS (SELECT * FROM  antrian_farmasi_rajal d WHERE d.tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' and d.no_resep= b.no_resep)');
fDM.qResepRacikan.SQL.Add('and b.tgl_peresepan='''+FormatDateTime('YYYY-mm-dd',Now)+''' GROUP BY b.no_resep order by b.jam_peresepan desc ');
fDM.qResepRacikan.Active:=True;
fDM.qResepRacikan.Open;
end;

procedure TfAmbilAntrian.Koneksi;
var koneksi : TIniFile;
begin
koneksi := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'conf.ini'); //tipe single database
if (fDM.ZConnection1.Connected) then
fDM.ZConnection1.Disconnect;
fDM.ZConnection1.HostName := koneksi.ReadString('Database','Hostname','');
fDM.ZConnection1.User     := koneksi.ReadString('Database','User','');
fDM.ZConnection1.Password := koneksi.ReadString('Database','Password','');
fDM.ZConnection1.Port     := 3306;
fDM.ZConnection1.Database := koneksi.ReadString('Database','Database','');
fDM.ZConnection1.Protocol := koneksi.ReadString('Database','Protokol','');
fDM.ZConnection1.LibraryLocation := ExtractFilePath(Application.ExeName)+'\libmysql.dll';

 try
  fDM.ZConnection1.Connect;
  fDM.ZConnection1.Connected    :=True;
  fDM.qResepNonRacikan.Active   :=True;
  fDM.qResepRacikan.Active      :=True;
  fDM.qAntriNonRacikan.Active   :=True;
  fDM.qAntrianRacikan.Active    :=True;
  fDM.qAntrianRajal.Active      :=True;
  fDM.qSetting.Active           :=True;
  fDM.qLapAntrian.Active        :=True;

 except
  MessageDlg('Koneksi Database Gagal',mtError, [MBOK],0);
  exit;
end;
end;

procedure TfAmbilAntrian.LapAntrian;
begin

end;

procedure TfAmbilAntrian.NoAntrianNonRacikan;
var
c, b : string;
a : Integer;
begin
fDM.qAntriNonRacikan.Close;
fDM.qAntriNonRacikan.Active:=False;
fDM.qAntriNonRacikan.SQL.Clear;
fDM.qAntriNonRacikan.SQL.Add('select no_antrian from antrian_farmasi_rajal');
fDM.qAntriNonRacikan.SQL.Add('where tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' and resep=''Non Racik'' order by no_antrian asc');
fDM.qAntriNonRacikan.Active:=True;
fDM.qAntriNonRacikan.Open;

if fDM.qAntriNonRacikan.IsEmpty=true then
begin
  b:='001';
  lNoAntrianNonRacik.Caption:=b;
  exit;
  end
  else
    fDM.qAntriNonRacikan.Last;
    c:=fDM.qAntriNonRacikanno_antrian.AsString;
    a:=StrToInt(c)+1;
    if a<10 then
      begin
      b:='00'+(IntToStr(a));
      end
        else
        if a<100 then
          begin
          b:='0'+(IntToStr(a));
          end
            else
            b:=IntToStr(a);
lNoAntrianNonRacik.Caption:=b;
end;

procedure TfAmbilAntrian.NoAntrianRacikan;
var
c, b : string;
a : Integer;
begin
fDM.qAntrianRacikan.Close;
fDM.qAntrianRacikan.Active:=False;
fDM.qAntrianRacikan.SQL.Clear;
fDM.qAntrianRacikan.SQL.Add('select no_antrian from antrian_farmasi_rajal');
fDM.qAntrianRacikan.SQL.Add('where tgl_antri='''+FormatDateTime('YYYY-mm-dd',Now)+''' and resep=''Racik'' order by no_antrian asc');
fDM.qAntrianRacikan.Active:=True;
fDM.qAntrianRacikan.Open;

if fDM.qAntrianRacikan.IsEmpty=true then
begin
  b:='001';
  lNoAntrianRacik.Caption:=b;
  exit;
  end
  else
    fDM.qAntrianRacikan.Last;
    c:=fDM.qAntrianRacikanno_antrian.AsString;
    a:=StrToInt(c)+1;
    if a<10 then
      begin
      b:='00'+(IntToStr(a));
      end
        else
        if a<100 then
          begin
          b:='0'+(IntToStr(a));
          end
            else
            b:=IntToStr(a);
lNoAntrianRacik.Caption:=b;
end;

procedure TfAmbilAntrian.Simpan;
begin
fDM.qAntrianRajal.Append;
fDM.qAntrianRajal['no_rawat']  := eNoRawat.Text;
fDM.qAntrianRajal['no_resep']  := lNoResep.Caption;
fDM.qAntrianRajal['no_antrian']:= NoAntri;
fDM.qAntrianRajal['status']    := '0';
fDM.qAntrianRajal['tgl_antri'] := Now;
fDM.qAntrianRajal['resep']     := lStatusRacikan.Caption;
fDM.qAntrianRajal.Post;
end;

end.
