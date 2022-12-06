unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;h:cardinal;
  fromdll:function(n,m:cardinal):int64; stdcall;
  procedure load;
  procedure unload;
  implementation

{$R *.dfm}
  procedure load;
begin
h:=loadlibrary('project2.dll');
if h<>0 then @fromdll:=getprocaddress(h,pchar('doit'));
end;
  procedure unload;
begin
  freelibrary(h);
end;
procedure TForm3.Button1Click(Sender: TObject);
begin
showmessage(inttostr(fromdll(100000,100000)));//powinno sie wyswietlić 0 gdyby się program nie wykrzaczył z błędem 203. A tak nie jest niestety.
end;
procedure TForm3.FormCreate(Sender: TObject);
begin
load;
end;
procedure TForm3.FormDestroy(Sender: TObject);
begin
unload;
end;
end.
