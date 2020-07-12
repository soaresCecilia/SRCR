%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

% Calcula o número de elementos de uma lista.
tamanhoLista([], 0).
tamanhoLista([Cabeca|Cauda], TotalElementos) :- tamanhoLista(Cauda, Total), TotalElementos is Total+1.


% Verifica se o nodo Próximo já foi visitado.
proximoNodo(Actual, Proximo, Distancia, Caminho) :-
    adjacencia(Actual, Proximo, Distancia),
    naopertence(Proximo, Caminho).

% Verifica se o nodo Próximo já foi visitado.
proximoNodo(Actual, ProxNodo,Distancia,Caracteristica,Visitados) :-
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


%verifica se elemento está contido numa lista
membro(X, [X|_]).
membro(X, [_|Xs]) :- membro(X,Xs).

membros([],_).
membros([X|Xs], Members):- membro(X,Members), membro(Xs,Members).

%Inverte uma lista
inverso(Xs, Ys):- inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs], Ys, Zs):- inverso(Xs, [X|Ys], Zs).



%Encontra a lista com menor comprimento num conjunto de listas.
menorLista([L], L).
menorLista([ListaX,ListaY|CaudaDeListas], Menor) :-
    length(ListaX, TamX),
    length(ListaY, TamY),
    TamX =< TamY, !, menorLista([ListaX|CaudaDeListas], Menor).

menorLista([ListaX,ListaY|CaudaDeListas], Menor):- menorLista([ListaY|CaudaDeListas], Menor).



% Calcula o maximo de uma lista de pares
maximo([(P,X)], (P,X)).
maximo([(Px,X)|L], (Py, Y)) :- maximo(L, (Py,Y)), X =< Y.
maximo([(Px,X)|L], (Px, X)) :- maximo(L, (Py,Y)), X > Y.



listIDTamFinal(Caminho, L) :-
    listaIDTam(Caminho, A, L).

listaIDTam([], A, A).
listaIDTam([(Origem, Destino,_)| Cauda], A, L) :-
    cidadeID(Origem, TamOrigem),
    cidadeID(Destino, TamDestino),
    TamOrigem =< TamDestino, !,
    listaIDTam(Cauda, [(Destino, TamDestino) | A], L).
listaIDTam([(Origem, Destino,_)| Cauda], A, L) :-
    cidadeID(Origem, TamOrigem),
    listaIDTam(Cauda, [(Origem, TamOrigem) | A], L).


%Identifica cidade pelo id e devolve tamanho das adjacencias
cidadeID(ID, Tam):- cidade(ID,_,_,_,_,_,Adjacencia,_,_,_),
        length(Adjacencia,Tam).

%Identifica cidade pelo id e devolve nome.
cidadeNome(ID, Nome):- cidade(ID,_,_,Nome,_,_,_,_,_,_).





% Verifica se uma cidade tem poderes administrativos minor
cidadeMinor(IDCidade) :- cidade(IDCidade, _, _, _, _, PoderesAdminist, _, _, _, _), PoderesAdminist == 'minor'.

% Verifica se uma cidade é património mundial
semPatrimonio(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, 0, _, _).


% Verifica se uma cidade tem castelo
cidadeComCastelo(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, _, 1, _).

% Verifica se uma cidade é patrimonio mundial
cidadePatrimonioMundial(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, 1, _, _).

%Verifica se uma cidade tem mais de cem mil habitantes
cidadePopulosa(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, _, _, 1).


% Escreve uma lista com \n entre os elementos
escrever([]).
escrever([X|L]):- write(X), nl, escrever(L).
