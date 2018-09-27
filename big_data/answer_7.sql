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


-- ## 2.
SELECT o.o_totalprice FROM orders AS o, customer AS c, nation AS n WHERE o.o_custkey=c.c_custkey AND c.c_nationkey=n.n_nationkey AND n.n_name='BRAZIL' UNION SELECT p.p_retailprice FROM part AS p;

-- ## 3.
SELECT o.o_totalprice FROM orders AS o, customer AS c, nation AS n WHERE o.o_custkey=c.c_custkey AND c.c_nationkey=n.n_nationkey AND n.n_name='BRAZIL' UNION ALL SELECT p.p_retailprice FROM part AS p;

-- ## 4.
SELECT c_acctbal FROM customer INTERSECT SELECT p_retailprice FROM part INTERSECT SELECT o_totalprice FROM orders;

-- ## 5.
SELECT l_shipdate FROM lineitem INTERSECT SELECT o_orderdate FROM orders;
