real((A,_), A).
imaginary((_,B), B).

conjugate((A,B), (A,C)) :-
  C is - B.

abs((A,B), R) :-
 R is sqrt(A**2 + B**2).

add((A,B), (C,D), (X,Y)) :-
  X is A + C,
  Y is B + D.

sub((A,B), (C,D), (X,Y)) :-
  X is A - C,
  Y is B - D.

mul((A,B), (C,D), (X,Y)) :-
  X is A * C - B * D,
  Y is B * C + A * D.

div((A,B), (C,D), (X,Y)) :-
  X is (A * C + B * D) / (C**2 + D**2),
  Y is (B * C - A * D) / (C**2 + D**2).
