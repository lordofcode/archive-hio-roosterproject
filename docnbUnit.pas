unit docnbUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBTables, DBCtrls, Grids, DBGrids, Mask;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    LesCombo: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    Table2: TTable;
    DataSource2: TDataSource;
    Bevel1: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Bevel2: TBevel;
    Table3: TTable;
    DataSource3: TDataSource;
    BitBtn3: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure LesComboClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Voerin(plaats : Integer);
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
     DBLookupComboBox1.enabled := True;
end;

procedure TForm3.DBLookupComboBox1Click(Sender: TObject);
begin
     LesCombo.enabled := True;
end;

procedure TForm3.LesComboClick(Sender: TObject);
begin
     GroupBox1.enabled := True;
     GroupBox1.caption := LesCombo.Text;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
     Edit1.Text := '';
     DBLookupComboBox1.enabled := False;
     Lescombo.text := 'Lesdagen';
     Lescombo.enabled := False;
     CheckBox1.checked := False;
     CheckBox2.checked := False;
     CheckBox3.checked := False;
     CheckBox4.checked := False;
     CheckBox5.checked := False;
     CheckBox6.checked := False;
     CheckBox7.checked := False;
     CheckBox8.checked := False;
     CheckBox9.checked := False;
     CheckBox10.checked := False;
     Groupbox1.enabled := False;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  if checkbox1.checked then
  begin
    checkbox1.checked := false;
    Voerin(1);
  end;
  if checkbox2.checked then
  begin
    checkbox2.checked := false;
    Voerin(2);
  end;
  if checkbox3.checked then
  begin
    checkbox3.checked := false;
    Voerin(3);
  end;
  if checkbox4.checked then
  begin
    checkbox4.checked := false;
    Voerin(4);
  end;
  if checkbox5.checked then
  begin
    checkbox5.checked := false;
    Voerin(5);
  end;
  if checkbox6.checked then
  begin
    checkbox6.checked := false;
    Voerin(6);
  end;
  if checkbox7.checked then
  begin
    checkbox7.checked := false;
    Voerin(7);
  end;
  if checkbox8.checked then
  begin
    checkbox8.checked := false;
    Voerin(8);
  end;
  if checkbox9.checked then
  begin
    checkbox9.checked := false;
    Voerin(9);
  end;
  if checkbox10.checked then
  begin
    checkbox10.checked := false;
    Voerin(10);
  end;
     table3.Active := false;
     table3.active := true;
     Edit1.Text := '';
     DBLookupComboBox1.enabled := False;
     Lescombo.text := 'Lesdagen';
     Lescombo.enabled := False;
     Groupbox1.enabled := False;
end;

procedure TForm3.Voerin(plaats : Integer);
var
periode, docent, uur, dag : string;
deel1, deel2 : string;

begin
     periode := edit1.Text;
     docent := DBEdit1.Text;
     dag := LesCombo.Text;
     uur := InttoStr(plaats);
     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO DOCENTNB(PERIODE,DOCENT, DAGVANWEEK, UUR)';
     deel2 := 'VALUES (:periodeparameter, :docentparameter, :dagparameter, :uurparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := Periode;
     Query1.Params[1].AsString := Docent;
     Query1.Params[2].AsString := Dag;
     Query1.Params[3].AsString := Uur;
     Query1.ExecSQL;
     Query1.SQL.Clear;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
periode, docent, dag, uur: string;
deel1, deel2: string;

begin
     periode := DBEdit2.Text;
     docent := DBEdit3.Text;
     dag := DBEdit4.Text;
     uur := DBEdit5.Text;
     if periode = '' then
        begin
          bitbtn3.enabled := false;
          exit;
        end;
     if MessageDlg('Wilt u ' + docent + ' voor periode ' + periode + ' voor dag ' + dag + ' voor uur ' + uur  + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'DELETE FROM DOCENTNB';
         deel2 := 'WHERE PERIODE = :PERIODEPARAMETER and DOCENT = :DOCENTPARAMETER and DAGVANWEEK = :DAGPARAMETER and UUR = :UURPARAMETER';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := periode;
         Query1.Params[1].AsString := docent;
         Query1.Params[2].AsString := dag;
         Query1.Params[3].AsString := uur;
         Query1.ExecSQL;
         Table3.active := False;
         Table3.active := True;
         end;
         BitBtn3.enabled := false;
         BitBtn4.enabled := false;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
     Table1.active := true;
     Table2.active := true;
     Table3.active := true;
end;

procedure TForm3.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
     table2.active := false;
     table3.active := false;     
end;

procedure TForm3.DBGrid1ColEnter(Sender: TObject);
begin
     BitBtn3.enabled := True;
     BitBtn4.enabled := True;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
periode, docent, dag, uur, waarde, veld : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   gebruiker := false;
   periode := DBEdit2.Text;
   docent := DBEdit3.Text;
   dag := DBEdit4.Text;
   uur := DBEdit5.Text;
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

         deel1 := 'UPDATE DOCENTNB';
         deel2 := 'SET periode = :waardeparameter';
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

         deel1 := 'UPDATE DOCENTNB';
         deel2 := 'SET docent = :waardeparameter';
       end;
     end;
     if Veld = 'DAGVANWEEK' then
     begin
       waarde := dag;
       gebruiker := InputQuery('Dag wijzigen. Deze was: ' + dag, 'Geef nieuwe dag',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENTNB';
         deel2 := 'SET dagvanweek = :waardeparameter';
       end;
     end;
     if Veld = 'UUR' then
     begin
       waarde := uur;
       gebruiker := InputQuery('Uur wijzigen. Deze was: ' + uur, 'Geef nieuwe uur',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE DOCENTNB';
         deel2 := 'SET uur = :waardeparameter';
       end;
     end;
     if gebruiker then
     begin
       deel3 := 'WHERE PERIODE = :periodeparameter and DOCENT = :docentparameter and DAGVANWEEK=:dagparameter and UUR=:uurparameter';

       Query1.SQL.Add(deel1);
       Query1.SQL.Add(deel2);
       Query1.SQL.Add(deel3);

       Query1.Params[0].AsString := waarde;
       Query1.Params[1].AsString := periode;
       Query1.Params[2].AsString := docent;
       Query1.Params[3].AsString := dag;
       Query1.Params[4].AsString := uur;
       Query1.ExecSQL;
       Table3.active := False;
       Table3.active := True;
     end;
   end;
   bitbtn3.enabled := false;
   bitbtn4.enabled := false;
end;

end.
