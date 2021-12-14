program rooster;

uses
  Forms,
  MAIN in 'MAIN.PAS' {MainForm},
  Childwin in 'CHILDWIN.PAS' {MDIChild},
  About in 'about.pas' {AboutBox},
  LokInv in 'LokInv.pas' {Form1},
  Vakinv in 'Vakinv.pas' {Form2},
  docnbUnit in 'docnbUnit.pas' {Form3},
  vakgeb in 'vakgeb.pas' {Form4},
  loktype in 'loktype.pas' {Form5},
  Uren in 'Uren.pas' {Form6},
  newlist in 'newlist.pas',
  roos in 'roos.pas',
  uitvoer in 'uitvoer.pas' {Form7},
  rosrun in 'Rosrun.pas';

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
