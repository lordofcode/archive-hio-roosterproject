unit roos;

interface

uses
Classes, Sysutils, dialogs;

type
    Trooster = class (TObject)
private
public
       groep : string;
       dagvanweek : string;
       uur : integer;
       docent : string;
       lokaal : string;
       vak : string;
       werkvorm : string;
       volgende : Trooster;
		 constructor Create(gro,dagje : string;uren : integer;doc,lok,vakje,werk : string;volg : trooster);
		 destructor Destroy;
end;

implementation

constructor trooster.Create(gro,dagje : string;uren : integer;doc,lok,vakje,werk : string;volg : trooster);
begin
	  inherited Create;
	  groep := gro;
	  dagvanweek := dagje;
	  uur := uren;
	  docent := doc;
	  lokaal := lok;
	  vak := vakje;
	  werkvorm := werk;
	  volgende := volg;
end;

destructor trooster.Destroy;
begin
	volgende.destroy;
	inherited destroy;
end;

end.
