%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = mod1-PathSim(A,h_VVG,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [k-by-1 matrix] of (half) meta-path, label id
% output:   S   = [n-by-n matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S2 = mod1PathSim(A,h_VVG,h_VL,path)
    N = size(A,2);
    S = spalloc(N,N,2*N);
	display(path);
	whos('A')
	
    %assume deg(A_i) distinct loop at each node
    A_mod = A;
    for i=1:N,
        A_mod(i,i) = sum(A(i,1:N));
    end;
    CM_half = getCommuteMatrix(A_mod,h_VVG,h_VL,path);
    CM = CM_half*CM_half';
    %if VERBOSE, disp(CM); end;
    Qs = getIndexByType(path(1),h_VVG,h_VL);
    Qs = Qs{1};
    
	CM_diag=diag(CM);
	[sc_qq,sc_cc]=meshgrid(CM_diag(Qs),CM_diag(Qs));
	sc_qc = CM(Qs,Qs);
	sc=2*sc_qc./(sc_qq+sc_cc);
	S2(Qs,Qs)=sc;
	S2=S2-eye(size(S2));
	%disp('quick code DONE');
    %fprintf('max error: %.6f\n',max(abs(S2(:)-S(:))));
	whos('CM')
	whos('S2')
	
end
