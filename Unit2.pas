unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, System.Zip,Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenWordfile1: TMenuItem;
    Oynaniyopish1: TMenuItem;
    EncDecypt1: TMenuItem;
    Encryptfile1: TMenuItem;
    Decript1: TMenuItem;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Faylnisaqlash1: TMenuItem;
    MSWordfayliniochish1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Shifrlashfunksiyasinisaqlash1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure OpenWordfile1Click(Sender: TObject);
    procedure Encryptfile1Click(Sender: TObject);
    procedure Faylnisaqlash1Click(Sender: TObject);
    procedure Decript1Click(Sender: TObject);
    procedure Shifrlashfunksiyasinisaqlash1Click(Sender: TObject);
    procedure MSWordfayliniochish1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  ran,a,dis,arr1,arr2,x1,y1:integer;
   num:integer;
   rand:array[1..1000] of integer;
   mainarr:array[1..2,1..500] of char;
   pwc:array[1..500] of  char;
   fff:integer;
implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Decript1Click(Sender: TObject);
var i,j,k:integer;
s,s1:string;
begin
RichEdit2.Clear;
   for j:=1 to RichEdit1.Lines.Count do
   begin
         s:=RichEdit1.Lines.Strings[j-1];
         //RichEdit2.Lines.Add(s+' ==> ');
         s1:='';
         for k:=1 to  Length(s) do
         for i:=1 to 172 do
          if s[k]=mainarr[2,i] then  s1:=s1+mainarr[1,i];
         RichEdit2.Lines.Add(s1);


   end;
end;

procedure TForm2.Encryptfile1Click(Sender: TObject);
var i,j,k:integer;
s,s1:string;
begin
RichEdit2.Clear;
   for j:=1 to RichEdit1.Lines.Count do
   begin
         s:=RichEdit1.Lines.Strings[j-1];
         //RichEdit2.Lines.Add(s+' ==> ');
         s1:='';
         for k:=1 to  Length(s) do
         for i:=1 to 172 do
          if s[k]=mainarr[1,i] then  s1:=s1+mainarr[2,i];
         RichEdit2.Lines.Add(s1);

   end;
end;

procedure TForm2.Faylnisaqlash1Click(Sender: TObject);
begin
if fff=0  then    /////////  Fayl txt bo'lsa
begin
    SaveDialog1.Execute;
    RichEdit2.Lines.SaveToFile(SaveDialog1.FileName+'.txt',TEncoding.UTF8);

end;
end;

procedure TForm2.FormShow(Sender: TObject);
var i:integer;
s0,s2:string;
begin
StringGrid1.Cells[0,0]:='Haqiqiy belgi';
StringGrid1.Cells[0,1]:='belgi raqami';
StringGrid1.Cells[0,2]:='Shifrlangan belgi';
StringGrid1.ColWidths[0]:=125;
Panel2.Height:=Form2.Height div 3;

for i:=1 to 172 do
begin
  s0:=StringGrid1.Cells[i,0];
  mainarr[1,i]:=s0[1];
  s2:=StringGrid1.Cells[i,2];
  mainarr[2,i]:=s2[1];
end;


end;

procedure TForm2.MSWordfayliniochish1Click(Sender: TObject);
 var zipfile:TZipFile; i:integer;
 fname,fstr:string;
 ww:TextFile;
 b:boolean;
begin
fff:=1;
b:=true;
if OpenDialog1.Execute then
  begin
       zipFile := TZipFile.Create;
 try
     CopyFile(pchar(OpenDialog1.FileName),pchar(ExtractFilePath(Application.ExeName)+'tmp.zip'),true) ;
     zipfile.ExtractZipFile(ExtractFilePath(Application.ExeName)+'tmp.zip',ExtractFilePath(Application.ExeName)+'tmp\',nil);
     DeleteFile(ExtractFilePath(Application.ExeName)+'tmp.zip');
     fname:=ExtractFilePath(Application.ExeName)+'tmp\word\document.xml' ;
     if FileExists(fname) then
       begin
          AssignFile(ww,fname);
          Reset(ww);
          while not eof(ww) do
            begin
              Readln(ww,fstr);
                  for I := 1 to Length(fstr)-6 do
                    begin
                        if ((copy(fstr,i,4)  = '<w:t') or b = true) then
                             if fstr[i] = '>' then
                        if copy(fstr,i,6) = '</w:t>' then    b:=false;


            end;

       end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;



  end;

end;

procedure TForm2.OpenWordfile1Click(Sender: TObject);
var s,fk:string;
fl:integer;
begin
if OpenDialog1.Execute then
  begin
       s:=OpenDialog1.FileName;
       fl:=Length(s);
       fk:=copy(s,fl-3,4) ;
       if fk='.txt' then    ////  tanlangan fayl text bo'lsa
            begin
               RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
               fff:=0;


            end;

  end;
end;

procedure TForm2.Shifrlashfunksiyasinisaqlash1Click(Sender: TObject);
begin
//
end;

end.
