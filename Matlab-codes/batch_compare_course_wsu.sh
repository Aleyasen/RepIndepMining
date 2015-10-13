#!/bin/bash

echo "course-wsu / pathsim / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results pathsim > compare_5_course_wsu_pathsim_half.txt
java -jar aggregator.jar compare_5_course_wsu_pathsim_half.txt

echo "course-wsu / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results simrank > compare_5_course_wsu_simrank_half.txt
java -jar aggregator.jar compare_5_course_wsu_simrank_half.txt

echo "course-wsu / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_target_wsu_schema_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/uw-courses_source_wsu_schema_results rwr > compare_5_course_wsu_rwr_half.txt
java -jar aggregator.jar compare_5_course_wsu_rwr_half.txt
