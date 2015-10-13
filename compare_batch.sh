#!/bin/bash


#course
run_ = 'r3';
./compare.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results pathsim > compare_uw_courses_${run_}_pathsim.txt
./compare.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results rwr > compare_uw_courses_${run_}_rwr.txt
./compare.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results simrank > compare_uw_courses_${run_}_simrank.txt


#dblp
./compare.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema1-top2000-year-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema1-top2000-year-metapath pathsim > compare-dblp-c100-new-schema1-top2000-year-metapath-pathsim_${run_}.txt
./compare.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-target-c100-new-schema-area-metapath /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/dblp-source-c100-new-schema-area-metapath  pathsim > compare-dblp-c100-new-schema1-top2000-area-metapath-pathsim_${run_}.txt
