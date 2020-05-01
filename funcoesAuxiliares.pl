%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares


% Inserção de conhecimento
insercao( Termo ) :- assert( Termo ).
insercao( Termo ) :- retract( Termo ),!,fail.

% Remoção de conhecimento
remocao( Termo ) :- retract( Termo ).
remocao( Termo ) :- assert( Termo ),!,fail.

% Testa se todos os predicados são verdadeiros
teste( [] ).
teste( [R|LR] ) :- R, teste( LR ).

% Insere novo conhecimento na base de conhecimento
evolucao( Termo ) :- solucoes( Invariante, +Termo::Invariante, Lista),
insercao( Termo ), teste( Lista ).

% Retira conhecimento da base de conhecimento
involucao( Termo ) :- solucoes( Invariante, -Termo::Invariante,Lista),
remocao( Termo ), teste( Lista ).

% Verifica se o elemento A pertence a uma lista
pertence( X,[X|L] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).


% Encontra todas as solucoes e coloca-as na lista L.
solucoes( X,Y,Z ) :- findall( X,Y,Z ).


% Verifica o comprimento do parametro S.
comprimento( S,N ) :- length( S,N ).

comprimentoAtom(S,N) :- atom_length(S,N).




% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :- Questao.
demo( Questao,falso ) :- -Questao.
demo( Questao,desconhecido ) :- nao( Questao ), nao( -Questao ).


% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( Questao ).


% Data válida

mes31Dias(D,M) :- D >=1, D=<31,(M==1;M=3;M==5;M==7;M==8;M==10;M==12).
mes30Dias(D,M) :- D >= 1, D=<30, (M==4;M=6;M==9;M==11).
mes29Dias(D,M) :- D >= 1, D=<29, M==2.

validaData(D,M,A) :- mes31Dias(D,M);mes30Dias(D,M);mes29Dias(D,M).



% Ganho ou custo válido (> 0) tem de ser maior do que zero.
custoValido(G) :- G > 0.


% Tipo de Atividade Economica

tipoAtividadeEconomica('Construcao').
tipoAtividadeEconomica('Comercio').
tipoAtividadeEconomica('Transporte').
tipoAtividadeEconomica('Alojamento').
tipoAtividadeEconomica('Consultoria').

% Valida atividade economica de um determinado adjudicatario

validaAE(IdAda,AE) :- adjudicatario(IdAda,AE,_,_,_).


% Tipo de Procedimento ou é Ajuste Direto, Consulta Prévia ou Concurso Público.
tipoProcedimentoValido('Ajuste Direto').
tipoProcedimentoValido('Consulta Previa').
tipoProcedimentoValido('Concurso Publico').


% Contrato por ajuste direto tem apenas três finalidade: aquisição ou locação de bens móveis ou aquisição de serviços.

tipoAjusteD('Aquisicao de bens moveis').
tipoAjusteD('Locacao de bens moveis').
tipoAjusteD('Aquisicao de servicos').


% Contrato por ajuste direto tem um prazo até 365 dias.

prazoAjusteD(Prazo) :- Prazo =< 365.



% Contrato por ajuste direto tem de ter valor igual ou inferior a 5000 euros, tem de ter prazo até 365 dias e tem de ter uma finalidade específica.

ajusteDiretoValido(TC, Custo, Prazo) :- tipoAjusteD(TC),
                                           Custo =< 5000, prazoAjusteD(Prazo).


%---------------------------------------------------------------------------------
% Contrato entre o mesmo Adjudicante e Adjudicatario, com o mesmo tipo de Contrato, e valor de contratos nos 3 anos economicos (incluindo o atual) anteriores, não pode ultrapasaar os 75000 euros
	

%ex: encontraContratosA2('700500601','100100103','Construcao','Aquisicao de servicos',data(_,_,2021),CS).
encontraContratosA0(IdAd,IdAda,AE,TC,data(D,M,A), CS) :- solucoes(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A)),(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A))),CS).
encontraContratosA1(IdAd,IdAda,AE,TC,data(D,M,A), CS) :- A2 is A-1, solucoes(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A2)),(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A2))),CS).
encontraContratosA2(IdAd,IdAda,AE,TC,data(D,M,A), CS) :- A3 is A-2, solucoes(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A3)),(contrato(_,IdAd,IdAda,AE,TC,_,_,Valor,_,_,data(D,M,A3))),CS).

% Concatenar 2 listas ex: [1,2],[3,4],L ======= [1,2,3,4]
concat([], R, R).
concat([X|XS1], R, [X|XS2]) :- concat(XS1, R, XS2).

% ex: encontrarTudo('700500601','100100103','Construcao','Aquisicao de servicos',data(_,_,2021),CS).
encontrarTudo(IdAd,IdAda,AE,TC,Data, CS) :- encontraContratosA0(IdAd,IdAda,AE,TC,Data, CS0), encontraContratosA1(IdAd,IdAda,AE,TC,Data, CS1), concat(CS0,CS1,CSR),encontraContratosA2(IdAd,IdAda,AE,TC,Data, CS2), concat(CSR,CS2,CS).

% somatorio dos elementos da lista ex: [1,2,3,4],S ======= 10
soma([],0).
soma([contrato(_,_,_,_,_,_,_,Valor,_,_,_)|XS],Total) :- soma(XS, Acumulado), Total is Valor + Acumulado.

%calcula valor total dos contratos
calculaValorTotal(CS, VT) :- soma(CS,VT).

%Confirma se valor total encontrado mais o que queremos inserir é válido
confirmaValor(Valor) :- Valor =<75000.

 
%regraTresAnos('700500601','100100103','Construcao','Aquisicao de servicos',5000,data(_,_,2021)). resultado esperado yes
%regraTresAnos('700500601','100100103','Construcao','Aquisicao de servicos',5000000,data(_,_,2021)). resultado esperado No

regraTresAnos(IdAd, IdAda, AEco, TC, Custo, Data) :- encontrarTudo(IdAd, IdAda, AEco, TC, Data, CS), calculaValorTotal(CS, VT), confirmaValor(VT+Custo).

%---------------------------------------------------------------------------------
% Obter os n primeiros elementos de uma lista

take(Lista,0,[]).
take([X|XS], N1, [X|I]) :- N0 is N1-1, take(XS,N0,I).

%---------------------------------------------------------------------------------
% Ordenar uma lista através de merge sort

merge_sort([],[]).     % empty list is already sorted
merge_sort([X],[X]).   % single element list is already sorted
merge_sort(List,Sorted):-
    List=[_,_|_],divide(List,L1,L2),     % list with at least two elements is divided into two parts
	merge_sort(L1,Sorted1),merge_sort(L2,Sorted2),  % then each part is sorted
	merge(Sorted1,Sorted2,Sorted).                  % and sorted parts are merged

merge(A, [], A).
merge([], B, B).
merge([(X0,X1)|Ta], [(Y0,Y1)|Tb], R) :- X1 > Y1, merge(Ta, [(Y0,Y1)|Tb], M), R = [(X0,X1)|M].
merge([(X0,X1)|Ta], [(Y0,Y1)|Tb], R) :- X1 =< Y1, merge(Tb, [(X0,X1)|Ta], M), R = [(Y0,Y1)|M].

halve(L,A,B):-hv(L,[],A,B).
   
hv(L,L,[],L).      % for lists of even length
hv(L,[_|L],[],L).  % for lists of odd length
hv([H|T],Acc,[H|L],B):-hv(T,[_|Acc],L,B).
