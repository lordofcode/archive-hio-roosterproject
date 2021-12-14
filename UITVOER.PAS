unit uitvoer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, DBTables, StdCtrls, DBCtrls, Mask;

type
  TForm7 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    Query2: TQuery;
    Table2: TTable;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure Kwerie (soort : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.DFM}

uses
Main;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
var
tydel : string;

begin
  mainform.Memo1.Clear;
  tydel := copy(self.Caption,0,5);
  if tydel = 'Groep' then
  begin
    mainform.gro := 0;
  end
  else if tydel = 'Docen' then
  begin
    mainform.doc := 0;
  end
  else if tydel = 'Lokaa' then
  begin
    mainform.loka := 0;
  end;
  Action := caFree;
  if ((mainform.gro > 0) or (mainform.doc > 0) or (mainform.loka > 0)) then
  begin
    mainform.CutBtn.enabled := true;
  end
  else
  begin
    mainform.CutBtn.enabled := false;
  end;
end;

procedure TForm7.DBLookupComboBox1Enter(Sender: TObject);
var
deel1, soort, per, tydel : string;

begin
  mainform.Memo1.Clear;
  tydel := copy(self.Caption,0,5);
  soort := DBLookupCombobox1.Text;
  per := Mainform.DBLookupComboBox1.Text;
  Query2.close;
  Query2.SQL.Clear;
  if tydel = 'Groep' then
  begin
      deel1 := 'SELECT * FROM LES WHERE PERIODE = :perPARAMETER and GROEP = :soortPARAMETER ORDER BY NUMMER,UUR';
  end
  else if tydel = 'Docen' then
  begin
      deel1 := 'SELECT * FROM LES WHERE PERIODE = :perPARAMETER and DOCENT = :soortPARAMETER ORDER BY NUMMER,UUR';
  end
  else if tydel = 'Lokaa' then
  begin
      deel1 := 'SELECT * FROM LES WHERE PERIODE = :perPARAMETER and LOKAAL = :soortPARAMETER ORDER BY NUMMER,UUR';
  end;
      Query2.SQL.Add(deel1);
      Query2.Params[0].AsString := per;
      Query2.Params[1].AsString := soort;

      Query2.Open;
      Table2.active := false;
      Table2.active := true;
      DBEdit1.DataField := 'GROEP';
      DBEdit2.DataField := 'DAGVANWEEK';
      DBEdit3.DataField := 'UUR';
      DBEdit4.DataField := 'DOCENT';
      DBEdit5.DataField := 'LOKAAL';
      DBEdit6.DataField := 'VAK';
      DBEdit7.DataField := 'WERKVORM';
      DBEdit8.DataField := 'PERIODE';
      if dblookupcombobox1.text <> '' then mainform.CutBtn.enabled := true;
end;

procedure TForm7.Kwerie (soort : string);
begin
     if soort = 'Groep' then
     begin
       Query1.SQL.Clear;
       Query1.SQL.Add('select distinct groep from les');
       Query1.active := true;
       DBLookupComboBox1.ListField := 'GROEP';
       DBLookupComboBox1.Keyfield := 'GROEP';
     end
     else if soort='Docen' then
     begin
       Query1.SQL.Clear;
       Query1.SQL.Add('select distinct docent from les');
       Query1.active := true;
       DBLookupComboBox1.ListField := 'DOCENT';
       DBLookupComboBox1.Keyfield := 'DOCENT';
     end
     else if soort='Lokaa' then
     begin
       Query1.SQL.Clear;
       Query1.SQL.Add('select distinct lokaal from les');
       Query1.active := true;
       DBLookupComboBox1.ListField := 'LOKAAL';
       DBLookupComboBox1.Keyfield := 'LOKAAL';
     end;
end;

end.
