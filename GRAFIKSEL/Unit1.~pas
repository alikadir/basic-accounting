unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB, ADODB, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, DbChart, TeeShape, Menus, SUIMainMenu,
  ImgList, SUIButton;

type
  Tgrafik = class(TForm)
    DBChart1: TDBChart;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Series1: TPieSeries;
    ADOQuery2: TADOQuery;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    stok: TsuiButton;
    satilan: TsuiButton;
    musteri: TsuiButton;
    firma: TsuiButton;
    suiButton5: TsuiButton;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;



    procedure stokClick(Sender: TObject);
    procedure suiButton5Click(Sender: TObject);
  
    procedure musteriClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure satilanClick(Sender: TObject);
    procedure firmaClick(Sender: TObject);
 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  grafik: Tgrafik;
  tikla1,tikla2,tikla3,tikla4:boolean;
implementation

{$R *.dfm}


procedure Tgrafik.suiButton5Click(Sender: TObject);
begin
grafik.close;
end;

procedure Tgrafik.stokClick(Sender: TObject);
 begin

 if tikla1=false then
begin
 Series1.Clear;
series1.Title:='Stoktaki Ürün Miktarý Grafiði';

 adoquery1.First;
while not adoquery1.Eof do
begin
series1.Add(strtoint(adoquery1.FieldValues['Adet']),' ad '+adoquery1.FieldValues['cinsi']);
adoquery1.Next;
end;
tikla1:=true;
tikla3:=false;
end
else
showmessage('Zaten Þuanda Þemada Stok Durum Görüntüsü Var');

end;

procedure Tgrafik.musteriClick(Sender: TObject);
begin
if tikla2=false then
begin
series1.Title:='Müþterilerin Borç Grafiði';
series1.Clear;
adoquery2.First;
while not adoquery2.Eof do
begin
series2.Add(strtoint(adoquery2.FieldValues['Borc']),' YTL '+adoquery2.FieldValues['IsimSoyad']);
adoquery2.Next;
end;
tikla2:=true;
tikla4:=false;
end
else
showmessage('Zaten Þuanda Þemada Müþteri Borç Görüntüsü Var');

end;

procedure Tgrafik.FormCreate(Sender: TObject);
begin
setwindowlong(handle,gwl_style,getwindowlong(handle,
gwl_style) and not ws_caption);

height:=height+1;
AnimateWindow(grafik.Handle,1000,AW_VER_POSITIVE );



end;

procedure Tgrafik.satilanClick(Sender: TObject);
begin

 if tikla3=false then
begin
 Series1.Clear;
 series1.Title:= 'Satýlan Ürün Þemasý' ;


adoquery3.First;
while not adoquery3.Eof do
begin
series1.Add(adoquery3.FieldValues['UrunAdet'],' ad '+adoquery3.FieldValues['cinsi']);
adoquery3.Next;
end;
tikla3:=true;
tikla1:=false;

end
else
showmessage('Zaten Þuanda Þemada Satýlan Ürün Görüntüsü Var');

end;

procedure Tgrafik.firmaClick(Sender: TObject);
begin
if tikla4=false then
begin
series2.Title:='Frimalara Olan Borç Grafiði';
series2.Clear;
adoquery4.First;
while not adoquery4.Eof do
begin
try
series2.Add(strtoint(adoquery4.FieldValues['kalan']),' YTL '+adoquery4.FieldValues['FirmaAdi']);
finally

adoquery4.Next;
end;
end;
tikla4:=true;
tikla2:=false;
end
else
showmessage('Zaten Þuanda Þemada Firmalara Olan Borç Görüntüsü Var');

end;
end.
