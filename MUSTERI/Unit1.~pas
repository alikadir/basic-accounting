unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, ADODB, Mask,
  ComCtrls, ExtCtrls, SUIDlg, SUIForm, RzBHints, SUIButton, SUIImagePanel,
  DBTables;

type
  Tmusteri = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Duzenle: TBitBtn;
    Label10: TLabel;
    Box: TGroupBox;
    DBMemo2: TDBMemo;
    onay: TBitBtn;
    iptal: TBitBtn;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    tarihbox: TDateTimePicker;
    Memo2: TMemo;
    msn: TsuiMSNPopForm;
    sil: TBitBtn;
    yeni: TBitBtn;
    yenionay: TBitBtn;
    yeniiptal: TBitBtn;
    RzBalloonHints1: TRzBalloonHints;
    Panel1: TPanel;
    suiRadioButton1: TsuiRadioButton;
    suiRadioButton4: TsuiRadioButton;
    suiPanel1: TsuiPanel;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Edit5: TEdit;
    ADOQuery1: TADOQuery;
    Image2: TImage;
    Image3: TImage;
    Label8: TLabel;
    
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DuzenleClick(Sender: TObject);



    
    procedure onayClick(Sender: TObject);
    procedure iptalClick(Sender: TObject);
    procedure silClick(Sender: TObject);
    procedure yeniClick(Sender: TObject);
    procedure yenionayClick(Sender: TObject);
    procedure yeniiptalClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);

    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  musteri: Tmusteri;
  btus:boolean;
implementation

{$R *.dfm}



procedure Tmusteri.FormCreate(Sender: TObject);
begin





setwindowlong(handle,gwl_style,getwindowlong(handle,
gwl_style) and not ws_caption);
height:=height+1;
box.Visible:=false;
AnimateWindow(musteri.Handle,1000,AW_HOR_POSITIVE OR AW_HOR_NEGATIVE OR AW_SLIDE);
end;

procedure Tmusteri.DateTimePicker1CloseUp(Sender: TObject);
begin
  dbedit7.Text:= datetostr(tarihbox.Date);
end;

procedure Tmusteri.DuzenleClick(Sender: TObject);
begin
if not(dbedit1.text='')
  then
 begin
 image1.Visible:=false;
 dbgrid1.Enabled:=false;
 yeni.Enabled:=false;
 sil.Enabled:=false;
 duzenle.Enabled:=false;
 box.Visible:=true;
 box.Caption:='  Müþteri Düzenle  ';
      yenionay.Visible:=false;;
      yeniiptal.Visible:=false;
      onay.Visible:=true;
      iptal.Visible:=true;

           edit1.Text:=dbedit1.Text;
           memo1.Lines.Text:=dbmemo1.Lines.Text;
           edit2.Text:=dbedit2.Text;
           edit3.Text:=dbedit3.Text;
           edit4.Text:=dbedit4.Text;
           tarihbox.DateTime:=strtodate(dbedit5.text);
           label8.Caption:=dbedit7.text;

           memo2.Lines.Text:=dbmemo2.Lines.Text;
                       end
     else
 showmessage(' Düzenlemek Ýçin Seçilmiþ Bir Müþteri Yok ..!'+#13+'                      Bir Müþteri Seçin !');
     end;




procedure Tmusteri.onayClick(Sender: TObject);

begin
  if not(edit1.text='')
  then
 begin


if  messagedlg('   |=> '+dbedit1.Text+' <=| '+
   'Müþteri ye Yapýlan Düzenlemeyi'+#13+'   Onaylýyomusunuz ?',
    mtwarning,[mbyes,mbno],0)= mryes

then

begin

   dbgrid1.Enabled:=true;
          adoquery1.Edit;

   dbedit1.enabled:=true;
   dbedit2.enabled:=true;
   dbedit3.enabled:=true;
   dbedit4.enabled:=true;
   dbedit5.enabled:=true;

   dbedit7.enabled:=true;
   dbmemo1.enabled:=true;
   dbmemo2.enabled:=true;

           dbedit1.Text:=edit1.Text;
           dbmemo1.Lines.Text:=memo1.Lines.Text;
           dbedit2.Text:=edit2.Text;
           dbedit3.Text:=edit3.Text;
           dbedit4.Text:=edit4.Text;
           dbedit5.text:=datetostr(tarihbox.DateTime);


           dbmemo2.Lines.Text:=memo2.Lines.text;

msn.Title:='Düzenleme Kaydedildi ..!';
msn.MessageText:=edit1.text+#13+#13+'Müþteri Baþarýyla'+#13+'Kaydedildi ..' ;
msn.Popup;
         image1.Visible:=true;
         box.Visible:=false;
         yeni.Enabled:=true;
         sil.Enabled:=true;
         duzenle.Enabled:=true;
         adoquery1.post;


   dbedit1.enabled:=false;
   dbedit2.enabled:=false;
   dbedit3.enabled:=false;
   dbedit4.enabled:=false;
   dbedit5.enabled:=false;

   dbedit7.enabled:=false;
   dbmemo1.enabled:=false;
   dbmemo2.enabled:=false;
            end;
           end
          else
   showmessage(' Alanlarýn Tamamýný Doldurun ..!'+#13+'                 Müþteri Ýsmi Yok !');

           end; 
procedure Tmusteri.iptalClick(Sender: TObject);
begin
if messagedlg('   |=> '+dbedit1.Text+' <=| '+
'Müþteriye Yapýlan Düzenleme'+#13+'   Ýptal Edilsin mi ?',
mtconfirmation,[mbyes,mbno],0)=mryes then
begin
    box.visible:=false;
    dbgrid1.Enabled:=true;
    yeni.Enabled:=true;
    sil.Enabled:=true;
    duzenle.Enabled:=true;
    image1.Visible:=true;
end;
end;

procedure Tmusteri.silClick(Sender: TObject);
begin
 if not(dbedit1.text='')
  then
 begin
  if  messagedlg('   |=> '+dbedit1.Text+' <=| '+
    'Müþteriyi ve Varsa Bu Müþterinin Aldýðý Ürünleri Veritabanýndan (Programdan)'+#13+'   Silmiþ Olacaksýnýz ..!'+#13+
    '                                                       Onaylýyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then

 begin

 msn.Title:='Kayýt Silindi ..!';
 msn.MessageText:=dbedit1.text+#13+#13+'Müþteri Baþarýyla'+#13+'Silindi ..' ;
 msn.Popup;

   adoquery1.Delete;
   adoquery1.refresh;

                   end;
                   end
                   else
 showmessage(' Silmek Ýçin Seçilmiþ Bir Müþteri Yok ..!'+#13+'                 Bir Müþteri Seçin !');
                   end;

procedure Tmusteri.yeniClick(Sender: TObject);
begin
     image1.Visible:=false;
     tarihbox.DateTime:=(now);
      yeni.Enabled:=false;
      duzenle.Enabled:=false;
      sil.Enabled:=false;

      adoquery1.Insert;
      dbgrid1.Enabled:=false;
      box.Visible:=true;
      box.Caption:='  Yeni Müþteri  ';
      yenionay.Visible:=true;
      yeniiptal.Visible:=true;
      onay.Visible:=false;
      iptal.Visible:=false;

 edit1.text:='';
 edit2.text:='';
 edit3.text:='';
 edit4.text:='';
 label8.Caption:=' Yeni Kayýt ( Borç Yok )';

 memo1.Lines.Text:='';
 memo2.Lines.Text:='';
 end;

procedure Tmusteri.yenionayClick(Sender: TObject);
 var
DENE : string;
aynisivarmi:boolean;
begin
 adoquery1.Insert;
 if not(edit1.text='')
  then
 begin


     DENE:=edit1.Text;
     adoquery1.First;
     aynisivarmi:=false;
while ( not adoquery1.Eof ) do
begin
     if (adoquery1.FieldByName('isimsoyad').asstring)=(DENE) then
 begin
     aynisivarmi:=true;

 end;
     adoquery1.Next;
end;

 if aynisivarmi=false then
 begin

 if  messagedlg('   |=> '+edit1.Text+' <=| '+
    ' Ýsimli Bi Müþteri oluþturmak Üzeresiniz '+#13+'  Bu Kaydý '+#13+
    '                  Onaylýyomusunuz ?',
     mtwarning,[mbyes,mbno],0)= mryes

   then

 begin
 dbgrid1.Enabled:=true;
  adoquery1.Insert;
 adoquery1.Edit;

   dbedit1.enabled:=true;
   dbedit2.enabled:=true;
   dbedit3.enabled:=true;
   dbedit4.enabled:=true;
   dbedit5.enabled:=true;

   dbedit7.enabled:=true;
   dbmemo1.enabled:=true;
   dbmemo2.enabled:=true;

           dbedit1.Text:=edit1.Text;
           dbmemo1.Lines.Text:=memo1.Lines.Text;
           dbedit2.Text:=edit2.Text;
           dbedit3.Text:=edit3.Text;
           dbedit4.Text:=edit4.Text;
           dbedit5.text:=datetostr(tarihbox.DateTime);


           dbmemo2.Lines.Text:=memo2.Lines.text;


 msn.Title:='Müþteri Oluþturuldu ..!';
 msn.MessageText:=edit1.text+#13+#13+'Müþteri Baþarýyla'+#13+'Oluþturuldu ..' ;
 msn.Popup;
         image1.Visible:=true;;
         box.Visible:=false;
         yeni.Enabled:=true;
         duzenle.Enabled:=true;
         sil.Enabled:=true;
         adoquery1.post;


   dbedit1.enabled:=false;
   dbedit2.enabled:=false;
   dbedit3.enabled:=false;
   dbedit4.enabled:=false;
   dbedit5.enabled:=false;

   dbedit7.enabled:=false;
   dbmemo1.enabled:=false;
   dbmemo2.enabled:=false;
              end;
              end
              else
          begin
   showmessage('|=> '+(edit1.Text)+' <=| '+' isiminde kayýtlý bi müþteriniz zaten var !!');
           adoquery1.Insert;
           end;
           end
           else
           begin
  showmessage('Kayýt Yapabilmek Ýçin Bölümleri Eksiksiz Doldurun ! ');
            adoquery1.Insert;
            end;
           end;
procedure Tmusteri.yeniiptalClick(Sender: TObject);
begin
         image1.Visible:=true;
         box.visible:=false;
         dbgrid1.Enabled:=true;
         yeni.Enabled:=true;
         duzenle.Enabled:=true;
         sil.Enabled:=true;
end;

procedure Tmusteri.BitBtn1Click(Sender: TObject);

begin
musteri.Close;
end;


procedure Tmusteri.Edit5Change(Sender: TObject);
var
smetin,sbulunan:string;
secimuz:integer;
begin
 if btus=true then
 begin
 btus:=false;
 exit;
 end;
 if not (dbedit1.text='') then
 begin
 adoquery1.Locate('isimsoyad',edit5.Text,[loPartialKey,
 loCaseInsensitive]);
 smetin:=edit5.Text;
 sbulunan:=adoquery1.FieldValues['isimsoyad'];
 secimuz:=length(sbulunan) - length(smetin);
 if secimuz > 0 then
 begin
 edit5.Text:=sbulunan;
 edit5.SelStart:=length(smetin);
 edit5.SelLength:=secimuz;
 end;
 end;

 end;




procedure Tmusteri.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=VK_DELETE) OR (key=VK_BACK) then
 btus:=true;
end;

procedure Tmusteri.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

procedure Tmusteri.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (key>='0') and (key<='9') or (key=#8)  then
 begin
 key:=key;
 end
 else
 key:=chr(0);
end;

end.
