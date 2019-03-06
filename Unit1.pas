unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Image1: TImage;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   ran,a,dis,arr1,arr2,x1,y1:integer;
   num:integer;
   rand:array[1..1000] of integer;
   mainarr:array[1..2,1..500] of char;
   pwc:array[1..500] of  char;
implementation

  uses Math, Unit2;

{$R *.dfm}
function HexToStr(s:string):longword;
var
i:integer;
begin
s:='0'+Trim(s);
Result:=0;i:=1;
    for i:=1 to length(s) do
        case s[i] of
        '0'..'9':Result:=Result*16 + ord(s[i])-48;
        'A'..'F':Result:=Result*16 + ord(s[i])-55;
        'a'..'f':Result:=Result*16 + ord(s[i])-87;
        end    //case
end;
 function takror(yu:integer):boolean;
  var i:integer;
  b:boolean;
  begin
     b:=false;
     for i:=1 to num do
        if (rand[i] = yu) then
        b:=true;
     takror:=b;
  end;

procedure TForm1.FormShow(Sender: TObject);
var i:integer;
begin


pwc[1]:=' ';  pwc[2]:='!';  pwc[3]:='"';  pwc[4]:='#';  pwc[5]:='$';  pwc[6]:='%';  pwc[7]:='&';
pwc[8]:=#39;  pwc[9]:='(';  pwc[10]:=')';  pwc[11]:='*';  pwc[12]:='+';  pwc[13]:=',';  pwc[14]:='-';
pwc[15]:='.';  pwc[16]:='/';  pwc[17]:='0';  pwc[18]:='1';  pwc[19]:='2';  pwc[20]:='3';  pwc[21]:='4';
pwc[22]:='5';  pwc[23]:='6';  pwc[24]:='7';  pwc[25]:='8';  pwc[26]:='9';  pwc[27]:=':';  pwc[28]:=';';
pwc[29]:='<';  pwc[30]:='=';  pwc[31]:='>';  pwc[32]:='?';  pwc[33]:='@';  pwc[34]:='A';  pwc[35]:='B';
pwc[36]:='C';  pwc[37]:='D';  pwc[38]:='E';  pwc[39]:='F';  pwc[40]:='G';  pwc[41]:='H';  pwc[42]:='I';
pwc[43]:='J';  pwc[44]:='K';  pwc[45]:='L';  pwc[46]:='M';  pwc[47]:='N';  pwc[48]:='O';  pwc[49]:='P';
pwc[50]:='Q';  pwc[51]:='R';  pwc[52]:='S';  pwc[53]:='T';  pwc[54]:='U';  pwc[55]:='V';  pwc[56]:='W';
pwc[57]:='X';  pwc[58]:='Y';  pwc[59]:='Z';  pwc[60]:='[';  pwc[61]:='\';  pwc[62]:=']';  pwc[63]:='^';
pwc[64]:='_';  pwc[65]:='`';  pwc[66]:='a';  pwc[67]:='b';  pwc[68]:='c';  pwc[69]:='d';  pwc[70]:='e';
pwc[71]:='f';  pwc[72]:='g';  pwc[73]:='h';  pwc[74]:='i';  pwc[75]:='j';  pwc[76]:='k';  pwc[77]:='l';
pwc[78]:='m';  pwc[79]:='n';  pwc[80]:='o';  pwc[81]:='p';  pwc[82]:='q';  pwc[83]:='r';  pwc[84]:='s';
pwc[85]:='t';  pwc[86]:='u';  pwc[87]:='v';  pwc[88]:='w';  pwc[89]:='x';  pwc[90]:='y';  pwc[91]:='z';
pwc[92]:='{';  pwc[93]:='|';  pwc[94]:='}';  pwc[95]:='~';  pwc[96]:='';  pwc[97]:='Ѐ';  pwc[98]:='Ё';
pwc[99]:='№';  pwc[100]:='Ў';  pwc[101]:='А';  pwc[102]:='Б';  pwc[103]:='В';  pwc[104]:='Г';
pwc[105]:='Д';  pwc[106]:='Е';  pwc[107]:='Ж';  pwc[108]:='З';  pwc[109]:='И';  pwc[110]:='Й';
pwc[111]:='К';  pwc[112]:='Л';  pwc[113]:='М';  pwc[114]:='Н';  pwc[115]:='О';  pwc[116]:='П';
pwc[117]:='Р';  pwc[118]:='С';  pwc[119]:='Т';  pwc[120]:='У';  pwc[121]:='Ф';  pwc[122]:='Х';
pwc[123]:='Ц';  pwc[124]:='Ч';  pwc[125]:='Ш';  pwc[126]:='Щ';  pwc[127]:='Ъ';  pwc[128]:='Ы';
pwc[129]:='Ь';  pwc[130]:='Э';  pwc[131]:='Ю';  pwc[132]:='Я';  pwc[133]:='а';  pwc[134]:='б';
pwc[135]:='в';  pwc[136]:='г';  pwc[137]:='д';  pwc[138]:='е';  pwc[139]:='ж';  pwc[140]:='з';
pwc[141]:='и';  pwc[142]:='й';  pwc[143]:='к';  pwc[144]:='л';  pwc[145]:='м';  pwc[146]:='н';
pwc[147]:='о';  pwc[148]:='п';  pwc[149]:='р';  pwc[150]:='с';  pwc[151]:='т';  pwc[152]:='у';
pwc[153]:='ф';  pwc[154]:='х';  pwc[155]:='ц';  pwc[156]:='ч';  pwc[157]:='ш';  pwc[158]:='щ';
pwc[159]:='ъ';  pwc[160]:='ы';  pwc[161]:='ь';  pwc[162]:='э';  pwc[163]:='ю';  pwc[164]:='я';
pwc[165]:='ё';  pwc[166]:='ў';  pwc[167]:='Ғ';  pwc[168]:='ғ';  pwc[169]:='Қ';  pwc[170]:='қ';
pwc[171]:='Ҳ';  pwc[172]:='ҳ';

StringGrid1.Cells[0,0]:='Haqiqiy belgi';
StringGrid1.Cells[0,1]:='belgi raqami';
StringGrid1.Cells[0,2]:='Shifrlangan belgi';
StringGrid1.Cells[0,3]:='Shifrlangan belgi raqami';
StringGrid1.ColWidths[0]:=125;
    for i:=1 to 172 do
      mainarr[1,i]:=pwc[i] ;
      for i:=1 to 172 do
   begin
      StringGrid1.Cells[i,0]:= mainarr[1,i];
      StringGrid1.Cells[i,1]:=IntToStr(i);
   end;
 BitBtn5.Caption:='Funksiyadan'+#13+'foydalanish oynasi';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);

end;
    procedure TForm1.Button1Click(Sender: TObject);
label 55;
var
    c:word;
  i,j,p1,p2,yuza:integer;
   s2,s1,s:string;
  Color: TColor;
  R,G,B: Byte;
    bor:boolean;
 begin
  /////////////  Arrayni tashkil etish
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
 Randomize;
x1:=Image1.Width;
y1:=Image1.Height;
55:ran:=RandomRange(1,x1 div 15);
dis:=x1 div ran;
arr1:=x1 div dis;
arr2:=y1 div dis;
if x1 div dis < 30 then  goto 55;
s2:='X '+IntToStr(x1)+#13+'Y '+IntToStr(y1)+#13+' dis '+IntToStr(dis)+#13+' arr1 x '+IntToStr(arr1)+#13+' arr2 y '+IntToStr(arr2);
   //////////////////////////////////  Asosiy prodseduraniki
     a:=1;   num:=1;

     i:=0;
    for i:=1 to arr1 do
    begin
 		for j:=1 to arr2 do
				begin
					bor:=false;
					yuza:=0;
					for p1:=(i-1)*dis to i*dis do    ///// Yuzaning xajmi
					for p2:=(j-1)*dis to j*dis do
						begin
							Color:=Image1.Picture.Bitmap.Canvas.Pixels[p1,p2];
							s1:=colortostring(image1.Canvas.Pixels[p1,p2]);
							s1:=InttoStr(hextostr(s1));
							if Length(s1)=8 then
								begin
									bor:=true;
									yuza:=yuza+1;
								end;                        ///// Yuzaning xajmi
						end;

					if (bor=true) and (takror(yuza) = false) and (yuza <> 256)  then
						begin
              rand[num]:=yuza;
              mainarr[2,num]:=chr(rand[num]);
              StringGrid1.Cells[num,2]:=mainarr[2,num];
              StringGrid1.Cells[num,3]:=IntToStr(rand[num]) ;
              Image1.Canvas.Pen.Color:=clblue;
              Image1.Canvas.Ellipse((i-1)*dis,(j-1)*dis,(i-1)*dis+8,(j-1)*dis+8);
              inc(num);
              if a>=173  then  break;
              
              a:=a+1;
            end;
				end;
        if a>=173  then  break;
        ProgressBar1.Position:=ProgressBar1.Position+ trunc(100/arr1) ;

    end;



end;
procedure TForm1.BitBtn2Click(Sender: TObject);
var t,d,l,i,j:integer;
begin
       t:=0;
       a:=1;
       while a<173 do
        begin
        ProgressBar1.Position:=0;
          Button1Click(Sender);
             if t<=2 then
                  inc(t)
             else
              begin
                 ShowMessage('Bu faylning o`lchamlari kichkina'+#13+' iltimos boshqa fayl tanlash yoki generatsiyani boshqattan amalga oshirish '+#13+'TAVSIYA etiladi');
                 exit;
              end;
        end;
       ShowMessage('Harakatlar soni='+IntToStr(t));

      i:=0; j:=0;
   while i<x1 do
    begin
       Image1.Canvas.Pen.Color:=clGreen;
       Image1.Canvas.MoveTo(i,0);
       Image1.Canvas.LineTo(i,y1);
       i:=i+dis
     end;
   while j<y1 do
    begin
       Image1.Canvas.Pen.Color:=clRed;
       Image1.Canvas.MoveTo(0,j);
       Image1.Canvas.LineTo(x1,j);
       j:=j+dis;
    end;
     ProgressBar1.Position:=0;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var i,q:integer;
s,s1:String;
begin
   s:=Edit1.Text;
   s1:='';
   for i:=1 to  Length(s) do
   for q:=1 to 172  do
   if s[i]=mainarr[1,q] then s1:=s1+mainarr[2,q];
   Edit2.Text:=s1;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i,q:integer;
s,s1:String;
begin
     s:=Edit2.Text;
   s1:='';
   for i:=1 to  Length(s) do
   for q:=1 to 172  do
     if ord(s[i])= ord(mainarr[2,q]) then
        begin
          s1:=s1+mainarr[1,q];
          break;
        end;
   Edit3.Text:=s1;

end;


procedure TForm1.BitBtn5Click(Sender: TObject);

var i:integer;
begin
Form2.StringGrid1.Cells[0,0]:='Haqiqiy belgi';
Form2.StringGrid1.Cells[0,1]:='belgi raqami';
Form2.StringGrid1.Cells[0,2]:='Shifrlangan belgi';
StringGrid1.Cells[0,3]:='Shifrlangan belgi raqami';
Form2.StringGrid1.ColWidths[0]:=125;

 for i:=1 to 172 do
   begin
     Form2.StringGrid1.Cells[i,0] :=Form1.StringGrid1.Cells[i,0];
     Form2.StringGrid1.Cells[i,1]:=IntToStr(i);
     Form2.StringGrid1.Cells[i,2] :=Form1.StringGrid1.Cells[i,2];
     Form2.StringGrid1.Cells[i,3] :=Form1.StringGrid1.Cells[i,3];
   end;


Form2.ShowModal
end;

end.
