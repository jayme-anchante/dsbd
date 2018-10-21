-- ## 1.
SELECT p.p_name, p.p_retailprice, ps.ps_supplycost
FROM part AS p
INNER JOIN partsupp AS ps
ON p.p_partkey=ps.ps_partkey
WHERE p.p_retailprice > 2097.10;

-- ## 2.
SELECT o.o_orderstatus, l.l_discount
FROM orders AS o
INNER JOIN lineitem AS l
ON o.o_orderkey=l.l_orderkey
WHERE l.l_shipdate BETWEEN '1998-11-11' AND '1998-12-31';

-- ## 3.
SELECT o.o_orderpriority, c.c_name, c.c_address
FROM customer AS c
INNER JOIN orders AS o
ON o.o_custkey = c.c_custkey 
INNER JOIN nation AS n
ON c.c_nationkey = n.n_nationkey
WHERE n.n_name = 'UNITED STATES' AND c.c_acctbal > 9990;

-- ## 4.
SELECT c.c_name
FROM customer AS c
INNER JOIN nation AS n
ON c.c_nationkey = n.n_nationkey
WHERE n.n_name = 'UNITED STATES' AND c.c_acctbal > 9990 AND c.c_mktsegment LIKE '%AUTO%';

-- ## 5.
SELECT c.c_name, o.o_totalprice
FROM customer AS c
INNER JOIN orders AS o
ON c.c_custkey = o.o_custkey
INNER JOIN nation AS n
ON c.c_nationkey = n.n_nationkey
WHERE n.n_name = 'BRAZIL';
