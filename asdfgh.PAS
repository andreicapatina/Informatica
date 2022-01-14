Program P149;

{ Timpul de executie a procedurii Sortare n=1..1000}
Uses DOS;

Type Vector = Array[1..10000] Of Real;
Var   A : Vector;
   i, n : Integer;
 T1, T2 : Real; { Timpul in secunde }

Var ore, minute, secunde, sutimi : word;

Function TimpulCurent:Real;
Begin
  GetTime(ore, minute, secunde, sutimi);
  TimpulCurent:=3600.0*ore+60.0*minute+1.0*secunde+0.01*sutimi;
End; { TimpulCurent }

Procedure Sortare(Var A:Vector; n:Integer);
{ Sortarea elementelor vectorului A }
Var i, j : Integer;
       r : Real;
Begin
  For i:=1 To n Do
  For j:=1 To n-1 Do
  If A[j]>A[j+1] Then
    Begin
      r:=A[j];
      A[j]:=A[j+1];
      A[j+1]:=r;
    End;
End; { Sortare }

BEGIN
  Write('Dati numarul de elemente n=');
  ReadLn(n);
  { Atribuim lui A valoarea (n, n-1, ..., 3, 2, 1) }
  For i:=1 To n Do A[i]:=n-i+1;
  T1:=TimpulCurent;
  Sortare(A, n);
  T2:=TimpulCurent;
  WriteLn('Durata de executie', (T2-T1):7:2, ' secunde.');
  ReadLn;
end.