-- login: psql -U ci218 -h bd.c3sl.ufpr.br -d tpch
-- pass: ci218

/*
 
########################
## EXERCÍCIOS - SAÍDA ##
########################

*/

-- ## 1.
select * from nation;

-- ## 2.
select n_comment, n_name from nation;

-- ## 3.
select o_orderpriority from orders;

-- ## 4.
select l_discount from lineitem;

-- ## 5. a consulta 1 está correta

-- ## 6.

-- # 2.
select n_name from nation;
-- # 3.
select r_name, r_comment from region;
-- # 4.
select p_name, 12 * p_retailprice from part;

-- ## 7.
select * p_name || '--' || p_type as "Nome e Tipo" from part;
