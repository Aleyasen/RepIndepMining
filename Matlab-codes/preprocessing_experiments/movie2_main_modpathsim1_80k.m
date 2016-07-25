clear all;

DAT_LOC = '/srv/data/projects/apps/RepIndep_CIDR/fullgraph/filtered_80570_112895';
% ANS_LOC = '/srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/new_top2000_q100_movie_imdb_to_niagra_source_wo_dirby_result';
% mkdir(ANS_LOC);

%% inputs
node_files = { [DAT_LOC '/movie.txt'], [DAT_LOC '/actor.txt'], [DAT_LOC '/director.txt'], [DAT_LOC '/starring.txt'],[DAT_LOC '/character.txt'],[DAT_LOC '/directedby.txt'] };
edge_files = { [DAT_LOC '/starring_actor.txt'], [DAT_LOC '/starring_movie.txt'],[DAT_LOC '/starring_character.txt'],[DAT_LOC '/directedby_director.txt'],[DAT_LOC '/directedby_movie.txt']};
% query_file = [DAT_LOC '/_query_sample.txt'];
% answer_loc = ANS_LOC;
% label = 'movie';
alg = 'modpathsim1'; 
%metapath = {'starring','movie','starring'};
%star = [0 0 0]; % star = 1 when label at i is star

metapath_file = [DAT_LOC '/entities_count_all.txt'];

%alg = 'pathsim';
%alg = 'simrank';
VERBOSE = 0;


%% settings
[Gs,VG,EG,h_VVG,h_VA,h_VL,h_L] = graphReader(node_files,edge_files);
%[QT,QG] = queryReader(query_file,label,h_VA,h_VL,h_VVG,h_L);
%LG = h_L(label);
%CA = getIndexByType(LG,h_VVG,h_VL); CA = CA{1}; % candidate answers index in G
disp(['Data size is |V|=' num2str(length(VG)) ' |E|=' num2str(length(EG))]);

fid_mp = fopen(metapath_file,'r');
if strcmpi(alg,'modpathsim2')
	data_all_mp = textscan(fid_mp,'%s %s','delimiter','\t');
	data_mp = data_all_mp{1};
	star_mp = data_all_mp{2};
	disp(['data_mp length = ' num2str(length(data_mp))]);
	for i = 1:length(data_mp)
		 disp(['mp = ' data_mp{i} ' star = ' star_mp{i}]);
	end;
else
	data_mp = textscan(fid_mp,'%s','delimiter','\n\r');
	data_mp = data_mp{1};
	disp(['data_mp length = ' num2str(length(data_mp))]);
	for i = 1:length(data_mp)
		 disp(['mp = ' data_mp{i}]);
	end;
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
	end;
elseif strcmpi(alg,'rwr')
    disp('>>> calculating Random Walk With Restart <<<');
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        SQ = RWR(QG(q),Gs,0.8,100);
        sq = full(SQ(CA));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q)],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'simrank')
    disp('>>> calculating SimRank <<<');
    SG = simRank(Gs,0.8,100);
    SQ = SG(QG,CA);
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q)],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'modpathsim1') 
	for ii = 1:length(data_mp)
		tstart = tic;
		metapath_str = data_mp{ii};
		%disp(metapath_str);
		metapath = strsplit(metapath_str);
		%disp(metapath);
		mpath = findMetaPathID(metapath,h_L);
		%disp('start matrix construction...');
		SG = mod1PathSim(Gs,h_VVG,h_VL,mpath);
		tend = toc(tstart);
		display([metapath '	time= ' num2str(tend)]);

	end;	
elseif strcmpi(alg,'modpathsim2')
	for ii = 1:length(data_mp)
		tstart = tic;
		metapath_str = data_mp{ii};
		star_str = star_mp{ii};
		%disp(metapath_str);
		metapath = strsplit(metapath_str);
		star_ = strsplit(star_str);
		star = convertStars(star_);
		%disp(metapath);
		mpath = findMetaPathID(metapath,h_L);
		%disp('start matrix construction...');
		SG = mod2PathSim(Gs,h_VVG,h_VL,mpath,star);
		tend = toc(tstart);
		display([metapath '	time= ' num2str(tend)]);
	end;
end;
tend_w = toc(tstart_w);
display([alg ': elapsed time = ' num2str(tend_w)]);
display('---------------------------------------------------------------');

exit;