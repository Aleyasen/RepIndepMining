clear all;

DAT_LOC = '/srv/data/projects/apps/RepIndep_CIDR/fullgraph/top2000';
% ANS_LOC = '/srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_source_wo_dirby_result';
% mkdir(ANS_LOC);

%% inputs
node_files = { [DAT_LOC '/movie.txt'], [DAT_LOC '/actor.txt'], [DAT_LOC '/director.txt'], [DAT_LOC '/starring.txt'],[DAT_LOC '/character.txt'],[DAT_LOC '/directedby.txt'] };
edge_files = { [DAT_LOC '/starring_actor.txt'], [DAT_LOC '/starring_movie.txt'],[DAT_LOC '/starring_character.txt'],[DAT_LOC '/directedby_director.txt'],[DAT_LOC '/directedby_movie.txt']};
% query_file = [DAT_LOC '/_query_sample.txt'];
% answer_loc = ANS_LOC;
% label = 'movie';
alg = 'pathsim'; metapath = {'starring','movie','starring'};
metapath_file = [DAT_LOC '/metapaths.txt'];
%alg = 'pathsim';
%alg = 'simrank';
VERBOSE = 0;

%% settings
[Gs,VG,EG,h_VVG,h_VA,h_VL,h_L] = graphReader(node_files,edge_files);
% [QT,QG] = queryReader(query_file,label,h_VA,h_VL,h_VVG,h_L);
% LG = h_L(label);
% CA = getIndexByType(LG,h_VVG,h_VL); CA = CA{1}; % candidate answers index in G
disp(['Data size is |V|=' num2str(length(VG)) ' |E|=' num2str(length(EG))]);

fid_mp = fopen(metapath_file,'r');
data_mp = textscan(fid_mp,'%s','delimiter','\n\r');
data_mp = data_mp{1};
disp(['data_mp length = ' num2str(length(data_mp))]);
for i = 1:length(data_mp)
	 disp(['mp = ' data_mp{i}]);
end;
%% algorithms
% tstart = tic;
tstart_w = tic;
% res_folder = [answer_loc '/' alg];
% res_file = [res_folder '/answer.query'];
% mkdir(res_folder);

if strcmpi(alg,'pathsim')
	for ii = 1:length(data_mp)
		tstart = tic;
		metapath_str = data_mp{ii};
		%disp(metapath_str);
		metapath = strsplit(metapath_str);
		%disp(metapath);
		path = findMetaPathID(metapath,h_L);
		%disp('start matrix construction...');
		SG = pathSimnew(Gs,h_VVG,h_VL,path);
		tend = toc(tstart);
		display([metapath '	time= ' num2str(tend)]);

	%    SQ = SG(QG,CA);
	%    for q = 1:length(QG)
	%        display(['-- processing "' QT{q} '"']);
	%        sq = full(SQ(q,:));
	%        [rnk,gid] = sort(sq,'descend');
	%        fid = fopen([res_file num2str(q) '.txt'],'w');
	%        for i = 1:length(gid)
	%            if QG(q)==CA(gid(i)), continue; end;
	%            if rnk(i)==0, continue; end;
	%            fprintf(fid,'%s\t|\t%.8f\n',h_VA(VG(CA(gid(i)))),rnk(i));
	%            if VERBOSE, fprintf('%s\t|\t%.8f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
	%        end;
	%        fclose(fid);
	%    end;
	end;
end;
tend_w = toc(tstart_w);
display([alg ': elapsed time = ' num2str(tend_w)]);
display('---------------------------------------------------------------');

exit;