unit uDisplay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, DXSUtil, MPlayer, DSPack, DirectShow9,
  ComCtrls;

type
  TfDisplay = class(TForm)
    pBawah: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    pKanan: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    pAntrianRacik: TPanel;
    pKananAtas: TPanel;
    Label2: TLabel;
    Panel10: TPanel;
    DBGrid2: TDBGrid;
    pAntrianNonRacik: TPanel;
    pJudul: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    FilterGraph: TFilterGraph;
    OpenDialog: TOpenDialog;
    DSVideoWindowEx21: TDSVideoWindowEx2;
    DSTrackBar1: TDSTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSTrackBar1Timer(sender: TObject; CurrentPos, StopPos: Cardinal);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDisplay: TfDisplay;

implementation

uses UDm, UPanggilAntrian;

{$R *.dfm}

procedure TfDisplay.DSTrackBar1Timer(sender: TObject; CurrentPos,
  StopPos: Cardinal);
begin
if TimeToStr(CurrentPos / MiliSecPerDay)= TimeToStr(StopPos / MiliSecPerDay) then
begin
    FilterGraph.ClearGraph;
    FilterGraph.RenderFile(Lvideo);
    FilterGraph.Play;

end;

end;

procedure TfDisplay.FormActivate(Sender: TObject);
begin
fDM.qSetting.Close;
fDM.qSetting.Open;
pBawah.Caption:=fDM.qSettingnama_instansi.AsString;
  try
    if not FilterGraph.Active then
    begin
    FilterGraph.Active := true;
    FilterGraph.ClearGraph;
    FilterGraph.RenderFile(Lvideo);
    FilterGraph.Volume :=0;
    FilterGraph.Play;
    end;
  except
  MessageDlg('Tidak Bisa Membuka Video..!!!',mtError, [MBOK],0);
  FilterGraph.ClearGraph;
  exit;
  end;
end;

procedure TfDisplay.FormCreate(Sender: TObject);
begin
fDisplay.Height:=(LongInt(Screen.Height));
fDisplay.Width:=(LongInt(Screen.Width));
pJudul.Height:=(fDisplay.Height-100) div 10;
pBawah.Height:=(fDisplay.Height-100) div 20;
pKanan.Width:=fDisplay.Width div 3;
pKananAtas.Height:=(fDisplay.Height-200) div 2;
Label2.Height:=pKananAtas.Height div 6;
Label1.Height:=pKananAtas.Height div 6;
Panel10.Height:=pKananAtas.Height div 2;
Panel3.Height:=pKananAtas.Height div 2;
end;

end.
