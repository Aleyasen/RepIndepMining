#!/bin/bash

echo "freebase to niagra2 / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_source_results rwr > compare_2_freebase_to_niagara_2_rwr_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_2_rwr_half.txt

echo "freebase to niagra2 / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_source_results simrank > compare_2_freebase_to_niagara_2_simrank_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_2_simrank_half.txt
