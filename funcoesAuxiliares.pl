%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares


% Inserção de conhecimento
insercao( Termo ) :-
assert( Termo ).
insercao( Termo ) :-
retract( Termo ),!,fail.

% Remoção de conhecimento
remocao( Termo ) :-
retract( Termo ).
remocao( Termo ) :-
assert( Termo ),!,fail.

% Testa se todos os predicados são verdadeiros
teste( [] ).
teste( [R|LR] ) :-
R,
teste( LR ).

% Insere novo conhecimento na base de conhecimento
evolucao( Termo ) :-
solucoes( Invariante,+Termo::Invariante,Lista ),
insercao( Termo ),
teste( Lista ).

% Retira conhecimento da base de conhecimento
involucao( Termo ) :-
solucoes( Invariante,-Termo::Invariante,Lista ),
remocao( Termo ),
teste( Lista ).

% Verifica se o elemento A pertence a uma lista
pertence( X,[X|L] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).


% Encontra todas as solucoes e coloca-as na lista L.
solucoes( X,Y,Z ) :- findall( X,Y,Z ).


% Verifica o comprimento de uma lista
comprimento( S,N ) :- length( S,N ).


% Verifica o comprimento de uma String
comprimentoString( S,N ) :- atom_length( S,N ).


% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
Questao.
demo( Questao,falso ) :-
-Questao.
demo( Questao,desconhecido ) :-
nao( Questao ),
nao( -Questao ).


% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
Questao, !, fail.
nao( Questao ).


% Nif válido (com 9 digitos) ex: '123456789'
nifValido(Nif) :- comprimentoString(Nif, R), R == 9.

% Ganho ou custo válido (>= 0)
custoValido(G) :- G >= 0.

% Tipo de Procedimento ou é Ajuste Direto, Consulta Prévia ou Concurso Público.
tipoProcedimentoValido('Ajuste Direto').
tipoProcedimentoValido('Consulta Prévia').
tipoProcedimentoValido('Concurso Público').
