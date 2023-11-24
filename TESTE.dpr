program TESTE;

uses
  Vcl.Forms,
  testandoerro in 'C:\Users\JAMES\Documents\Embarcadero\Studio\Projects\teste\testandoerro.pas' {Form1},
  Unit1 in 'C:\Users\JAMES\Documents\Embarcadero\Studio\Projects\serialPlacaMae\Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
