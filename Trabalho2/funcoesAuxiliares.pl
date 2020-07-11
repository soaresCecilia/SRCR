%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Funções Auxiliares

% Calcula o número de elementos de uma lista.
tamanhoLista([], 0).
tamanhoLista([Cabeca|Cauda], TotalElementos) :- tamanhoLista(Cauda, Total), TotalElementos is Total+1.


% Verifica se o nodo Próximo já foi visitado.
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

%Encontra a lista com maior comprimento num conjunto de listas.
maiorLista([L], L).
maiorLista([(Origem,_,_),(Destino, _,_)|CaudaDeListas], Maior) :-
    (cidadeID(Origem, Tam1), cidadeID(Destino, Tam2)),
    Tam1 =< Tam2, !,
    maiorLista([(Destino, _,_)|CaudaDeListas], Maior).

maiorLista([(Origem,_,_),(Destino, _,_)|CaudaDeListas], Maior):- maiorLista([(Origem, _,_)|CaudaDeListas], Maior).
           


%Identifica cidade pelo id e devolve tamanho das adjacencias
cidadeID(ID, L):- cidade(ID,_,_,_,_,_,Adjacencia,_,_,_),
        length(Adjacencia,L).

%Identifica cidade pelo id e devolve nome.
cidadeNome((ID,_,_), Nome):- cidade(ID,_,_,Nome,_,_,_,_,_,_).













% Verifica se uma cidade tem poderes administrativos minor
cidadeMinor(IDCidade) :- cidade(IDCidade, _, _, _, _, PoderesAdminist, _, _, _, _), PoderesAdminist == 'minor'.


% Verifica se uma cidade tem castelo
cidadeComCastelo(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, _, Castelo, _), Castelo == 1.

% Verifica se uma cidade é patrimonio mundial
cidadePatrimonioMundial(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, PatrimonioMundial, _, _), PatrimonioMundial == 1.

%Verifica se uma cidade tem mais de cem mil habitantes
cidadePopulosa(IDCidade) :- cidade(IDCidade, _, _, _, _, _, _, _, _, Habitantes), Habitantes == 1.


%Exclui cidades com Castelos ou se o seu responsável administrativos for Viseu
excluiCidade(IDCidade) :- cidade(IDCidade, _, _, _, responsavelAdmin, _, _, _, Castelo, _), Castelo == 0, responsavelAdmin \= 'Viseu'.
