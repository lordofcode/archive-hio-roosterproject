unit loktype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DBTables, Mask, DBCtrls, Db;

type
  TForm5 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Table2: TTable;
    DataSource2: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}

procedure TForm5.FormActivate(Sender: TObject);
begin
     table1.active := true;
     table2.active := true;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TForm5.DBGrid1Enter(Sender: TObject);
begin
     BitBtn2.enabled := true;
     BitBtn3.enabled := true;
end;

procedure TForm5.DBLookupComboBox1Enter(Sender: TObject);
begin
     Bitbtn1.enabled := true;
     Bitbtn4.enabled := true;
     Edit1.enabled := true;
end;

procedure TForm5.FormDeactivate(Sender: TObject);
begin
     Table1.active := false;
     Table2.active := false;
end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
     Edit2.enabled := True;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
var
vak, vorm, lokaal : string;
deel1, deel2 : string;

begin
     vak := DBEdit1.Text;
     vorm := Edit1.Text;
     lokaal := Edit2.Text;
     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO LOKAAL(VAK, WERKVORM, LOKAAL)';
     deel2 := 'VALUES (:vakparameter, :vormparameter, :lokaalparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := vak;
     Query1.Params[1].AsString := vorm;
     Query1.Params[2].AsString := lokaal;
     Query1.ExecSQL;
     Table2.active := false;
     Table2.active := true;
     Edit1.enabled := false;
     Edit2.enabled := false;
     Bitbtn4.enabled := false;
     Bitbtn1.enabled := false;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit1.enabled := false;
     Edit2.Text := '';
     Edit2.enabled := false;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
var
vak, werkvorm, lokaal: string;
deel1, deel2: string;

begin
  vak := DBEdit2.Text;
  werkvorm := DBEdit3.Text;
  lokaal := DBEdit4.Text;
  if vak <> '' then
  begin
    if MessageDlg('Wilt u het vak ' + vak + ' met werkvorm ' + werkvorm + ' voor lokaal ' + lokaal +  ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
    begin
      Query1.Close;
      Query1.SQL.clear;

      deel1 := 'DELETE FROM LOKAAL';
      deel2 := 'WHERE VAK = :VAKPARAMETER and WERKVORM = :WERKVORMPARAMETER and LOKAAL = :LOKAALPARAMETER';

      Query1.SQL.Add(deel1);
      Query1.SQL.Add(deel2);

      Query1.Params[0].AsString := vak;
      Query1.Params[1].AsString := werkvorm;
      Query1.Params[2].AsString := lokaal;
      Query1.ExecSQL;
      Table2.active := False;
      Table2.active := True;
      Bitbtn2.enabled := false;
      Bitbtn3.Enabled := false;
    end;
  end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
var
vak, werkvorm, lokaal, waarde, veld : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   gebruiker := false;
   vak := DBEdit2.Text;
   werkvorm := DBEdit3.Text;
   lokaal := DBEdit4.Text;
   veld := DBGrid1.SelectedField.FieldName;
   if vak <> '' then
   begin
     if veld = 'VAK' then
     begin
       waarde := vak;
       gebruiker := InputQuery('Wilt u het vak wijzigen? Deze was ' + vak, 'Geef nieuw vak',waarde);
       if gebruiker then
       begin
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'UPDATE LOKAAL';
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

         deel1 := 'UPDATE LOKAAL';
         deel2 := 'SET werkvorm = :waardeparameter';
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

         deel1 := 'UPDATE LOKAAL';
         deel2 := 'SET lokaal = :waardeparameter';
       end;
     end;
     if gebruiker then
     begin
       deel3 := 'WHERE VAK = :vakparameter and WERKVORM = :werkvormparameter and LOKAAL=:lokaalparameter';

       Query1.SQL.Add(deel1);
       Query1.SQL.Add(deel2);
       Query1.SQL.Add(deel3);

       Query1.Params[0].AsString := waarde;
       Query1.Params[1].AsString := vak;
       Query1.Params[2].AsString := werkvorm;
       Query1.Params[3].AsString := lokaal;
       Query1.ExecSQL;
       Table2.active := False;
       Table2.active := True;
     end;
   end;
   Bitbtn3.enabled := false;
   Bitbtn2.enabled := false;
end;

end.
