%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Auxiliares

% Calcula o número de elementos de uma lista.
tamanhoLista([], 0).
tamanhoLista([Cabeca|Cauda], TotalElementos) :- tamanhoLista(Cauda, Total), TotalElementos is Total+1.


% Calcula próximo nodo na pesquisa em profundidade
proximoNodo(Actual, Proximo, Distancia, Caminho) :-
    adjacencia(Actual, Proximo, Distancia),
    naopertence(Proximo, Caminho).


% Verifica se um elemento não faz parte de uma lista
naopertence(Elem, []) :- !.
naopertence(Elem, [Cabeca|Cauda]) :-
     Elem \= Cabeca,
    naopertence(Elem, Cauda).


%Actualiza o estado de uma lista
atualizar([],_,_,X-X).
atualizar([(_,Estado)|Ls], Vs, Historico, Xs-Ys):-
    membro(Estado, Historico), !,
    atualizar(Ls, Vs, Historico, Xs-Ys).


atualizar([(Move, Estado)|Ls], Vs, Historico, [(Estado, [Move|Vs])|Xs]-Ys) :- atualizar(Ls,Vs, Historico, Xs-Ys).



%verifica se elemento estºa contido numa lista
membro(X, [X|_]).
membro(X, [_|Xs]) :- membro(X,Xs).

membros([],_).
membros([X|Xs], Members):- membro(X,Members), membro(Xs,Members).

%Inverte uma lista
inverso(Xs, Ys):- inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs], Ys, Zs):- inverso(Xs, [X|Ys], Zs).













