guardaAdjudicante(Stream) :- adjudicante(A,B,C,D),
write(Stream, 'adjudicante('), write(Stream, '\''), write(Stream, A),
write(Stream, '\',\''), write(Stream, B), write(Stream, '\',\''),
write(Stream, C), write(Stream, '\',\''), write(Stream, D),
write(Stream, '\').\n\n'), fail; true.


guardaAdjudicatario(Stream) :- adjudicatario(A,B,C,D,E),
write(Stream, 'adjudicatario('), write(Stream, '\''), write(Stream, A),
write(Stream, '\','), write(Stream, '['), write_list(B, Stream), write(Stream, '],'), write(Stream, '\''),
write(Stream, C), write(Stream, '\',\''), write(Stream, D),
write(Stream, '\',\''), write(Stream, E), write(Stream, '\').\n\n'),
fail; true.

write_list([], Stream).
write_list([H|[]], Stream):- 
	write(Stream, '\''),
	write(Stream, H),
	write(Stream, '\'').
write_list([H|T], Stream):-
    write(Stream, '\''),
    write(Stream, H),
    write(Stream, '\','),
    write_list(T, Stream).


guardaContrato(Stream):- contrato(A,B,C,D,E,F,G,H,I,J,K),
write(Stream, 'contrato('), write(Stream, A),
write(Stream, ',\''),write(Stream, B),
write(Stream, '\',\''), write(Stream, C),
write(Stream, '\',\''), write(Stream, D),
write(Stream, '\',\''), write(Stream, E),
write(Stream, '\',\''), write(Stream, F),
write(Stream, '\',\''), write(Stream, G),
write(Stream, '\','), write(Stream, H),
write(Stream, ','), write(Stream, I),
write(Stream, ',\''), write(Stream, J),
write(Stream, '\','), write(Stream, K),
write(Stream, ').\n\n'),
fail; true.



guardaEstado :-
open('baseConhecimento.pl', write, Stream),
write(Stream, '%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n'),
write(Stream, '%       BASE CONHECIMENTO\n'),
write(Stream, '%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n\n'),
write(Stream, '\n%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F}\n\n'),
guardaAdjudicante(Stream),
write(Stream, '\n%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F}\n\n'),
guardaAdjudicatario(Stream),
write(Stream, '\n%-----Contratos: #IdCont,IdAd,IdAda,ActividadeEconomica,TipoContrato,TipoProc,Descricao,#Custo,#Prazo,Local,#Data -> {V,F}\n\n'),
guardaContrato(Stream),
close(Stream).
