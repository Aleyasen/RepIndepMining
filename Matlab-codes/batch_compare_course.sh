#!/bin/bash

echo "course-uw / pathsim / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results pathsim > compare_6_course_uw_pathsim_half.txt
java -jar aggregator.jar compare_6_course_uw_pathsim_half.txt

echo "course-uw / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results simrank > compare_6_course_uw_simrank_half.txt
java -jar aggregator.jar compare_6_course_uw_simrank_half.txt

echo "course-uw / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_remove_multi_subj_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_remove_multi_subj_schema_results rwr > compare_6_course_uw_rwr_half.txt
java -jar aggregator.jar compare_6_course_uw_rwr_half.txt

#----------------------

echo "course-wsu / pathsim / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results pathsim > compare_5_course_wsu_pathsim_half.txt
java -jar aggregator.jar compare_5_course_wsu_pathsim_half.txt

echo "course-wsu / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results simrank > compare_5_course_wsu_simrank_half.txt
java -jar aggregator.jar compare_5_course_wsu_simrank_half.txt

echo "course-wsu / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results rwr > compare_5_course_wsu_rwr_half.txt
java -jar aggregator.jar compare_5_course_wsu_rwr_half.txt
