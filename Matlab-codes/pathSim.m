%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = pathSim(A,h_VVG,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [k-by-1 matrix] of (half) meta-path, label id
% output:   S   = [n-by-n matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S = pathSim(A,h_VVG,h_VL,path)
    N = size(A,2);
    S = spalloc(N,N,2*N);
    CM_half = getCommuteMatrix(A,h_VVG,h_VL,path);
    CM = CM_half*CM_half';
    %if VERBOSE, disp(CM); end;
    Qs = getIndexByType(path(1),h_VVG,h_VL);
    Qs = Qs{1};
    for q = 1:length(Qs)
        for c = (q+1):length(Qs)
            sc_qq = CM(Qs(q),Qs(q))+0;
            sc_cc = CM(Qs(c),Qs(c))+0;
            sc_qc = CM(Qs(q),Qs(c))+0;
            sc = 2*sc_qc/(sc_qq+sc_cc);
            %if VERBOSE, fprintf('q%d c%d -> qq%d cc%d qc%d => %.4f\n',Qs(q),Qs(c),sc_qq,sc_cc,sc_qc,sc); end;
            S(Qs(q),Qs(c)) = sc;
            S(Qs(c),Qs(q)) = sc;
        end;
    end;
end
