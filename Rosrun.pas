unit rosrun;

interface

uses
Classes, Sysutils, dialogs;

type
    TLijst = class (TObject)
private
public
       getal : Integer;
       volgende : TLijst;
		 constructor Create(g : Integer; volg : TLijst);
	 destructor Destroy;
end;

implementation

constructor TLijst.Create(g : Integer; volg : TLijst);
begin
	  inherited Create;
	  getal := g;
	  volgende := volg;

end;

destructor TLijst.Destroy;
begin
	volgende.Destroy;
	inherited Destroy;
end;


end.
