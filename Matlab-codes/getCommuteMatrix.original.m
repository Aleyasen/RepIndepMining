%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CM = getCommuteMatrix2(A,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [1-by-k matrix] of (half) meta-path, label id
% output:   CM       = [n-by-n sparse matrix] commuting matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CM = getCommuteMatrix(A,h_VVG,h_VL,path)
    if ~issparse(A), A = sparse(A); end;
    N = size(A,1);
    VTs = getIndexByType(path,h_VVG,h_VL);
    Cs = cell(1,length(path)-1);
    for t = 1:length(path)-1
        C = A;
        vts1 = VTs{t};
        vts2 = VTs{t+1};
        nvts1 = 1:N; nvts1(vts1) = [];
        nvts2 = 1:N; nvts2(vts2) = [];
        C(nvts1,:) = 0;
        C(:,nvts2) = 0;
        Cs{t} = C;
    end;
    CM = Cs{1};
    for i = 2:length(Cs)
        CM = CM*Cs{i};
    end;
end