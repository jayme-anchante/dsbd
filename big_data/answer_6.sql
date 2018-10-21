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
SELECT p_name FROM part WHERE p_retailprice < (SELECT AVG(c_acctbal) FROM customer);

-- ## 2.
SELECT p_name FROM part WHERE p_retailprice < (SELECT AVG(c_acctbal) FROM customer);

-- ## 3.
SELECT o.o_orderstatus FROM orders AS o, customer AS c WHERE o.o_custkey=c.c_custkey AND c.c_nationkey = (SELECT n_nationkey FROM nation WHERE n_name='BRAZIL');

-- ## 4.
SELECT l_comment FROM lineitem WHERE l_quantity = IN (SELECT p.p_size FROM part AS p, lineitem AS l WHERE p.p_partkey=l.l_partkey AND p.p_type='LARGE POLISHED COPPER' AND l.l_shipdate BETWEEN '1998-07-27' AND '1998-12-31');
