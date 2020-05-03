


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%       BASE CONHECIMENTO
%--------------------------------- - - - - - - - - - -  -  -  -  -   -




% adjudicante: IdAd,Nome,Nif,Morada -> {V,F}
adjudicante('700700707','Ministerio dos Negocios Estrangeiros','600014576','Largo do Rilvas, Lisboa').
adjudicante('707070707','Municipio de Guimaraes','505948605','Largo Conego Jose Maria Gomes, Guimaraes').
adjudicante('700500600','Banco de Portugal','500792771','Rua do Comercio, Lisboa').
adjudicante('700500601','Santa Casa da Misericordia de Lisboa','500745471','Largo Trindade Coelho, Lisboa').
adjudicante('700500611','Santa Casa da Misericordia de Guimaraes','599745471','Largo da oliveira, Guimaraes').
adjudicante('700500602','Direccao Regional dos Assuntos do Mar','600085899','Rua D. Pedro IV, 29, Horta').
adjudicante('700500603','Instituto Portugues de Oncologia','506362299','Rua Dr. Antonio Bernardino de Almeida').
adjudicante('700500650','Centro Hospitalar Universitario de Lisboa','508080142','Alameda Santo Antonio dos Capuchos, Lisboa').

% adjudicatario: IdAda,AE,Nome,Nif,Morada -> {V,F}
adjudicatario('100100100','[Construcao,Comercio]','JOHNSON & JOHNSON VISION','500153370','Lagoas Park, Ed.9, Oeiras').
adjudicatario('100100101','[Construcao,Consultoria]','Seguradoras Unidas, S.A.,','500940231','Av. da Liberdade, Lisboa').
adjudicatario('100100102','[Construcao,Educacao]','CISEC, S.A','500205698','Rua Dom Nuno Alvares Pereira, Faro').
adjudicatario('100100103','[Construcao,Servicos]','Drager','508771323','Rua Nossa Senhora da Conceicao, Carnaxide').
adjudicatario('100100104','[Construcao,Restauracao]','Pamafe Informatica, Lda','504099388','Rua do Crasto, 194, Porto').

% contrato: #IdCont,IdAd,IdAda,ActividadeEconomica,TipoContrato,TipoProc,Descricao,#Custo,#Prazo,Local,#Data -> {V,F}
contrato(1,'700700707','100100102','Comercio','Aquisicao de servicos','Ajuste Direto','Requalificacao do acesso ao parque de estacionamento da sede do Ministerio',4000.0,30,'Largo do Rilvas, Lisboa',data(11,3,2018)').
contrato(2,'707070707','100100104','Consultoria','Aquisicao de bens','Concurso Publico','Aquisicao de 40 dispositivos de acesso a rede sem fios',10122.8,90,'Municipio de Guimaraes',data(8,4,2020)').
contrato(3,'700500650','100100100','Comercio','Aquisicao de bens','Concurso Publico','Consumiveis para cirurgia catarata,vitrectomia e combinada',93360.0,100,'Alameda Santo Antonio dos Capuchos, Lisboa',data(9,4,2020)').
contrato(4,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2019)').
contrato(5,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2020)').
contrato(6,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(9,4,2021)').
contrato(7,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(5,5,2021)').
contrato(8,'700500601','100100103','Construcao','Aquisicao de servicos','Concurso Publico','Aquisicao de servicos de manutencao preventiva, corretiva e assistencia tecnica aos equipamentos de ventilacao',5000,45,'Edificio da Santa Casa da Misericordia de Lisboa',data(5,5,2019)').
