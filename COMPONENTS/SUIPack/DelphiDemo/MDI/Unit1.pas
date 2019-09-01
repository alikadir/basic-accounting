unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SUIForm, Menus, SUIMainMenu, SUIMgr;

type
  TForm1 = class(TForm)
    suiMainMenu1: TsuiMainMenu;
    FilemenuofMain1: TMenuItem;
    Exit1: TMenuItem;
    Window1: TMenuItem;
    Cascade1: TMenuItem;
    ile1: TMenuItem;
    suiMDIForm1: TsuiMDIForm;
    procedure Exit1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure ile1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Exit1Click(Sender: TObject);
begin
    Close();
end;

procedure TForm1.Cascade1Click(Sender: TObject);
begin
    suiMDIForm1.Cascade();
end;

procedure TForm1.ile1Click(Sender: TObject);
begin
    suiMDIForm1.Tile();
end;

end.
