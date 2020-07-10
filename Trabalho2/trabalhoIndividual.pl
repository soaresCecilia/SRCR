%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica
% Projecto de Componente Individual

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Includes

:- include('baseConhecimento.pl').

:- include('funcoesAuxiliares.pl').


%                       RESOLUÇÃO ALÍNEAS

% a) Calcular um trajeto possível entre duas cidades;

% TODO: IMPRIMIR Caminho todo


%--------------- Pesquisa Depth First - Pesquisa em Profundidade
%Expandir sempre um dos nós mais profundos da árvore

depthFirst(Origem, Destino, Caminho):-
    depthFirst(Origem, Destino, [Origem], Caminho).

depthFirst(Destino, Destino, _ , []).
depthFirst(Origem, Destino, Visitados,
           [(Origem, ProxNodo, Distancia)|Caminho]) :-
    proximoNodo(Origem, ProxNodo, Distancia, Visitados),
    depthFirst(ProxNodo, Destino, [ProxNodo|Visitados], Caminho).



%----------Pesquisa em Profundidade limitada a 5 cidades

pesquisaEmProfundidade(Origem, Destino, Caminho):-
    pesquisaEmProfundidade2( Origem, Destino, [Origem], Caminho).

pesquisaEmProfundidade2(Destino, Destino, _, []).
pesquisaEmProfundidade2(Origem, Destino, Visitados, [(Origem, ProxNodo, Distancia)|Caminho]) :-
    tamanhoLista(Visitados, Tamanho),
        Tamanho < 2,
    proximoNodo(Origem, ProxNodo, Distancia, Visitados),
    pesquisaEmProfundidade2(ProxNodo, Destino, [ProxNodo|Visitados], Caminho),
        tamanhoLista(Caminho, Total),
        Total < 2.



%--------------- Pesquisa Breadth First - Pesqueisa em Largura
% Todos os nós de menor profundidade são expandidos primeiro
%ficha11.pl


breadthFirst(Origem, Destino, Caminho):-
    breadthFirst([(Origem, [])|Xs]-Xs, [], Destino, Caminho).

breadthFirst([(Estado, Vs)|_]-_, _, Destino, Rs):-
    Estado == Destino,!, inverso(Vs, Rs).

breadthFirst([(Estado, _)|Xs]-Ys, Historico, Destino, Caminho):-
    membro(Estado, Historico),!,
    breadthFirst(Xs-Ys, Historico, Destino, Caminho).

breadthFirst([(Estado, Vs)|Xs]-Ys, Historico, Destino, Caminho):-
    setof(((Estado, ProxNodo, Distancia), ProxNodo), adjacencia(Estado, ProxNodo, Distancia), Ls),
    atualizar(Ls, Vs, [Estado|Historico], Ys-Zs),
    breadthFirst(Xs-Zs, [Estado|Historico], Destino, Caminho).






% b) Selecionar apenas cidades, com uma determinada caraterística, para um determinado trajeto;


% c) Excluir uma ou mais caracteristicas de cidades para um percurso;

% d) Identificar num determinado percurso qual a cidade com o maior número de ligações;

% e) Escolher o menor percurso (usando o critério do menor número de cidades percorridas);

% f) Escolher o percurso mais rápido (usando o critério da distância);

% g) Escolher um percurso que passe apenas por cidades “minor”;

% h) Escolher uma ou mais cidades intermédias por onde o percurso deverá obrigatoriamente passar.
 
