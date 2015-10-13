clear all;

DAT_LOC = '/srv/data/projects/apps/RepIndep_CIDR/dblp/data/mas';
ANS_LOC = '/srv/data/projects/apps/RepIndep_CIDR/MATLAB/aale/simtest-freebase/mas-keyword-target-check-speed-fast';
mkdir(ANS_LOC);

%% inputs
node_files = { [DAT_LOC '/paper.txt'], [DAT_LOC '/conf.txt'],[DAT_LOC '/domain.txt'],[DAT_LOC '/keyword.txt'] };
edge_files = { [DAT_LOC '/conf_domain.txt'], [DAT_LOC '/paper_conf.txt'], [DAT_LOC '/domain_keyword.txt'] };
query_file = [DAT_LOC '/_query.txt'];
answer_loc = ANS_LOC;

label = 'conf';
alg = 'pathsim'; metapath = {'conf','domain','keyword'}; star = [0 0 0]; % star = 1 when label at i is star
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

if strcmpi(alg,'pathsim')
    disp('>> running PathSim');
    mpath = findMetaPathID(metapath,h_L);
    SG = pathSimfast(Gs,h_VVG,h_VL,mpath);
	tend = toc(tstart);
	display([alg ': elapsed time (after generating matrix) = ' num2str(tend)]);
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
    disp('>>> calculating Mod1-PathSim <<<');
    mpath = findMetaPathID(metapath,h_L);
    SG = mod1PathSim(Gs,h_VVG,h_VL,mpath);
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
elseif strcmpi(alg,'modpathsim2')
    disp('>>> calculating Mod2-PathSim <<<');
    mpath = findMetaPathID(metapath,h_L);
    SG = mod2PathSim(Gs,h_VVG,h_VL,mpath,star);
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
end;
tend = toc(tstart);
display([alg ': elapsed time = ' num2str(tend)]);
display('---------------------------------------------------------------');

exit;