unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;


function doit(n,m:cardinal):int64;  stdcall external 'Project5.dll';

implementation

{$R *.dfm}



var
  h: HModule;
  doit_dynamic:function(n,m:cardinal):int64; stdcall;
//  procedure load;
//  procedure unload;

procedure load;
begin
  h:=loadlibrary('project5.dll');
  if h<>0 then @doit_dynamic:=getprocaddress(h,pchar('doit'));
end;

procedure unload;
begin
  freelibrary(h);
end;


procedure TForm5.Button1Click(Sender: TObject);
begin
  showmessage(inttostr(doit(100000,100000)));//powinno sie wyswietli� 0 gdyby si� program nie wykrzaczy� z b��dem 203. A tak nie jest niestety.
end;




procedure TForm5.Button2Click(Sender: TObject);
begin
  showmessage(inttostr(doit_dynamic(100000,100000)));//powinno sie wyswietli� 0 gdyby si� program nie wykrzaczy� z b��dem 203. A tak nie jest niestety.

end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  load;
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
  unload;
end;

end.
