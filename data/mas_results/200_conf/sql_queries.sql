SELECT distinct * FROM 
conf_domain_200 cd1, 
domain_keyword_200 dk1, 
domain_keyword_200 dk2, 
conf_domain_200 cd2 
where
cd1.conf=204  and
cd1.domain = dk1.domain and
dk1.keyword = dk2.keyword and
dk2.domain = cd2.domain and
cd2.conf=120;

SELECT distinct * FROM 
paper_conf_200 pc1,
paper_domain_200 pd1, 
domain_keyword_200 dk1, 
domain_keyword_200 dk2, 
paper_domain_200 pd2,
paper_conf_200 pc2
where
pc1.conf=204  and
pc1.paper = pd1.paper and
pd1.domain = dk1.domain and
dk1.keyword = dk2.keyword and
dk2.domain = pd2.domain  and
pd2.paper = pc2.paper  and
pc2.conf=120;


1	SIMPLE	pc1	ref	PRIMARY,conf	conf	4	const	1110	Using index
1	SIMPLE	pd1	eq_ref	PRIMARY,domain	PRIMARY	4	mas.pc1.paper	1	
1	SIMPLE	dk1	ref	domain	domain	4	mas.pd1.domain	41	Using index
1	SIMPLE	pc2	ref	PRIMARY,conf	conf	4	const	1606	Using index
1	SIMPLE	pd2	eq_ref	PRIMARY,domain	PRIMARY	4	mas.pc2.paper	1	
1	SIMPLE	dk2	ref	domain	domain	8	mas.pd2.domain,mas.dk1.keyword	1	Using index


1	SIMPLE	pc1	ref	PRIMARY,conf,p_c_index	conf	4	const	1110	Using index
1	SIMPLE	pd1	eq_ref	PRIMARY,domain,p_d_index	PRIMARY	4	mas.pc1.paper	1	
1	SIMPLE	dk1	ref	domain	domain	4	mas.pd1.domain	41	Using index
1	SIMPLE	pc2	ref	PRIMARY,conf,p_c_index	conf	4	const	1606	Using index
1	SIMPLE	pd2	eq_ref	PRIMARY,domain,p_d_index	PRIMARY	4	mas.pc2.paper	1	
1	SIMPLE	dk2	ref	domain	domain	8	mas.pd2.domain,mas.dk1.keyword	1	Using index	


5 --> 120 count=45175984






