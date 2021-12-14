unit Uren;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DBTables, Mask, DBCtrls, Db;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Table1: TTable;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Table2: TTable;
    DataSource2: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.DFM}

uses
Main;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TForm6.DBGrid1Enter(Sender: TObject);
begin
     Bitbtn2.enabled := true;
     Bitbtn3.enabled := true;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
var
periode, groep, vak, vorm, uren : string;
deel1, deel2 : string;
begin
     periode := edit1.Text;
     groep := edit2.Text;
     vak := DBEdit1.Text;
     vorm := edit4.text;
     uren := edit3.Text;
     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO UREN(PERIODE, GROEP, VAK, WERKVORM, UREN)';
     deel2 := 'VALUES (:periodeparameter, :groepparameter, :vakparameter, :vormparameter, :urenparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := Periode;
     Query1.Params[1].AsString := groep;
     Query1.Params[2].AsString := vak;
     Query1.Params[3].AsString := vorm;
     Query1.Params[4].AsString := uren;
     Query1.ExecSQL;
     table2.active := false;
     table2.active := true;
     bitbtn1.enabled := false;
     bitbtn4.enabled := false;
     edit1.Text := '';
     edit2.Text := '';
     edit2.enabled := false;
     DBEdit1.Text := '';
     edit3.text := '';
     edit3.enabled := false;
     edit4.text := '';
     edit4.enabled := false;
     Mainform.Query4.active := false;
     Mainform.Table9.active := false;
     Mainform.table9.active := true;
     Mainform.Query4.active := true;
end;

procedure TForm6.Edit1Change(Sender: TObject);
begin
     edit2.enabled := true;
     bitbtn4.enabled := true;
end;

procedure TForm6.Edit2Change(Sender: TObject);
begin
     DBLookupComboBox1.enabled := true;
end;

procedure TForm6.DBLookupComboBox1Click(Sender: TObject);
begin
     edit4.enabled := true;
end;

procedure TForm6.Edit4Change(Sender: TObject);
begin
     edit3.enabled := true;
end;

procedure TForm6.Edit3Change(Sender: TObject);
begin
     bitbtn1.enabled := true;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
var
periode, groep, vak, vorm, uren: string;
deel1, deel2: string;

begin
     periode := DBEdit2.Text;
     groep := DBEdit3.Text;
     vak := DBEdit4.Text;
     vorm := DBEdit5.Text;
     uren := DBEdit6.Text;
     if periode <> '' then
     begin
       if MessageDlg('Wilt u periode ' + periode + ' , groep ' + groep + ' voor vak ' + vak + ' met werkvorm ' + vorm  + ' met ' + uren + ' uren echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'DELETE FROM UREN';
         deel2 := 'WHERE PERIODE = :PERIODEPARAMETER and GROEP = :GROEPPARAMETER and VAK = :VAKPARAMETER and WERKVORM = :VORMPARAMETER and UREN = :URENPARAMETER';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := periode;
         Query1.Params[1].AsString := groep;
         Query1.Params[2].AsString := vak;
         Query1.Params[3].AsString := vorm;
         Query1.Params[4].AsString := uren;
         Query1.ExecSQL;
         Table2.active := False;
         Table2.active := True;
         Mainform.Query4.active := false;
         Mainform.Table9.active := false;
         Mainform.table9.active := true;
         Mainform.Query4.active := true;
       end;
     end;
     BitBtn2.enabled := false;
     BitBtn3.enabled := false;
end;

procedure TForm6.BitBtn3Click(Sender: TObject);
var
periode, groep, vak, vorm, uren, waarde, veld : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   gebruiker := false;
   periode := DBEdit2.Text;
   groep := DBEdit3.Text;
   vak := DBEdit4.Text;
   vorm := DBEdit5.Text;
   uren := DBEdit6.Text;
   veld := DBGrid1.SelectedField.FieldName;
   if Periode <> '' then
   begin
     if veld = 'PERIODE' then
     begin
       waarde := periode;
       gebruiker := InputQuery('Wilt u de periode wijzigen? Deze was ' + periode, 'Geef nieuwe periode',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE UREN';
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

         deel1 := 'UPDATE UREN';
         deel2 := 'SET groep = :waardeparameter';
       end;
     end;
     if Veld = 'VAK' then
     begin
       waarde := vak;
       gebruiker := InputQuery('Vak wijzigen. Deze was: ' + vak, 'Geef nieuw vak',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE UREN';
         deel2 := 'SET vak = :waardeparameter';
       end;
     end;
     if Veld = 'WERKVORM' then
     begin
       waarde := vorm;
       gebruiker := InputQuery('Werkvorm wijzigen. Deze was: ' + vorm, 'Geef nieuwe werkvorm',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE UREN';
         deel2 := 'SET werkvorm = :waardeparameter';
       end;
     end;
     if Veld = 'UREN' then
     begin
       waarde := uren;
       gebruiker := InputQuery('Aantal uren wijzigen. Deze was: ' + uren, 'Geef nieuw aantal uren',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE UREN';
         deel2 := 'SET uren = :waardeparameter';
       end;
     end;
     if gebruiker then
     begin
       deel3 := 'WHERE PERIODE = :PERIODEPARAMETER and GROEP = :GROEPPARAMETER and VAK = :VAKPARAMETER and WERKVORM = :VORMPARAMETER and UREN = :URENPARAMETER';

       Query1.SQL.Add(deel1);
       Query1.SQL.Add(deel2);
       Query1.SQL.Add(deel3);

       Query1.Params[0].AsString := waarde;
       Query1.Params[1].AsString := periode;
       Query1.Params[2].AsString := groep;
       Query1.Params[3].AsString := vak;
       Query1.Params[4].AsString := vorm;
       Query1.Params[5].AsString := uren;
       Query1.ExecSQL;
       Table2.active := False;
       Table2.active := True;
       Mainform.Query4.active := false;
       Mainform.Table9.active := false;
       Mainform.table9.active := true;
       Mainform.Query4.active := true;
     end;
   end;
   bitbtn2.enabled := false;
   bitbtn3.enabled := false;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
     table1.active := true;
     table2.active := true;
end;

procedure TForm6.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
     table2.active := false;     
end;

end.
