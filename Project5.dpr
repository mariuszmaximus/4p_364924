library Project5;


uses
  SysUtils,
  Classes;

{$R *.res}
var
  p:array of pointer;


function doit(n, m: cardinal): int64; stdcall; // stdcall;
var
  i: integer;
begin
  for i := 0 to length(p) - 1 do
    if p[i] <> nil then
      freemem(p[i]);
  result := 0;
  //p := nil;
  try
    setlength(p, n);
    for i := 0 to length(p) - 1 do
    begin
      getmem(p[i], m);
      inc(result, m);
    end;
  except
    result := 0;
  end;
end;


exports doit;

begin
  // p := nil;
  // writeln('aaa');

end.
