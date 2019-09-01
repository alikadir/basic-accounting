program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {veris};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tveris, veris);
  Application.Run;
end.
