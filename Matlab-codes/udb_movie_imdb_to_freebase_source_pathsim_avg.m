clear all;

DAT_LOC = '/srv/data/projects/apps/RepIndep_CIDR/udb_movie';
ANS_LOC = '/srv/data/projects/apps/RepIndep_CIDR/udb_results/movie_imdb_to_freebase_source_result';
mkdir(ANS_LOC);

%% inputs
node_files = { [DAT_LOC '/actor.txt'], [DAT_LOC '/character.txt'], [DAT_LOC '/director.txt'], [DAT_LOC '/film.txt']};
edge_files = { [DAT_LOC '/actor_film.txt'], [DAT_LOC '/actor_character.txt'], [DAT_LOC '/character_film.txt'], [DAT_LOC '/film_director.txt']};

query_file = [DAT_LOC '/_query.txt'];
answer_loc = ANS_LOC;


%label = 'author';
%alg = 'modpathsim2'; metapath = {'author','title','proc','conf'}; star = [0 0 1 0]; % star = 1 when label at i is star
label = 'film';
alg = 'pathsim'; 
metapath = {{'film','actor'},{'film','character'},{'film','director'}}; star = {[0 0],[0 0],[0 0]}; % star = 1 when label at i is star
%metapath = {'proc','title','conf'}; star = [0 0 0]; % star = 1 when label at i is star
%alg = 'pathsim'; metapath = {'proc','conf'}; star = [0 1 0]; % star = 1 when label at i is star
%alg = 'rwr';
%alg = 'simrank';
%alg = '?';
VERBOSE = 0;

%% settings
[Gs,VG,EG,h_VVG,h_VA,h_VL,h_L] = graphReader(node_files,edge_files);
[QT,QG] = queryReader(query_file,label,h_VA,h_VL,h_VVG,h_L);
LG = h_L(label);
CA = getIndexByType(LG,h_VVG,h_VL); CA = CA{1}; % candidate answers index in G
disp(['Data size is |V|=' num2str(length(VG)) ' |E|=' num2str(length(EG))]);

%% algorithms
tstart = tic;

res_folder = [answer_loc '/' alg];
res_file = [res_folder '/answer.query'];
mkdir(res_folder);

if strcmpi(alg,'pathsim') && iscell(metapath{1})
    disp('>> running PathSim with multiple metapaths | uniform weighting');
    % assume same query label or error if not
    num_mpath = size(metapath,2);
    full_SQ = zeros(length(QG),length(CA));
    for m = 1:num_mpath
        curr_metapath = metapath{m};
        mpath = findMetaPathID(curr_metapath,h_L);
        SG = pathSim(Gs,h_VVG,h_VL,mpath);
        SQ = SG(QG,CA);
        full_SQ = full_SQ+SQ;
    end;
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(full_SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'pathsim')
    disp('>> running PathSim');
    mpath = findMetaPathID(metapath,h_L);
    SG = pathSim(Gs,h_VVG,h_VL,mpath);
    SQ = SG(QG,CA);
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'rwr')
    disp('>>> calculating Random Walk With Restart <<<');
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        SQ = RWR(QG(q),Gs,0.8,100);
        sq = full(SQ(CA));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
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
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'modpathsim1') && iscell(metapath{1})
    disp('>> running Mod1-PathSim with multiple metapaths | uniform weighting');
    % assume same query label or error if not
    num_mpath = size(metapath,2);
    full_SQ = zeros(length(QG),length(CA));
    for m = 1:num_mpath
        curr_metapath = metapath{m};
        mpath = findMetaPathID(curr_metapath,h_L);
        SG = mod1PathSim(Gs,h_VVG,h_VL,mpath);
        SQ = SG(QG,CA);
        full_SQ = full_SQ+SQ;
    end;
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(full_SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'modpathsim1')
    disp('>>> running Mod1-PathSim <<<');
    mpath = findMetaPathID(metapath,h_L);
    SG = mod1PathSim(Gs,h_VVG,h_VL,mpath);
    SQ = SG(QG,CA);
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'modpathsim2') && iscell(metapath{1})
    disp('>> running Mod2-PathSim with multiple metapaths | uniform weighting');
    % assume same query label or error if not
    num_mpath = size(metapath,2);
    full_SQ = zeros(length(QG),length(CA));
    for m = 1:num_mpath
        curr_metapath = metapath{m};
        curr_star = star{m};
        mpath = findMetaPathID(curr_metapath,h_L);
        SG = mod2PathSim(Gs,h_VVG,h_VL,mpath,curr_star);
        SQ = SG(QG,CA);
        full_SQ = full_SQ+SQ;
    end;
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(full_SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
elseif strcmpi(alg,'modpathsim2')
    disp('>>> running Mod2-PathSim <<<');
    mpath = findMetaPathID(metapath,h_L);
    SG = mod2PathSim(Gs,h_VVG,h_VL,mpath,star);
    SQ = SG(QG,CA);
    for q = 1:length(QG)
        display(['-- processing "' QT{q} '"']);
        sq = full(SQ(q,:));
        [rnk,gid] = sort(sq,'descend');
        fid = fopen([res_file num2str(q) '.txt'],'w');
        for i = 1:length(gid)
            if QG(q)==CA(gid(i)), continue; end;
            if rnk(i)==0, continue; end;
            fprintf(fid,'%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i));
            if VERBOSE, fprintf('%s\t|\t%.4f\n',h_VA(VG(CA(gid(i)))),rnk(i)); end;
        end;
        fclose(fid);
    end;
end;
tend = toc(tstart);
display([alg ': elapsed time = ' num2str(tend)]);
display('---------------------------------------------------------------');

exit;