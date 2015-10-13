%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = simRank(A,df,iter)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           df      = [double] decay factor
%           iter    = [int32] maximum iterations
% output:   S   = [n-by-n matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S = simRank(A,df,iter)
    if ~issparse(A), M = sparse(A); else M = A; end;
    N = size(M,1);
    P = normalize(M);
    I = speye(N,N);
    S = I;
    for i = 1:iter
        S = df*P'*S*P+(1-df)*I;
        for j = 1:N, S(j,j) = 1; end;
		if mod(i,5)==1, disp(['SR iter = ' num2str(i) ' : time=' num2str(cputime)]); end;
    end;
    if ~issparse(A), S = full(S); end;
end