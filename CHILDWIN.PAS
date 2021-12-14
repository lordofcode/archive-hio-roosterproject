unit Childwin;

interface

uses Windows, Dialogs, Classes, Graphics, Forms, Controls, StdCtrls, ExtCtrls,
  Buttons, Db, DBTables, Grids, DBGrids, Mask, DBCtrls;

type
  TMDIChild = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel2: TBevel;
    DataSource1: TDataSource;
    Table1: TTable;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Query1: TQuery;
    BitBtn4: TBitBtn;
    DBEdit1: TDBEdit;
    Query2: TQuery;
    DataSource2: TDataSource;
    Table2: TTable;
    DataSource3: TDataSource;
    Query3: TQuery;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}


procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMDIChild.Edit2Change(Sender: TObject);
begin
     BitBtn1.enabled := True;
end;

procedure TMDIChild.BitBtn1Click(Sender: TObject);
var
deel1, deel2: string;
naam, afkor : string;
begin
     naam := edit1.Text;
     afkor := edit2.Text;
     Query1.Close;
     Query1.SQL.clear;

     deel1 := 'INSERT INTO DOCENTAFKORTING(DOCENT, AFKORTING)';
     deel2 := 'VALUES (:naamParameter, :afkorParameter)';

     Query1.SQL.Add(deel1);
     Query1.SQL.Add(deel2);

     Query1.Params[0].AsString := naam;
     Query1.Params[1].AsString := afkor;
     Query1.ExecSQL;
     Table1.active := False;
     Table1.active := True;
     edit1.Text := '';
     edit2.Text := '';
     edit2.enabled := false;
     BitBtn1.enabled := False;
     BitBtn4.enabled := False;
     BitBtn2.enabled := False;     
end;

procedure TMDIChild.BitBtn2Click(Sender: TObject);
begin
     Edit1.Text := '';
     Edit2.enabled := False;
     Edit2.Text := '';
     BitBtn1.enabled := False;
end;

procedure TMDIChild.BitBtn3Click(Sender: TObject);
var
veld, afkor, waarde : string;
deel1, deel2, deel3 : string;
gebruiker : boolean;
begin
   BitBtn2.enabled := False;
   veld := DBGrid1.SelectedField.FieldName;
   if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
   begin
     if veld = 'DOCENT' then
       begin
         afkor := DBEdit2.Text;
         Query2.Close;
         Query2.SQL.clear;

         deel1 := 'SELECT DOCENT FROM DOCENTAFKORTING';
         deel2 := 'WHERE AFKORTING = :afkorParameter';

         Query2.SQL.Add(deel1);
         Query2.SQL.Add(deel2);

         Query2.Params[0].AsString := afkor;
         Query2.Open;
         waarde := DBEdit1.Text;
         gebruiker := InputQuery('Naam wijzigen van ' + afkor, 'Geef nieuwe naam',waarde);
          if gebruiker then
          begin
            Query1.Close;
            Query1.SQL.clear;

            deel1 := 'UPDATE DOCENTAFKORTING';
            deel2 := 'SET docent = :waardeparameter';
            deel3 := 'WHERE AFKORTING = :afkorParameter';

            Query1.SQL.Add(deel1);
            Query1.SQL.Add(deel2);
            Query1.SQL.Add(deel3);

            Query1.Params[0].AsString := waarde;
            Query1.Params[1].AsString := afkor;
            Query1.ExecSQL;
            Table1.active := False;
            Table1.active := True;
            edit2.enabled := false;
            BitBtn1.enabled := False;
         end;
       end
     else
       begin
         afkor := DBEdit2.Text;
         waarde := afkor;
         InputQuery('Afkorting wijzigen. Deze was: ' + afkor, 'Geef nieuwe afkorting',waarde);
          if length(waarde) > 3 then
          begin
            Showmessage ('Te lange afkorting! Maximaal 3 tekens!');
            self.bitbtn3.click;
          end;
          if length(waarde) <= 3 then
          begin
            Query1.Close;
            Query1.SQL.clear;

            deel1 := 'UPDATE DOCENTAFKORTING';
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
            edit2.enabled := false;
            BitBtn1.enabled := False;
         end;
       end;
   end;
   bitbtn3.enabled := false;
   bitbtn4.enabled := false;
end;

procedure TMDIChild.Edit1Change(Sender: TObject);
begin
     Edit2.enabled := True;
     BitBtn2.enabled := True;
end;

procedure TMDIChild.BitBtn4Click(Sender: TObject);
var
veld, afkor : string;
deel1, deel2: string;

begin
   BitBtn2.enabled := False;
   veld := DBGrid1.SelectedField.FieldName;
   if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
   begin
     if veld = 'AFKORTING' then
       begin
         afkor := DBGrid1.SelectedField.AsString;
         if MessageDlg('Wilt u ' + afkor + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
           Query3.Close;
           Query3.SQL.Clear;

           deel1 := 'DELETE FROM DOCENTNB';
           deel2 := 'WHERE DOCENT = :afkorparameter';

           Query3.SQL.Add(deel1);
           Query3.SQL.Add(deel2);

           Query3.Params[0].AsString := afkor;
           Query3.ExecSQL;

         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'DELETE FROM DOCENTAFKORTING';
         deel2 := 'WHERE AFKORTING = :afkorParameter';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := afkor;
         Query1.ExecSQL;
         Table1.active := False;
         Table1.active := True;
         edit2.enabled := false;
         BitBtn1.enabled := False;
         end;
       end
     else
       begin
         afkor := DBEdit2.Text;
         if MessageDlg('Wilt u ' + afkor + ' echt verwijderen?',MtWarning,[mbYes, mbNo],0) = mrYes then
         begin
           Query3.Close;
           Query3.SQL.Clear;

           deel1 := 'DELETE FROM DOCENTNB';
           deel2 := 'WHERE DOCENT = :afkorparameter';

           Query3.SQL.Add(deel1);
           Query3.SQL.Add(deel2);

           Query3.Params[0].AsString := afkor;
           Query3.ExecSQL;

         Query1.Close;
         Query1.SQL.clear;

         deel1 := 'DELETE FROM DOCENTAFKORTING';
         deel2 := 'WHERE AFKORTING = :afkorParameter';

         Query1.SQL.Add(deel1);
         Query1.SQL.Add(deel2);

         Query1.Params[0].AsString := afkor;
         Query1.ExecSQL;
         Table1.active := False;
         Table1.active := True;
         edit2.enabled := false;
         BitBtn1.enabled := False;
         end;
       end;
   end;
   bitbtn3.enabled := false;
   bitbtn4.enabled := false;
end;

procedure TMDIChild.FormActivate(Sender: TObject);
begin
     table1.active := true;
     table2.active := true;
end;

procedure TMDIChild.FormDeactivate(Sender: TObject);
begin
     table1.active := false;
     table2.active := false;
end;

procedure TMDIChild.DBGrid1ColEnter(Sender: TObject);
begin
        BitBtn3.enabled := True;
        BitBtn4.enabled := True;
end;

end.
