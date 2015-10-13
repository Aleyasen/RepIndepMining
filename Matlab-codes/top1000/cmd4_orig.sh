#!/bin/bash

X=$1

DAT_LOC=/srv/data/projects/apps/RepIndep_CIDR/fullgraph/${X}

ANS_LOC=/srv/data/projects/apps/RepIndep_CIDR/simtest/orig4-${X}
mkdir ${ANS_LOC}

java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt  ${DAT_LOC}/actor.txt ${DAT_LOC}/character.txt -E ${DAT_LOC}/movie_actor.txt  ${DAT_LOC}/movie_character.txt ${DAT_LOC}/actor_character.txt -I PATHSIM -M actor-movie

java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt  ${DAT_LOC}/actor.txt ${DAT_LOC}/character.txt -E ${DAT_LOC}/movie_actor.txt  ${DAT_LOC}/movie_character.txt ${DAT_LOC}/actor_character.txt -I RWR

#java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt  ${DAT_LOC}/actor.txt ${DAT_LOC}/character.txt -E ${DAT_LOC}/movie_actor.txt  ${DAT_LOC}/movie_character.txt ${DAT_LOC}/actor_character.txt -I SIMRANK iter=15


