unit LokInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DB, DBTables, Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    LesCombo: TComboBox;
    Label2: TLabel;
    Table1: TTable;
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
    Label3: TLabel;
    Edit2: TEdit;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Query1: TQuery;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LesComboChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Voerin(plaats : integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TForm1.LesComboChange(Sender: TObject);
begin
     GroupBox1.caption := LesCombo.Text;
     GroupBox1.enabled := True;
     Bitbtn1.enabled := true;
end;



procedure TForm1.BitBtn2Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit2.Text := '';
     LesCombo.Text := 'Lesdagen';
     Groupbox1.caption := '';
     Groupbox1.enabled := False;
     LesCombo.enabled := False;
     Edit1.enabled := False;
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
     Bitbtn2.enabled := False;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
     Bitbtn2.enabled := True;
     Edit1.enabled := True;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
     LesCombo.enabled := True;
     GroupBox1.enabled := True;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
periode, lokaal, dag, uur: string;
deel1, deel2: string;

begin
     periode := DBEdit1.Text;
     lokaal := DBEdit2.Text;
     dag := DBEdit3.Text;
     uur := DBEdit4.Text;
     if periode = '' then
        begin
          bitbtn3.enabled := false;
          exit;
        end;
     if MessageDlg('Wilt u ' + lokaal + ' voor periode ' + periode + ' voor dag ' + dag + ' voor uur ' + uur  + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'DELETE FROM LOKAALNB';
         deel2 := 'WHERE PERIODE = :PERIODEPARAMETER and LOKAAL = :LOKAALPARAMETER and DAGVANWEEK = :DAGPARAMETER and UUR = :UURPARAMETER';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := periode;
         Query1.Params[1].AsString := lokaal;
         Query1.Params[2].AsString := dag;
         Query1.Params[3].AsString := uur;
         Query1.ExecSQL;
         Table1.active := False;
         Table1.active := True;
         end;
         BitBtn3.enabled := false;
         BitBtn4.enabled := false;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
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
     table1.Active := false;
     table1.active := true;
     Edit1.Text := '';
     Edit2.Text := '';
     Lescombo.text := 'Lesdagen';
     Lescombo.enabled := False;
     Groupbox1.enabled := False;
end;

procedure TForm1.Voerin(plaats : Integer);
var
periode, lokaal, dag, uur : string;
deel1, deel2 : string;
begin
     periode := edit2.Text;
     lokaal := edit1.Text;
     dag := LesCombo.Text;
     uur := InttoStr(plaats);
     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO LOKAALNB(PERIODE,LOKAAL, DAGVANWEEK, UUR)';
     deel2 := 'VALUES (:periodeparameter, :lokaalparameter, :dagparameter, :uurparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := Periode;
     Query1.Params[1].AsString := Lokaal;
     Query1.Params[2].AsString := Dag;
     Query1.Params[3].AsString := Uur;
     Query1.ExecSQL;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     table1.active := true;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
end;

procedure TForm1.DBGrid1ColEnter(Sender: TObject);
begin
     bitbtn3.enabled := true;
     bitbtn4.enabled := true;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
periode, lokaal, dag, uur, waarde, veld : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   gebruiker := false;
   periode := DBEdit1.Text;
   lokaal := DBEdit2.Text;
   dag := DBEdit3.Text;
   uur := DBEdit4.Text;
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

         deel1 := 'UPDATE LOKAALNB';
         deel2 := 'SET periode = :waardeparameter';
       end;
     end;
     if Veld = 'LOKAAL' then
     begin
       waarde := lokaal;
       gebruiker := InputQuery('Lokaal wijzigen. Deze was: ' + lokaal, 'Geef nieuw lokaal',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE LOKAALNB';
         deel2 := 'SET lokaal = :waardeparameter';
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

         deel1 := 'UPDATE LOKAALNB';
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

         deel1 := 'UPDATE LOKAALNB';
         deel2 := 'SET uur = :waardeparameter';
       end;
     end;
     if gebruiker then
     begin
       deel3 := 'WHERE PERIODE = :periodeparameter and LOKAAL= :lokaalparameter and DAGVANWEEK=:dagparameter and UUR=:uurparameter';

       Query1.SQL.Add(deel1);
       Query1.SQL.Add(deel2);
       Query1.SQL.Add(deel3);

       Query1.Params[0].AsString := waarde;
       Query1.Params[1].AsString := periode;
       Query1.Params[2].AsString := lokaal;
       Query1.Params[3].AsString := dag;
       Query1.Params[4].AsString := uur;
       Query1.ExecSQL;
       Table1.active := False;
       Table1.active := True;
     end;
   end;
     bitbtn3.enabled := false;
     bitbtn4.enabled := false;
end;

end.
