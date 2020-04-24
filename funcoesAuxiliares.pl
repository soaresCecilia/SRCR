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




% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :- Questao.
demo( Questao,falso ) :- -Questao.
demo( Questao,desconhecido ) :- nao( Questao ), nao( -Questao ).


% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( Questao ).



% Nif válido (com 9 digitos) ex: "123456789"
nifValido(Nif) :- comprimento(Nif, R), R == 9.


% Ganho ou custo válido (> 0) tem de ser maior do que zero.
custoValido(G) :- G > 0.

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

ajusteDiretoValido(TC, TP, Custo, Prazo) :- TP == 'Ajuste Direto', tipoAjusteD(TC),
                                           Custo =< 5000, prazoAjusteD(Prazo).


% Contrato entre o mesmo Adjudicante e Adjudicatario, com o mesmo tipo de Contrato, e valor de contratos nos 3 anos economicos (incluindo o atual) anteriores, não pode ultrapasaar os 75000 euros
	


%ex: encontraContratosA2('700500601','100100103','Aquisicao de servicos',_-_-2021,CS).
% FUNCIONAM
encontraContratosA0(IdAd,IdAda,TC,D-M-A, CS) :- solucoes(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A),(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A)),CS).
encontraContratosA1(IdAd,IdAda,TC,D-M-A, CS) :- A3 is A-1, solucoes(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A3),(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A3)),CS).
encontraContratosA2(IdAd,IdAda,TC,D-M-A, CS) :- A3 is A-2, solucoes(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A3),(contrato(_,IdAd,IdAda,TC,_,_,Valor,_,_,D-M-A3)),CS).


% Concatenar 2 listas ex: [1,2],[3,4],L ======= [1,2,3,4]
concat([], R, R).
concat([X|XS1], R, [X|XS2]) :- concat(XS1, R, XS2).


% ex: encontrarTudo('700500601','100100103','Aquisicao de servicos',_-_-2021,CS).
%VERSAO QUE já FUNCIONA


encontrarTudo(IdAd,IdAda,TC,D-M-A, CS) :- encontraContratosA0(IdAd,IdAda,TC,D-M-A, CS0), encontraContratosA1(IdAd,IdAda,TC,D-M-A, CS1), concat(CS0,CS1,CSR),encontraContratosA2(IdAd,IdAda,TC,D-M-A, CS2), concat(CSR,CS2,CS).


% somatorio dos elementos da lista ex: [1,2,3,4],S ======= 10
soma([],0).
soma([contrato(_,_,_,_,_,_,Valor,_,_,_)|XS],Total) :- soma(XS, Acumulado), Total is Valor + Acumulado.


%FUNCIONA
%calcula valor total dos contratos
calculaValorTotal(CS, VT) :- soma(CS,VT).


%Confirma se valor total encontrado mais o que queremos inserir é válido
confirmaValor(Valor) :- Valor =<75000.


%regraTresAnos('700500601','100100103','Aquisicao de servicos',5000,_-_-2021).
%encontrarTudo('700500601','100100103','Aquisicao de servicos',_-_-2021,CS),calculaValorTotal(CS, VT), confirmaValor(VT+100000). dá bem.
%encontrarTudo('700500601','100100103','Aquisicao de servicos',_-_-2021,CS),calculaValorTotal(CS, VT), confirmaValor(VT+1000). dá mal.
%regraTresAnos('700500601','100100103','Aquisicao de servicos',5000,_-_-2021). resultado esperado yes
%regraTresAnos('700500601','100100103','Aquisicao de servicos',5000000,_-_-2021). resultado esperado No


regraTresAnos(IdAd, IdAda, TC, Custo, Data) :- encontrarTudo(IdAd, IdAda, TC, Data, CS), calculaValorTotal(CS, VT), confirmaValor(VT+Custo).

