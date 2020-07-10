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
        Tamanho < 5,
    proximoNodo(Origem, ProxNodo, Distancia, Visitados),
    pesquisaEmProfundidade2(ProxNodo, Destino, [ProxNodo|Visitados], Caminho),
        tamanhoLista(Caminho, Total),
        Total < 5.



%---- Pesquisa Breadth First - Pesqueisa em Largura
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





%--------------------------------------------------------
% b) Selecionar apenas cidades, com uma determinada caraterística, para um determinado trajeto;



%--------------------------------------------------------
% c) Excluir uma ou mais caracteristicas de cidades para um percurso;

%--------------------------------------------------------
% d) Identificar num determinado percurso qual a cidade com o maior número de ligações;







%--------------------------------------------------------
% e) Escolher o menor percurso (usando o critério do menor número de cidades percorridas);


%--Pesquisa em Profundidade Limitada

menorPercursoCidades(Origem, Destino, Caminho):-
    findall(Caminho, pesquisaEmProfundidade(Origem, Destino, Caminho), Lista),
    menorLista(Lista, Caminho).



%--Pesquisa em Largura

menorPercursoCidadesBF(Origem, Destino, Caminho):-
findall(Caminho, breadthFirst(Origem, Destino, Caminho), Lista),
menorLista(Lista, Caminho).




%--------------------------------------------------------
% f) Escolher o percurso mais rápido (usando o critério da distância);


%----Pesquisa em Profundidade Limitada

depthFirstMenorDistancia(Origem, Destino, Caminho, Custo):-
    depthFirstMenorDistancia( Origem, Destino, [Origem], Caminho, Custo).

depthFirstMenorDistancia(Destino, Destino, _, [],0).
depthFirstMenorDistancia(Origem, Destino, Visitados, [(Origem, ProxNodo, Distancia)|Caminho], Custo) :-
    tamanhoLista(Visitados, Total),
        Total < 200,
    proximoNodo(Origem, ProxNodo, Distancia, Visitados),
    depthFirstMenorDistancia(ProxNodo, Destino, [ProxNodo|Visitados], Caminho, CustoVisitados),
        tamanhoLista(Caminho, TotalV),
        TotalV < 200,
        Custo is Distancia + CustoVisitados.


%Procura o caminho mais rápido com o template de retorno (Trajceto, Distancia), coloca o resultado em L e depois verifica qual o menor trajecto que está em L e coloca-o em (Caminho, Distancia).

maisRapido(Origem, Destino, Caminho, Distancia):- findall((Trajecto, DistanciaTotal),
    depthFirstMenorDistancia(Origem, Destino, Trajecto, DistanciaTotal),
    L),
    minimo(L, (Caminho,Distancia)).








%--------------------------------------------------------
% g) Escolher um percurso que passe apenas por cidades “minor”;


%--------------- Pesquisa em Profundidade



apenasCidadesMinor(Origem, Destino, Caminho):-
    cidadeMinor(Origem),
    apenasCidadesMinor( Origem, Destino, [Origem], Caminho).

apenasCidadesMinor(Destino, Destino, _, []).

apenasCidadesMinor(Origem, Destino, Visitados, [(Origem, ProxNodo, Distancia)|Caminho]) :-
    tamanhoLista(Visitados, Tamanho),
        Tamanho < 115,
    proximoNodo(Origem, ProxNodo, Distancia, Visitados),
    cidadeMinor(ProxNodo),
    apenasCidadesMinor(ProxNodo, Destino, [ProxNodo|Visitados], Caminho),
        tamanhoLista(Caminho, Total),
        Total < 115.




%--------------------------------------------------------
% h) Escolher uma ou mais cidades intermédias por onde o percurso deverá obrigatoriamente passar.
 
