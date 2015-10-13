SELECT count(*) FROM 
conf_domain_200 cd1, 
domain_keyword_200 dk1, 
domain_keyword_200 dk2, 
conf_domain_200 cd2 
where
cd1.conf=5  and
cd1.domain = dk1.domain and
dk1.keyword = dk2.keyword and
dk2.domain = cd2.domain and
cd2.conf=120;

SELECT count(*) FROM 
paper_conf_200 pc1,
paper_domain_200 pd1, 
domain_keyword_200 dk1, 
domain_keyword_200 dk2, 
paper_domain_200 pd2,
paper_conf_200 pc2
where
pc1.conf=23 and
pc1.paper = pd1.paper and
pd1.domain = dk1.domain and
dk1.keyword = dk2.keyword and
dk2.domain = pd2.domain  and
pd2.paper = pc2.paper  and
pc2.conf=120;


SELECT count(*) cc, pc1.conf FROM 
paper_conf_200 pc1,
paper_domain_200 pd1, 
domain_keyword_200 dk1, 
domain_keyword_200 dk2, 
paper_domain_200 pd2,
paper_conf_200 pc2
where
pc1.paper = pd1.paper and
pd1.domain = dk1.domain and
dk1.keyword = dk2.keyword and
dk2.domain = pd2.domain  and
pd2.paper = pc2.paper  and
pc2.conf=120
group by pc1.conf order by cc desc;


select count(*) cc,  pc.conf from paper_conf_200 pc, paper_domain_200 pd, domain_keyword_200 dk where
pc.paper=pd.paper and
pd.domain=dk.domain 
group by pc.conf order by cc desc;

select count(*) cc, conf from paper_conf_200 group by conf order by cc desc; 