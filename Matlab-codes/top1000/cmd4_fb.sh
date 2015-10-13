#!/bin/bash

X=$1

DAT_LOC=/srv/data/projects/apps/RepIndep_CIDR/fullgraph/${X}

ANS_LOC=/srv/data/projects/apps/RepIndep_CIDR/simtest/fb4-${X}
mkdir ${ANS_LOC}

java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt ${DAT_LOC}/actor.txt ${DAT_LOC}/starring.txt -E ${DAT_LOC}/starring_movie.txt  ${DAT_LOC}/starring_actor.txt -I PATHSIM -M actor-starring-movie

#java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt ${DAT_LOC}/actor.txt ${DAT_LOC}/character.txt ${DAT_LOC}/starring.txt -E ${DAT_LOC}/starring_movie.txt ${DAT_LOC}/starring_character.txt ${DAT_LOC}/starring_actor.txt -I RWR

#java -Xmx300g -jar ./run_sim4.jar ${DAT_LOC}/_query.txt actor ${ANS_LOC} -N ${DAT_LOC}/movie.txt ${DAT_LOC}/actor.txt ${DAT_LOC}/character.txt ${DAT_LOC}/starring.txt -E ${DAT_LOC}/starring_movie.txt ${DAT_LOC}/starring_character.txt ${DAT_LOC}/starring_actor.txt -I SIMRANK iter=15