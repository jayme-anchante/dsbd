-- login: ssh jtanchante@ssh.inf.ufpr.br
-- pass: -
-- login: psql -U ci218 -h bd.c3sl.ufpr.br -d tpch
-- pass: ci218

/*
 
########################
## EXERCÍCIOS - SAÍDA ##
########################

*/

-- ## 1.
select p_name, p_retailprice from part where p_retailprice > 2097.1;

-- ## 2.
select n_comment from nation where n_name = 'ARGENTINA';

-- ## 3.
select p_name, p_retailprice from part where p_retailprice between 2095.1 and 2097.9;

-- ## 4.
select l_discount from lineitem where l_receiptdate between '1998-12-27' and '1998-12-31';

-- ## 5.
select c_name, c_address from customer where c_nationkey = 24 and c_acctbal > 9990;

-- ## 6.
select c_name, c_address from customer where c_nationkey = 24 and c_acctbal > 9990 and c_mktsegment like '%AUTO%';

-- ## 7.
select c_name, c_address from customer where c_nationkey = 24 and c_acctbal > 9990 and (c_mktsegment like '%AUTO%' or c_mktsegment like 'MAC%');

-- ## 8.
select * from nation where n_name not like '%A%';

-- ## 9.
select * from nation where n_name like '_A%';
