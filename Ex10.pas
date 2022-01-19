Program Ex10;
const Rmax=30;
type Punct = record
              x, y, z: real;
             end;
     Indice = -Rmax..Rmax;
var P : array[Indice] of Punct;
 j, m, l, R, K ,i: Indice;

function Distanta(A,B,C : Punct) : real;
begin
 Distanta:=sqrt(sqr(A.x)+sqr(B.y)+sqr(C.z));
end; { Distanta }

function SolutiePosibila(j,m,l:Indice):boolean;
begin
 if (j<>m) And (m<>l) And (l<>j)then SolutiePosibila:=true
 else SolutiePosibila:=false;
end; { SolutiePosibila }

procedure PrelucrareaSolutiei(A,B,C: Punct);
begin
 if Distanta(A,B,C) <= R then
  begin
   K:=K+1;
  end;
end; { PrelucrareaSolutiei }

begin
 K:=1;
 write('Dati raza sferei R = '); readln(R);
 
for j:=-R to R do
  for m:=-R to R do
    for l:=-R to R do
      if SolutiePosibila(j, m, l) then
        PrelucrareaSolutiei(P[j], P[m], P[l]);
writeln('Numarul de puncte = ', K );

end.

