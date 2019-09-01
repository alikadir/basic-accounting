unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DB, ADODB, ExtCtrls,
  ComCtrls, Buttons, SUIImagePanel, RzBHints, SUIButton, SUIForm;

type
  Talis = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    box: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    yeniiptal: TBitBtn;
    yenionay: TBitBtn;
    onay: TBitBtn;
    iptal: TBitBtn;
    Label14: TLabel;
    tarihbox: TDateTimePicker;
    esc: TBitBtn;
    Panel1: TPanel;
    butonbox: TsuiPanel;
    hesapbox: TsuiPanel;
    RzBalloonHints1: TRzBalloonHints;
    yeni: TBitBtn;
    sil: TBitBtn;
    duzenle: TBitBtn;
    suiRadioButton1: TsuiRadioButton;
    suiRadioButton2: TsuiRadioButton;
    msn: TsuiMSNPopForm;
    Image1: TImage;
    Edit6: TEdit;
    DBEdit8: TDBEdit;
    Edit7: TEdit;
    Image2: TImage;
    Image3: TImage;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    odemeyap: TBitBtn;
    odemebox: TGroupBox;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    Label22: TLabel;
    Edit12: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel2: TPanel;
    Edit16: TEdit;
    Label27: TLabel;
    Edit17: TEdit;
    Label28: TLabel;
    odemetarih: TDateTimePicker;
    Label29: TLabel;
    odeonay: TBitBtn;
    odeiptal: TBitBtn;
    Label30: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Panel3: TPanel;
    DBEdit14: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    procedure DBEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure escClick(Sender: TObject);
    procedure yeniClick(Sender: TObject);
    procedure yenionayClick(Sender: TObject);
    procedure yeniiptalClick(Sender: TObject);
    procedure duzenleClick(Sender: TObject);
    procedure iptalClick(Sender: TObject);
    procedure onayClick(Sender: TObject);
    procedure silClick(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9Change(Sender: TObject);
    procedure odemeyapClick(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17Change(Sender: TObject);
    procedure odeonayClick(Sender: TObject);
    procedure odeiptalClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  alis: Talis;
  btus:boolean;
implementation

{$R *.dfm}


  procedure Talis.DBEdit1Change(Sender: TObject);
begin
butonbox.Enabled:=true;
 datasource2.enabled:=true;

adoquery2.close;
adoquery2.sql.clear;
adoquery2.sql.add('select * from urunler');
adoquery2.sql.add('where firmaadi='''+dbedit1.Text+'''');
//adoquery2.Parameters.ParamByName('ad').Value:=dbedit1.Text;
adoquery2.open;

end;


procedure Talis.FormCreate(Sender: TObject);
begin
setwindowlong(handle,gwl_style,getwindowlong(handle,
gwl_style) and not ws_caption);

height:=height+1;
AnimateWindow(alis.Handle,1000,AW_VER_NEGATIVE OR AW_SLIDE);

height:=height+1;
box.Visible:=false;
odemebox.Visible:=false;
 dbedit14.Visible:=false;


 end;

procedure Talis.escClick(Sender: TObject);
begin
alis.Close;
end;

procedure Talis.yeniClick(Sender: TObject);
begin
if not (dbedit1.Text='') then
begin
image1.Visible:=false;
dbedit14.Visible:=false;
butonbox.Enabled:=false;
dbgrid1.Enabled:=false;
dbgrid2.Enabled:=false;
box.Visible:=true;
onay.Visible:=false;
iptal.visible:=false;
yenionay.Visible:=true;
yeniiptal.visible:=true;
adoquery2.Insert;
edit6.Text:=dbedit1.Text;
box.Caption:= ' Yeni Ürün Alýmý ';

tarihbox.DateTime:=(now);
           edit1.Text:='';
           edit2.Text:='';
           edit3.Text:='';
           edit4.Text:='';
           edit5.Text:='';
           end
           else
           showmessage('Kayýtlý Firma Yok !');
           end;

procedure Talis.yenionayClick(Sender: TObject);
  var
DENE : string;
aynisivarmi:boolean;
begin
if not (edit1.text='') and not (edit2.text='') and not (edit3.text='') and not
(edit4.text='')and not (edit5.text='') then
begin
  DENE:=edit1.Text;
     adoquery2.First;
     aynisivarmi:=false;
while ( not adoquery2.Eof ) do
begin
     if (adoquery2.FieldByName('cinsi').asstring)=(DENE) then
 begin
     aynisivarmi:=true;

 end;
     adoquery2.Next;
end;

 if aynisivarmi=false then
 begin
 if  messagedlg('   |=> '+dbedit1.Text+' <=| '+' Firmasýndan '+'   |=> '+edit1.Text+' <=| '+
    ' Ýsimli Bi Ürün Alýmýný  '+#13+''+#13+
    '                  Onaylýyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin
    dbgrid1.Enabled:=true;
    dbgrid2.Enabled:=true;
  adoquery2.Insert;
  adoquery1.Edit;
 adoquery2.Edit;



   dbedit2.enabled:=true;
   dbedit3.enabled:=true;
   dbedit4.enabled:=true;
   dbedit5.enabled:=true;
   dbedit6.enabled:=true;
   dbedit7.enabled:=true;
    dbedit8.Enabled:=true;
            dbedit8.Text:=edit6.Text;
           dbedit2.Text:=edit1.Text;
           dbedit3.Text:=edit2.Text;
           dbedit4.text:=datetostr(tarihbox.DateTime);
            dbedit5.Text:=edit3.Text;
            dbedit6.Text:=edit4.Text;
            dbedit7.Text:=edit5.Text;
 msn.Title:='Ürün Alýndý ..!';
 msn.MessageText:=edit1.text+#13+#13+'Ürün Baþarýyla'+#13+'Kaydedildi..' ;
 msn.Popup;
    adoquery2.post;
    image1.Visible:=true;
    butonbox.Enabled:=true;

   dbedit8.Enabled:=false;
   dbedit2.enabled:=false;
   dbedit3.enabled:=false;
   dbedit4.enabled:=false;
   dbedit5.enabled:=false;
   dbedit6.enabled:=false;
   dbedit7.enabled:=false;

butonbox.Enabled:=true;
dbgrid1.Enabled:=true;
dbgrid2.Enabled:=true;
box.Visible:=false;
image1.Visible:=true;
butonbox.Enabled:=true;

   end;
   end
             else
          begin
   showmessage('|=> '+(edit1.Text)+' <=| '+' isiminde kayýtlý bi Ürün zaten var !!');
           adoquery2.Insert;
           end;
   end
else
showmessage(' Alanlarý Tam ( Eksiksiz ) Doldurun ! !')

end;

procedure Talis.yeniiptalClick(Sender: TObject);
begin
if  messagedlg('   |=> '+dbedit1.Text+' <=| '+' Firmasýndan '+
    '  Ürün Alýmýný  '+#13+''+#13+
    '                  Ýptal Ediyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin
butonbox.Enabled:=true;
dbgrid1.Enabled:=true;
dbgrid2.Enabled:=true;
box.Visible:=false;
image1.Visible:=true;
butonbox.Enabled:=true;
adoquery2.refresh;
   end;
   end;

procedure Talis.duzenleClick(Sender: TObject);
begin
if not (dbedit1.Text='')and not(dbedit2.Text='') then
begin
image1.Visible:=false;

butonbox.Enabled:=false;
dbgrid1.Enabled:=false;
dbgrid2.Enabled:=false;
box.Visible:=true;
onay.Visible:=true;
iptal.visible:=true;
yenionay.Visible:=false;
yeniiptal.visible:=false;

edit6.Text:=dbedit1.Text;
box.Caption:= ' Ürün Bilgisi Düzenleme ';

           tarihbox.DateTime:=strtodate(dbedit4.text);
           dbedit8.Text:=edit6.Text;
           edit1.Text:=dbedit2.Text;
           edit2.Text:=dbedit3.Text;
           edit3.Text:=dbedit5.Text;
           edit4.Text:=dbedit6.Text;
           edit5.Text:=dbedit7.Text;
           end
           else
           Showmessage('Düzenleme Yapmak Ýçin Firma veya Ürün Tanýmlý Deðil !');
           end;

procedure Talis.iptalClick(Sender: TObject);
begin
 if  messagedlg('   |=> '+dbedit1.Text+' <=| '+' Firmasýndan Alýnmýþ '+'   |=> '+edit1.Text+' <=| '+
    ' Ýsimli Ürün Üzerinde  '+#13+' Yapýlan Düzenlemeyi '+#13+
    '                  Ýptal Etmek Ýstiyormusun ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin
butonbox.Enabled:=true;
dbgrid1.Enabled:=true;
dbgrid2.Enabled:=true;
box.Visible:=false;
image1.Visible:=true;
butonbox.Enabled:=true;
   end;
end;

procedure Talis.onayClick(Sender: TObject);
begin
if not (edit1.text='') and not (edit2.text='') and not (edit3.text='') and not
(edit4.text='')and not (edit5.text='') then
begin

 if  messagedlg('   |=> '+dbedit1.Text+' <=| '+' Firmasýndan Alýnmýþ '+'   |=> '+dbedit2.Text+' <=| '+
    ' Ýsimli Ürün Üzerinde   '+#13+' Yapýlan Düzenlemeyi '+#13+
    '                  Onaylýyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin
    dbgrid1.Enabled:=true;
    dbgrid2.Enabled:=true;

  adoquery1.Edit;
  adoquery2.Edit;



   dbedit2.enabled:=true;
   dbedit3.enabled:=true;
   dbedit4.enabled:=true;
   dbedit5.enabled:=true;
   dbedit6.enabled:=true;
   dbedit7.enabled:=true;
    dbedit8.Enabled:=true;
            dbedit8.Text:=edit6.Text;
           dbedit2.Text:=edit1.Text;
           dbedit3.Text:=edit2.Text;
           dbedit4.text:=datetostr(tarihbox.DateTime);
            dbedit5.Text:=edit3.Text;
            dbedit6.Text:=edit4.Text;
            dbedit7.Text:=edit5.Text;
 msn.Title:='Ürün Düzenlendi ..!';
 msn.MessageText:=edit1.text+#13+#13+'Ürün Baþarýyla'+#13+'Düzenlendi..' ;
 msn.Popup;
    adoquery2.post;
    image1.Visible:=true;
    butonbox.Enabled:=true;

   dbedit8.Enabled:=false;
   dbedit2.enabled:=false;
   dbedit3.enabled:=false;
   dbedit4.enabled:=false;
   dbedit5.enabled:=false;
   dbedit6.enabled:=false;
   dbedit7.enabled:=false;

butonbox.Enabled:=true;
dbgrid1.Enabled:=true;
dbgrid2.Enabled:=true;
box.Visible:=false;
image1.Visible:=true;
butonbox.Enabled:=true;

   end;
end
else
showmessage(' Alanlarý Tam ( Eksiksiz ) Doldurun ! !')

end;


procedure Talis.silClick(Sender: TObject);
begin
 if not(dbedit2.text='')
  then
 begin
  if  messagedlg('   |=> '+dbedit2.Text+' <=| '+
    'Ýsimli Ürünü '+#13+'   Silmiþ Olacaksýnýz ..!'+#13+
    'Bu Ürünü Aldýktan Sonra Firmaya Ödeme Yaptýysanýz Bu Ýþlem Programýn Ödeme Planýný ALT / ÜST Edecektir !!!'+#13+
    'Bu Uyarýyý Dikkate Alarak Ürün Silmeyi Onaylýyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then

 begin

 msn.Title:='Kayýt Silindi ..!';
 msn.MessageText:=dbedit2.text+#13+#13+'Ýsimli Ürün Baþarýyla'+#13+'Silindi ..' ;
 msn.Popup;

   adoquery2.Delete;
   adoquery2.refresh;

                   end;
                   end
                   else
 showmessage(' Silmek Ýçin Seçilmiþ Bir Ürün Yok ..!'+#13+'              Bir Ürün Seçin !');
                   end;


procedure Talis.Edit7Change(Sender: TObject);
var
smetin,sbulunan:string;
secimuz:integer;
begin

 if btus=true then
 begin
 btus:=false;
 exit;
 end;
  if not (dbedit2.text='') then
 begin
 adoquery2.Locate('cinsi',edit7.Text,[loPartialKey,
 loCaseInsensitive]);
 smetin:=edit7.Text;
 sbulunan:=adoquery2.FieldValues['cinsi'];
 secimuz:=length(sbulunan) - length(smetin);
 if secimuz > 0 then
 begin
 edit7.Text:=sbulunan;
 edit7.SelStart:=length(smetin);
 edit7.SelLength:=secimuz;
 end;
 end;
 end;

procedure Talis.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  if (key=VK_DELETE) OR (key=VK_BACK) then
 btus:=true;
  end;
procedure Talis.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Talis.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Talis.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_DECIMAL) then
begin
edit3.Text:=edit3.text +'.';
edit3.SelStart:=(length(edit3.Text));
end;
end;

procedure Talis.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;
procedure Talis.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;
procedure Talis.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_DECIMAL) then
begin
edit4.Text:=edit4.text +'.';
edit4.SelStart:=(length(edit4.Text));
end;
end;

procedure Talis.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_DECIMAL) then
begin
edit5.Text:=edit5.text +'.';
edit5.SelStart:=(length(edit5.Text));
end;
end;

procedure Talis.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Talis.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Talis.Edit9Change(Sender: TObject);
var
yaz,yuzde,tut,hesapla:real;
begin
if edit9.text='' then edit9.text:='0';
 if edit8.text='' then edit8.text:='0';
tut:=strtofloat(edit8.text);
yuzde:=strtofloat(edit9.text);
hesapla:=(tut)/100*(yuzde);
yaz:=(tut)+(hesapla);
edit10.text:=floattostr(yaz);
end;

procedure Talis.odemeyapClick(Sender: TObject);
var
dene,odenen,kalan,eski,toplam:real;
begin
if not (dbedit1.Text='')  then
begin
 if not (adoquery2.recordcount=0) then
 begin
  adoquery1.Edit;
 toplam:=0;
 adoquery2.First;
 while ( not adoquery2.Eof ) do
begin
 toplam:=(toplam + (strtofloat(adoquery2.FieldByName('GelisFiyati').asstring) * (strtofloat(adoquery2.FieldByName('Adet').asstring)) ) );
 adoquery2.Next;
end;

if dbedit10.Text='' then dbedit10.Text:='0';
odemebox.Visible:=true;
dbedit12.text:=floattostr(toplam);
eski:= strtofloat(dbedit12.text);
odenen:=strtofloat(dbedit10.Text);

kalan:=eski-odenen;
  dbedit11.Text:= floattostr(kalan);
 dene:=strtofloat(dbedit11.Text);
if not (dene<=0) then
begin
 dbgrid1.Enabled:=false;
 dbgrid2.Enabled:=false;
 butonbox.Enabled:=false;
 esc.Enabled:=false;
  edit7.Enabled:=false;
 edit16.Text:='0';

edit12.text:=inttostr(adoquery2.recordcount);
end
else
showmessage('Firmaya Borcunuz Yok !');
end
else
showmessage('Firmadan Alýnmýþ Ürün Yok ki Ne parasý Ödeyeceksin ?');
end
 else
 showmessage('Kayýtlý Firma Yok !');
 end;


procedure Talis.Edit16Change(Sender: TObject);
var
kalan,asil,suan:real;
begin
if not(edit16.text='') then
begin
asil:=strtofloat(dbedit11.text);
suan:=strtofloat(edit16.Text);
kalan:=asil-suan;
edit17.Text:=floattostr(kalan);
end;
end;

procedure Talis.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Talis.Edit17Change(Sender: TObject);
var
dene:real;
begin
dene:= strtofloat(edit17.text);
if dene>-1 then
begin
if dene>0 then odemetarih.Enabled:=true
else
begin
odemetarih.Enabled:=false;

end;
end
else
begin
showmessage('Borcundan Fazla Para Ödüyosun !');
edit16.Text:='0';
end;
end;

procedure Talis.odeonayClick(Sender: TObject);
begin
 if  messagedlg('   |=> '+dbedit13.Text+' <=| '+
    'Firmasýna '+'   |=> '+edit16.Text+' YTL  <=|  Miktarýnda Ödeme yapmayý'+#13+'   Onaylýyomusunuz ?'
    ,
     mtwarning,[mbyes,mbno],0)= mryes

   then

 begin


 dbedit10.Text:=floattostr(strtofloat(dbedit10.Text)+strtofloat(edit16.Text));
dbedit11.Text:=edit17.Text;
if odemetarih.Enabled=true then dbedit9.Text:=datetostr(odemetarih.DateTime)
else dbedit9.Text:='';
msn.Title:='Ödeme Yapýldý ..!';
 msn.MessageText:=dbedit13.text+#13+#13+'Ýsimli Firmaya '+edit16.Text+' YTL'+#13+'Ödeme Yapýldý ..' ;
 msn.Popup;
  dbedit14.Visible:=true;
  dbgrid1.Enabled:=true;
 dbgrid2.Enabled:=true;
 butonbox.Enabled:=true;
 esc.Enabled:=true;
 adoquery1.Post;
 odemebox.Visible:=false;
  edit7.Enabled:=true;
 end;

end;

procedure Talis.odeiptalClick(Sender: TObject);
begin
 if  messagedlg('   |=> '+dbedit13.Text+' <=| '+
    'Firmasýna '+'   |=> '+edit16.Text+' YTL  <=|  Miktarýnda Ödeme yapmayý'+#13+' Ýptal Ediyorsunuz Ýptal Edilsin mi ?'
    ,
     mtwarning,[mbyes,mbno],0)= mryes

   then

 begin

  dbgrid1.Enabled:=true;
 dbgrid2.Enabled:=true;
 butonbox.Enabled:=true;
 esc.Enabled:=true;
 odemebox.Visible:=false;
  edit7.Enabled:=true;
end;
 end;

end.
