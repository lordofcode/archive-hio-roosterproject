unit newlist;

interface

uses
Classes, Sysutils, dialogs;


type
	TLijstElem = class (TObject)
		public
			getal : integer;
			next : TLijstElem;
	end;

	TLijst = class (TObject)
		public
			Head : TLijstElem;
			cElems : integer;

			constructor Create;
			destructor Destroy;
			function Count : integer;
			function Get(index : integer) : integer;
			procedure Add(value : integer);
			function Copy : TLijst;
	end;

implementation

constructor TLijst.Create;
begin
	inherited Create;
	Head := nil;
	cElems := 0;
end;

destructor TLijst.Destroy;
var
	trash : TLijstElem;
begin
	trash := Head;
	while (Head<>nil) do begin
		trash := Head;
		Head := Head.next;
		trash.Destroy;
	end;

	inherited Destroy;
end;

function TLijst.Count : integer;
begin
	Count := cElems;
end;

function TLijst.Get(index : integer) : integer;
var
	t : TLijstElem;
	i : integer;
begin
	Result := 0;
	if ((index<=cElems)and(index>=0)) then begin
		t := Head;
		for i := 1 to index do t := t.next;
		Result := t.getal;
	end;
end;

procedure TLijst.Add(value : integer);
var
	t : TLijstElem;
begin
	t := TLijstElem.Create;
	t.getal := value;
	t.next := Head;
	Head := t;
	inc(cElems);
end;

function TLijst.Copy : TLijst;
var
	rv : TLijst;
	i : integer;
begin
	rv := TLijst.Create;
	i := cElems;
	while (i>0) do begin
		rv.Add(Get(i-1));
		dec(i);
	end;
	Copy := rv;
end;


end.
