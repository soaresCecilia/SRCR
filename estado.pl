guardaAdjudicante(Stream) :- adjudicante(A,B,C,D),
write(Stream, 'adjudicante('), write(Stream, '\''), write(Stream, A), write(Stream, '\',\''),
write(Stream, B), write(Stream, '\',\''), write(Stream, C),
write(Stream, '\',\''), write(Stream, D), write(Stream, '\').\n'),
fail; true.


guardaAdjudicatario(Stream) :- adjudicatario(A,B,C,D),
write(Stream, 'adjudicatario('), write(Stream, '\''), write(Stream, A), write(Stream, '\',\''),
write(Stream, B), write(Stream, '\',\''), write(Stream, C),
write(Stream, '\',\''), write(Stream, D), write(Stream, '\').\n'),
fail; true.



guardaContrato(Stream):- contrato(A,B,C,D,E,F,G,H,I,J),
write(Stream, 'contrato('), write(Stream, A),
write(Stream, ',\''),write(Stream, B),
write(Stream, '\',\''), write(Stream, C),
write(Stream, '\',\''), write(Stream, D),
write(Stream, '\',\''), write(Stream, E),
write(Stream, '\',\''), write(Stream, F),
write(Stream, '\',\''), write(Stream, G),
write(Stream, '\','), write(Stream, H),
write(Stream, ',\''), write(Stream, I),
write(Stream, '\',\''), write(Stream, J),
write(Stream, '\').\n'),
fail; true.



guardaEstado :-
open('estado.pl', write, Stream),
write(Stream, '% adjudicante: #IdAd,Nome,Nif,Morada -> {V,F}\n'),
saveAdjudicante(Stream),
write(Stream, '\n% adjudicatario: #IdAda,Nome,Nif,Morada -> {V,F}\n'),
saveAdjudicatario(Stream),
write(Stream, '\n% contrato: #IdCont,#IdAd,#IdAda,TipoContrato,TipoProc,Descricao,Custo,Prazo,Local,Data -> {V,F}\n'),
saveContrato(Stream),
close(Stream).
