object fDM: TfDM
  OldCreateOrder = False
  Height = 321
  Width = 413
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Properties.Strings = (
      'controls_cp=GET_ACP')
    Connected = True
    DesignConnection = True
    HostName = 'rscandimas.my.id'
    Port = 3306
    Database = 'sik'
    User = 'rscmc'
    Password = '0Satu234%'
    Protocol = 'mysql-5'
    LibraryLocation = 'F:\Antrian_Farmasi\PanggilAntrian\libmysql.dll'
    Left = 64
    Top = 16
  end
  object qResepNonRacik: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.status='#39'0'#39' and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_res' +
        'ep order by a.no_antrian asc'
      ''
      '')
    Params = <>
    Left = 40
    Top = 80
    object qResepNonRacikno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qResepNonRacikno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qResepNonRacikno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qResepNonRacikstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qResepNonRaciktgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qResepNonRacikresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
    object qResepNonRaciknm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object dsResepNonRacik: TDataSource
    DataSet = qResepNonRacik
    Left = 48
    Top = 240
  end
  object qAntriNonRacik: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.status='#39'1'#39' and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_res' +
        'ep order by a.no_antrian asc'
      ''
      ''
      '')
    Params = <>
    Left = 208
    Top = 80
    object qAntriNonRacikno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qAntriNonRacikno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qAntriNonRacikno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qAntriNonRacikstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qAntriNonRaciktgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qAntriNonRacikresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
    object qAntriNonRaciknm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object qLaporan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien, b.no_rawat'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_resep order by a.no_' +
        'antrian asc'
      '')
    Params = <>
    Left = 160
    Top = 160
    object qLaporanno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qLaporanno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qLaporanstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 10
    end
    object qLaporantgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qLaporannm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
    object qLaporanno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
  end
  object qSetting: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select a.nama_instansi  from setting a')
    Params = <>
    Left = 240
    Top = 160
    object qSettingnama_instansi: TStringField
      FieldName = 'nama_instansi'
      Required = True
      Size = 60
    end
  end
  object qResepRacik: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.status='#39'0'#39' and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_res' +
        'ep order by a.no_antrian asc'
      ''
      '')
    Params = <>
    Left = 128
    Top = 80
    object qResepRacikno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qResepRacikno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qResepRacikno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qResepRacikstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qResepRaciktgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qResepRacikresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
    object qResepRaciknm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object qAntriRacik: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.status='#39'1'#39' and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_res' +
        'ep order by a.no_antrian asc'
      ''
      ''
      '')
    Params = <>
    Left = 280
    Top = 80
    object qAntriRacikno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qAntriRacikno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qAntriRacikno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qAntriRacikstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qAntriRaciktgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qAntriRacikresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
    object qAntriRaciknm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object qAntrianFarmasi: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from antrian_farmasi_rajal')
    Params = <>
    Left = 32
    Top = 168
    object qAntrianFarmasino_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qAntrianFarmasino_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qAntrianFarmasino_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qAntrianFarmasistatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qAntrianFarmasitgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qAntrianFarmasiresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
  end
  object dsResepRacik: TDataSource
    DataSet = qResepRacik
    Left = 160
    Top = 240
  end
end
