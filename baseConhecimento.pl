%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F,D}

adjudicante('700700707','Ministerio dos Negocios Estrangeiros','600014576','Largo do Rilvas, Lisboa').

adjudicante('707070707','Municipio de Guimaraes','505948605','Largo Conego Jose Maria Gomes, Guimaraes').

adjudicante('700500600','Banco de Portugal','500792771','Rua do Comercio, Lisboa').

adjudicante('700500601','Santa Casa da Misericordia de Lisboa','500745471','Largo Trindade Coelho, Lisboa').

adjudicante('700500611','Santa Casa da Misericordia de Guimaraes','599745471','Largo da oliveira, Guimaraes').

adjudicante('700500602','Direccao Regional dos Assuntos do Mar','600085899','Rua D. Pedro IV, 29, Horta').

adjudicante('700500603','Instituto Portugues de Oncologia','506362299','Rua Dr. Antonio Bernardino de Almeida').

adjudicante('700500650','Centro Hospitalar Universitario de Lisboa','508080142','Alameda Santo Antonio dos Capuchos, Lisboa').

adjudicante('700','MJ','500','Lisboa').


%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F,D}

adjudicatario('100100100',['Construcao','Comercio'],'JOHNSON & JOHNSON VISION','500153370','Lagoas Park, Ed.9, Oeiras').

adjudicatario('100100101',['Construcao','Consultoria'],'Seguradoras Unidas, S.A.,','500940231','Av. da Liberdade, Lisboa').

adjudicatario('100100102',['Construcao','Educacao'],'CISEC, S.A','500205698','Rua Dom Nuno Alvares Pereira, Faro').

adjudicatario('100100103',['Construcao','Servicos'],'Drager','508771323','Rua Nossa Senhora da Conceicao, Carnaxide').

adjudicatario('100100104',['Construcao','Restauracao'],'Pamafe Informatica, Lda','504099388','Rua do Crasto, 194, Porto').

adjudicatario('100133787',['Construcao','Comercio','Educacao'],'Viva','503405607','Porto').


%-----Contratos: #IdCont,IdAd,IdAda,ActividadeEconomica,TipoContrato,TipoProc,Descricao,#Custo,#Prazo,Local,#Data -> {V,F,D}

contrato(1,'700700707','100100102','Comercio','Aquisicao de servicos','Ajuste Direto','Requalificacao do acesso ao parque de estacionamento da sede do Ministerio',4000.0,30,'Largo do Rilvas, Lisboa',data(11,3,2018)).

contrato(2,'707070707','100100104','Consultoria','Aquisicao de bens','Concurso Publico','Aquisicao de 40 dispositivos de acesso a rede sem fios',10122.8,90,'Municipio de Guimaraes',data(8,4,2020)).

contrato(3,'700500650','100100100','Comercio','Aquisicao de bens','Concurso Publico','Consumiveis para cirurgia catarata,vitrectomia e combinada',93360.0,100,'Alameda Santo Antonio dos Capuchos, Lisboa',data(9,4,2020)).

contrato(4,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2019)).

contrato(5,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2020)).

contrato(6,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2021)).

contrato(7,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(5,5,2021)).

contrato(8,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(5,5,2019)).

contrato(9,'700500601','100100103','Construcao','Aquisicao de bens moveis','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(5,5,2020)).

contrato(10,'700','100133787','Educacao','Aquisicao de servicos','Consulta Previa','Formacao',900,90,'Porto',data(6,4,2019)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO NEGAÇÃO FORTE
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F,D}
-adjudicante('722136853', 'Municipio de Cabeceiras', '602590576', 'Cabeceiras de Basto').

%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F,D}
-adjudicatario('102999303',['Construcao','Servicos'],'Viper','512345799','Rua Nossa Senhora Maria, Monção').


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO IMPERFEITO INCERTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F,D}

% Não se sabe o nome do adjudicante 700212453:
adjudicante('700212453', nome_desconhecido, '600464576', 'Avenida João XXI, Braga').
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- adjudicante(IdAd, nome_desconhecido, Nif, Morada).

% Não se sabe a sede do adjudicante 700812493:
adjudicante('700812493', 'Município de Braga', '600469536', sede_desconhecida).
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- adjudicante(IdAd, Nome, Nif, sede_desconhecida).


%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F,D}

% Não se sabe o nome do adjudicatário 100467100:
adjudicatario('100467100', ['Comercio'], nome_desconhecido, '500234213', 'Rua do Caires, Braga').
excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :- adjudicatario(IdAda, AE, nome_desconhecido, Nif, Morada).

% Não se sabe a sede do adjudicatário 100128100:
adjudicatario('100128100', ['Construcao'], 'Sonae Indrustria, S.A', '501234223', sede_desconhecida).
excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :- adjudicatario(IdAda, AE, Nome, Nif, sede_desconhecida).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO IMPERFEITO IMPRECISO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F,D}

% Não se sabe se o adjudicante 742212453 é o Município de Viana do Castelo ou de Barcelos: 
excecao(adjudicante('742212453', 'Município de Viana do Castelo', '612464576', 'Praça da República')).
excecao(adjudicante('742212453', 'Município de Barcelos', '612464576', 'Praça da República')).

% Não se sabe se a morada do adjudicante 792212453 é Praça do Conde de Agrolongo, Braga ou Praça do Conde de Agrolongo, Porto:
excecao(adjudicante('792212453', 'Município de Linhares', '666464576', 'Praça do Conde de Agrolongo, Braga')).
excecao(adjudicante('792212453', 'Município de Linhares', '666464576', 'Praça do Conde de Agrolongo, Porto')).

%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F,D}

% Não se sabe se o adjudicatário 102669100 é o 'J.GOMES S.A' ou 'J.GOMES LDA.' ou 'J.GOMES Unipessoal':
excecao(adjudicatario('102669100', ['Construcao'], 'J.GOMES S.A', '529234213', 'Esporões, Braga')).
excecao(adjudicatario('102669100', ['Construcao'], 'J.GOMES LDA.', '529234213', 'Esporões, Braga')).
excecao(adjudicatario('102669100', ['Construcao'], 'J.GOMES Unipessoal', '529234213', 'Esporões, Braga')).

% Não se sabe se a sede do adjudicatário é em Braga, Guimarães ou Porto:
excecao(adjudicatario('102669190', ['Comercio'], 'SONAE IM S.A', '529234299', 'Braga')).
excecao(adjudicatario('102669190', ['Comercio'], 'SONAE IM S.A', '529234299', 'Guimarães')).
excecao(adjudicatario('102669190', ['Comercio'], 'SONAE IM S.A', '529234299', 'Porto')).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO IMPERFEITO INTERDITO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%----Adjudicantes: IdAd,Nome,Nif,Morada -> {V,F,D}

% É impossível saber a sede do adjudicante 781135453:
adjudicante(adjudicante('781135453', 'Município de Poiares', '647621276', secret)).
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- 
	adjudicante(IdAd, Nome, Nif, secret).
nulo(secret).

+adjudicante(IdAd, Nome, Nif, Morada) :: (findall((IdAd, Nome, Nif, Morada), (adjudicante(IdAd, Nome, Nif, M),
			nao(nulo(M))) , S), comprimento(S, N), N == 0).	

%----Adjudicatários: IdAda,AE,Nome,Nif,Morada -> {V,F,D}

% É impossível saber o nome do adjudicatário
adjudicatario(adjudicatario('102270299', ['Construcao', 'Comercio'], secret, '530145613', 'Lisboa')).
excecao(adjudicatario(IdAda, AE, Nome, Nif, Morada)) :- 
	adjudicatario(IdAda, AE, secret, Nif, Morada).
nulo(secret).	

+adjudicatario(IdAda, AE, Nome, Nif, Morada) :: (findall((IdAda, AE, Nome, Nif, Morada), (adjudicatario(IdAda, AE, Name, Nif, Morada),
			nao(nulo(Name))) , S), comprimento(S, N), N == 0).	