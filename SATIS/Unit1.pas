unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, ADODB, SUIForm,
  ComCtrls, Buttons, ExtCtrls, RzBHints;

type
  Tveris = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo2: TDBMemo;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    satbox: TGroupBox;
    Edit1: TEdit;
    onay: TBitBtn;
    iptal: TBitBtn;
    sat: TBitBtn;
    Edit2: TEdit;
    tarihbox: TDateTimePicker;
    toptan: TRadioButton;
    perakende: TRadioButton;
    Edit3: TEdit;
    bufiyat: TRadioButton;
    msn: TsuiMSNPopForm;
    Edit4: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    urunbox: TGroupBox;
    musteribox: TGroupBox;
    Panel1: TPanel;
    Satilmisbox: TGroupBox;
    Panel2: TPanel;
    Panel4: TPanel;
    Edit6: TEdit;
    Edit7: TEdit;
    RzBalloonHints1: TRzBalloonHints;
    esc: TBitBtn;
    odeme: TBitBtn;
    Edit8: TEdit;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    odemebox: TGroupBox;
    butonbox: TPanel;
    pesinode: TCheckBox;
    vadetarihi: TDateTimePicker;
    Label24: TLabel;
    odeonay: TBitBtn;
    odeiptal: TBitBtn;
    Edit5: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Edit12: TEdit;
    Label29: TLabel;
    Edit13: TEdit;
    Label30: TLabel;
    odemekalantarih: TDateTimePicker;
    Label31: TLabel;
    DBEdit17: TDBEdit;
    Label27: TLabel;
    procedure DBEdit1Change(Sender: TObject);
    procedure escClick(Sender: TObject);
    procedure satClick(Sender: TObject);
    procedure bufiyatClick(Sender: TObject);
    procedure perakendeClick(Sender: TObject);
    procedure toptanClick(Sender: TObject);
    procedure onayClick(Sender: TObject);
    procedure odemeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure pesinodeClick(Sender: TObject);
    procedure iptalClick(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit13Change(Sender: TObject);
    procedure odeiptalClick(Sender: TObject);
    procedure odeonayClick(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  veris: Tveris;
  btus1,btus2,btus3:boolean;
implementation

{$R *.dfm}

procedure Tveris.DBEdit1Change(Sender: TObject);
 
begin
 datasource3.enabled:=true;
adoquery3.close;
adoquery3.sql.clear;
adoquery3.sql.add('select * from SatilanUrun');
adoquery3.sql.add('where MusteriAdiSoyadi='''+dbedit1.Text+'''');
//adoquery3.Parameters.ParamByName('ad').Value:=dbedit1.Text;
adoquery3.open;

end;

procedure Tveris.escClick(Sender: TObject);
begin
veris.Close;
end;

procedure Tveris.satClick(Sender: TObject);
begin
if not (dbedit1.text='') then
begin
edit4.Text:=dbedit6.text;
butonbox.Enabled:=false;
odemebox.Visible:=false;
musteribox.Enabled:=false;
urunbox.Enabled:=false;
satilmisbox.Enabled:=false;

satbox.visible:=true;
edit1.text:=dbedit1.Text;
edit2.Text:=dbedit5.text;
tarihbox.DateTime:=(now);
adoquery3.Insert;
edit4.Visible:=false;
end
else
showmessage('Sat�� Yapmak ��in M��teri Tan�ml� De�il !');
end;

procedure Tveris.bufiyatClick(Sender: TObject);
begin
 edit4.Visible:=true;
end;

procedure Tveris.perakendeClick(Sender: TObject);
begin
 edit4.Visible:=false;
end;

procedure Tveris.toptanClick(Sender: TObject);
begin
 edit4.Visible:=false;
end;

procedure Tveris.onayClick(Sender: TObject);
var
durum,fiyat:string;
ana,sat:integer;
borc:real;
begin
 if not  (edit3.text='')  then
begin
ana:=strtoint (dbedit9.Text);
sat:=strtoint(edit3.Text);
if (ana)>=(sat) then
begin
if toptan.Checked=true then fiyat:= dbedit7.Text;
if perakende.Checked=true then fiyat:= dbedit8.Text;
if bufiyat.Checked=true then fiyat:= edit4.Text;
if pesinode.Checked=true then durum:= fiyat+' YTL Olarak Pe�in �dendi ';

if  messagedlg('   |=> '+dbedit4.Text+' <=| '+' Firmas�ndan Al�nm�� '+'   |=> '+dbedit5.Text+' <=| '+
    ' �simli �r�n�   '+#13+'|=> '+dbedit1.text+' <=|'+' �simli M��teriye '+#13+
    'Fiyat� : '+fiyat+' , �deme Durumu : '+durum + #13+' Girdi�iniz Bu Bilgiler Do�rultusunda Satmay� Onayl�yomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin
adoquery3.Insert;
adoquery3.Edit;
dbedit10.Text:=edit1.text;
dbedit11.Text:=edit2.Text;
dbedit12.Text:=datetostr(tarihbox.DateTime);
dbedit13.Text:=fiyat;
dbedit17.Text:=edit3.Text;


if pesinode.Checked=true then
begin
dbedit14.Text:=fiyat;
dbedit16.Text:='0';
end
else
begin
dbedit14.Text:='0';
dbedit16.Text:=fiyat;
dbedit15.text:=datetostr(vadetarihi.DateTime);
end;

 adoquery1.Edit;
 adoquery2.Edit;
 dbedit9.Text:= inttostr((ana)-(sat));
 adoquery1.Post;
 msn.Title:='�r�n Sat�ld�';
 msn.MessageText:=edit2.text+#13+#13+'�r�n Ba�ar�yla'+#13+'Sat�ld�..' ;
 msn.Popup;
 adoquery3.Post;
 adoquery2.Post;
 adoquery3.Refresh;
 adoquery2.Refresh;
 satbox.Visible:=false;
 musteribox.Enabled:=true;
urunbox.Enabled:=true;
satilmisbox.Enabled:=true;
butonbox.Enabled:=true;

  adoquery3.First;
    borc:=0;
while ( not adoquery3.Eof ) do
begin
 borc:=borc + strtofloat ( adoquery3.FieldByName('kalan').asstring);
 adoquery3.Next;
end;
  adoquery1.Edit;
  dbedit2.Text:=floattostr(borc);
  adoquery1.Post;
  adoquery1.Refresh;

 end;
end
else
showmessage('Stoktaki '+'|=> '+dbedit5.text+' <=| �simli �r�n '+dbedit9.Text+' Adet '+#13+
'Siz '+dbedit9.text+ ' Adet �r�n�n�zden Fazlas�n� Satmak �stiyosunuz !!');
end
else
showmessage(' B�l�mleri Tam (Eksiksiz) Doldurun ! ');

end;

procedure Tveris.odemeClick(Sender: TObject);
var
kalan:real;
begin
if not (dbedit11.Text='') then
begin
kalan:=strtofloat(dbedit16.text);
if (kalan>0) then
begin
odemebox.Visible:=true;
satbox.visible:=false;

edit5.Text:=dbedit10.Text;
edit9.Text:=dbedit11.Text;
edit11.Text:=dbedit16.Text;

musteribox.Enabled:=false;
urunbox.Enabled:=false;
satilmisbox.Enabled:=false;
butonbox.Enabled:=false;
end
else
showmessage('M��terinin '+'|=> '+dbedit11.text+' <=| Bu �r�ne Ait Borcu G�r�nm�yor !!');
end
else
showmessage('�deme Yapmak ��in �r�n Tan�ml� De�il !');
end;

procedure Tveris.FormCreate(Sender: TObject);
begin

setwindowlong(handle,gwl_style,getwindowlong(handle,
gwl_style) and not ws_caption);
height:=height+1;
 AnimateWindow(veris.Handle,1000,AW_VER_PoSITIVE);
satbox.visible:=false;
odemebox.Visible:=false;
end;

procedure Tveris.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;
procedure Tveris.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  begin
if (key=VK_DECIMAL) then
begin
edit4.Text:=edit4.text +'.';
edit4.SelStart:=(length(edit4.Text));
end;
end;


procedure Tveris.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;
procedure Tveris.pesinodeClick(Sender: TObject);
begin
if pesinode.Checked=true then vadetarihi.Visible:=false
else
vadetarihi.Visible:=true;
end;

procedure Tveris.iptalClick(Sender: TObject);
begin
 satbox.Visible:=false;
 musteribox.Enabled:=true;
urunbox.Enabled:=true;
satilmisbox.Enabled:=true;
butonbox.Enabled:=true;
adoquery3.Refresh;
adoquery2.Refresh;
end;

procedure Tveris.Edit12Change(Sender: TObject);
var
kalan,odenen,borc:real;
begin
if edit12.text='' then
begin
edit12.text:='0';
edit12.SelStart:=(length(edit12.Text));
end;
kalan:=strtofloat(edit11.text);
odenen:=strtofloat(edit12.Text);
borc:=kalan-odenen;
edit13.Text:=floattostr(borc);
end;

procedure Tveris.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Tveris.Edit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_DECIMAL) then
begin
edit12.Text:=edit12.text +'.';
edit12.SelStart:=(length(edit12.Text));
end;
end;

procedure Tveris.Edit13Change(Sender: TObject);
var
deniyos:real;
begin
deniyos:=strtofloat(edit13.Text);
if deniyos>0 then odemekalantarih.Visible:=true
else
odemekalantarih.Visible:=false;
end;

procedure Tveris.odeiptalClick(Sender: TObject);
begin
musteribox.Enabled:=true;
urunbox.Enabled:=true;
satilmisbox.Enabled:=true;
butonbox.Enabled:=true;
odemebox.Visible:=false;
adoquery3.Refresh;
adoquery2.Refresh;
end;

procedure Tveris.odeonayClick(Sender: TObject);
var
borc,odenen,odenmis:real;
begin
adoquery3.Edit;
odenen:=strtofloat(edit12.text);
 odenmis:=strtofloat(dbedit14.Text);
 if odenen>0 then
 begin

 if  messagedlg('|=> '+dbedit1.text+' <=|'+' �simli M��teriye '+#13+
    'Sat�lm�� Olan '+'|=> '+edit9.text+' <=|'+' �simli �r�n�n �cretini '+#13+'�demeyi Onayl�yomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then
   begin

 adoquery3.Edit;

 dbedit14.Text:=floattostr((odenmis)+(odenen));
  if odemekalantarih.Visible=true then dbedit15.Text:=datetostr(odemekalantarih.DateTime);
 dbedit16.Text:=edit13.Text;

  msn.Title:='�cret �dendi';
 msn.MessageText:=edit9.text+#13+#13+'�r�n�n �creti'+#13+'�dendi ..' ;
 msn.Popup;



  adoquery3.Post;
  adoquery3.Refresh;
adoquery2.Refresh;
  musteribox.Enabled:=true;
urunbox.Enabled:=true;
satilmisbox.Enabled:=true;
butonbox.Enabled:=true;
odemebox.Visible:=false;

    adoquery3.First;
    borc:=0;
while ( not adoquery3.Eof ) do
begin
 borc:=borc + strtofloat ( adoquery3.FieldByName('kalan').asstring);
 adoquery3.Next;
end;
  adoquery1.Edit;
  dbedit2.Text:=floattostr(borc);
  adoquery1.Post;
  adoquery1.Refresh;
 end;
 end
 else
 showmessage('�denen Paray� Yazmad�n�z !');
 end;

procedure Tveris.Edit8Change(Sender: TObject);
var
smetin,sbulunan:string;
secimuz:integer;
begin

 if btus1=true then
 begin
 btus1:=false;
 exit;
 end;
  if not (dbedit1.text='') then
 begin
 adoquery1.Locate('IsimSoyad',edit8.Text,[loPartialKey,
 loCaseInsensitive]);
 smetin:=edit8.Text;
 sbulunan:=adoquery1.FieldValues['IsimSoyad'];
 secimuz:=length(sbulunan) - length(smetin);
 if secimuz > 0 then
 begin
 edit8.Text:=sbulunan;
 edit8.SelStart:=length(smetin);
 edit8.SelLength:=secimuz;
 end;
 end;
 end;
procedure Tveris.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
begin
  if (key=VK_DELETE) OR (key=VK_BACK) then
 btus1:=true;
  end;
end;

procedure Tveris.Edit6Change(Sender: TObject);
var
smetin,sbulunan:string;
secimuz:integer;
begin

 if btus2=true then
 begin
 btus2:=false;
 exit;
 end;
  if not (dbedit5.text='') then
 begin
 adoquery2.Locate('Cinsi',edit6.Text,[loPartialKey,
 loCaseInsensitive]);
 smetin:=edit6.Text;
 sbulunan:=adoquery2.FieldValues['Cinsi'];
 secimuz:=length(sbulunan) - length(smetin);
 if secimuz > 0 then
 begin
 edit6.Text:=sbulunan;
 edit6.SelStart:=length(smetin);
 edit6.SelLength:=secimuz;
 end;
 end;
 end;
procedure Tveris.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
begin
  if (key=VK_DELETE) OR (key=VK_BACK) then
 btus2:=true;
  end;
end;
procedure Tveris.Edit7Change(Sender: TObject);
var
smetin,sbulunan:string;
secimuz:integer;
begin

 if btus3=true then
 begin
 btus3:=false;
 exit;
 end;
  if not (dbedit11.text='') then
 begin
 adoquery3.Locate('Cinsi',edit7.Text,[loPartialKey,
 loCaseInsensitive]);
 smetin:=edit7.Text;
 sbulunan:=adoquery3.FieldValues['Cinsi'];
 secimuz:=length(sbulunan) - length(smetin);
 if secimuz > 0 then
 begin
 edit7.Text:=sbulunan;
 edit7.SelStart:=length(smetin);
 edit7.SelLength:=secimuz;
 end;
 end;
 end;

procedure Tveris.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
begin
  if (key=VK_DELETE) OR (key=VK_BACK) then
 btus3:=true;
  end;
end;
end.