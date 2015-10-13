SELECT count(*) from node n1, node n2, edge e1 where e1.source=n1.id and e1.source_type=n1.type and e1.target=n2.id and e1.target_type=n2.type;  


SELECT * from node n1, node n2, edge e1 where e1.source=n1.id and n1.type='Proc' and e1.source_type='Proc' and e1.target=n2.id and e1.target_type='Year' and n2.type='Year';

589

select * from edge e1 where e1.source_type='Proc' and e1.target_type='Year';

SELECT * from node n1, node n2, node n3, edge e1, edge e2 where e1.source=n1.id and n1.type='Title' and e1.source_type='Title' and e1.target=n2.id and e1.target_type='Proc' and n2.type='Proc' and e2.source_type='Title' and e2.target_type='Year' and e2.source=n2.id and e2.target=n3.id and n3.type='Year';



SELECT count(distinct e1.target, e2.target) from edge e1, edge e2 where e1.source_type='Title' and e1.target_type='Proc' and e2.source_type='Title' and e2.target_type='Year' and e1.source=e2.source;

697

select * from (
SELECT distinct e1.target proc_ , e2.target year_, e1.source _title  from edge e1, edge e2 where e1.source_type='Title' and e1.target_type='Proc' and e2.source_type='Title' and e2.target_type='Year' and e1.source=e2.source and (e1.target,e2.target) not in (select distinct e4.source, e4.target  from edge e4 where e4.source_type='Proc' and e4.target_type='Year')
) T;

select * from (SELECT distinct e1.target t1, e2.target t2 from edge e1, edge e2 where e1.source_type='Title' and e1.target_type='Proc' and e2.source_type='Title' and e2.target_type='Year' and e1.source=e2.source) T 
minus
select * from (select distinct e1.target t1, e1.source t2 from edge e1 where e1.source_type='Proc' and e1.target_type='Year') T2


select * from (
SELECT distinct e1.target proc_ , e2.target year_, e1.source title_  from edge e1, edge e2 where e1.source_type='Title' and e1.target_type='Proc' and e2.source_type='Title' and e2.target_type='Year' and e1.source=e2.source and (e1.target,e2.target) not in (select distinct e4.source, e4.target  from edge e4 where e4.source_type='Proc' and e4.target_type='Year')
) T, node n1, node n2, node n3 where
T.proc_ = n1.id and n1.type='Proc' and T.year_ = n2.id and n2.type='Year' and T.title_ = n3.id and n3.type='Title'

