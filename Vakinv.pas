unit Vakinv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label3: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
deel1, deel2, vaknaam, vakaf : string;
begin
     vaknaam := edit1.text;
     vakaf := edit2.text;

     Query1.close;
     Query1.SQL.Clear;

     deel1 := 'INSERT INTO VAKAFKORTING(VAK, AFKORTING)';
     deel2 := 'VALUES (:vaknaamparameter, :vakafparameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := vaknaam;
     Query1.Params[1].AsString := vakaf;
     Query1.ExecSQL;
     Query1.SQL.Clear;
     edit1.Text := '';
     edit2.Text := '';
     edit2.enabled := false;
     table1.active := false;
     table1.active := true;
     bitbtn5.enabled := false;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
     Edit2.enabled := true;
     bitbtn6.enabled := true;     
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
     Bitbtn5.enabled := true;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit2.Text := '';
     edit2.enabled := false;
     Bitbtn5.enabled := false;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
veld, afkor : string;
deel1, deel2: string;
begin
     bitbtn6.enabled := false;
     veld := DBGrid1.SelectedField.FieldName;
     if veld = 'AFKORTING' then
       begin
         afkor := DBGrid1.SelectedField.AsString;
         if MessageDlg('Wilt u ' + afkor + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
           Query1.Close;
           Query1.SQL.Clear;

           deel1 := 'DELETE FROM VAKAFKORTING';
           deel2 := 'WHERE AFKORTING = :afkorparameter';

           Query1.SQL.Add(deel1);
           Query1.SQL.Add(deel2);

           Query1.Params[0].AsString := afkor;
           Query1.ExecSQL;

         Query1.Close;
         Query1.SQL.clear;
         Table1.active := False;
         Table1.active := True;
         end;
       end;
     if veld = 'VAK' then
       begin
         afkor := DBEdit2.Text;
         if MessageDlg('Wilt u ' + afkor + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
           Query1.Close;
           Query1.SQL.Clear;

           deel1 := 'DELETE FROM VAKAFKORTING';
           deel2 := 'WHERE AFKORTING = :afkorparameter';

           Query1.SQL.Add(deel1);
           Query1.SQL.Add(deel2);

           Query1.Params[0].AsString := afkor;
           Query1.ExecSQL;

         Query1.Close;
         Query1.SQL.clear;
         Table1.active := False;
         Table1.active := True;
         end;
       end;
     bitbtn1.enabled := false;
     bitbtn2.enabled := false;
     bitbtn6.enabled := false;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
veld, afkor, waarde : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
     bitbtn6.enabled := false;
     veld := DBGrid1.SelectedField.FieldName;
     if veld = 'VAK' then
       begin
         afkor := DBEdit2.Text;
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'SELECT VAK FROM VAKAFKORTING';
         deel2 := 'WHERE AFKORTING = :afkorParameter';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := afkor;
         Query1.Open;
         waarde := DBEdit1.Text;
         gebruiker := InputQuery('Naam wijzigen? Deze was: ' + waarde, 'Geef nieuwe naam',waarde);
          if gebruiker then
          begin
            Query1.Close;
            Query1.SQL.clear;

            deel1 := 'UPDATE VAKAFKORTING';
            deel2 := 'SET vak = :waardeparameter';
            deel3 := 'WHERE AFKORTING = :afkorParameter';

            Query1.SQL.Add(deel1);
            Query1.SQL.Add(deel2);
            Query1.SQL.Add(deel3);

            Query1.Params[0].AsString := waarde;
            Query1.Params[1].AsString := afkor;
            Query1.ExecSQL;
            Table1.active := False;
            Table1.active := True;
         end;
       end;
     if veld = 'AFKORTING' then
       begin
         afkor := DBGrid1.SelectedField.AsString;
         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'SELECT VAK FROM VAKAFKORTING';
         deel2 := 'WHERE AFKORTING = :afkorParameter';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := afkor;
         Query1.Open;
         waarde := DBEdit2.Text;
         gebruiker := InputQuery('Afkorting wijzigen? Deze was: ' + afkor, 'Geef nieuwe afkorting',waarde);
          if gebruiker then
          begin
            Query1.Close;
            Query1.SQL.clear;

            deel1 := 'UPDATE VAKAFKORTING';
            deel2 := 'SET afkorting = :waardeparameter';
            deel3 := 'WHERE AFKORTING = :afkorParameter';

            Query1.SQL.Add(deel1);
            Query1.SQL.Add(deel2);
            Query1.SQL.Add(deel3);

            Query1.Params[0].AsString := waarde;
            Query1.Params[1].AsString := afkor;
            Query1.ExecSQL;
            Table1.active := False;
            Table1.active := True;
         end;
       end;
       bitbtn1.enabled := false;
       bitbtn2.enabled := false;
       bitbtn6.enabled := false;       
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
     table1.active := true;
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
end;

procedure TForm2.DBGrid1ColEnter(Sender: TObject);
begin
     Bitbtn1.enabled := true;
     Bitbtn2.enabled := true;
end;

end.
