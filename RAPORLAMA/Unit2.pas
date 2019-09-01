unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDsgnDB, ppEndUsr, ExtCtrls, ppViewr, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppPrnabl, ppStrtch, ppMemo, ppBands, ppCache, StdCtrls;

type
  TForm2 = class(TForm)
    ppBDEPipeline1: TppBDEPipeline;
    ppReport1: TppReport;
    ppViewer1: TppViewer;
    Panel1: TPanel;
    ppDesigner1: TppDesigner;
    ds_data: TDataSource;
    tablo_data: TADOTable;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppMemo1: TppMemo;
    ppParameterList1: TppParameterList;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
ppReport1.Print;


end;


end.
