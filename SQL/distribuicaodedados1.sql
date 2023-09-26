
insert into local 
SELECT DISTINCT
0, km
FROM
dataset_acidentes
 ORDER BY
2;

select lcl_km from local where lcl_id < 500;