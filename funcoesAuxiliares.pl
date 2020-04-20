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



