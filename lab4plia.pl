%seteaza baza de date
setez(X, 1) :- assertz(yes(X)), !.
setez(X, _) :- assertz(no(X)).
%sterge baza de date
sterge_db :- retractall(yes(_)), retractall(no(_)).
%verifica raspunsul utilizatorului
pozitiv(X) :- yes(X), ! ;no(X),  !, fail ;setezator(X), pozitiv(X).
negativ(X) :- no(X),  ! ;yes(X), !, fail ;setezator(X), negativ(X).
%seteaza baza de date cu raspunsul utilizatorului
setezator(X) :- intrebare(X, RET), setez(X, RET).
%formeaza intrebari spre utilizator si salveaza raspunsul
intrebare(X, RET) :- format("~nAlgoritmul de sortare are: ~w ?~n",[X]),introdu(RET).
introdu(RET) :- read(T), !, raspunsul(T, RET).
introdu(0) .
%modifica raspunsul utilizatorului formand din y -> 1
% si din alt caracter -> 0
raspunsul(y, 1) :- !.
raspunsul(_, 0) .
%punctul de start a sistemului expert
start :- sterge_db, algoritm_de_sortare(X),
	format("~nAlgoritmul potrivit este: ~w .",[X]).
%baza de cunostinte
algoritm_de_sortare('QuickSort') :-
	pozitiv("performanta de Q(nlogn)"),
	negativ("performanta de Q(n^2)"),
	pozitiv("memorie adaugatoare n"),
	negativ("memorie adaugatoare 1"),
	negativ("este stabil"),
	pozitiv("nu este stabil")
	,!.
algoritm_de_sortare('MergeSort') :-
	pozitiv("performanta de Q(nlogn)"),
	negativ("performanta de Q(n^2)"),
	pozitiv("memorie adaugatoare n"),
	negativ("memorie adaugatoare 1"),
	pozitiv("este stabil"),
	negativ("nu este stabil")
	,!.
algoritm_de_sortare('HeapSort') :-
	pozitiv("performanta de Q(nlogn)"),
	negativ("performanta de Q(n^2)"),
	negativ("memorie adaugatoare n"),
	pozitiv("memorie adaugatoare 1"),
	negativ("este stabil"),
	pozitiv("nu este stabil")
	,!.
algoritm_de_sortare('BubbleSort') :-
	negativ("performanta de Q(nlogn)"),
	pozitiv("performanta de Q(n^2)"),
	negativ("memorie adaugatoare n"),
	pozitiv("memorie adaugatoare 1"),
	pozitiv("este stabil"),
	negativ("nu este stabil")
	,!.
algoritm_de_sortare('BinaryTreeSort') :-
	pozitiv("performanta de Q(nlogn)"),
	negativ("performanta de Q(n^2)"),
	pozitiv("memorie adaugatoare n"),
	negativ("memorie adaugatoare 1"),
	pozitiv("este stabil"),
	negativ("nu este stabil")
	,!.
algoritm_de_sortare('CocktailSort') :-
	negativ("performanta de Q(nlogn)"),
	pozitiv("performanta de Q(n^2)"),
	negativ("memorie adaugatoare n"),
	pozitiv("memorie adaugatoare 1"),
	pozitiv("este stabil"),
	negativ("nu este stabil")
	,!.
algoritm_de_sortare('GnomeSort') :-
	negativ("performanta de Q(nlogn)"),
	pozitiv("performanta de Q(n^2)"),
	negativ("memorie adaugatoare n"),
	pozitiv("memorie adaugatoare 1"),
	pozitiv("este stabil"),
	negativ("nu este stabil")
	,!.
algoritm_de_sortare('Nu am gasit nici un algoritm potrivit pentru cazul tau. ').










