%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

% Sistema de Representação de conhecimento e raciocínio com capacidade
% para caracterizar um universo de contratos públicos

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op(900,xfy,'::').
:- dynamic adjudicante/4.
:- dynamic adjudicatario/4.
:- dynamic contrato/9.
:- dynamic data/3.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

:- include('funcoesAuxiliares.pl').


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais

%--------- Adjudicatarios

% Garantir que o id de cada adjudicatario é único

+adjudicatario(Id,Nome, Nif, Morada) :: (solucoes(Id, adjudicatario(Id,_,_,_), L),
										comprimento(L, 1)).


% Garantir que adjudicatarios com ids diferentes têm diferente informação

+adjudicatario(Id,Nome,Nif, Morada) :: (solucoes((Nome, Nif, Morada), adjudicatario(_,Nome, Nif, Morada), L),
										comprimento(L, 1)).


%Garantir que o Nif do adjudicatário é válido.

+adjudicatario(_,_, Nif, _) :: nifValido(Nif).


% Garantir que não é possível remover um adjudicatario que celebrou contratos públicos.

-adjudicatario(Id,_,_,_,_) :: (solucoes(Id, contrato(_,Id,_,_,_,_,_,_,_), L),
								comprimento(L, 0)).



%--------------------------------- Adjudicantes -----------------------------------------------

% Garantir que o id de cada adjudicante é único

+adjudicante(Id,Nome, Nif, Morada) :: (solucoes(Id, adjudicante(Id,_,_,_), L),
										comprimento(L, 1)).


% Garantir que adjudicatarios com ids diferentes têm diferente informação

+adjudicante(Id,Nome,Nif, Morada) :: (solucoes((Nome, Nif, Morada), adjudicante(_,Nome, Nif, Morada), L),
										comprimento(L, 1)).


%Garantir que o Nif do adjudicatário é válido.

+adjudicante(_,_, Nif, _) :: nifValido(Nif).


% Garantir que não é possível remover um adjudicante que celebrou contratos públicos.

-adjudicante(Id,_,_,_) :: (solucoes(Id, contrato(_,Id,_,_,_,_,_,_,_), L),
							comprimento(L, 0)).



%---------------------------------- Contratos ------------------------------------------------- 

% Garantir que cada contrato é único
+contrato(IdAd, IdAda, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data) ::
		(solucaoes((IdAd, IdAda, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data),
				contrato(IdAd, IdAda, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data), 
				  L),
		comprimento(L, 1)).


% Garantir que não é possível remover um contrato associado a um adjudicante

-contrato(IdAdjudicante,_,_,_,_,_,_,_,_) :: (solucoes(IdAdjudicante, adjudicante(IdAdjudicante,_,_,_), L),
										comprimento(L, 0)).


% Garantir que não é possível remover um contrato associado a um adjudicatário

-contrato(_,IdAdjudicatario,_,_,_,_,_,_,_) :: (solucoes(IdAdjudicatario, adjudicatario(IdAdjudicatario,_,_,_), L),
											comprimento(L, 0)).


% Garantir que o tipo de procedimento é válido.

+contrato(_,_,_,TP,_,_,_,_,_) :: tipoProcedimentoValido(TP).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Adicionar adjudicatarios, adjudicantes e contratos.

novoAdjudicatario(Id,Nome,Nif, Morada) :- evolucao(adjudicatario(Id, Nome,Nif, Morada)).

novoAdjudicante(Id,Nome,Nif, Morada) :- evolucao(adjudicante(Id,Nome,Nif, Morada)).

novoContrato(IdAd,IdAda,TC,TP,Desc,Valor,Prazo,Local,Data) :- evolucao(contrato(IdAd,IdAda,TC,TP,Desc,Valor,Prazo,Local,Data)).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Remover adjudicatarios, adjudicantes e contratos.

%Devolve Adjudicante por Id do mesmo.
adjudicanteID(Id, L) :- solucoes(adjudicante(Id, Nome,Nif, Morada), adjudicante(Id,Nome,Nif,  Morada), L).

removeAdjudicante(Id) :- adjudicanteID(Id,[X|_]), involucao(X).



adjudicatarioID(Id, L) :- solucoes(adjudicatario(Id,Nome,Nif,  Morada), adjudicatario(Id, Nome,Nif, Morada), L).

removeAdjudicatario(Id) :- adjudicatarioID(Id,[X|_]), involucao(X).


