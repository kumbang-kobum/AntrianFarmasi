object fAmbilAntrian: TfAmbilAntrian
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ambil Antrian Farmasi/Apotek'
  ClientHeight = 466
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pJudul: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 101
    Align = alTop
    BevelOuter = bvNone
    Color = 419020
    ParentBackground = False
    TabOrder = 0
    object lJudul: TLabel
      Left = 0
      Top = 0
      Width = 711
      Height = 101
      Align = alClient
      Alignment = taCenter
      Caption = 'NOMOR ANTRIAN APOTEK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 533
      ExplicitHeight = 48
    end
  end
  object pNomor: TPanel
    Left = 0
    Top = 121
    Width = 711
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pKiri: TPanel
      Left = 0
      Top = 0
      Width = 346
      Height = 64
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lNoAntrianNonRacik: TLabel
        Left = 0
        Top = 19
        Width = 346
        Height = 45
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 31
        ExplicitWidth = 375
        ExplicitHeight = 83
      end
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 346
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Nomor Antrian Non Racik'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 207
      end
    end
    object pKanan: TPanel
      Left = 346
      Top = 0
      Width = 365
      Height = 64
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label11: TLabel
        Left = 0
        Top = 0
        Width = 365
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Nomor Antrian Racik'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 170
      end
      object lNoAntrianRacik: TLabel
        Left = 0
        Top = 19
        Width = 365
        Height = 45
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 31
        ExplicitWidth = 169
        ExplicitHeight = 77
      end
    end
  end
  object pBtsAtas: TPanel
    Left = 0
    Top = 101
    Width = 711
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object pBawah: TPanel
    Left = 0
    Top = 352
    Width = 711
    Height = 114
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label5: TLabel
      Left = 220
      Top = 38
      Width = 126
      Height = 18
      Caption = 'Nomor Resep Obat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 254
      Top = 14
      Width = 85
      Height = 18
      Caption = 'Nama Pasien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lNoResep: TLabel
      Left = 396
      Top = 38
      Width = 126
      Height = 18
      Caption = 'Nomor Resep Obat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lNamaPasien: TLabel
      Left = 396
      Top = 14
      Width = 97
      Height = 18
      Caption = 'Nama Pasien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 362
      Top = 14
      Width = 5
      Height = 18
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 362
      Top = 38
      Width = 5
      Height = 18
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 253
      Top = 62
      Width = 86
      Height = 18
      Caption = 'Status Resep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lStatusRacikan: TLabel
      Left = 396
      Top = 62
      Width = 126
      Height = 18
      Caption = 'Nomor Resep Obat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 362
      Top = 62
      Width = 5
      Height = 18
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pTengah: TPanel
    Left = 0
    Top = 185
    Width = 711
    Height = 167
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object lNoRawat: TLabel
      Left = 307
      Top = 17
      Width = 132
      Height = 23
      Alignment = taCenter
      Caption = 'Nomor Rawat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eNoRawat: TEdit
      Left = 224
      Top = 46
      Width = 298
      Height = 27
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = eNoRawatChange
      OnKeyPress = eNoRawatKeyPress
    end
    object btnCetak: TButton
      Left = 291
      Top = 79
      Width = 169
      Height = 26
      Caption = 'Cetak'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCetakClick
    end
  end
end
