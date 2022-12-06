program Project6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function doit(n,m:cardinal):int64; stdcall external 'Project5.dll';
begin
  try
     Writeln(doit(1000,1024*1024*10));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
