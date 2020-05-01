%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calculo de custo total de um adjudicante e lucro total de um adjudicatario
% Calculo de valores totais por atividade economica, por tipo de contrato, por tipo de procedimento, por prazo, por local e por data 

adjudicanteCustoTotal(Id, Total) :-
   	contratoIDAd(Id, L),
    soma(L, Total).

adjudicatarioLucroTotal(Id, Total) :-
    contratoIDAda(Id, L),
    soma(L, Total).

totalAtividadeEconomica(AE, Total) :-
	contratoAE(AE, L),
    soma(L, Total).

totalTipoContrato(TC, Total) :-
	contratoTC(TC, L),
    soma(L, Total).

totalTipoProcedimento(TP, Total) :-
	contratoTP(TP, L),
    soma(L, Total).

totalPrazo(Prazo, Total) :-
	contratoPrazo(Prazo, L),
    soma(L, Total).

totalLocal(Local, Total) :-
	contratoLocal(Local, L),
    soma(L, Total).

totalData(Data, Total) :-
	contratoData(Data, L),
    soma(L, Total).
    
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Ordenar por Custos dos Adjudicantes

adjudicantesComMaioresCustos(Tamanho, Resultado) :-
    solucoes(Id, adjudicante(Id,Nome,Nif,Morada), I1),
    adjudicanteParCustoTotal(I1, I2),
    merge_sort(I2,I3),
    take(I3,Tamanho,I4),
    idAdjudicanteParaAdjudicante(I4,Resultado).

adjudicanteParCustoTotal([],[]).
adjudicanteParCustoTotal([X|XS], [(X,U)|I]) :-
    adjudicanteParCustoTotal(XS,I),
    adjudicanteCustoTotal(X, U).

idAdjudicanteParaAdjudicante([],[]).
idAdjudicanteParaAdjudicante([(Y0,Y1)|XS], [(U,Y1)|I]) :- idAdjudicanteParaAdjudicante(XS, I), adjudicanteID(Y0,[U]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Ordenar por Lucros dos Adjudicatarios

adjudicatariosComMaioresCustos(Tamanho, Resultado) :-
    solucoes(Id, adjudicatario(Id,AE,Nome,Nif,Morada), I1),
    adjudicatariosParLucroTotal(I1, I2),
    merge_sort(I2,I3),
    take(I3,Tamanho,I4),
    idAdjudicatarioParaAdjudicatario(I4,Resultado).

adjudicatariosParLucroTotal([],[]).
adjudicatariosParLucroTotal([X|XS], [(X,U)|I]) :-
    adjudicatariosParLucroTotal(XS,I),
    adjudicatarioLucroTotal(X, U).

idAdjudicatarioParaAdjudicatario([],[]).
idAdjudicatarioParaAdjudicatario([(Y0,Y1)|XS], [(U,Y1)|I]) :- idAdjudicatarioParaAdjudicatario(XS, I), adjudicatarioID(Y0,[U]).
