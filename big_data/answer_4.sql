-- ## 1.
SELECT p.p_name, p.p_retailprice, ps.ps_supplycost FROM part AS p, partsupp AS ps WHERE p.p_partkey=ps.ps_partkey AND p.p_retailprice > 2097.10;

-- ## 2.
SELECT o.o_orderstatus, l.l_discount FROM orders AS o, lineitem AS l WHERE o.o_orderkey=l.l_orderkey AND l.l_shipdate BETWEEN '1998-11-11' AND '1998-12-31';

-- ## 3.
SELECT o.o_orderpriority, c.c_name, c.c_address FROM customer AS c, orders AS o, nation AS n WHERE o.o_custkey = c.c_custkey AND c.c_nationkey = n.n_nationkey AND n.n_name = 'UNITED STATES' AND c.c_acctbal > 9990;

-- ## 4.
SELECT c.c_name FROM customer AS c, nation AS n WHERE c.c_nationkey = n.n_nationkey AND n.n_name = 'UNITED STATES' AND c.c_acctbal > 9990 AND c.c_mktsegment LIKE '%AUTO%';

-- ## 5.
SELECT c.c_name, o.o_totalprice FROM customer AS c, orders AS o, nation AS n WHERE c.c_custkey = o.o_custkey AND c.c_nationkey = n.n_nationkey AND n.n_name = 'BRAZIL';
