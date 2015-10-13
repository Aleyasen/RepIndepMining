#!/bin/bash

echo "dblp year metapath / pathsim / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath pathsim > compare_4_dblp_year_mp_one_pathsim.txt
java -jar aggregator.jar compare_4_dblp_year_mp_one_pathsim.txt

echo "dblp year metapath / simrank / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath simrank > compare_4_dblp_year_mp_one_simrank.txt
java -jar aggregator.jar compare_4_dblp_year_mp_one_simrank.txt

echo "dblp year metapath / rwr / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath rwr > compare_4_dblp_year_mp_one_rwr.txt
java -jar aggregator.jar compare_4_dblp_year_mp_one_rwr.txt

echo "dblp year metapath / pathsim / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath pathsim > compare_4_dblp_year_mp_half_pathsim.txt
java -jar aggregator.jar compare_4_dblp_year_mp_half_pathsim.txt

echo "dblp year metapath / simrank / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath simrank > compare_4_dblp_year_mp_half_simrank.txt
java -jar aggregator.jar compare_4_dblp_year_mp_half_simrank.txt

echo "dblp year metapath / rwr / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath rwr > compare_4_dblp_year_mp_half_rwr.txt
java -jar aggregator.jar compare_4_dblp_year_mp_half_rwr.txt

#---------------------------

echo "dblp area metapath / pathsim / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath pathsim > compare_3_dblp_area_mp_one_pathsim.txt
java -jar aggregator.jar compare_3_dblp_area_mp_one_pathsim.txt


echo "dblp area metapath / simrank / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath simrank > compare_3_dblp_area_mp_one_simrank.txt
java -jar aggregator.jar compare_3_dblp_area_mp_one_simrank.txt


echo "dblp area metapath / rwr / one";
./compare.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath rwr > compare_3_dblp_area_mp_one_rwr.txt
java -jar aggregator.jar compare_3_dblp_area_mp_one_rwr.txt


echo "dblp area metapath / pathsim / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath pathsim > compare_3_dblp_area_mp_half_pathsim.txt
java -jar aggregator.jar compare_3_dblp_area_mp_half_pathsim.txt


echo "dblp area metapath / simrank / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath simrank > compare_3_dblp_area_mp_half_simrank.txt
java -jar aggregator.jar compare_3_dblp_area_mp_half_simrank.txt


echo "dblp area metapath / rwr / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath rwr > compare_3_dblp_area_mp_half_rwr.txt
java -jar aggregator.jar compare_3_dblp_area_mp_half_rwr.txt

