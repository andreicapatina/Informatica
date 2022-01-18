Program P152b;
{ Puncte pe un plan euclidian }
const nmax=30;
type Punct = record
               x, y : real;
             end;
    Indice = 1..nmax;

var      P : array[Indice] of Punct;
     j, m, k, n : Indice;
dmax, smax : real; { distanţa maxima }

PA, PB, PC : Punct;

function Distanta(A, B : Punct) : real;
begin
Distanta:=sqrt(sqr(A.x-B.x)+sqr(A.y-B.y));
end; { Distanta }

function SolutiePosibila(j,m,k:Indice):boolean;
begin
if (j<>m) And (m<>k) And (k<>j) then SolutiePosibila:=true
else SolutiePosibila:=false;
end; { SolutiePosibila }

procedure PrelucrareaSolutiei(A, B, C : Punct);
Var AB, BC, AC, SP, S : Real;
begin
AB:=Distanta(A, B);
BC:=Distanta(B, C);
AC:=Distanta(A, C);
SP:=(AB+BC+AC)/2;
S:=SQRT(SP*(SP-AB)*(SP-BC)*(Sp-AC));
If S > smax Then
begin
PA:=A; PB:=B; PC:=C;
smax:=S;
end;
end; { PrelucrareaSolutiei }

begin
write('Dati n='); readln(n);
writeln('Daţi coordonatele x, y ale punctelor');
for j:=1 to n do
begin
write('P[', j, ']: '); readln(P[j].x, P[j].y);
end;
dmax:=0;
for j:=1 to n do
for m:=1 to n do
for k:=1 to n do
if SolutiePosibila(j, m, k) then
PrelucrareaSolutiei(P[j], P[m], P[k]);
writeln('Soluţia: PA=(', PA.x:5:2, ',', PA.y:5:2, ')');
writeln('         PB=(', PB.x:5:2, ',', PB.y:5:2, ')');
writeln('         PC=(', PC.x:5:2, ',', PC.y:5:2, ')');
readln;
end.