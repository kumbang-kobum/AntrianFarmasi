object Form1: TForm1
  Left = 1020
  Top = 500
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Panggil Antrian'
  ClientHeight = 278
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultSizeOnly
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pJudul: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 419020
    ParentBackground = False
    TabOrder = 0
    object RDNonRacik: TRadioButton
      Left = 50
      Top = 15
      Width = 200
      Height = 17
      Caption = 'Resep Non Racik'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = RDNonRacikClick
    end
    object RDRacik: TRadioButton
      Left = 196
      Top = 15
      Width = 200
      Height = 17
      Caption = 'Resep Racik'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RDRacikClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 354
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 121
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
      Left = 8
      Top = 73
      Width = 106
      Height = 19
      Caption = 'Nama Pasien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lNoResep: TLabel
      Left = 152
      Top = 121
      Width = 22
      Height = 18
      Caption = 'Null'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lNamaPasien: TLabel
      Left = 152
      Top = 73
      Width = 32
      Height = 19
      Caption = 'Null'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 139
      Top = 122
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
      Left = 139
      Top = 74
      Width = 6
      Height = 19
      Caption = ':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 28
      Width = 94
      Height = 18
      Caption = 'Nomor Antrian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 145
      Width = 40
      Height = 18
      Caption = 'Resep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lResep: TLabel
      Left = 152
      Top = 145
      Width = 22
      Height = 18
      Caption = 'Null'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 139
      Top = 146
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
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 89
      Height = 18
      Caption = 'Nomor Rawat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lNoRawat: TLabel
      Left = 152
      Top = 97
      Width = 22
      Height = 18
      Caption = 'Null'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 139
      Top = 98
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
    object btnPanggil: TButton
      Left = 75
      Top = 185
      Width = 100
      Height = 30
      Caption = 'PANGGIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnPanggilClick
    end
    object btnUlang: TButton
      Left = 181
      Top = 185
      Width = 100
      Height = 30
      Caption = 'ULANG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnUlangClick
    end
    object eNoAntrian: TEdit
      Left = 152
      Top = 24
      Width = 194
      Height = 26
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = eNoAntrianChange
    end
  end
end
