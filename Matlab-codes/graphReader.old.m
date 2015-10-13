%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [Gs,VG,EG,h_VVG,h_VA,h_VL,h_L] = graphReader(node_files,edge_files)
% input:    node_files  = {<type1>,...}
%           edge_files  = {<type1_type2>,...}
% output:   Gs      = [n-by-n sparse matrix] graph
%           VG      = [n-by-1 matrix] list of node id
%           EG      = [n-by-2 matrix] list of edge
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VA    = [map(int32,char)] of node id and node value
%           h_VL    = [map(int32,char)] of node id and label id
%           h_L     = [map(char,int32)] of label id and label
% note:     Format of node id is XX...XTT where TT is 2-digit label id.
% note:     Maximum number of node types is 100.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Gs,VG,EG,h_VVG,h_VA,h_VL,h_L] = graphReader(node_files,edge_files)
    [VG,h_VA,h_VL,h_VVG,h_L] = nodesReader(node_files);
    [EG,connected] = edgesReader(edge_files,h_VVG,h_L);
    %[VG,EG,h_VVG] = cleanGraph(VG,EG,h_VVG,connected);
    if length(connected)~=length(VG), 
        [VG,EG,h_VVG] = cleanGraph(VG,EG,h_VVG,connected);
    else
        EG = double(EG);
    end;
    NV = length(VG);
    Gs = sparse(EG(:,1),EG(:,2),ones(length(EG),1),NV,NV); 
    %[keys(h_VVG); values(h_VVG)]'
    %[keys(h_VA); values(h_VA)]'
end

function [VG,h_VA,h_VL,h_VVG,h_L] = nodesReader(node_files)
    VG = [];
    h_VA = containers.Map('keytype','int32','valuetype','char');	% V=A
    h_VL = containers.Map('keytype','int32','valuetype','int32');   % V=L
    h_VVG = containers.Map('keytype','int32','valuetype','int32');  % V=VG
    h_L = containers.Map('keytype','char','valuetype','int32');     % <type_str>=L
    % node_id = ###TT where TT is type
    for i = 1:length(node_files)
        % mark type id
        tid = i;
        [path,name,ext] = fileparts(node_files{i});
        h_L(lower(name)) = tid;
        % read node of tid type from file
        disp(['nodesReader : read ' node_files{i}]);
        fid = fopen(node_files{i},'r');
        data = textscan(fid,'%d %s','delimiter','\n\r');
        fclose(fid);
        % mark node id
        nids = data{1};
        labs = data{2};
        num = length(data{1});
        for n = 1:num
            pid = nids(n)*100+tid;
            h_VA(pid) = labs{n};
            h_VL(pid) = tid;
            VG = [VG; pid];
            h_VVG(pid) = length(VG);
        end;
    end;
end

function [EG,connected,isolated] = edgesReader(edge_files,h_VVG,h_L)
    EG = [];
    count = zeros(length(h_VVG),1);
    for i = 1:length(edge_files)
        % get types
        [path,name,ext] = fileparts(edge_files{i});
        ts = strsplit(name,'_');
        if length(ts)~=2, error([edge_files{i} ' contains wrong format of filename!']); end;
        t1 = h_L(ts{1});
        t2 = h_L(ts{2});
        % read node of tid type from file
        disp(['edgesReader : read ' edge_files{i}]);
        fid = fopen(edge_files{i},'r');
		%data = textscan(fid,'%d %d');
        data = textscan(fid,'%d %d','headerlines',0);
        fclose(fid);
        v1 = data{1};
        v2 = data{2};
        if(length(v1)~=length(v2)), error([edge_files{i} ' contains non node-pair']); end;
        for n = 1:length(v1)
            p1 = v1(n)*100+t1;
            p2 = v2(n)*100+t2;
			if sum(isKey(h_VVG,{p1,p2}))~=2, continue; end;
            vg1 = h_VVG(p1);
            vg2 = h_VVG(p2);
            %disp([p1 p2 vg1 vg2]);
            EG = [EG; vg1 vg2; vg2 vg1];
            count(vg1) = 1;
            count(vg2) = 1;
        end;
    end;
    connected = find(count);
    isolated = find(count==0);
    disp(['There are ' num2str(length(isolated)) ' isolated nodes in G.']);
    %if(~isempty(isolated)), disp(isolated); end;
end

function [VG,EG,h_VVG] = cleanGraph(VG_old,EG_old,h_VVG_old,connected)
    VG = VG_old(connected);
    h_VVG = containers.Map('keytype','int32','valuetype','int32');
    EG = zeros(size(EG_old));
    h_map = containers.Map(connected,1:length(connected));
    for i = 1:size(EG,1)
        EG(i,1) = h_map(EG_old(i,1));
        EG(i,2) = h_map(EG_old(i,2));
    end;
    vs = keys(h_VVG_old);
    for i = 1:length(vs)
        v = vs{i};
        vg_old = h_VVG_old(v);
        if isKey(h_map,vg_old), h_VVG(v) = h_map(vg_old); end;
    end;
end