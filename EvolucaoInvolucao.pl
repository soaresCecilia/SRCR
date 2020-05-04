%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução/Involução de conhecimento

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento perfeito (positivo e negativo)

% Insere novo conhecimento na base de conhecimento
evolucao(T) :-
    solucoes(I, +T::I, Linv),
    insercao(T),
    teste(Linv).

% Insere conhecimento perfeito positivo na base de conhecimento
evolucao(T, positivo) :-
    solucoes(I, +T::I, Linv),
    insercao(T),
    teste(Linv).

% Insere conhecimento perfeito negativo na base de conhecimento
evolucao(T, negativo) :-
    solucoes(I, +(-T)::I, Linv),
    insercao(-T),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito incerto

%--- Adjudicatario

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicatario com nome desconhecido
evolucao(adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada), adjudicatario, incerto, nome) :-
    evolucao(adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada), positivo),
    insercao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                    adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicatario com morada desconhecida
evolucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida), adjudicatario, incerto, morada) :-
    evolucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida), positivo),
    insercao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                    adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida))).


%--- Adjudicante

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com nome desconhecido
evolucao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada), adjudicante, incerto, nome) :-
    evolucao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada), positivo),
    insercao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                    adjudicante(IdAd, Nome_desconhecido, Nif, Morada))).

% Insere conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com morada desconhecida
evolucao(adjudicante(IdAd, Nome, Nif, Morada_desconhecida), adjudicante, incerto, morada) :-
    evolucao(adjudicante(IdAd, Nome, Nif, Morada_desconhecida), positivo),
    insercao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                    adjudicante(IdAd, Nome, Nif, Morada_desconhecida))).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% Insere conhecimento imperfeito impreciso na base de conhecimento
% seja de um adjudicante ou adjudicatário
evolucao(T, impreciso) :-
    solucoes(I, +(excecao(T))::I, LString),
    insercao(excecao(T)),
    teste(LString).

%--- Adjudicatario

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicatario com nome dentro de um conjunto de valores
evolucao(adjudicatario(IdAda, AE, Nome_impreciso, Nif, Morada), adjudicatario, impreciso, nome, ListaNomes) :-
    insercao((excecao(adjudicatario(IdAda, AE, Nome_impreciso, Nif, Morada)) :-
                    pertence( Nome_impreciso, ListaNomes ))).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicatario com morada contida dentro de um conjunto de valores
evolucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_imprecisa), adjudicatario, impreciso, morada, ListaMoradas) :-
    insercao((excecao(adjudicatario(IdAda, AE, Morada_imprecisa, Nif, Morada)) :-
                    pertence( Morada_imprecisa, ListaMoradas ))).

%--- Adjudicante 

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicante com nome dentro de um conjunto de valores
evolucao(adjudicante(IdAd, Nome_impreciso, Nif, Morada), adjudicante, impreciso, nome, ListaNomes) :-
    insercao((excecao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada)) :-
                    pertence( Nome_impreciso, ListaNomes ))).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicante com morada contida dentro de um conjunto de valores
evolucao(adjudicante(IdAd, Nome, Nif, Morada_imprecisa), adjudicante, impreciso, morada, ListaMoradas) :-
    insercao((excecao(adjudicante(IdAd, Nome, Nif, Morada_imprecisa)) :-
                    pertence( Morada_imprecisa, ListaMoradas ))).     

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito

%--- Adjudicatario

% Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com nome interdito
 evolucao(adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada), adjudicatario, interdito, nome) :-
    evolucao(adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada), positivo),
    insercao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada))),
    insercao((nulointerdito(Nome_impossivel))).

% Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com morada interdita
 evolucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel), adjudicatario, interdito, morada) :-
    evolucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel), positivo),
    insercao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel))),
    insercao((nulointerdito(Morada_impossivel))).    

%--- Adjudicante

% Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com nome interdito
 evolucao(adjudicante(IdAd, Nome_impossivel, Nif, Morada), adjudicante, interdito, nome) :-
    evolucao(adjudicante(IdAd, Nome_impossivel, Nif, Morada), positivo),
    insercao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                adjudicante(IdAd, Nome_impossivel, Nif, Morada))),
    insercao((nulointerdito(Nome_impossivel))).

% Insere conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicante com morada interdita
 evolucao(adjudicante(IdAd, Nome, Nif, Morada_impossivel), adjudicante, interdito, morada) :-
    evolucao(adjudicante(IdAd, Nome, Nif, Morada_impossivel), positivo),
    insercao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                adjudicante(IdAd, Nome, Nif, Morada_impossivel))),
    insercao((nulointerdito(Morada_impossivel))).    

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento perfeito (positivo e negativo)

% Retira conhecimento da base de conhecimento
involucao(T) :-
    solucoes(I, -T::I, Linv),
    remocao(T),
    teste(Linv).

% Retira conhecimento perfeito positivo na base de conhecimento
involucao(T, positivo) :-
    solucoes(I, -T::I, Linv),
    remocao(T),
    teste(Linv).

% Retira conhecimento perfeito negativo na base de conhecimento
involucao(T, negativo) :-
    solucoes(I, -(-T)::I, Linv),
    remocao(-T),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito incerto

%--- Adjudicatario

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicatario com nome desconhecido
involucao(adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada), adjudicatario, incerto, nome) :-
    involucao(adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada), positivo),
    remocao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                    adjudicatario(IdAda, AE, Nome_desconhecido, Nif, Morada))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicatario com morada desconhecida
involucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida), adjudicatario, incerto, morada) :-
    involucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida), positivo),
    remocao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                    adjudicatario(IdAda, AE, Nome, Nif, Morada_desconhecida))).

%--- Adjudicante

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com nome desconhecido
involucao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada), adjudicante, incerto, nome) :-
    involucao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada), positivo),
    remocao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                    adjudicante(IdAd, Nome_desconhecido, Nif, Morada))).

% Retira conhecimento imperfeito incerto na base de conhecimento
% no caso do adjudicante com morada desconhecida
involucao(adjudicante(IdAd, Nome, Nif, Morada_desconhecida), adjudicante, incerto, morada) :-
    involucao(adjudicante(IdAd, Nome, Nif, Morada_desconhecida), positivo),
    remocao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                    adjudicante(IdAd, Nome, Nif, Morada_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito impreciso

% Retira conhecimento imperfeito impreciso na base de conhecimento
% seja de adjudicante ou adjudicatário
involucao(T, impreciso) :-
    solucoes(I, -(excecao(T))::I, LString),
    remocao(excecao(T)),
    teste(LString).

%--- Adjudicatario

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicatario com nome dentro de um conjunto de valores
involucao(adjudicatario(IdAda, AE, Nome_impreciso, Nif, Morada), adjudicatario, impreciso, nome, ListaNomes) :-
    remocao((excecao(adjudicatario(IdAda, AE, Nome_impreciso, Nif, Morada)) :-
                    pertence( Nome_impreciso, ListaNomes ))).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicatario com morada contida dentro de um conjunto de valores
involucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_imprecisa), adjudicatario, impreciso, morada, ListaMoradas) :-
    remocao((excecao(adjudicatario(IdAda, AE, Morada_imprecisa, Nif, Morada)) :-
                    pertence( Morada_imprecisa, ListaMoradas ))).

%--- Adjudicante 

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicante com nome dentro de um conjunto de valores
involucao(adjudicante(IdAd, Nome_impreciso, Nif, Morada), adjudicante, impreciso, nome, ListaNomes) :-
    remocao((excecao(adjudicante(IdAd, Nome_desconhecido, Nif, Morada)) :-
                    pertence( Nome_impreciso, ListaNomes ))).

% Retira conhecimento imperfeito impreciso na base de conhecimento
% no caso de um adjudicante com morada contida dentro de um conjunto de valores
involucao(adjudicante(IdAd, Nome, Nif, Morada_imprecisa), adjudicante, impreciso, morada, ListaMoradas) :-
    remocao((excecao(adjudicante(IdAd, Nome, Nif, Morada_imprecisa)) :-
                    pertence( Morada_imprecisa, ListaMoradas ))).               

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito interdito

%--- Adjudicatario

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com nome interdito
 involucao(adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada), adjudicatario, interdito, nome) :-
    involucao(adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada), positivo),
    remocao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                adjudicatario(IdAda, AE, Nome_impossivel, Nif, Morada))),
    remocao((nulointerdito(Nome_impossivel))).

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com morada interdita
 involucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel), adjudicatario, interdito, morada) :-
    involucao(adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel), positivo),
    remocao((excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :-
                adjudicatario(IdAda, AE, Nome, Nif, Morada_impossivel))),
    remocao((nulointerdito(Morada_impossivel))).    

%--- Adjudicante

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicatário com nome interdito
 involucao(adjudicante(IdAd, Nome_impossivel, Nif, Morada), adjudicante, interdito, nome) :-
    involucao(adjudicante(IdAd, Nome_impossivel, Nif, Morada), positivo),
    remocao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                adjudicante(IdAd, Nome_impossivel, Nif, Morada))),
    remocao((nulointerdito(Nome_impossivel))).

% Retira conhecimento imperfeito interdito na base de conhecimento
% no caso de um adjudicante com morada interdita
 involucao(adjudicante(IdAd, Nome, Nif, Morada_impossivel), adjudicante, interdito, morada) :-
    involucao(adjudicante(IdAd, Nome, Nif, Morada_impossivel), positivo),
    remocao((excecao(adjudicante(IdAd, Nome, Nif, Morada)) :-
                adjudicante(IdAd, Nome, Nif, Morada_impossivel))),
    remocao((nulointerdito(Morada_impossivel))).        