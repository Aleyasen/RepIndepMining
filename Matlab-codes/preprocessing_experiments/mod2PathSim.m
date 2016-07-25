%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = mod2-PathSim(A,h_VVG,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [k-by-1 matrix] of (half) meta-path, label id
%           star    = indicate label of position i to be star iff 1
% output:   S   = [n-by-n matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S2 = mod2PathSim(A,h_VVG,h_VL,path,star)
    N = size(A,2);
    S = spalloc(N,N,2*N);
	display(path);
	display(star);
	whos('A')
	
    %assume loop at each node
    A_mod = A;
    for i=1:N,
        A_mod(i,i) = 1;
    end;
    path_full = [path path(end-1:-1:1)];
    star_full = [star star(end-1:-1:1)];
    CM = getCommuteMatrix(A_mod,h_VVG,h_VL,path_full,star_full);
    %CM = CM_half*CM_half';
    %if VERBOSE, disp(CM); end;
    Qs = getIndexByType(path(1),h_VVG,h_VL);
    Qs = Qs{1};
    
	whos('Qs')
	
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
