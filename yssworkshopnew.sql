
insert into link(adminId, value) values (1, ( SELECT md5(RAND()) as 'c1' from link as t1 where 'c1' NOT IN (SELECT value from link as t2) LIMIT 1))