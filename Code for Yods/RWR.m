%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% S = RWR(qid,A,df,iter)
% input:    qid     = [int32] index of query
%           A       = [n-by-n matrix] adjacency matrix of graph G
%           df      = [double] decay factor
%           iter    = [int32] maximum iterations
% output:   S   = [n-by-1 matrix] similarity matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S = RWR(qid,A,df,iter)
    if ~issparse(A), M = sparse(A); else M = A; end; 
    N = size(M,1);
    Q = sparse(N,1);
    Q(qid,1) = 1;
    P = normalize(M);
    S = sparse(N,1);
    for i = 1:iter
        S = (df*P')*S+(1-df)*Q;
        S = normalize(S,'column');
    end;
    if ~issparse(A), S = full(S); end;
end