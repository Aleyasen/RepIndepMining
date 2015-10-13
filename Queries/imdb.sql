select * from node;
select count(*) from edge;
SELECT name, COUNT(*) c FROM node where type='Character' GROUP BY name HAVING c > 1;

-- duplicate Character:
-- 'benigno (dariel alarcón ramírez)', '2'

-- starring_actor
-- starring_character count => 16767
-- starring_movie => 17031
-- 
-- to
-- actor_character
-- movie_character
-- movie_actor

-- directedby_movie
-- directedby_director
--
-- movie director => 3137
SELECT count(distinct
    e1.target , e2.target )
from
    edge e1,
    edge e2
where
    e1.source_type = 'Directedby'
        and e1.target_type = 'Movie'
        and e2.source_type = 'Directedby'
        and e2.target_type = 'Director'
        and e1.source = e2.source;

select count(distinct e1.source, e1.target) from edge e1 where e1.source_type='Movie' and e1.target_type='Director' order by e1.source, e1.target;