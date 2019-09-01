unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB, StdCtrls, Buttons,
  Grids, DBGrids, RzBckgnd, RzTabs, ComCtrls, Mask, DBCtrls;

type
  TForm1 = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    firmayaz: TBitBtn;
    firmaurunyaz: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    panel: TRzPageControl;
    gridli: TRzTabSheet;
    tarihli: TRzTabSheet;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    RzSeparator1: TRzSeparator;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel20: TQRLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    procedure firmayazClick(Sender: TObject);
    procedure firmaurunyazClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.firmayazClick(Sender: TObject);
begin
qrlabel1.Caption:='-     Kayýtlý Firmalarýn  Bilgileri     -';
qrlabel3.Caption:='- Firma Adý -';
qrlabel4.Caption:='Firmaya Kalan Borç -';
qrlabel5.Caption:='- Firma Telefonu -';
qrlabel6.Caption:='- Firma Adresi -';
qrlabel12.Caption:='- Firmaya Ödenen -';
qrlabel2.Caption:='Bu Belge '+datetostr(now)+' Tarihinde Saat '+ timetostr(now)+'  de Yazdýrýldý' ;

quickrep1.DataSet:=adotable1;

 qrlabel10.Caption:='YTL';
 qrlabel20.Caption:='YTL';

qrdbtext1.DataSet:=adotable1;
qrdbtext1.DataField:='firmaadi';

qrdbtext2.DataSet:=adotable1;
qrdbtext2.DataField:='kalan';

qrdbtext3.DataSet:=adotable1;
qrdbtext3.DataField:='tel1';

qrdbtext4.DataSet:=adotable1;
qrdbtext4.DataField:='adres';

qrdbtext5.DataSet:=adotable1;
qrdbtext5.DataField:='odenen';

quickrep1.Preview;
end;

procedure TForm1.firmaurunyazClick(Sender: TObject);
begin
qrlabel1.Caption:='- '+dbedit1.text+' Firmasýndan Alýnan Ürünler -';
qrlabel3.Caption:='- Ürün Adý -';
qrlabel4.Caption:='- Ürün Adedi -';
qrlabel5.Caption:='- Alýþ Tarihi -';
qrlabel6.Caption:='Manual Olarak Ýstediðiniz Bilgiyi Yazýn';
qrlabel12.Caption:='- Geliþ Fiyatý -';
qrlabel2.Caption:='Bu Belge '+datetostr(now)+' Tarihinde Saat '+ timetostr(now)+'  de Yazdýrýldý' ;

quickrep1.DataSet:=adotable2;

 qrlabel10.Caption:='Adet';
 qrlabel20.Caption:='YTL';

qrdbtext1.DataSet:=adotable2;
qrdbtext1.DataField:='Cinsi';

qrdbtext2.DataSet:=adotable2;
qrdbtext2.DataField:='Adet';

qrdbtext3.DataSet:=adotable2;
qrdbtext3.DataField:='AlimTarihi';

//qrdbtext4.DataSet:=adotable1;
//qrdbtext4.DataField:='adres';

qrdbtext5.DataSet:=adotable2;
qrdbtext5.DataField:='GelisFiyati';

quickrep1.Preview;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Application.CreateForm(tform2,form2);
form2.show;

end;

procedure TForm1.Button1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f10 then
begin
form2.ppDesigner1.Show;
form2.ppReport1.Template.FileName:='D:\server_items\[[ delphi ]]\gul\yazýcý asýl deneme\rapor_ali.rtm';
form2.ppreport1.Template.Load;
end;
end;

end.
