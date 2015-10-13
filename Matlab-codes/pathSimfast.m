%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = pathSim(A,h_VVG,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [k-by-1 matrix] of (half) meta-path, label id
% output:   S   = [n-by-n matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S = pathSimfast(A,h_VVG,h_VL,path)
    N = size(A,2);
	disp(['N=' N]);
    S = spalloc(N,N,2*N);
	disp('allocate memory DONE');
    CM_half = getCommuteMatrix(A,h_VVG,h_VL,path);
	
	disp('cacluate commute matrix DONE CM_half size:');
	size(CM_half)
    CM = CM_half*CM_half';
	disp('multiple half matrix DONE');
    %if VERBOSE, disp(CM); end;
    Qs = getIndexByType(path(1),h_VVG,h_VL);
    Qs = Qs{1};
	disp(['get index by type DONE Qs Length= ' num2str(length(Qs)) ]);
%    for q = 1:length(Qs)
%        for c = (q+1):length(Qs)
%            sc_qq = CM(Qs(q),Qs(q))+0;
%            sc_cc = CM(Qs(c),Qs(c))+0;
%            sc_qc = CM(Qs(q),Qs(c))+0;
%            sc = 2*sc_qc/(sc_qq+sc_cc);
%            %if VERBOSE, fprintf('q%d c%d -> qq%d cc%d qc%d => %.4f\n',Qs(q),Qs(c),sc_qq,sc_cc,sc_qc,sc); end;
%            S(Qs(q),Qs(c)) = sc;
%            S(Qs(c),Qs(q)) = sc;
%        end;
%    end;
%	disp('loop on Qs DONE');
	
	CM_diag=diag(CM);
	[sc_qq,sc_cc]=meshgrid(CM_diag(Qs),CM_diag(Qs));
	sc_qc = CM(Qs,Qs);
	sc=2*sc_qc./(sc_qq+sc_cc);
	S2(Qs,Qs)=sc;
	S2=S2-eye(size(S2));
	disp('quick code DONE');
%    fprintf('max error: %.6f\n',max(abs(S2(:)-S(:))));

end
