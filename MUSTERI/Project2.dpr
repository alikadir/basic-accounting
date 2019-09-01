program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {firma};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(Tmusteri, musteri);
  Application.Run;
end.
