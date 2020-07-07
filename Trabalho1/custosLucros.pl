%--------------------------------- - - - - - - - - - -  -  -  -  -   -


 % Calculo de custo total de um adjudicante
adjudicanteCustoTotal(Id, Total) :-
   	contratoIDAd(Id, L),
    soma(L, Total).


% Calculo do lucro total de um adjudicatário
adjudicatarioLucroTotal(Id, Total) :-
    contratoIDAda(Id, L),
    soma(L, Total).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calculo de valores totais por atividade economica, por tipo de contrato, 
% por tipo de procedimento, por prazo, por local e por data 


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


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calculo de valores totais por atividade economica, por tipo de contrato, 
% por tipo de procedimento, por prazo, por local e por data de um determinado adjudicante

totalAdjudicanteAE(IDAD, AE, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).

totalAdjudicanteTipoContrato(IDAD, TC, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TC,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TC,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicanteTipoProcedimento(IDAD, TipoProced, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicantePrazo(IDAD, P, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicanteLocal(IDAD, Local, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicanteData(IDAD, Data, Total) :-
    solucoes(contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).   

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Calculo de valores totais por atividade economica, por tipo de contrato, 
% por tipo de procedimento, por prazo, por local e por data de um determinado adjudicatário

totalAdjudicatarioAE(IDADA, AE, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).

totalAdjudicatarioTipoContrato(IDADA, TC, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TC,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TC,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicatarioTipoProcedimento(IDADA, TipoProced, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicatarioPrazo(IDADA, P, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicatarioLocal(IDADA, Local, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).


totalAdjudicatarioData(IDADA, Data, Total) :-
    solucoes(contrato(IdC,IDAD,IDADA,AE,TipoContrato,TipoProced,Des,C,P,Local,Data),
    contrato(IdC,IDAD,IdAda,AE,TipoContrato,TipoProced,Des,C,P,Local,Data), L),
    soma(L, Total).   

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


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


adjudicatariosComMaioresLucros(Tamanho, Resultado) :-
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
