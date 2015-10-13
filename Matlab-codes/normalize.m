%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NA = normalize(A)
% NA = normalize(A,dim)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           dim     = 'row' or 'column'
% output:   NA      = [n-by-n matrix] normalized matrix by dim
% note:     by default, dim = 'row'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function NA = normalize(A,varargin)
    dim = 'row';
    if nargin>1, dim = varargin(1); end;
    if strcmpi(dim,'column'), A = A'; end;
    n = size(A,1);
    NA = zeros(size(A));
    for i = 1:n
        NA(i,:) = A(i,:)/sum(A(i,:));
    end;
    if issparse(A), NA = sparse(NA); end;
    if strcmpi(dim,'column'), NA = NA'; end;
end