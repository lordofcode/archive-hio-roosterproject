unit Main;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, DBTables, DB, rosrun, roos, ChildWin,
  Mask, DBCtrls, Grids, DBGrids, uitvoer;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    SpeedPanel: TPanel;
    OpenBtn: TSpeedButton;
    SaveBtn: TSpeedButton;
    CutBtn: TSpeedButton;
    CopyBtn: TSpeedButton;
    StatusBar: TStatusBar;
    Database1: TDatabase;
    N2: TMenuItem;
    Roosteren1: TMenuItem;
    Table1: TTable;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Table2: TTable;
    DataSource2: TDataSource;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Table3: TTable;
    DataSource4: TDataSource;
    Table4: TTable;
    DataSource5: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit10: TDBEdit;
    Edit2: TEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Nieuw1: TMenuItem;
    Query2: TQuery;
    Table5: TTable;
    DataSource6: TDataSource;
    Table6: TTable;
    DataSource3: TDataSource;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Table7: TTable;
    DataSource7: TDataSource;
    Query1: TQuery;
    WindowTileItem: TMenuItem;
    PrintDialog1: TPrintDialog;
    Memo1: TMemo;
    Memo2: TMemo;
    DBEdit22: TDBEdit;
    Query3: TQuery;
    Table8: TTable;
    DataSource8: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Query4: TQuery;
    DataSource9: TDataSource;
    Label1: TLabel;
    Table9: TTable;
    DataSource10: TDataSource;
    Afkorting1: TMenuItem;
    Vakgebied1: TMenuItem;
    Beschikbaarheid1: TMenuItem;
    Lokaaltype1: TMenuItem;
    Beschikbaarheid2: TMenuItem;
    Uren1: TMenuItem;
    Uren2: TMenuItem;
    SaveDialog1: TSaveDialog;
    Query5: TQuery;
    DataSource11: TDataSource;
    DBEdit23: TDBEdit;
    DataSource12: TDataSource;
    Table10: TTable;
    Table11: TTable;
    Table12: TTable;
    DataSource13: TDataSource;
    DataSource14: TDataSource;
    DataSource15: TDataSource;
    DataSource16: TDataSource;
    Query6: TQuery;
    Query7: TQuery;
    DBEdit24: TDBEdit;
    Query8: TQuery;
    DataSource17: TDataSource;
    function nietbezet(uur : integer;dagvanweek,tiepe,dingeen,dingtwee : string) : boolean;
    function lokaalbeschikbaar(dagvanweek : string;uurtje : integer;lokaal : string) : boolean;
    function zoeklokaal(groep, vak, werkvorm,docent,dagvanweek : string;uurtje : integer) : boolean;
    function dag(dagnr : integer) : string;
    function zoekuur(groep, vak, werkvorm, docent : string) : boolean;
    function zoekdocent(groep, vak, werkvorm : string) : boolean;
    procedure FormCreate(Sender: TObject);
    procedure FileNewItemClick(Sender: TObject);
    procedure WindowCascadeItemClick(Sender: TObject);
    procedure UpdateMenuItems(Sender: TObject);
    procedure WindowArrangeItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileExitItemClick(Sender: TObject);
    procedure FileSaveItemClick(Sender: TObject);
    procedure FileSaveAsItemClick(Sender: TObject);
    procedure CopyItemClick(Sender: TObject);
    procedure WindowMinimizeItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HelpAboutItemClick(Sender: TObject);
    procedure Roosteren1Click(Sender: TObject);
    procedure Nieuw1Click(Sender: TObject);
    procedure Groepenrooster1Click(Sender: TObject);
    procedure CutBtnClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Lokaaltype1Click(Sender: TObject);
    procedure Afkorting1Click(Sender: TObject);
    procedure Vakgebied1Click(Sender: TObject);
    procedure Beschikbaarheid1Click(Sender: TObject);
    procedure Uren1Click(Sender: TObject);
    procedure Uren2Click(Sender: TObject);
    procedure Beschikbaarheid2Click(Sender: TObject);
    procedure checkrooster;
    procedure Button1Click(Sender: TObject);
    procedure CopyBtnClick(Sender: TObject);
  private
    { Private declarations }
    lala : boolean;
    docenro, groepro, lokaaro : TForm7;
 //   temprooster,oudrooster : trooster;
//tijdelijk rooster (TR)
    trperiode, trgroep, trvak, trwerkvorm, trdocent, trlokaal, trdagvanweek : array[1..10000] of string;
    truur : array[1..10000] of integer;
    trindex : integer;
//oud rooster (OR)
    orperiode, orgroep, orvak, orwerkvorm, ordocent, orlokaal, ordagvanweek : array[1..10000] of string;
    oruur : array[1..10000] of integer;
    orindex : integer;
//lokaal {lok}............vak met werkvorm kan in lokaal gegeven worden
    lokvak, lokwerkvorm, loklokaal : array[1..1000] of string;
    lokaantal : integer;
//lokaal niet beschikbaar (lnb)
    lnbperiode, lnbdagvanweek, lnblokaal : array[1..5000] of string;
    lnbuur : array[1..5000] of integer;
    lnbaantal : integer;
// docent niet beschikbaar (dnb)
    dnbperiode, dnbdagvanweek, dnbdocent : array[1..5000] of string;
    dnbuur : array[1..5000] of integer;
    dnbaantal : integer;
// vakgebied (vg)
    vgperiode, vgdocent, vggroep, vgvak, vgwerkvorm : array[1..5000] of string;
    vgaantal : integer;
//einde
    Docentinv : TMDIChild;
	 docent : boolean;
    nummer : integer;
    procedure Datums;
    procedure zetnul(var keuzenummer : array of integer);
    procedure Wisrooster;
    procedure Invoerrooster;
    function tussendag (k : Integer; temp : string) : string;
    procedure aanvullen (k : Integer; temp : string);
    procedure CreateMDIChild(const Name: string);
    procedure CreateLokTypeChild(const Name: string);
    procedure CreateUrenChild(const Name: string);
    procedure CreateLokaalChild(const Name: string);
    procedure CreateVakgebChild(const Name: string);
    procedure CreateGroeproost(const Name: string);
    procedure CreatedocnbChild(const Name: string);
    procedure CreateVakChild(const Name: string);
    procedure ShowHint(Sender: TObject);
    procedure vultabeltwee;
    procedure vultabelvier;
    procedure vultabelvijf;
    procedure vultabelzes;
  public
    { Public declarations }
    doc, gro, loka : Integer;
    procedure Print;
  end;

var
  MainForm: TMainForm;

implementation

uses LokInv, Vakinv, vakgeb, docnbUnit, uren, loktype, About, printers;

//uses About;

{$R *.DFM}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  doc := 0;
  gro := 0;
  loka := 0;
  Application.OnHint := ShowHint;
  Screen.OnActiveFormChange := UpdateMenuItems;
  docent := false;
end;

procedure tmainform.vultabeltwee;
begin
	  table2.active := true;
     vgaantal := 0;
     table2.first;
     while not table2.eof do begin
           vgaantal := vgaantal + 1;
           vggroep[vgaantal] := dbedit7.text;
           vgdocent[vgaantal] := dbedit6.text;
           vgvak[vgaantal] := dbedit8.text;
           vgwerkvorm[vgaantal] := dbedit9.text;
           vgperiode[vgaantal] :=  dbedit10.text;
           table2.next;
     end;
	  table2.active := false;
end;

procedure tmainform.vultabelvier;
begin
	  table4.active := true;
     dnbaantal := 0;
     table4.first;
     while not table4.eof do begin
           dnbaantal := dnbaantal + 1;
           dnbperiode[dnbaantal] := dbedit11.text;
           dnbdocent[dnbaantal] := dbedit12.text;
           dnbdagvanweek[dnbaantal] := dbedit13.text;
           dnbuur[dnbaantal] := strtoint(dbedit14.text);
           table4.next;
     end;
	  table4.active := false;
end;

procedure tmainform.vultabelvijf;
begin
	  table5.active := true;
     lokaantal := 0;
     table5.first;
     while not table5.eof do begin
           lokaantal := lokaantal + 1;
           lokvak[lokaantal] := dbedit15.text;
           lokwerkvorm[lokaantal] := dbedit16.text;
           loklokaal[lokaantal] := dbedit17.text;
           table5.next;
     end;
	  table5.active := false;
end;

procedure tmainform.vultabelzes;
begin
     lnbaantal := 0;
     table6.first;
     while not table6.eof do begin
           lnbaantal := lnbaantal + 1;
           lnbperiode[lnbaantal] := dbedit18.text;
           lnbuur[lnbaantal] := strtoint(dbedit20.text);
           lnbdagvanweek[lnbaantal] := dbedit19.text;
           lnblokaal[lnbaantal] := dbedit21.text;
           table6.next;
     end;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusBar.SimpleText := Application.Hint;
end;

procedure TMainForm.CreateMDIChild(const Name: string);
begin
  { create a new MDI child window }
  Docentinv := TMDIChild.Create(Application);
  Docentinv.Caption := Name;
end;

procedure TMainForm.CreateLokTypeChild(const Name: string);
var
  Child: TForm5;
begin
  { create a new MDI child window }
  Child := TForm5.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.CreateUrenChild(const Name: string);
var
  Child: TForm6;
begin
  { create a new MDI child window }
  Child := TForm6.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.CreateLokaalChild(const Name: string);
var
  Child: TForm1;
begin
  { create a new MDI child window }
  Child := TForm1.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.CreateVakgebChild(const Name: string);
var
  Child: TForm4;
begin
  Child := TForm4.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.CreateGroeproost(const Name: string);
var
  even : string;
begin
  { create a new MDI child window }
  even := copy(Name,0,5);
  if even = 'Groep' then
   begin
     if gro < 1 then
     begin
       groepro := TForm7.Create(Application);
       groepro.Kwerie(copy (name,0,5));
       groepro.Caption := Name;
       gro := 1;
     end;
   end
  else if even = 'Docen' then
	begin
     if doc < 1 then
     begin
       docenro := TForm7.Create(Application);
       docenro.Kwerie(copy (name,0,5));
		 docenro.Caption := Name;
       doc := 1;
     end;
   end
  else if even = 'Lokaa' then
   begin
     if loka < 1 then
     begin
       lokaaro := TForm7.Create(Application);
		 lokaaro.Kwerie(copy (name,0,5));
       lokaaro.Caption := Name;
       loka := 1;
     end;
   end;
end;

procedure TMainForm.CreatedocnbChild(const Name: string);
var
  Child: TForm3;
begin
  { create a new MDI child window }
  Child := TForm3.Create(Application);
  Child.Caption := Name;
end;


procedure TMainForm.CreateVakChild(const Name: string);
var
  Child: TForm2;
begin
  { create a new MDI child window }
  Child := TForm2.Create(Application);
  Child.Caption := Name;
end;

procedure TMainForm.FileNewItemClick(Sender: TObject);
begin
  CreateLoktypeChild('Lokaaltype' + IntToStr(MDIChildCount + 1));
  CreateUrenChild('Uren' + IntToStr(MDIChildCount + 1));
  CreatedocnbChild('Beschikbaarheid docenten' + IntToStr(MDIChildCount + 1));
  CreateLokaalChild('Beschikbaarheid lokalen' + IntToStr(MDIChildCount + 1));
  CreateVakGebChild('Vakgebied' + IntToStr(MDIChildCount + 1));
  CreateVakChild('Vakken' + IntToStr(MDIChildCount + 1));
  CreateMDIChild('Docenten' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpenItemClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FileCloseItemClick(Sender: TObject);
var
k : Integer;

begin
   if doc = 1 then doc := 0;
   if gro = 1 then gro := 0;
   if loka = 1 then loka := 0;
   k := MDIChildcount;
   while k > 0 do
   begin
	 ActiveMDIChild.free;
    k := MDIChildcount;
  end;
end;

procedure TMainForm.FileSaveItemClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    CreateMDIChild(SaveDialog1.FileName);
end;

procedure TMainForm.FileSaveAsItemClick(Sender: TObject);
begin
  { save current file under new name }
end;

procedure TMainForm.FileExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.CopyItemClick(Sender: TObject);
begin
  {copy selection to clipboard}
end;

procedure TMainForm.WindowCascadeItemClick(Sender: TObject);
begin
  if DBLookupCombobox1.Text <> '' then
  CreateGroeproost('Docentenrooster' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.WindowArrangeItemClick(Sender: TObject);
begin
  if DBLookupCombobox1.Text <> '' then
  CreateGroeproost('Lokaalrooster' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.WindowMinimizeItemClick(Sender: TObject);
var
  I: Integer;
begin
  { Must be done backwards through the MDIChildren array }
  for I := MDIChildCount - 1 downto 0 do
    MDIChildren[I].WindowState := wsMinimized;
end;

procedure TMainForm.UpdateMenuItems(Sender: TObject);
begin
  FileCloseItem.Enabled := MDIChildCount > 0;
  FileSaveItem.Enabled := MDIChildCount > 0;
  FileSaveAsItem.Enabled := MDIChildCount > 0;
//  CutItem.Enabled := MDIChildCount > 0;
//  CopyItem.Enabled := MDIChildCount > 0;
//  PasteItem.Enabled := MDIChildCount > 0;
  SaveBtn.Enabled := MDIChildCount > 0;
//  CutBtn.Enabled := MDIChildCount > 0;
//  CopyBtn.Enabled := MDIChildCount > 0;
//  WindowCascadeItem.Enabled := MDIChildCount > 0;
//  WindowTileItem.Enabled := MDIChildCount > 0;
//  WindowArrangeItem.Enabled := MDIChildCount > 0;
//  WindowMinimizeItem.Enabled := MDIChildCount > 0;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
end;

procedure TMainForm.HelpAboutItemClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure tmainform.checkrooster;
begin
	  if orindex = 0 then begin
        orindex := 1;
        while orindex <> trindex do begin
              orperiode[orindex] := trperiode[orindex];
              orgroep[orindex] := trgroep[orindex];
              orvak[orindex] := trvak[orindex];
              ordocent[orindex] := trdocent[orindex];
              orlokaal[orindex] := trlokaal[orindex];
              oruur[orindex] := truur[orindex];
              ordagvanweek[orindex] := trdagvanweek[orindex];
              orindex := orindex + 1;
        end;
	  end
	  else begin
			 //controleer oudrooster met temprooster
	  end;
end;

procedure TMainForm.Wisrooster;
var
deel1, deel2, per : string;
begin
	  edit2.text := dblookupcombobox1.text;
	  table7.active := true;
	  per := Edit2.Text;
	  Query1.close;
	  Query1.SQL.Clear;

	  Query1.SQL.Add('DELETE FROM LES');
	  Query1.SQL.Add('WHERE PERIODE = :PERPARAMETER');

	  Query1.Params[0].AsString := per;
	  Query1.ExecSQL;

	  table7.active := false;
	  table7.tablename := 'LOKAALBEZETTING';
	  table7.active := true;

	  Query1.close;
	  Query1.SQL.Clear;

	  deel1 := 'DELETE FROM LOKAALBEZETTING';
	  deel2 := 'WHERE PERIODE = :PERPARAMETER';

	  Query1.SQL.Add(deel1);
	  Query1.SQL.Add(deel2);

	  Query1.Params[0].AsString := per;
	  Query1.ExecSQL;

	  table7.active := false;
	  table7.tablename := 'ROOSTERKLAS';
	  table7.active := true;
	  Query1.close;
	  Query1.SQL.Clear;

	  deel1 := 'DELETE FROM ROOSTERKLAS';
	  deel2 := 'WHERE PERIODE = :PERPARAMETER';

	  Query1.SQL.Add(deel1);
	  Query1.SQL.Add(deel2);

	  Query1.Params[0].AsString := per;
	  Query1.ExecSQL;

	  table7.active := false;
	  table7.tablename := 'ROOSTERDOCENT';
	  table7.active := true;
	  Query1.close;
	  Query1.SQL.Clear;

	  deel1 := 'DELETE FROM ROOSTERDOCENT';
	  deel2 := 'WHERE PERIODE = :PERPARAMETER';

	  Query1.SQL.Add(deel1);
	  Query1.SQL.Add(deel2);

	  Query1.Params[0].AsString := per;
	  Query1.ExecSQL;

	  table7.active := false;
	  table7.tablename := 'LES';
end;

procedure TMainForm.Datums;
var
dag, gro, per, doc, deel1, deel2 : string;
begin
   dag := datetostr(date);
   per := DBLookupComboBox1.Text;
   Table10.active := true;
   Query6.datasource := datasource13;
   Query6.close;
   Query6.SQL.Clear;

   Query6.SQL.Add('INSERT INTO LOKAALBEZETTING(PERIODE, DATUM)');
   Query6.SQL.Add('VALUES (:perparameter, :dagparameter)');

   Query6.Params[0].AsString := per;
   Query6.Params[1].AsString := dag;
   Query6.ExecSQL;
   table10.active := false;
   table12.active := true;
   Query3.datasource := datasource15;
   Query7.close;
   Query7.SQL.Clear;

   Query7.SQL.Add('select distinct docent from les where periode = :perparameter');
   Query7.Params[0].AsString := per;
   Query7.active := true;
   Query7.First;
   DBEdit24.DataField := 'DOCENT';
   while not Query7.EOF do
   begin
     doc := DBEdit24.Text;
     Query6.close;
     Query6.SQL.Clear;

     Query6.SQL.Add('INSERT INTO ROOSTERDOCENT(PERIODE, DATUM, DOCENT)');
     Query6.SQL.Add('VALUES (:perparameter, :dagparameter, :docparameter)');

     Query6.Params[0].AsString := per;
     Query6.Params[1].AsString := dag;
     Query6.Params[2].AsString := doc;
     Query6.ExecSQL;
     Query7.Next;
   end;
   DBEdit24.DataField := '';
   Query7.active := false;
   table12.active := false;
   table11.active := true;
   Query6.datasource := datasource14;
   Query7.close;
   Query7.SQL.Clear;

   Query7.SQL.Add('select distinct groep from les where periode = :perparameter');
   Query7.Params[0].AsString := per;
   Query7.active := true;
   Query7.First;
   DBEdit24.DataField := 'GROEP';
   while not Query7.EOF do
   begin
     gro := DBEdit24.Text;
     Query6.close;
     Query6.SQL.Clear;

     deel1 := 'INSERT INTO ROOSTERKLAS(PERIODE, DATUM, GROEP)';
     deel2 := 'VALUES (:perparameter, :dagparameter, :groparameter)';

     Query6.SQL.Add(deel1);
     Query6.SQL.Add(deel2);

     Query6.Params[0].AsString := per;
     Query6.Params[1].AsString := dag;
     Query6.Params[2].AsString := gro;
     Query6.ExecSQL;
     Query7.Next;
   end;
   DBEdit24.DataField := '';
   Query7.active := false;
   table11.active := false;
end;

procedure TMainform.Invoerrooster;
var
per , gro, dag, uur, doc, lok, vak, vorm, num, deel1, deel2 : string;
begin
	while orindex <> 1 do begin
      orindex := orindex -1;
      per := orperiode[orindex];
      gro := orgroep[orindex];
      dag := ordagvanweek[orindex];
      uur := inttostr(oruur[orindex]);
      doc := ordocent[orindex];
      lok := orlokaal[orindex];
      vak := orvak[orindex];
      vorm := trwerkvorm[orindex];
      if dag ='Maandag' then num := '1'
      else if dag = 'Dinsdag' then num :='2'
      else if dag = 'Woensdag' then num :='3'
      else if dag = 'Donderdag' then num :='4'
      else if dag = 'Vrijdag' then num :='5';
      Query1.close;
      Query1.SQL.Clear;

      deel1 := 'INSERT INTO LES(PERIODE, GROEP, DAGVANWEEK, UUR, DOCENT, LOKAAL,VAK, WERKVORM, NUMMER)';
      deel2 := 'VALUES (:perparameter, :groparameter, :dagparameter, :uurparameter, :docparameter, :lokparameter, :vakparameter, :vormparameter, :numparameter)';

      Query1.SQL.Add(deel1);
      Query1.SQL.Add(deel2);

      Query1.Params[0].AsString := per;
      Query1.Params[1].AsString := gro;
      Query1.Params[2].AsString := dag;
      Query1.Params[3].AsString := uur;
      Query1.Params[4].AsString := doc;
      Query1.Params[5].AsString := lok;
      Query1.Params[6].AsString := vak;
      Query1.Params[7].AsString := vorm;
      Query1.Params[8].AsString := num;
      Query1.ExecSQL;
//      oudrooster.destroy;// := oudrooster.volgende;
      //          table1.active := false;
   end;
   datums;
end;

procedure tmainform.zetnul(var keuzenummer : array of integer);
var
   k,l : integer;
begin
     k := 0;
     l := 0;
     table1.first;
     while not table1.eof do begin
           k := strtoint(dbedit3.text);
           while k <> 0 do begin
                 l := l + 1;
                 keuzenummer[l] := 0;
                 k := k - 1;
           end;
           table1.next;
     end;
end;

{function tmainform.goedrooster : boolean;
begin
//hallo
end;}

procedure TMainForm.Roosteren1Click(Sender: TObject);
var
per, gro, uur, dag, doc, lok, vak, vorm, num, deel1, deel2 : string;
k,l, knrindex : Integer;
terug : boolean;
Ready : boolean;
keuzenummer : array[1..10000] of integer;
begin
     vultabeltwee;
     vultabelvier;
     vultabelvijf;
     vultabelzes;
     l := 0;
     orindex := 0;
     knrindex := 0;
     zetnul(keuzenummer);
     Wisrooster;
     //if not goedrooster then begin
           if dblookupComboBox1.text <> '' then
           begin
                  table1.active := true;
                  edit2.text := dblookupcombobox1.text;
                  Ready := false;
       //           while not Ready do
       begin
                     knrindex := knrindex + 1;
                     table1.first;
                     trindex := 1;
                     while not Table1.EOF do begin
                    //     showmessage(dbedit1.text);
                           terug := false;
                           //table 1 aflopen
                           //table 1 = (groep,vak,werkvorm, aantaluren)
                           //k = aantal uren van de actieve regel
                           k := StrToInt(DBEdit3.Text);
                           while k <> 0 do begin
                              //voor elk uur 1 keer rond
                              nummer := keuzenummer[knrindex];
                              trperiode[trindex] := edit2.text;
                              trgroep[trindex] := dbedit1.text;
                              trvak[trindex] := dbedit4.text;
                              trwerkvorm[trindex] := dbedit5.text;
                              if zoekdocent(DBEdit1.Text, DBEdit4.Text, DBEdit5.Text) = false then
                              begin
                                   // er is geen docent voor een vak gevonden
                            //       showmessage('stapje terug');
                                   if ((not table1.bof) and (k = strtoint(dbedit3.text))) then begin
                                      //het is niet de eerste regel dus
                                      keuzenummer[knrindex] := keuzenummer[knrindex-1];
                                      knrindex := knrindex - 1;
                                      trindex := trindex -1;
                                      k := 1;
                                      terug := true;
                                   end
                                   else if ((table1.bof) and (k = strtoint(dbedit3.text))) then begin
                                        //er is geen rooster gevonden
                                        showmessage('geen rooster mogelijk');
                                        exit; // Ready := true;
                                   end
                                   else begin
                                        k := k + 2;
                                        trindex := trindex -1;
                                        keuzenummer[knrindex] := keuzenummer[knrindex-1];
                                        knrindex := knrindex -1;
                                        inc(keuzenummer[knrindex]);
                                   end;
                              end
                              else begin
                                   knrindex := knrindex + 1;
                              end;
                              // eerst de groep, dan vak, dan werkvorm
                              k := k - 1;
                           end;
                           if not terug then table1.next
                           else terug := false;
                     end;
                     knrindex := knrindex -1;
                     checkrooster;
                     keuzenummer[knrindex] := keuzenummer[knrindex] + 1;
                     l := l + 1;
                     lala := false;
                     if ((l mod 100 = 0) {or (l > 45)})then begin
                        l := l;
                  //      lala := true;
                     end;
                     if lala then showmessage('Er is een rooster gemaakt');
                     knrindex := 0;
                  end;
                  Invoerrooster;
                  showmessage ('Het rooster is gereed!');
                  exit;
           end
           else showmessage('Selecteeer een periode');
     end;
//end;

function tmainform.zoekdocent(groep, vak, werkvorm : string) : boolean;
var
   k : integer;
begin
//	  table3.active := true;
//	  table3.first;
//	  while not table3.eof do begin
                          k := vgaantal;
			  while k <> 0 do begin
					  if ({(dbedit6.text = dbedit2.text) and} (groep = vggroep[k]) and (vak = vgvak[k]) and (werkvorm = vgwerkvorm[k]) and (vgperiode[k] = edit2.text)) then begin
					       if zoekuur(groep, vak, werkvorm,vgdocent[k]) = true then
							 begin
									zoekdocent := true;
									exit;
							 end;
					  end;
					  k := k -1;
			  end;
//			  table3.next;
//	  end;
	  zoekdocent := false;
//	  table3.Active := false;
end;

function tmainform.zoekuur(groep, vak, werkvorm, docent : string) : boolean;
var
	k,l,d : integer;
begin
	  zoekuur := false;
//	  table4.active := true;
	  for k := 1 to 5 do begin
	  //k = dag van week (1 = maandag)
			for d := 1 to 10 do begin
			//d = uur van dag (1 = 1e uur)
                                 l := dnbaantal;
				 while (((docent <> dnbdocent[l]) or (dag(k) <> dnbdagvanweek[l]) or (dnbuur[l] <> d) or (dnbperiode[l] <> edit2.text)) and (l <> 1)) do begin
						 l := l - 1;
				 end;
				 if ((docent <> dnbdocent[l]) or (dag(k) <> dnbdagvanweek[l]) or (dnbuur[l] <> d) or (dnbperiode[l] <> edit2.text)) then begin
					 if nietbezet(d,dag(k),'groepdocent',docent,groep) then begin
						if zoeklokaal(groep, vak, werkvorm, docent,dag(k),d) then
						begin
							zoekuur := true;
							exit;
						end;
					 end;
				 end;
			end;
//         table4.active := false;
	  end;
end;

function tmainform.zoeklokaal(groep, vak, werkvorm, docent,dagvanweek : string;uurtje : integer) : boolean;
var
   k : integer;
begin
//     showmessage(dagvanweek+ inttostr(uurtje));
     k := lokaantal;
	  while k <> 0 do begin
			  if ((vak = lokvak[k]) and (werkvorm = lokwerkvorm[k])) then begin
				  if lokaalbeschikbaar(dagvanweek,uurtje,loklokaal[k]) then begin
					  if nietbezet(uurtje,dagvanweek,'lokaal',loklokaal[k],'') then begin
						  if nummer = 0 then begin
  //			  			     {if lala then} showmessage (groep + ',' + docent + ',' + vak + ',' + werkvorm + ',' + dbedit17.text + ',' + dagvanweek + ',' + inttostr(uurtje));
                       trgroep[trindex] := groep;
                       trdagvanweek[trindex] := dagvanweek;
                       truur[trindex] := uurtje;
                       trdocent[trindex] := docent;
                       trvak[trindex] := vak;
                       trwerkvorm[trindex] := werkvorm;
                       trlokaal[trindex] := loklokaal[k];
//                       showmessage(trgroep[trindex] + ',' + trdagvanweek[trindex] + ',' + inttostr(truur[trindex]) + ',' + trdocent[trindex] + ',' + trvak[trindex] + ',' + trwerkvorm[trindex] + ',' + trlokaal[trindex]);
                       trindex := trindex + 1;
							  zoeklokaal := true;
							  exit;
						  end
						  else nummer := nummer -1;
					  end;
				  end;
			  end;
			  k := k -1
	  end;
     zoeklokaal := false;
end;

function tmainform.nietbezet(uur : integer;dagvanweek,tiepe,dingeen,dingtwee : string) : boolean;
var
   k : integer;
   resultaat : boolean;
 //  even : trooster;
begin
     k := trindex;

     k := k -1;
  //   even := nil;
     resultaat := true;
     while k > 0 do begin
           if ((uur = truur[k]) and (dagvanweek = trdagvanweek[k])) then begin
              if tiepe = 'groepdocent' then begin
                 if ((trdocent[k] = dingeen) and (dingeen <> '---')) then resultaat := false;
                 if trgroep[k] = dingtwee then resultaat := false;
              end
              else if (( tiepe = 'lokaal') and (trlokaal[k] = dingeen)) then resultaat := false;
           end;
           if resultaat = false then begin
              nietbezet := false;
              exit;
           end;
           k := k -1;
     end;
     nietbezet := true;
end;

function tmainform.lokaalbeschikbaar(dagvanweek : string;uurtje : integer;lokaal : string) : boolean;
var
   k : integer;
begin
     k := lnbaantal;
{     table6.active := true;
     table6.first; }
     while k <> 0 do begin
           if ((dagvanweek = lnbdagvanweek[k]) and (uurtje = lnbuur[k]) and (lokaal = lnblokaal[k]) and (lnbperiode[k] = edit2.text)) then begin
              lokaalbeschikbaar := false;
              exit;
           end;
           k := k -1;
     end;
{     table6.active := false; }
     lokaalbeschikbaar := true;
end;

function tmainform.dag(dagnr : integer) : string;
begin
     case dagnr of
     1: dag := 'Maandag';
     2: dag := 'Dinsdag';
     3: dag := 'Woensdag';
     4: dag := 'Donderdag';
     5: dag := 'Vrijdag'
     end;
end;

procedure TMainForm.Nieuw1Click(Sender: TObject);
begin
  if (MDIChildCount = 0) or ((doc = 1) or (gro =1) or (loka = 1)) then
  begin
  CreateLoktypeChild('Lokaaltype' + IntToStr(MDIChildCount + 1));
  CreateUrenChild('Uren' + IntToStr(MDIChildCount + 1));
  CreatedocnbChild('Beschikbaarheid docenten' + IntToStr(MDIChildCount + 1));
  CreateLokaalChild('Beschikbaarheid lokalen' + IntToStr(MDIChildCount + 1));
  CreateVakGebChild('Vakgebied' + IntToStr(MDIChildCount + 1));
  CreateVakChild('Vakken' + IntToStr(MDIChildCount + 1));
  CreateMDIChild('Docenten' + IntToStr(MDIChildCount + 1));
  end;
end;

procedure TMainForm.Groepenrooster1Click(Sender: TObject);
begin
  if DBLookupCombobox1.Text <> '' then
  CreateGroeproost('Groepenrooster' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.CutBtnClick(Sender: TObject);
var
text, text1, text2, temp, temp1,  per : string;
datum, spatie : string;
k,l, m, n : integer;
begin
  temp := 'Maandag';
  k := 1;
  if gro > 0 then
  begin
     if groepro.active then
     begin
       groepro.table2.first;
       while groepro.Table2.EOF = false do
       begin
         if Groepro.DBEdit1.Text = Groepro.DBLookupComboBox1.Text then
         begin
//         text := groepro.DBEdit1.Text;
//         memo1.Lines.add(text);
           text := groepro.DBEdit2.Text;
           memo1.Lines.add(text);
           text := groepro.DBEdit3.Text;
           memo1.Lines.add(text);
           text := groepro.DBEdit4.Text;
           memo1.Lines.add(text);
           text := groepro.DBEdit5.Text;
           memo1.Lines.add(text);
           text := groepro.DBEdit6.Text;
           table8.Active := true;
           DBEdit22.datafield := 'VAK';
           Query3.close;
           Query3.SQL.Clear;

           Query3.SQL.Add('SELECT vak FROM vakAFKORTING WHERE afkorting = :textPARAMETER');

           Query3.Params[0].AsString := text;

           Query3.Open;
           text := DBEdit22.text;
           DBEdit22.datafield := '';
           table3.active := false;
           memo1.Lines.add(text);
           text := groepro.DBEdit7.Text;
           memo1.Lines.add(text);
         end;
         groepro.table2.next;
       end;
       memo2.Clear;
       memo2.lines.Insert(0,'');
   temp1 := groepro.DBLookupComboBox1.text;
   per := dblookupcombobox1.text;
   Table11.active := true;
   Query7.datasource := datasource14;
   Query7.close;
   Query7.SQL.Clear;

   Query7.SQL.Add('select datum from roosterklas where periode= :perparameter and groep = :temp1parameter');

   Query7.Params[0].AsString := per;
   Query7.Params[1].AsString := temp1;
   Query7.Open;
   table10.active := true;
   dbedit24.datasource := datasource16;
   dbedit24.datafield := 'DATUM';
   datum := dbedit24.text;
   Query7.datasource := datasource7;
   query7.active := false;
       text := groepro.DBEdit8.Text;
       while length(text) < 3 do text := ' ' + text;
       memo2.lines.Insert(1,'     Rooster voor : ' + groepro.DBLookupComboBox1.text + '                    Periode: ' + Text + '        NHL fac. TEM     Datum : ' + datum);
       memo2.lines.insert (2,'');
       memo2.lines.Insert(3, '                  vaknaam                                  wv     docent  lok');
       memo2.lines.Insert(4, '           maandag');
       memo2.lines.insert(5,'     --------------------------------------------------------------------------------------------');
       temp := 'Maandag';
       while memo1.lines.count > 0 do
       begin
         if memo1.Lines.Strings[0] = 'Maandag' then
         begin
           memo1.Lines.Delete(0);
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[2] + ' ' + memo1.lines.strings[3] + '     ' + memo1.lines.strings[0] +'     ' + memo1.lines.strings[1]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
//             if k < 10 then k := k + 1;
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Dinsdag' then
         begin
           memo1.Lines.Delete(0);
           while ((k <= 11) and (temp <> 'Dinsdag')) do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[2] + ' ' + memo1.lines.strings[3] + '     ' + memo1.lines.strings[0] +'     ' + memo1.lines.strings[1]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
//             if k < 10 then k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Woensdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Woensdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[2] + ' ' + memo1.lines.strings[3] + '     ' + memo1.lines.strings[0] +'     ' + memo1.lines.strings[1]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
//             if k < 10 then k := k + 1;
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Donderdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Donderdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[2] + ' ' + memo1.lines.strings[3] + '     ' + memo1.lines.strings[0] +'     ' + memo1.lines.strings[1]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
//             if k < 10 then k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Vrijdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Vrijdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[2] + ' ' + memo1.lines.strings[3] + '     ' + memo1.lines.strings[0] +'     ' + memo1.lines.strings[1]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
//             if k < 10 then k := k + 1;
           end;
         end;
       end;
       if ((Memo1.lines.count = 0) and (k <> 11)) or ((Memo1.lines.count = 0) and (temp <> 'Vrijdag')) then aanvullen (k,temp);
     end;
  end;
  if doc > 0 then
  begin
    if docenro.active then
    begin
      if docenro.dblookupcombobox1.text = '---' then
      begin
        exit;
      end;
       temp := 'Maandag';
       docenro.table2.first;
       while docenro.Table2.EOF = false do
       begin
         if docenro.DBEdit4.Text = docenro.DBLookupComboBox1.Text then
         begin
//         text := groepro.DBEdit1.Text;
//         memo1.Lines.add(text);
           text := docenro.DBEdit2.Text;
           memo1.Lines.add(text);
           text := docenro.DBEdit3.Text;
           memo1.Lines.add(text);
           text := docenro.DBEdit1.Text;
           memo1.Lines.add(text);
           text := docenro.DBEdit5.Text;
           memo1.Lines.add(text);
           text := docenro.DBEdit6.Text;
           table8.Active := true;
           DBEdit22.datafield := 'VAK';
           Query3.close;
           Query3.SQL.Clear;

           Query3.SQL.Add('SELECT vak FROM vakAFKORTING WHERE afkorting = :textPARAMETER');

           Query3.Params[0].AsString := text;

           Query3.Open;
           text := DBEdit22.text;
           DBEdit22.datafield := '';
           table3.active := false;
           memo1.Lines.add(text);
           text := docenro.DBEdit7.Text;
           memo1.Lines.add(text);
         end;
         docenro.table2.next;
       end;
       memo2.Clear;
       table3.Active := true;
       DBedit23.DataField := 'DOCENT';
       text := Docenro.DBLookupcombobox1.Text;
       Query5.close;
       Query5.SQL.Clear;

       Query5.SQL.Add('SELECT docent FROM docentAFKORTING WHERE afkorting = :textPARAMETER');

       Query5.Params[0].AsString := text;

       Query5.Open;
       text := DBEdit23.text;
       while length(text) < 20 do text := text + ' ';
       text1 := docenro.DBEdit8.Text;
       while length(text1) < 3 do text1 := ' ' + text1;
       DBEdit23.datafield := '';
       table3.active := false;
   temp1 := docenro.DBLookupComboBox1.text;
   per := dblookupcombobox1.text;
   Table12.active := true;
   Query7.datasource := datasource15;
   Query7.close;
   Query7.SQL.Clear;

   Query7.SQL.Add('select datum from roosterdocent where periode= :perparameter and docent = :temp1parameter');

   Query7.Params[0].AsString := per;
   Query7.Params[1].AsString := temp1;
   Query7.Open;
   dbedit24.datasource := datasource16;
   dbedit24.datafield := 'DATUM';
   datum := dbedit24.text;
   Query7.datasource := datasource7;
       memo2.lines.insert(0,'');
       memo2.lines.Insert(1,'     Rooster van : ' + Text + '    Periode: ' + text1 + '         NHL fac. TEM     Datum : ' + datum);
       memo2.lines.insert (2,'');
       memo2.lines.Insert(3,'                  lok   vaknaam                                      wv     groep');
       memo2.lines.Insert(4,'           maandag');
       memo2.lines.insert(5,'     --------------------------------------------------------------------------------------------');
     while memo1.lines.count > 0 do
       begin
         if memo1.Lines.Strings[0] = 'Maandag' then
         begin
           memo1.Lines.Delete(0);
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[1] + '  ' + memo1.lines.strings[2] + '     ' + memo1.lines.strings[3] +'     ' + memo1.lines.strings[0]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Dinsdag' then
         begin
           memo1.Lines.Delete(0);
           while ((k <= 11) and (temp <> 'Dinsdag')) do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[1] + '  ' + memo1.lines.strings[2] + '     ' + memo1.lines.strings[3] +'     ' + memo1.lines.strings[0]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Woensdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Woensdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[1] + '  ' + memo1.lines.strings[2] + '     ' + memo1.lines.strings[3] +'     ' + memo1.lines.strings[0]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Donderdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Donderdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[1] + '  ' + memo1.lines.strings[2] + '     ' + memo1.lines.strings[3] +'     ' + memo1.lines.strings[0]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[0] = 'Vrijdag' then
         begin
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Vrijdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             while length(memo1.lines.strings[2]) < 40 do memo1.lines.strings[2] := memo1.lines.strings[2] + ' ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[1] + '  ' + memo1.lines.strings[2] + '     ' + memo1.lines.strings[3] +'     ' + memo1.lines.strings[0]);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end;
       end;
       if ((Memo1.lines.count = 0) and (k <> 11)) or ((Memo1.lines.count = 0) and (temp <> 'Vrijdag')) then aanvullen (k,temp);
    end;
  end;
  if loka > 0 then
  begin
    lokaaro.Table2.first;
    memo1.clear;
    if lokaaro.active then
    begin
      table6.active := true;
      query8.SQL.clear;
      query8.close;
      temp := lokaaro.DBLookupComboBox1.text;
      per := dblookupcombobox1.text;
      query8.sql.add('select * from lokaalnb where periode = :perparameter and lokaal = :tempparameter order by uur');
      Query8.Params[0].AsString := per;
      Query8.Params[1].AsString := temp;
      Query8.open;
      dbedit18.datasource := datasource17;
      dbedit19.datasource := datasource17;
      dbedit20.datasource := datasource17;
      dbedit21.datasource := datasource17;
      query8.first;
      if dbedit20.text = '' then
      begin
        while lokaaro.Table2.eof = false do
        begin
          while ((lokaaro.dbedit5.text <> lokaaro.dblookupcombobox1.text) and (lokaaro.Table2.eof = false)) do lokaaro.table2.next;
          if ((lokaaro.dbedit5.text = lokaaro.dblookupcombobox1.text) and (lokaaro.Table2.eof = false)) then
           begin
             memo1.lines.add(lokaaro.dbedit5.text);
             memo1.lines.add(lokaaro.dbedit2.text);
             memo1.lines.add(lokaaro.dbedit3.text);
             memo1.lines.add(lokaaro.dbedit1.text);
             lokaaro.table2.next;
          end;
        end;
      end;
      if dbedit20.text <> '' then
      begin
        while query8.eof = false do
        begin
          while query8.eof = false do
          begin
            if dbedit19.text = 'Maandag' then
            begin
              memo1.lines.add(dbedit21.text);
              memo1.lines.add(dbedit19.text);
              memo1.lines.add(dbedit20.text);
              memo1.lines.add('XXX');
              query8.next;
            end;
            query8.next;
          end;
          query8.first;
          while query8.eof = false do
          begin
            if dbedit19.text = 'Dinsdag' then
            begin
              memo1.lines.add(dbedit21.text);
              memo1.lines.add(dbedit19.text);
              memo1.lines.add(dbedit20.text);
              memo1.lines.add('XXX');
              query8.next;
            end;
            query8.next;
          end;
          query8.first;
          while query8.eof = false do
          begin
            if dbedit19.text = 'Woensdag' then
            begin
              memo1.lines.add(dbedit21.text);
              memo1.lines.add(dbedit19.text);
              memo1.lines.add(dbedit20.text);
              memo1.lines.add('XXX');
              query8.next;
            end;
            query8.next;
          end;
          query8.first;
          while query8.eof = false do
          begin
            if dbedit19.text = 'Donderdag' then
            begin
              memo1.lines.add(dbedit21.text);
              memo1.lines.add(dbedit19.text);
              memo1.lines.add(dbedit20.text);
              memo1.lines.add('XXX');
              query8.next;
            end;
            query8.next;
          end;
          query8.first;
          while query8.eof = false do
          begin
            if dbedit19.text = 'Vrijdag' then
            begin
              memo1.lines.add(dbedit21.text);
              memo1.lines.add(dbedit19.text);
              memo1.lines.add(dbedit20.text);
              memo1.lines.add('XXX');
              query8.next;
            end;
            query8.next;
          end;
        end;
{nieuw}
        lokaaro.table2.first;
        while lokaaro.table2.eof = false do
        begin
          if (lokaaro.dbedit5.text = lokaaro.dblookupcombobox1.text) then
          begin
            memo1.Lines.add(lokaaro.dbedit5.text);
            memo1.lines.add(lokaaro.dbedit2.text);
            memo1.lines.add(lokaaro.DBEdit3.Text);
            memo1.lines.add(lokaaro.dbedit1.text);
          end;
          lokaaro.table2.next;
        end;
      end;
// sorteren
      memo2.clear;
      k := 0;
      l := 0;
      if memo1.lines.strings[3] = 'XXX' then
      begin
        while memo1.lines.count > 0 do
        begin
          l := 0;
          while memo1.lines[k+1] = 'Maandag' do
//          if memo1.lines[k+1] = 'Maandag' then
          begin
            l := 0;
            while memo1.lines[k+l+3] = 'XXX' do l := l + 4;
            if memo1.lines[k+l+1] = 'Maandag' then
            begin
              m := strtoint(memo1.lines[k+2]);
              n := strtoint(memo1.lines[k+l+2]);
              if m < n then
              begin
                memo2.lines.Add(memo1.lines[0]);
                memo2.lines.Add(memo1.lines[1]);
                memo2.lines.Add(memo1.lines[2]);
                memo2.lines.Add(memo1.lines[3]);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
              end
              else
              begin
                memo2.lines.Add(memo1.lines[l]);
                memo2.lines.Add(memo1.lines[l+1]);
                memo2.lines.Add(memo1.lines[l+2]);
                memo2.lines.Add(memo1.lines[l+3]);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
              end;
            end
            else
            begin
              memo2.lines.Add(memo1.lines[0]);
              memo2.lines.Add(memo1.lines[1]);
              memo2.lines.Add(memo1.lines[2]);
              memo2.lines.Add(memo1.lines[3]);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
            end;
          end;
          l := 0;
          while memo1.lines.strings[l+1] <> '' do
          begin
            if ((memo1.lines.strings[l+1] = 'Maandag') and (memo1.lines.strings[l+3] <> 'XXX')) then
            begin
              memo2.lines.Add(memo1.lines[l]);
              memo2.lines.Add(memo1.lines[l+1]);
              memo2.lines.Add(memo1.lines[l+2]);
              memo2.lines.Add(memo1.lines[l+3]);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
            end
            else l := l + 4;
          end;
          while memo1.lines[k+1] = 'Dinsdag' do
//          if memo1.lines[k+1] = 'Dinsdag' then
          begin
            l := 0;
            while memo1.lines[k+l+3] = 'XXX' do l := l + 4;
            if memo1.lines[k+l+1] = 'Dinsdag' then
            begin
              m := strtoint(memo1.lines[k+2]);
              n := strtoint(memo1.lines[k+l+2]);
              if m < n then
              begin
                memo2.lines.Add(memo1.lines[0]);
                memo2.lines.Add(memo1.lines[1]);
                memo2.lines.Add(memo1.lines[2]);
                memo2.lines.Add(memo1.lines[3]);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
              end
              else
              begin
                memo2.lines.Add(memo1.lines[l]);
                memo2.lines.Add(memo1.lines[l+1]);
                memo2.lines.Add(memo1.lines[l+2]);
                memo2.lines.Add(memo1.lines[l+3]);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
              end;
            end
            else
            begin
              memo2.lines.Add(memo1.lines[0]);
              memo2.lines.Add(memo1.lines[1]);
              memo2.lines.Add(memo1.lines[2]);
              memo2.lines.Add(memo1.lines[3]);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
            end;
          end;
          l := 0;
          while memo1.lines.strings[l+1] <> '' do
          begin
            if ((memo1.lines.strings[l+1] = 'Dinsdag') and (memo1.lines.strings[l+3] <> 'XXX')) then
            begin
              memo2.lines.Add(memo1.lines[l]);
              memo2.lines.Add(memo1.lines[l+1]);
              memo2.lines.Add(memo1.lines[l+2]);
              memo2.lines.Add(memo1.lines[l+3]);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
            end
            else l := l + 4;
          end;
          while memo1.lines[k+1] = 'Woensdag' do
//          if memo1.lines[k+1] = 'Woensdag' then
          begin
            l := 0;
            while memo1.lines[k+l+3] = 'XXX' do l := l + 4;
            if memo1.lines[k+l+1] = 'Woensdag' then
            begin
              m := strtoint(memo1.lines[k+2]);
              n := strtoint(memo1.lines[k+l+2]);
              if m < n then
              begin
                memo2.lines.Add(memo1.lines[0]);
                memo2.lines.Add(memo1.lines[1]);
                memo2.lines.Add(memo1.lines[2]);
                memo2.lines.Add(memo1.lines[3]);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
              end
              else
              begin
                memo2.lines.Add(memo1.lines[l]);
                memo2.lines.Add(memo1.lines[l+1]);
                memo2.lines.Add(memo1.lines[l+2]);
                memo2.lines.Add(memo1.lines[l+3]);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
              end;
            end
            else
            begin
              memo2.lines.Add(memo1.lines[0]);
              memo2.lines.Add(memo1.lines[1]);
              memo2.lines.Add(memo1.lines[2]);
              memo2.lines.Add(memo1.lines[3]);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
            end;
          end;
          l := 0;
          while memo1.lines.strings[l+1] <> '' do
          begin
            if ((memo1.lines.strings[l+1] = 'Woensdag') and (memo1.lines.strings[l+3] <> 'XXX')) then
            begin
              memo2.lines.Add(memo1.lines[l]);
              memo2.lines.Add(memo1.lines[l+1]);
              memo2.lines.Add(memo1.lines[l+2]);
              memo2.lines.Add(memo1.lines[l+3]);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
            end
            else l := l + 4;
          end;
          while memo1.lines[k+1] = 'Donderdag' do
//          if memo1.lines[k+1] = 'Donderdag' then
          begin
            l := 0;
            while memo1.lines[k+l+3] = 'XXX' do l := l + 4;
            if memo1.lines[k+l+1] = 'Donderdag' then
            begin
              m := strtoint(memo1.lines[k+2]);
              n := strtoint(memo1.lines[k+l+2]);
              if m < n then
              begin
                memo2.lines.Add(memo1.lines[0]);
                memo2.lines.Add(memo1.lines[1]);
                memo2.lines.Add(memo1.lines[2]);
                memo2.lines.Add(memo1.lines[3]);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
              end
              else
              begin
                memo2.lines.Add(memo1.lines[l]);
                memo2.lines.Add(memo1.lines[l+1]);
                memo2.lines.Add(memo1.lines[l+2]);
                memo2.lines.Add(memo1.lines[l+3]);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
              end;
            end
            else
            begin
              memo2.lines.Add(memo1.lines[0]);
              memo2.lines.Add(memo1.lines[1]);
              memo2.lines.Add(memo1.lines[2]);
              memo2.lines.Add(memo1.lines[3]);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
            end;
          end;
          while memo1.lines[k+1] = 'Vrijdag' do
//          if memo1.lines[k+1] = 'Vrijdag' then
          begin
            l := 0;
            while memo1.lines[k+l+3] = 'XXX' do l := l + 4;
            if memo1.lines[k+l+1] = 'Vrijdag' then
            begin
              m := strtoint(memo1.lines[k+2]);
              n := strtoint(memo1.lines[k+l+2]);
              if m < n then
              begin
                memo2.lines.Add(memo1.lines[0]);
                memo2.lines.Add(memo1.lines[1]);
                memo2.lines.Add(memo1.lines[2]);
                memo2.lines.Add(memo1.lines[3]);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
                memo1.lines.Delete(0);
              end
              else
              begin
                memo2.lines.Add(memo1.lines[l]);
                memo2.lines.Add(memo1.lines[l+1]);
                memo2.lines.Add(memo1.lines[l+2]);
                memo2.lines.Add(memo1.lines[l+3]);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
                memo1.lines.Delete(l);
              end;
            end
            else
            begin
              memo2.lines.Add(memo1.lines[0]);
              memo2.lines.Add(memo1.lines[1]);
              memo2.lines.Add(memo1.lines[2]);
              memo2.lines.Add(memo1.lines[3]);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
              memo1.lines.Delete(0);
            end;
          end;
          l := 0;
          while memo1.lines.strings[l+1] <> '' do
          begin
            if ((memo1.lines.strings[l+1] = 'Vrijdag') and (memo1.lines.strings[l+3] <> 'XXX')) then
            begin
              memo2.lines.Add(memo1.lines[l]);
              memo2.lines.Add(memo1.lines[l+1]);
              memo2.lines.Add(memo1.lines[l+2]);
              memo2.lines.Add(memo1.lines[l+3]);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
              memo1.lines.Delete(l);
            end
            else l := l + 4;
          end;
        end;
      end;
      while memo2.lines.count > 0 do
      begin
        memo1.lines.add(memo2.lines.strings[0]);
        memo2.lines.delete(0);
      end;
// het echte indelen voor het printen
      temp := 'Maandag';
      k := 1;
   per := DBLookupComboBox1.Text;
   Table10.active := true;
   Query7.close;
   Query7.SQL.Clear;

   Query7.SQL.Add('select datum from lokaalbezetting where periode= :perparameter');

   Query7.Params[0].AsString := per;
   Query7.Open;
   table10.active := true;
   dbedit24.datasource := datasource16;
   dbedit24.datafield := 'DATUM';
   datum := dbedit24.text;
   text := dblookupcombobox1.text;
   while length(text) < 3 do text := ' ' + text;
       memo2.lines.insert(0,'');
       memo2.lines.Insert(1,'     Rooster voor : ' + lokaaro.DBLookupComboBox1.text + '                    Periode: ' + Text + '        NHL fac. TEM     Datum : ' + datum);
       memo2.lines.insert (2,'');
   dbedit24.datafield := '';
   query7.active := false;
   table10.active := false;
       memo2.lines.Insert(3,'                  bezetting');
       memo2.lines.Insert(4,'           maandag');
       memo2.lines.insert(5,'     --------------------------------------------------------------------------------------------');
       while memo1.lines.count > 0 do
       begin
         if memo1.Lines.Strings[1] = 'Maandag' then
         begin
           memo1.Lines.Delete(0);
           memo1.Lines.Delete(0);
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[0]);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[1] = 'Dinsdag' then
         begin
           memo1.Lines.Delete(0);
           memo1.Lines.Delete(0);
           while ((k <= 11) and (temp <> 'Dinsdag')) do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[0]);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[1] = 'Woensdag' then
         begin
           memo1.Lines.Delete(0);
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Woensdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[0]);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[1] = 'Donderdag' then
         begin
           memo1.Lines.Delete(0);
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Donderdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[0]);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end
         else if memo1.lines.strings[1] = 'Vrijdag' then
         begin
           memo1.Lines.Delete(0);
           memo1.Lines.Delete(0);
           while (k <= 11) and (temp <> 'Vrijdag') do
           begin
             temp := tussendag(k, temp);
             k := 1;
           end;
           while (strtoint(memo1.lines.Strings[0]) > k) do
           begin
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.Add(spatie + inttostr(k));
             k := k + 1;
           end;
           if (strtoint(memo1.lines.Strings[0]) = k) then
           begin
             memo1.lines.delete(0);
             if k < 10 then spatie := '               '
             else spatie := '              ';
             memo2.lines.add(spatie + inttostr(k) + '  ' + memo1.Lines.strings[0]);
             memo1.lines.delete(0);
             k := k + 1;
           end;
         end;
       end;
       if ((Memo1.lines.count = 0) and (k <> 11)) or ((Memo1.lines.count = 0) and (temp <> 'Vrijdag')) then aanvullen (k,temp);
    end;
  end;
  if printdialog1.execute then self.Print;
end;

function TMainform.tussendag (k : Integer; temp : string) : string;
var
spatie : string;

begin
  while k <= 10 do
  begin
    if k < 10 then spatie := '               '
    else spatie := '              ';
    memo2.lines.Add(spatie + inttostr(k));
    k := k + 1;
  end;
  if ((k = 11) and (temp = 'Maandag')) then
  begin
    memo2.lines.add('           dinsdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    k := 1;
  end
  else if ((k =11) and (temp = 'Dinsdag')) then
  begin
    memo2.lines.add('           woensdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    k := 1;
  end
  else if ((k =11) and (temp = 'Woensdag')) then
  begin
    memo2.lines.add('           donderdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    k := 1;
  end
  else if ((k =11) and (temp = 'Donderdag')) then
  begin
    memo2.lines.add('           vrijdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    k := 1;
  end;
  if temp = 'Maandag' then tussendag := 'Dinsdag'
  else if temp = 'Dinsdag' then tussendag := 'Woensdag'
  else if temp = 'Woensdag' then tussendag := 'Donderdag'
  else if temp = 'Donderdag' then tussendag := 'Vrijdag'
end;

procedure TMainForm.aanvullen (k : Integer; temp : string);
var
spatie : string;

begin
  if temp = 'Maandag' then
  begin
    while k < 11 do
    begin
      if k < 10 then spatie := '               '
      else spatie := '              ';
      memo2.lines.Add(spatie + inttostr(k));
      k := k + 1;
    end;
    k := 1;
    memo2.lines.add('           dinsdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    temp := 'Dinsdag';
  end;
  if temp = 'Dinsdag' then
  begin
    while k < 11 do
    begin
      if k < 10 then spatie := '               '
      else spatie := '              ';
      memo2.lines.Add(spatie + inttostr(k));
      k := k + 1;
    end;
    k := 1;
    memo2.lines.add('           woensdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    temp := 'Woensdag';
  end;
  if temp = 'Woensdag' then
  begin
    while k < 11 do
    begin
      if k < 10 then spatie := '               '
      else spatie := '              ';
      memo2.lines.Add(spatie + inttostr(k));
      k := k + 1;
    end;
    k := 1;
    memo2.lines.add('           donderdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    temp := 'Donderdag';
  end;
  if temp = 'Donderdag' then
  begin
    while k < 11 do
    begin
      if k < 10 then spatie := '               '
      else spatie := '              ';
      memo2.lines.Add(spatie + inttostr(k));
      k := k + 1;
    end;
    k := 1;
    memo2.lines.add('           vrijdag');
    memo2.lines.add('     --------------------------------------------------------------------------------------------');
    temp := 'Vrijdag';
  end;
  if temp = 'Vrijdag' then
  begin
    while k < 11 do
    begin
      if k < 10 then spatie := '               '
      else spatie := '              ';
      memo2.lines.Add(spatie + inttostr(k));
      k := k + 1;
    end;
    k := 1;
    temp := 'Zaterdag';
  end
end;

procedure TMainForm.Print;
var
 Line : Integer;
 PrintText : system.text;

begin
   Printer.Orientation := poPortrait;
   assignprn(PrintText);
   try
     Rewrite (PrintText);
     Printer.canvas.font := memo2.font;
     Printer.Canvas.Font.Pitch := (fpFixed);
     for line := 0 to memo2.lines.count -1 do
       Writeln (PrintText, Memo2.Lines[Line]);
       finally
         system.close (PrintText);
       end;
end;

procedure TMainForm.DBLookupComboBox1Click(Sender: TObject);
begin
   Query4.First;
end;

procedure TMainForm.Lokaaltype1Click(Sender: TObject);
begin
  CreateLoktypeChild('Lokaaltype' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Afkorting1Click(Sender: TObject);
begin
  CreateMDIChild('Docenten' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Vakgebied1Click(Sender: TObject);
begin
  CreateVakGebChild('Vakgebied' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Beschikbaarheid1Click(Sender: TObject);
begin
  CreatedocnbChild('Beschikbaarheid docenten' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Uren1Click(Sender: TObject);
begin
  CreateVakChild('Vakken' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Uren2Click(Sender: TObject);
begin
  CreateUrenChild('Uren' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Beschikbaarheid2Click(Sender: TObject);
begin
  CreateLokaalChild('Beschikbaarheid lokalen' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
	gelder : tlijst;
begin
	gelder := nil;
	gelder := tlijst.create(9,gelder);
	gelder := tlijst.create(10,gelder);
	gelder.destroy;
	showmessage(inttostr(gelder.getal));
end;

procedure TMainForm.CopyBtnClick(Sender: TObject);
begin
     self.mainmenu1.items[0].items[0].click;
end;

end.
