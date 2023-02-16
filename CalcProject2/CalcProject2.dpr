program CalcProject2;

uses
  Forms,
  CalcProject02 in 'CalcProject02.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
