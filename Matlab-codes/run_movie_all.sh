#!/bin/bash

sc=3;
# cd /srv/data/projects/apps/RepIndep_SIGMOD/MAT-AALE/
# module load matlab/R2014a
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_2_src_rwr > logs/new_main_q100_movie_freebase_to_niagara_2_src_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_2_src_simrank > logs/new_main_q100_movie_freebase_to_niagara_2_src_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_2_target_simrank > logs/new_main_q100_movie_freebase_to_niagara_2_target_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_2_target_rwr > logs/new_main_q100_movie_freebase_to_niagara_2_target_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_src_rwr > logs/new_main_q100_movie_freebase_to_niagara_src_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_src_simrank > logs/new_main_q100_movie_freebase_to_niagara_src_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_target_simrank > logs/new_main_q100_movie_freebase_to_niagara_target_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_freebase_to_niagara_target_rwr > logs/new_main_q100_movie_freebase_to_niagara_target_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_freebase_source_rwr > logs/new_main_q100_movie_imdb_to_freebase_source_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_freebase_source_simrank > logs/new_main_q100_movie_imdb_to_freebase_source_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_freebase_target_simrank > logs/new_main_q100_movie_imdb_to_freebase_target_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_freebase_target_rwr > logs/new_main_q100_movie_imdb_to_freebase_target_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_source_rwr > logs/new_main_q100_movie_imdb_to_niagra_source_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_source_simrank > logs/new_main_q100_movie_imdb_to_niagra_source_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_target_simrank > logs/new_main_q100_movie_imdb_to_niagra_target_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_target_rwr > logs/new_main_q100_movie_imdb_to_niagra_target_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_2_source_rwr > logs/new_main_q100_movie_imdb_to_niagra_2_source_rwr.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_2_source_simrank > logs/new_main_q100_movie_imdb_to_niagra_2_source_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_2_target_simrank > logs/new_main_q100_movie_imdb_to_niagra_2_target_simrank.log &
sleep ${sc}
nohup matlab -nodisplay -nosplash -r new_main_q100_movie_imdb_to_niagra_2_target_rwr > logs/new_main_q100_movie_imdb_to_niagra_2_target_rwr.log &
echo "Done!"