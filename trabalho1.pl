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
:- dynamic adjudicante/4.     /* */
:- dynamic adjudicatario/5.	  /* */
:- dynamic contrato/11.       /* */
:- dynamic data/3.            /* (Dia-Mes-Ano) */


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

:- include('baseConhecimento.pl').

:- include('criteriosSeleccao.pl').

:- include('funcoesAuxiliares.pl').

:- include('custosLucros.pl').

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Invariantes Estruturais e Referenciais


%--------------------------------- Adjudictarios -----------------------------------------------

% Garantir que o id de cada adjudicatario é único

+adjudicatario(Id,AE,Nome, Nif, Morada) :: (solucoes(Id, adjudicatario(Id,AE,_,_,_), L), comprimento(L, N), N == 1).


% Garantir que adjudicatarios com ids diferentes têm diferente informação

+adjudicatario(Id,AE,Nome,Nif, Morada) :: (solucoes((AE,Nome, Nif, Morada), adjudicatario(_,AE,Nome, Nif, Morada), L), comprimento(L, N), N == 1).


%Garantir que o Nif do adjudicatário é válido, e o seu tipo de AtividadeEconomica tambem.

+adjudicatario(_,_,_,Nif,_) :: nifValido(Nif).
+adjudicatario(_,AE,_,_,_) :: tipoAtividadeEconomica(AE).

% Garantir que não é possível remover um adjudicatario que celebrou contratos públicos.

-adjudicatario(Id,_,_,_,_,_) :: (solucoes(Id, contrato(_,_,Id,_,_,_,_,_,_,_,_), L),
								comprimento(L, N), N == 0).



%--------------------------------- Adjudicantes -----------------------------------------------

% Garantir que o id de cada adjudicante é único

+adjudicante(Id,Nome, Nif, Morada) :: (solucoes(Id, adjudicante(Id,_,_,_), L),
										comprimento(L, N), N == 1).


% Garantir que adjudicantes com ids diferentes têm diferente informação

+adjudicante(Id,Nome,Nif, Morada) :: (solucoes((Nome, Nif, Morada), adjudicante(_,Nome, Nif, Morada), L),
										comprimento(L, N), N == 1).


%Garantir que o Nif do adjudicatário é válido.

+adjudicante(_,_, Nif, _) :: nifValido(Nif).


% Garantir que não é possível remover um adjudicante que celebrou contratos públicos.

-adjudicante(Id,_,_,_) :: (solucoes(Id, contrato(_,Id,_,_,_,_,_,_,_,_,_), L),
							comprimento(L, N), N == 0).



%---------------------------------- Contratos ------------------------------------------------- 

% Garantir que cada contrato é único
+contrato(IdContrato, IdAd, IdAda, AtividadeEconomica, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data) ::
		(solucoes((IdContrato, IdAd, IdAda,AtividadeEconomica, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data),
				contrato(IdContrato, IdAd, IdAda, AtividadeEconomica, TipoContrato, TipoProcedimento, Descricao, Valor, Prazo, Local, Data),
				  L),
		comprimento(L, 1)).

% Garantir que a data do contrato inseirdo é válida

+contrato(_,_,_,_,_,_,_,_,_,_,data(Dia,Mes,Ano)) :: validaData(Dia,Mes,Ano).


% Garantir que não é possível remover um contrato associado a um adjudicante

-contrato(_,IdAdjudicante,_,_,_,_,_,_,_,_,_) :: (solucoes(IdAdjudicante, adjudicante(IdAdjudicante,_,_,_), L),
										comprimento(L, 0)).


% Garantir que não é possível remover um contrato associado a um adjudicatário

-contrato(_,_,IdAdjudicatario,_,_,_,_,_,_,_,_) :: (solucoes(IdAdjudicatario, adjudicatario(IdAdjudicatario,_,_,_,_), L),
											comprimento(L, 0)).



% Garantir que o tipo de atividade economica e o tipo de procedimento de um contrato é válido.

+contrato(_,_,_,_,_,TP,_,_,_,_,_) :: tipoProcedimentoValido(TP).

% Garantir que o tipo de atividade economica de um contrato com um determinado id de adjudicatario é válido.
+contrato(_,_,IdAda,AE,_,_,_,_,_,_,_) :: validaAE(IdAda,AE).


% Garantir que um contrato por ajuste direto tem valor igual ou inferior a 5000 euros, tem prazo de vigência de um ano a contar da data da adjudicação e que se refere apenas a contrato de aquisição ou locação de bens móveis ou aquisição de serviços.
 
+contrato(IdC,IdAd,IdAda,AE,TC,'Ajuste Direto',Des,Custo,Prazo,Local,Data) :: ajusteDiretoValido(TC, Custo, Prazo).



% garantir que a mesma empresa não pode celebrar um contrato com prestações de serviço com mesmo tipo ou idênticas às de contratos que
% já lhe foram atribuídos, n _o  ano económico em curso e nos dois anos económicos
% anteriores, sempre que: O preço contratual acumulado dos contratos já celebrados (não incluindo o
% contrato que se pretende celebrar) seja igual ou superior a 75.000 euros

+contrato(IdC,IdAd,IdAda,AE,TC,TP,Des,Custo,Prazo,Local,Data) :: regraTresAnos(IdAd, IdAda, AE, TC, Custo, Data).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Adicionar adjudicatarios, adjudicantes e contratos.


novoAdjudicatario(Id,AE,Nome,Nif,Morada) :- evolucao(adjudicatario(Id,AE,Nome,Nif,Morada)).

novoAdjudicante(Id,Nome,Nif,Morada) :- evolucao(adjudicante(Id,Nome,Nif,Morada)).

novoContrato(IdC,IdAd,IdAda,AE,TC,TP,Desc,Valor,Prazo,Local,Data) :- evolucao(contrato(IdC,IdAd,IdAda,AE,TC,TP,Desc,Valor,Prazo,Local,Data)).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Remover adjudicatarios, adjudicantes e contratos.

removeAdjudicante(Id) :- adjudicanteID(Id,[X|_]), involucao(X).


removeAdjudicatario(Id) :- adjudicatarioID(Id,[X|_]), involucao(X).


removeContrato(Id) :- contratoID(Id,[X|_]), involucao(X).

