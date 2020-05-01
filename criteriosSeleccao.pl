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
solucoes(adjudicatario(Id,AE,Nome,Nif,Morada),
adjudicatario(Id,AE,Nome,Nif, Morada), L).


% Identificar Adjudicatario pelo Nome
adjudicatarioNome(Nome, L) :-
solucoes(adjudicatario(Id,AE,Nome,Nif,Morada),
adjudicatario(Id,AE,Nome,Nif,Morada), L).


% Identificar Adjudicatario pelo Nif
adjudicatarioNif(Nif, L) :-
solucoes(adjudicatario(Id,AE,Nome,Nif,Morada),
adjudicatario(Id,AE,Nome,Nif,Morada), L).


% Identificar Adjudicatario pela Morada
adjudicatarioMorada(Morada, L) :-
solucoes(adjudicatario(Id,AE,Nome,Nif,Morada),
adjudicatario(Id,AE,Nome,Nif,Morada), L).

%Listar todos os Adjudicatarios com a mesma Atividade Economica
adjudicatarioAE(AE,L) :- solucoes((adjudicatario(Id,AE,Nome,Nif,Morada)), adjudicatario(Id,AE,Nome,Nif,Morada) , L).

%-------- Contrato


% Identificar Contrato pelo ID
contratoID(IdC, L) :-
solucoes(idC,
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).


% Identificar Contrato pelo Adjudicante
contratoIDAd(IdAd, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).



% Identificar Contrato pelo Adjudicatario
contratoIDAda(IdAda, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).

% Identificar Contrato pela atividade economica
contratoAE(AtividadeEconomica, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AtividadeEconomica,TipoContrato,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AtividadeEconomica,TipoContrato,TP,Des,C,P,Local,Data),L).

% Identificar Contrato pelo tipo do mesmo
contratoTC(TipoContrato, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TipoContrato,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TipoContrato,TP,Des,C,P,Local,Data),L).


% Identificar Contrato pelo tipo de procedimento subjacente
contratoTP(TipoProced, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TipoProced,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TipoProced,Des,C,P,Local,Data),L).


% Identificar Contrato pela descricao
contratoDesc(Descricao, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Descricao,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Descricao,C,P,Local,Data),L).


% Identificar Contrato pelo custo
contratoCusto(Custo, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,Custo,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,Custo,P,Local,Data),L).


% Identificar Contrato pelo prazo
contratoPrazo(Prazo, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,Prazo,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,Prazo,Local,Data),L).


% Identificar Contrato pelo Local
contratoLocal(Local, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).

% Identificar Contrato pela Data
contratoData(Data, L) :-
solucoes(contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),
contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,C,P,Local,Data),L).





