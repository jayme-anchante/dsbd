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
select current_date;

-- ## 2.
select c_name, sqrt(c_acctbal) as sqrt from customer where c_nationkey = 24 and c_acctbal > 9990;

-- ## 3.
select c_name,format('$ %s', round(sqrt(c_acctbal), 2)) as valor from customer where c_nationkey = 24 and c_acctbal > 9990;

-- ## 4.
select c_name,format('$ %s', round(sqrt(c_acctbal), 2)) as valor, length(c_comment) as length from customer where c_nationkey = 24 and c_acctbal > 9990;

-- ## 5.
select c_name, c_phone, to_number(c_phone, '999999999999999') as to_number from customer where c_nationkey = 24 and c_acctbal > 9990;
