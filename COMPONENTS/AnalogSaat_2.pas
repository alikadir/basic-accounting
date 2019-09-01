unit AnalogSaat_2;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

const

  pib180     = pi/180;
  pixelcount = 2048;

type
 _pRGB = ^Trgb;
  Trgb  = array[0..pixelcount-1] of Trgbtriple;

  pRGB  = array[0..pixelcount-1] of _pRGB;

type


  Tsekil  = (ts_kare,ts_daire);

  TAnalogSaat_2 = class(TGraphicControl)
  private
  _timer  : TTimer;
  r,x0,y0 : integer;
  _saat   : _SystemTime;
  fsaat   : tbitmap;
    FTransparent: boolean;
    FSaatKadranRenk: Tcolor;
    FSaniyeKadranRenk: Tcolor;
    FDakikaKadranRenk: Tcolor;
    FSaatKadrankalinlik: integer;
    FDakikaKadranKalinlik: integer;
    FSaniyeKadranKalinlik: integer;
    FBackground: tcolor;
    FText: string;
    FPicture: tpicture;
    FActive: boolean;
    FSekil: tsekil;
  procedure saatgovde;
  procedure tazele;
  procedure ozellikkur;
  procedure saatkadranciz(x0,y0,x1,y1:real);
    procedure __Timer(Sender: TObject);
    procedure SetTransparent(const Value: boolean);
    procedure SetSaatKadranRenk(const Value: Tcolor);
    procedure SetDakikaKadranRenk(const Value: Tcolor);
    procedure SetSaniyeKadranRenk(const Value: Tcolor);
    procedure SetSaatKadrankalinlik(const Value: integer);
    procedure SetDakikaKadranKalinlik(const Value: integer);
    procedure SetSaniyeKadranKalinlik(const Value: integer);
    procedure SetBackground(const Value: tcolor);
    procedure SetText(const Value: string);
    procedure SetPicture(Value: tpicture);
    procedure SetActive(const Value: boolean);
    procedure SetSekil(const Value: tsekil);
    { Private declarations }
  protected

    { Protected declarations }
  public
  constructor Create(aowner:tcomponent);override;
  destructor Destroy;override;
  procedure Paint;override;
    { Public declarations }
  published
  property Transparent:boolean read FTransparent write SetTransparent default False;
  property SaatKadranRenk : Tcolor read FSaatKadranRenk write SetSaatKadranRenk default clRed;
  property SaatKadranKalinlik : integer read FSaatKadrankalinlik write SetSaatKadrankalinlik  default 3;
  property DakikaKadranRenk : Tcolor read FDakikaKadranRenk write SetDakikaKadranRenk default clNavy;
  property DakikaKadranKalinlik : integer read FDakikaKadranKalinlik write SetDakikaKadranKalinlik default 2;
  property SaniyeKadranRenk : Tcolor read FSaniyeKadranRenk write SetSaniyeKadranRenk  default clgreen;
  property SaniyeKadranKalinlik : integer read FSaniyeKadranKalinlik write SetSaniyeKadranKalinlik default 1;
  property Background : tcolor read FBackground write SetBackground default clsilver;
  property Text:string read FText write SetText ;
  property Font;
  property Picture:tpicture read FPicture write SetPicture;
  property Active:boolean read FActive write SetActive Default True;
  property Popupmenu;
  property Sekil:tsekil read FSekil write SetSekil default ts_kare;

    { Published declarations }
  end;

procedure Register;
var
    img_data : pRGB;

implementation
{$r analogsaat_2.dcr}
procedure Register;
begin
  RegisterComponents('alikadir', [TAnalogSaat_2]);
end;

{ TAnalogSaat }

constructor TAnalogSaat_2.Create(aowner: tcomponent);
begin
  inherited Create(aowner);
  Fpicture              := TPicture.Create ;
  fsaat                 := tbitmap.create;
  _timer                := TTimer.Create(self);
  _timer.Interval       := 1000;
  _timer.Enabled        := true;
  _timer.OnTimer        := __Timer;

  ozellikkur ;
  repaint;

end;

destructor TAnalogSaat_2.Destroy;
begin
  FPicture.Free ;
  _timer.free;
  fsaat.free;
  inherited destroy;

end;

procedure loadimg(temp:tbitmap);
var
i:integer;
begin
for i:=0 to 10 do
img_data[i] := temp.scanline[i];
end;

procedure TAnalogSaat_2.ozellikkur;
begin
  width                 := 100;
  height                := 100;
  Transparent           := False;
  SaatKadranRenk        := clRed;
  SaatKadranKalinlik    := 3;
  DakikaKadranRenk      := clNavy;
  DakikaKadranKalinlik  := 2;
  SaniyeKadranRenk      := clGreen ;
  SaniyeKadranKalinlik  := 1;
  Background            := clSilver;
  Text                  := 'By alikadir';
  Active                := True;
  sekil                 := ts_kare;
end;

procedure TAnalogSaat_2.Paint;
var
_x,__x,___x : integer;
r1,r2,r3    : integer;
i,j         : integer;
begin
if fsaat.Width <> Width then
fsaat.Width := width;
if fsaat.Height  <> Height  then
fsaat.Height  := Height ;

//*********** saat gövdesi çiziliyor**************//
fsaat.canvas.Font.Assign(Font);
saatgovde;

//************yerel saat öðreniliyor*****************//
GetLocalTime( _saat );

{

  saat i gösterecek olan kadarnýn açýsý ayarlanýyor
  ayrýca dakikanýn ilerleyiþi dikkate alýnýyor

}
_x   :=  round( _saat.wMinute  * 0.5 ) + ( (_saat.wHour mod 12) * 30);
_x   := 180 - _x;

// dakikayý gösterecek olan kadranýn açýsý hesaplanýyor
__x  := _saat.wMinute*6;  //her bir adým  da 6 derece oynuyor
__x  := 180 - __x;

//saniyeyi gösterecek olan kadranýn açýsý hesaplanýyor
___x := _saat.wSecond*6; //her bir adým  da 6 derece oynuyor
___x := 180 - ___x;

//kadranýn çaplarý hesaplanýyor
r1 := r div 2;
r2 := round ( r * 0.70 );
r3 := round ( r * 0.80 );

//kadranlar ekrana çiziliyor..
with fsaat do
begin
canvas.pen.width := SaatKadranKalinlik;
canvas.pen.color := SaatKadranRenk;
saatkadranciz(x0 , y0 , x0 +  r1 * sin(pib180 * _x) , y0 + r1 * cos(pib180 * _x) );
//canvas.MoveTo( x0 , y0);
//canvas.lineto(  ),
//               );

canvas.pen.width := DakikaKadranKalinlik ;
canvas.pen.Color := DakikaKadranRenk ;
canvas.MoveTo( x0 , y0 );
canvas.lineto( x0 + round( r2 * sin(pib180 * __x) ),
               y0 + round( r2 * cos(pib180 * __x) ));

canvas.pen.width := SaniyeKadranKalinlik ;
canvas.pen.color := SaniyeKadranRenk ;
canvas.MoveTo( x0 , y0);
canvas.lineto( x0 + round( r3 * sin(pib180 * ___x) ),
               y0 + round( r3 * cos(pib180 * ___X) ));
end;

if sekil = ts_daire then
 begin
// loadimg(fsaat);
 {if (img_data[0] = nil) or (img_data[0]<>fsaat.ScanLine[0])then
  loadimg;
{  for j:=0 to fsaat.height -1 do
  for i:=0 to fsaat.width - 1 do
   if sqrt( (x0-i)*(x0-i) + (y0-j)*(y0-j)) > r then
    begin
     img_data[j,i].rgbtBlue := 0;
     img_data[j,i].rgbtGreen := 0;
     img_data[j,i].rgbtRed := 0;
    end;  }
 end;

canvas.draw(0,0,fsaat);
end;



procedure TAnalogSaat_2.saatgovde;
var
t_w,i,h,w  : integer;
_x0,_y0,_r : real;
tr : trect;
_i,_j : integer;

begin
 _x0 := (width / 2);
 _y0 := (height / 2);

 //***********saat dairesinin alaný hesaplanýyor
 if width < height then
  begin
   tr.left  := 0;
   tr.Right := width ;
   tr.top  := (height - width) div 2;
   tr.Bottom := tr.top + width;

  end
  else if height < width then
  begin
   tr.left  := (width - height) div 2;
   tr.Right := tr.left + height;
   tr.top  :=0;
   tr.Bottom := height;

  end
  else tr:=ClientRect ;

  //**********************************************

  //çap hesaplanýyor
  _r :=(tr.Right - tr.left - 20) / 2;

with fsaat do
 begin

  if self.Transparent then
   begin
    TransparentColor := Background;
    Transparent := true;
   end
  else
   begin
    canvas.brush.color := background;
    canvas.fillrect(clientrect);
   end;

//****ekrana varsa grafik çiziliyor**********
 if picture.Graphic  <> nil then
 begin
  // grafik in çizime baþlanacak kooordinatý hesaplanýyor
  if picture.width<width then
   w := (width - picture.width) div 2
  else
   w:=0;

  if picture.height<Height then
   h := (Height - picture.Height )  div 2
  else
  h:=0;
  //********************************************
  canvas.Draw(w,h,picture.graphic);
  canvas.brush.Style := bsclear;
 end;
//***********************************************

//*******ana çember****************
 canvas.pen.color   := clsilver;
 canvas.pen.width   := 3;

 canvas.Ellipse(tr);
//**************************************

//**************iç çember******************
 canvas.pen.color   := clgray;
 canvas.pen.width   := 2;

 tr.left := tr.left   + 3;
 tr.Right := tr.Right - 3;
 tr.Top := tr.top +3;
 tr.Bottom := tr.Bottom -3;
 canvas.Ellipse(tr);
//*********************************************

//************rakamlar çiziliyor*******************
 canvas.font.Style  := canvas.font.Style + [fsbold];
 canvas.brush.Style := bsclear;
 for i:=1 to 12 do
 canvas.TextOut( round(_x0 +  (_r * sin( pib180 * (180 - (i * 30) ) ))) - (canvas.textwidth(inttostr(i)) div 2),
                 round(_y0 +  (_r * cos( pib180 * (180 - (i * 30) ) ))) - (canvas.textheight(inttostr(i)) div 2),
                inttostr(i));
//***************************************************

//***********saat ler arasý noktalar konuluyor******
 canvas.brush.style := bssolid;
 canvas.pen.Style   := psclear;
 for i:=1 to 60 do
  begin
   if i mod 5 = 0 then continue;   //eðer saat üzerine geldiyse atal
   //koordinatlar hesaplanýyor
   _i := round(_x0 +  (_r * sin( pib180 * (180 - (i * 6) ) )));
   _j := round(_y0 +  (_r * cos( pib180 * (180 - (i * 6) ) )));
   //iki adet elips çiz
   canvas.Brush.color := clgray;
   canvas.Ellipse(_i-2,_j-2,_i+2,_j+2);
   canvas.Brush.color := clsilver;
   canvas.Ellipse(_i-1,_j-1,_i+3,_j+3);
  end;

//***************************************************

//********text i ekrana yaz***********
 canvas.brush.Style := bsclear;
 t_w := canvas.TextWidth ( text );
 if (tr.Right - tr.left) >= t_w then
 canvas.textout( ( width - t_w ) div 2 , round(tr.Bottom * 0.8),text);
//**************************************

 canvas.brush.Style := bssolid;
 x0 := round(_x0);
 y0 := round(_y0);
 r  := trunc(_r);

//***********göbek çember çiziliyor
 canvas.pen.Style :=  psClear ;
 canvas.Brush.Color := SaatKadranRenk ;
 canvas.Ellipse(x0-5,y0-5,x0+5,y0+5);
 canvas.pen.Style :=  psSolid ;
//*************************************
 end;

end;


procedure TAnalogSaat_2.saatkadranciz(x0, y0, x1, y1: real);
var
_x0 , _y0 , _x1 , _y1 ,
e , _e , mx, my ,cosx , sinx : real;

begin
mx := abs(x1-x0) ; my := abs(y1-y0);
e  := sqrt(mx*mx+my*my);
_e := 8;

if (x0>=x1) and (y1>=y0) then
begin
cosx := mx/e; sinx := my/e;
cosx := -sinx ; sinx := - cosx;

_x0 := _e*(cosx*sin(pib180*-30) + sinx*cos(pib180*-30));
_y0 := _e*(sinx*sin(pib180*-30) - cosx*cos(pib180*-30));

_x1 := _e*(cosx*sin(pib180*-30) - sinx*cos(pib180*-30));
_y1 := _e*(sinx*sin(pib180*-30) + cosx*cos(pib180*-30));

with fsaat do
 begin
  canvas.MoveTo(trunc(x0),trunc(y0));
  canvas.LineTo(trunc(x1),trunc(y1));

{  canvas.moveto(trunc(x1),trunc(y1));
  Canvas.LineTo(trunc(x1+_x0),trunc(y1+_y0));

  canvas.moveto(trunc(x1),trunc(y1));
  Canvas.LineTo(trunc(x1+_x1),trunc(y1+_y1));}

 end;
end
else
with fsaat do
 begin
  canvas.MoveTo(trunc(x0),trunc(y0));
  canvas.LineTo(trunc(x1),trunc(y1));
 end;

end;

procedure TAnalogSaat_2.SetActive(const Value: boolean);
begin
  FActive := Value;
end;

procedure TAnalogSaat_2.SetBackground(const Value: tcolor);
begin
  FBackground := Value;
  tazele;
end;


procedure TAnalogSaat_2.SetDakikaKadranKalinlik(const Value: integer);
begin
  FDakikaKadranKalinlik := Value;
  tazele;
end;

procedure TAnalogSaat_2.SetDakikaKadranRenk(const Value: Tcolor);
begin
  FDakikaKadranRenk := Value;
  tazele;
end;


procedure TAnalogSaat_2.SetPicture(Value: tpicture);
begin
  FPicture.Assign(Value);
  tazele;
end;

procedure TAnalogSaat_2.SetSaatKadrankalinlik(const Value: integer);
begin
  FSaatKadrankalinlik := Value;
  tazele;
end;

procedure TAnalogSaat_2.SetSaatKadranRenk(const Value: Tcolor);
begin
  FSaatKadranRenk := Value;
  tazele;
end;

procedure TAnalogSaat_2.SetSaniyeKadranKalinlik(const Value: integer);
begin
  FSaniyeKadranKalinlik := Value;
  tazele;
end;

procedure TAnalogSaat_2.SetSaniyeKadranRenk(const Value: Tcolor);
begin
  FSaniyeKadranRenk := Value;
  tazele;
end;

procedure TAnalogSaat_2.SetSekil(const Value: tsekil);
begin
  FSekil := Value;
end;

procedure TAnalogSaat_2.SetText(const Value: string);
begin
if ftext<>value then
 begin
  FText := Value;
  tazele;
 end;
end;

procedure TAnalogSaat_2.SetTransparent(const Value: boolean);
begin
if FTransparent <> Value then
begin
  FTransparent := Value;
  tazele;
end;
end;


procedure TAnalogSaat_2.tazele;
var
tr : trect;
h  : integer;
begin
tr.Left   := left;
tr.Top    := top;
tr.Right  := left + width;
tr.Bottom := top  + height;
if parent = nil then exit;
h := (parent as tform).handle;

if h>-1 then
 begin
 InvalidateRect(h,@tr,false);
 end;

end;

procedure TAnalogSaat_2.__Timer(Sender: TObject);
var
s:String;
begin
s:=(parent as tform).Name;
if (application.FindComponent(s)=nil)or(not active) then exit;
tazele;
end;


end.
