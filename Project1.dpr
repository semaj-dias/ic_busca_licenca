program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  BuscaLicenca in 'BuscaLicenca.pas' {Frm_Inicial};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Inicial, Frm_Inicial);
  Application.Run;
end.
