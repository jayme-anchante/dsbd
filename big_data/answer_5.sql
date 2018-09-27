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
SELECT p_type, AVG(p_retailprice) FROM part WHERE p_retailprice BETWEEN 2095.1 AND 2097.9 GROUP BY p_type;

-- ## 2.
SELECT o_orderstatus, MAX(o_totalprice) FROM orders GROUP BY o_orderstatus;

-- ## 3.
SELECT p.p_type, AVG(ps.ps_supplycost) FROM partsupp AS ps, part AS p WHERE p.p_partkey=ps.ps_partkey AND p.p_type='PROMO POLISHED COPPER' GROUP BY p.p_type;

-- ## 4.
SELECT o.o_orderstatus, MAX(l.l_discount) FROM orders AS o, lineitem AS l WHERE o.o_orderkey=l.l_orderkey AND l.l_shipdate BETWEEN '1998-11-11' AND '1998-12-31' GROUP BY o.o_orderstatus;

-- ## 5.
SELECT c.c_name, AVG(o.o_totalprice) FROM customer AS c, orders AS o, nation AS n WHERE c.c_custkey=o.o_custkey AND c.c_nationkey=n.n_nationkey AND n.n_name='BRAZIL' GROUP BY c.c_name;
