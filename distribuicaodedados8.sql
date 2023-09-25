update dataset_acidentes set automovel = 0 where automovel is null;

update dataset_acidentes set bicicleta = 0 where bicicleta is null;

update dataset_acidentes set caminhao = 0 where caminhao is null;

update dataset_acidentes set moto = 0 where moto is null;

update dataset_acidentes set onibus = 0 where onibus is null;

update dataset_acidentes set outros = 0 where outros is null;

update dataset_acidentes set tracao_animal = 0 where tracao_animal is null;

update dataset_acidentes set transporte_de_cargas_especiais = 0 where transporte_de_cargas_especiais is null;

update dataset_acidentes set trator_maquinas = 0 where trator_maquinas is null;

update dataset_acidentes set utilitarios = 0 where utilitarios is null;

select count(*) from dataset_acidentes where moto > 0;


