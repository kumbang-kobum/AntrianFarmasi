object fDM: TfDM
  OldCreateOrder = False
  Height = 390
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
    Protocol = 'mysqld-5'
    LibraryLocation = 'F:\Antrian_Farmasi\libmysql.dll'
    Left = 64
    Top = 16
  end
  object qResepNonRacikan: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select b.no_rawat, b.no_resep, c.nm_pasien'
      'from reg_periksa a, resep_obat b, pasien c'
      'where b.no_rawat=a.no_rawat and a.no_rkm_medis=c.no_rkm_medis'
      
        'and b.no_resep not in(select distinct resep_dokter_racikan.no_re' +
        'sep from resep_dokter_racikan)'
      
        'and b.jam_peresepan<>'#39'00:00:00'#39' and b.status='#39'ralan'#39' and NOT EXI' +
        'STS (SELECT * FROM  antrian_farmasi_rajal d WHERE d.tgl_antri='#39'2' +
        '023/07/06'#39'  and d.no_resep= b.no_resep)'
      'and b.tgl_peresepan='#39'2023/07/06'#39' order by b.jam_peresepan desc')
    Params = <>
    Left = 40
    Top = 80
    object qResepNonRacikanno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qResepNonRacikanno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qResepNonRacikannm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object dsResep: TDataSource
    DataSet = qResepRacikan
    Left = 152
    Top = 304
  end
  object qAntriNonRacikan: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select no_antrian from antrian_farmasi_rajal'
      'where tgl_antri='#39'2023/07/06'#39' and resep='#39'Non Racik'#39)
    Params = <>
    Left = 144
    Top = 80
    object qAntriNonRacikanno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
  end
  object dsAntri: TDataSource
    DataSet = qAntriNonRacikan
    Left = 96
    Top = 264
  end
  object qLapAntrian: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT a.*, d.nm_pasien'
      
        'FROM  antrian_farmasi_rajal a, resep_obat b,reg_periksa c, pasie' +
        'n d'
      
        'WHERE a.no_resep=b.no_resep and b.no_rawat=c.no_rawat and c.no_r' +
        'km_medis=d.no_rkm_medis'
      
        'and a.tgl_antri='#39'2023/03/01'#39'  GROUP BY a.no_resep order by a.no_' +
        'antrian asc'
      '')
    Params = <>
    Left = 352
    Top = 128
    object qLapAntrianno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qLapAntrianno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qLapAntrianno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qLapAntrianstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qLapAntriantgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qLapAntrianresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
    object qLapAntriannm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object qSetting: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select a.nama_instansi, a.alamat_instansi, a.logo from setting a')
    Params = <>
    Left = 248
    Top = 136
    object qSettingnama_instansi: TStringField
      FieldName = 'nama_instansi'
      Required = True
      Size = 60
    end
    object qSettingalamat_instansi: TStringField
      FieldName = 'alamat_instansi'
      Size = 150
    end
    object qSettinglogo: TBlobField
      FieldName = 'logo'
      Required = True
    end
  end
  object qAntrianRajal: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from antrian_farmasi_rajal')
    Params = <>
    Left = 248
    Top = 80
    object qAntrianRajalno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qAntrianRajalno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qAntrianRajalno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
    object qAntrianRajalstatus: TStringField
      FieldName = 'status'
      Required = True
      Size = 1
    end
    object qAntrianRajaltgl_antri: TDateField
      FieldName = 'tgl_antri'
    end
    object qAntrianRajalresep: TStringField
      FieldName = 'resep'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = qAntrianRajal
    Left = 296
    Top = 280
  end
  object qResepRacikan: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select b.no_rawat, b.no_resep, c.nm_pasien'
      'from reg_periksa a, resep_obat b, pasien c'
      'where b.no_rawat=a.no_rawat and a.no_rkm_medis=c.no_rkm_medis'
      
        'and b.no_resep in(select distinct resep_dokter_racikan.no_resep ' +
        'from resep_dokter_racikan)'
      
        'and b.jam_peresepan<>'#39'00:00:00'#39' and b.status='#39'ralan'#39' and NOT EXI' +
        'STS (SELECT * FROM  antrian_farmasi_rajal d WHERE d.tgl_antri='#39'2' +
        '023/07/06'#39'  and d.no_resep= b.no_resep)'
      'and b.tgl_peresepan='#39'2023/07/06'#39' order by b.jam_peresepan desc'
      '')
    Params = <>
    Left = 40
    Top = 136
    object qResepRacikanno_rawat: TStringField
      FieldName = 'no_rawat'
      Required = True
      Size = 17
    end
    object qResepRacikanno_resep: TStringField
      FieldName = 'no_resep'
      Required = True
      Size = 14
    end
    object qResepRacikannm_pasien: TStringField
      FieldName = 'nm_pasien'
      Size = 40
    end
  end
  object qAntrianRacikan: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select no_antrian from antrian_farmasi_rajal'
      'where tgl_antri='#39'2023/07/06'#39' and resep='#39'Racik'#39
      '')
    Params = <>
    Left = 144
    Top = 134
    object qAntrianRacikanno_antrian: TStringField
      FieldName = 'no_antrian'
      Required = True
      Size = 5
    end
  end
end
