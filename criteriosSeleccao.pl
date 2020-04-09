%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Identificar Adjudicantes, Adjudicatários e Contratos por critérios de seleção

%--------- Adjudicante

adjudicanteID(Id, L) :- solucoes(adjudicante(Id, Nome,Nif,Morada),
                            adjudicante(Id,Nome,Nif,Morada), L).

adjudicanteNome(Nome, L) :- solucoes(adjudicante(Id, Nome, Nif, Morada),
                                adjudicante(Id, Nome, Nif, Morada), L).

adjudicanteNif(Nif, L) :- solucoes(adjudicante(Id, Nome, Nif, Morada),
                            adjudicante(Id, Nome, Nif, Morada), L).

adjudicanteMorada(Morada, L) :- solucoes(adjudicante(Id, Nome, Nif, Morada),
                                adjudicante(Id, Nome, Nif, Morada), L).


%-------- Adjudicatário

adjudicatarioID(Id, L) :- solucoes(adjudicatario(Id,Nome,Nif,  Morada),
                                adjudicatario(Id, Nome,Nif, Morada), L).

adjudicatarioNome(Nome, L) :- solucoes(adjudicatario(Id,Nome,Nif,  Morada),
                                    adjudicatario(Id, Nome,Nif, Morada), L).

adjudicatarioNif(Nif, L) :- solucoes(adjudicatario(Id,Nome,Nif,  Morada),
                                adjudicatario(Id, Nome,Nif, Morada), L).

adjudicatarioMorada(Morada, L) :- solucoes(adjudicatario(Id,Nome,Nif,  Morada),
                                    adjudicatario(Id, Nome,Nif, Morada), L).

%-------- Contrato

contratoID(IdC, L) :- solucoes(contrato(IdC, IdAd, IdAda, TC, TP, Des, C, P, Local, Data),
                        contrato(IdC, IdAd, IdAda, TC, TP, Des, C, P, Local, Data), L).

contratoIDAd(IdAd, L) :- solucoes(contrato(_,IdAd,_,_,_,_,_,_,_,_),
                            contrato(_,IdAd,_,_,_,_,_,_,_,_), L).


contratoIDAda(IdAda, L) :- solucoes(contrato(_,_,IdAda,_,_,_,_,_,_,_),
                            contrato(_,_,IdAda,_,_,_,_,_,_,_), L).

contratoTC(TipoContrato, L) :- solucoes(contrato(_,_,_,TipoContrato,_,_,_,_,_,_),
                                contrato(_,_,_,TipoContrato,_,_,_,_,_,_), L).


contratoTP(TipoProced, L) :- solucoes(contrato(_,_,_,_,TipoProced,_,_,_,_,_),
                            contrato(_,_,_,_,TipoProced,_,_,_,_,_), L).


contratoDesc(Descricao, L) :- solucoes(contrato(_,_,_,_,_,Descricao,_,_,_,_),
                                contrato(_,_,_,_,_,Descricao,_,_,_,_), L).

contratoCusto(Custo, L) :- solucoes(contrato(_,_,_,_,_,_,Custo,_,_,_),
                            contrato(_,_,_,_,_,_,Custo,_,_,_), L).


contratoPrazo(Prazo, L) :- solucoes(contrato(_,_,_,_,_,_,_,Prazo,_,_),
                            contrato(_,_,_,_,_,_,_,Prazo,_,_), L).

contratoLocal(Local, L) :- solucoes(contrato(_,_,_,_,_,_,_,_,Local,_),
                            contrato(_,_,_,_,_,_,_,_,Local,_), L).

contratoData(Data, L) :- solucoes(contrato(_,_,_,_,_,_,_,_,_,Data),
                            contrato(_,_,_,_,_,_,_,_,_,Data), L).





