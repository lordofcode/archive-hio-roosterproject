unit vakgeb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, DBTables, Mask, DBCtrls, Buttons, Grids, DBGrids;

type
  TForm4 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit3: TEdit;
    Label3: TLabel;
    Table3: TTable;
    DataSource3: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.DFM}

procedure TForm4.Edit1Change(Sender: TObject);
begin
     Edit2.enabled := true;
end;

procedure TForm4.Edit2Change(Sender: TObject);
begin
     DBLookupComboBox1.enabled := true;
end;

procedure TForm4.DBLookupComboBox1Click(Sender: TObject);
begin
     Edit3.enabled := true;
end;

procedure TForm4.Edit3Change(Sender: TObject);
begin
     DBLookupComboBox2.enabled := true;
end;

procedure TForm4.DBLookupComboBox2Click(Sender: TObject);
begin
     BitBtn1.enabled := true;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
deel1, deel2, periode, groep, vak, vorm, docent : string;

begin
     periode := edit1.Text;
     groep := edit2.Text;
     vak := DBEdit1.Text;
     vorm := edit3.Text;
     docent := DBEdit2.Text;
     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO DOCENT(PERIODE, GROEP, VAK, WERKVORM, DOCENT)';
     deel2 := 'VALUES (:periodeparameter, :groepparameter, :vakparameter, :vormparameter, :docentparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := Periode;
     Query1.Params[1].AsString := Groep;
     Query1.Params[2].AsString := Vak;
     Query1.Params[3].AsString := Vorm;
     Query1.Params[4].AsString := Docent;
     Query1.ExecSQL;
     table3.active := false;
     table3.active := true;
     Edit1.Text := '';
     Edit2.Text := '';
     Edit2.enabled := false;
     Edit3.Text := '';
     Edit3.enabled := false;
     DBLookupComboBox1.enabled := false;
     DBLookupComboBox2.enabled := false;
     bitbtn1.enabled := false;
     bitbtn3.enabled := false;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
     table1.active := true;
     table2.active := true;
     table3.active := true;
end;

procedure TForm4.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
     table2.active := false;
     table3.active := false;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit2.Text := '';
     Edit2.enabled := false;
     Edit3.Text := '';
     Edit3.enabled := false;
     DBLookupComboBox1.enabled := false;
     DBLookupComboBox2.enabled := false;
     bitbtn1.enabled := false;
     bitbtn3.enabled := false;
end;

procedure TForm4.DBGrid1Enter(Sender: TObject);
begin
     Bitbtn2.enabled := true;
     Bitbtn4.enabled := true;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
periode, groep, vak, werkvorm, docent, waarde, veld : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   gebruiker := false;
   periode := DBEdit3.Text;
   groep := DBEdit4.Text;
   vak := DBEdit5.Text;
   werkvorm := DBEdit6.Text;
   docent := DBEdit7.Text;
   veld := DBGrid1.SelectedField.FieldName;
   if (Periode <> '') then
   begin
     if veld = 'PERIODE' then
     begin
       waarde := periode;
       gebruiker := InputQuery('Wilt u de periode wijzigen? Deze was ' + periode, 'Geef nieuwe periode',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENT';
         deel2 := 'SET periode = :waardeparameter';
       end;
     end;
     if Veld = 'GROEP' then
     begin
       waarde := groep;
       gebruiker := InputQuery('Groep wijzigen. Deze was: ' + groep, 'Geef nieuwe groep',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENT';
         deel2 := 'SET groep = :waardeparameter';
       end;
     end;
     if Veld = 'VAK' then
     begin
       waarde := vak;
       gebruiker := InputQuery('Vak wijzigen. Deze was: ' + vak, 'Geef nieuwe vak',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENT';
         deel2 := 'SET vak = :waardeparameter';
       end;
     end;
     if Veld = 'WERKVORM' then
     begin
       waarde := werkvorm;
       gebruiker := InputQuery('Werkvorm wijzigen. Deze was: ' + werkvorm, 'Geef nieuwe werkvorm',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENT';
         deel2 := 'SET werkvorm = :waardeparameter';
       end;
     end;
     if Veld = 'DOCENT' then
     begin
       waarde := docent;
       gebruiker := InputQuery('Docent wijzigen. Deze was: ' + docent, 'Geef nieuwe docent',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENT';
         deel2 := 'SET docent = :waardeparameter';
       end;
     end;
     if gebruiker then
     begin
       deel3 := 'WHERE PERIODE = :periodeparameter and GROEP= :groepparameter and VAK=:vakparameter and WERKVORM=:werkvormparameter and DOCENT= :docentparameter';

       Query1.SQL.Add(deel1);
       Query1.SQL.Add(deel2);
       Query1.SQL.Add(deel3);

       Query1.Params[0].AsString := waarde;
       Query1.Params[1].AsString := periode;
       Query1.Params[2].AsString := groep;
       Query1.Params[3].AsString := vak;
       Query1.Params[4].AsString := werkvorm;
       Query1.Params[5].AsString := docent;
       Query1.ExecSQL;
       Table3.active := False;
       Table3.active := True;
     end;
   end;
     Bitbtn4.enabled := false;
     Bitbtn2.enabled := false;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
var
periode, groep, vak, werkvorm, docent : string;
deel1, deel2 : string;

begin
  periode := DBEdit3.Text;
  groep := DBEdit4.Text;
  vak := DBEdit5.Text;
  werkvorm := DBEdit6.Text;
  docent := DBEdit7.Text;
  if periode <> '' then
  begin
    if MessageDlg('Wilt u het vakgebied van periode ' + periode + ' voor vak ' + vak + ' met werkvorm ' + werkvorm + ' van docent ' + docent  + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
    begin
      Query1.Close;
      Query1.SQL.clear;

      deel1 := 'DELETE FROM DOCENT';
      deel2 := 'WHERE PERIODE = :PERIODEPARAMETER and GROEP = :GROEPPARAMETER and VAK = :VAKPARAMETER and WERKVORM = :WERKVORMPARAMETER and DOCENT = :DOCENTPARAMETER';

      Query1.SQL.Add(deel1);
      Query1.SQL.Add(deel2);

      Query1.Params[0].AsString := periode;
      Query1.Params[1].AsString := groep;
      Query1.Params[2].AsString := vak;
      Query1.Params[3].AsString := werkvorm;
      Query1.Params[4].AsString := docent;
      Query1.ExecSQL;
      Table3.active := False;
      Table3.active := True;
    end;
  end;
  Bitbtn2.enabled := false;
  Bitbtn4.enabled := false;
end;

end.
