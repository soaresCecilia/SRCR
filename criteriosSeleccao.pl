%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar Adjudicantes, Adjudicatários e Contratos por critérios de seleção

%--------- Adjudicante



% Identificar Adjudicante pelo ID
adjudicanteID(Id, L) :-
solucoes(adjudicante(Id,Nome,Nif,Morada),
adjudicante(Id,Nome,Nif,Morada), L).


% Identificar Adjudicante pelo Nome
adjudicanteNome(Nome, L) :-
solucoes(adjudicante(Id,Nome,Nif,Morada),
adjudicante(Id,Nome,Nif,Morada), L).


% Identificar Adjudicante pelo Nif
adjudicanteNif(Nif, L) :-
solucoes(adjudicante(Id,Nome,Nif,Morada),
adjudicante(Id,Nome,Nif,Morada), L).


% Identificar Adjudicante pela Morada
adjudicanteMorada(Morada, L) :-
solucoes(adjudicante(Id,Nome,Nif,Morada),
adjudicante(Id,Nome,Nif,Morada), L).


%-------- Adjudicatário


% Identificar Adjudicatario pelo ID
adjudicatarioID(Id, L) :-
solucoes(adjudicatario(Id,Nome,Nif,Morada),
adjudicatario(Id,Nome,Nif, Morada), L).


% Identificar Adjudicatario pelo Nome
adjudicatarioNome(Nome, L) :-
solucoes(adjudicatario(Id,Nome,Nif,Morada),
adjudicatario(Id, Nome,Nif,Morada), L).


% Identificar Adjudicatario pelo Nif
adjudicatarioNif(Nif, L) :-
solucoes(adjudicatario(Id,Nome,Nif,Morada),
adjudicatario(Id,Nome,Nif,Morada), L).


% Identificar Adjudicatario pela Morada
adjudicatarioMorada(Morada, L) :-
solucoes(adjudicatario(Id,Nome,Nif,Morada),
adjudicatario(Id,Nome,Nif,Morada), L).

%-------- Contrato


% Identificar Contrato pelo ID
contratoID(IdC, L) :-
solucoes(contrato(IdC,IdAd,AE,IdAda,TC,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).


% Identificar Contrato pelo Adjudicante
contratoIDAd(IdAd, L) :-
solucoes(contrato(_,IdAd,_,_,_,_,_,_,_,_,_),
contrato(_,IdAd,_,_,_,_,_,_,_,_,_), L).



% Identificar Contrato pelo Adjudicatario
contratoIDAda(IdAda, L) :-
solucoes(contrato(_,_,IdAda,_,_,_,_,_,_,_,_),
contrato(_,_,IdAda,_,_,_,_,_,_,_,_), L).


% Identificar Contrato pelo tipo do mesmo
contratoTC(TipoContrato, L) :-
solucoes(contrato(_,_,_,TipoContrato,_,_,_,_,_,_,_),
contrato(_,_,_,TipoContrato,_,_,_,_,_,_,_), L).


% Identificar Contrato pelo tipo de procedimento subjacente
contratoTP(TipoProced, L) :-
solucoes(contrato(_,_,_,_,TipoProced,_,_,_,_,_,_),
contrato(_,_,_,_,TipoProced,_,_,_,_,_,_), L).


% Identificar Contrato pela descricao
contratoDesc(Descricao, L) :-
solucoes(contrato(_,_,_,_,_,Descricao,_,_,_,_,_),
contrato(_,_,_,_,_,Descricao,_,_,_,_,_), L).


% Identificar Contrato pelo custo
contratoCusto(Custo, L) :-
solucoes(contrato(_,_,_,_,_,_,_,Custo,_,_,_),
contrato(_,_,_,_,_,_,Custo,_,_,_,_), L).


% Identificar Contrato pelo prazo
contratoPrazo(Prazo, L) :-
solucoes(contrato(_,_,_,_,_,_,_,_,Prazo,_,_),
contrato(_,_,_,_,_,_,_,_,Prazo,_,_), L).


% Identificar Contrato pelo Local
contratoLocal(Local, L) :-
solucoes(contrato(_,_,_,_,_,_,_,_,_,Local,_),
contrato(_,_,_,_,_,_,_,_,_,Local,_), L).


% Identificar Contrato pela Data
contratoData(Data, L) :-
solucoes(contrato(_,_,_,_,_,_,_,_,_,_,Data),
contrato(_,_,_,_,_,_,_,_,_,_,Data), L).





