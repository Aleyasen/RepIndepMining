#!/bin/bash

echo "imdb to niagra / rwr / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagara_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_source_result/ rwr > compare_2_imdb_to_niagra_rwr_half.txt
java -jar aggregator.jar compare_2_imdb_to_niagra_rwr_half.txt

echo "imdb to niagra / simrank / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagara_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_source_result/ simrank > compare_2_imdb_to_niagra_simrank_half.txt
java -jar aggregator.jar compare_2_imdb_to_niagra_simrank_half.txt

#-----------

echo "imdb to niagra2 / rwr / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_2_source_result/ rwr > compare_2_imdb_to_niagra_2_rwr_half.txt
java -jar aggregator.jar compare_2_imdb_to_niagra_2_rwr_half.txt

echo "imdb to niagra2 / simrank / half";
./compare_half.sh  /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_2_source_result/ simrank > compare_2_imdb_to_niagra_2_simrank_half.txt
java -jar aggregator.jar compare_2_imdb_to_niagra_2_simrank_half.txt

#-----------

echo "imdb to freebase / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_freebase_target_result /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_freebase_source_result rwr > compare_2_imdb_to_freebase_rwr_half.txt
java -jar aggregator.jar compare_2_imdb_to_freebase_rwr_half.txt

echo "imdb to freebase / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_freebase_target_result /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_freebase_source_result simrank > compare_2_imdb_to_freebase_simrank_half.txt
java -jar aggregator.jar compare_2_imdb_to_freebase_simrank_half.txt

#------------

echo "freebase to niagra / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_source_results rwr > compare_2_freebase_to_niagara_rwr_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_rwr_half.txt

echo "freebase to niagra / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_source_results simrank > compare_2_freebase_to_niagara_simrank_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_simrank_half.txt

#------------

echo "freebase to niagra2 / rwr / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_source_results rwr > compare_2_freebase_to_niagara_2_rwr_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_2_rwr_half.txt

echo "freebase to niagra2 / simrank / half";
./compare_half.sh /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_target_results /srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_freebase_to_niagara_2_source_results simrank > compare_2_freebase_to_niagara_2_simrank_half.txt
java -jar aggregator.jar compare_2_freebase_to_niagara_2_simrank_half.txt

#--------------
