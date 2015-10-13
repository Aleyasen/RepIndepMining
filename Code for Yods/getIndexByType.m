%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VGs = getIndexByType(types,h_VVG,h_VL)
% input:    types   = [1-by-k matrix] list of types to find matrix index
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
% output:   VGs     = [1-by-k cell] cell(i) has matrix index of type(i)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function VGs = getIndexByType(types,h_VVG,h_VL)
    VGs = cell(1,length(types));
    t_map = containers.Map('keytype','int32','valuetype','int32');
    for i = 1:length(types)
        VGs{i} = [];
        t_map(types(i)) = i;
    end;
    vs = keys(h_VVG);
    for i = 1:length(vs)
        v = vs{i};
        type = h_VL(v);
        if ~isKey(t_map,type), continue; end;
        vg = h_VVG(v);
        ti = t_map(h_VL(v));
        VGs{ti} = [VGs{ti};vg];
    end;
end