%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% QT = queryReader(query_file)
% QT,QG = queryReader(query_file,label,h_VA,h_VL,h_VVG,h_L)
% input:    query_file  = [char]
%           label       = [char] label of query
%           h_VA        = [map(int32,char)] of node id and node value
%           h_VL    = [map(int32,char)] of node id and label id
%           h_VVG       = [map(int32,int32)] of matrix index and node id
%           h_L     = [map(char,int32)] of label id and label
% output:   QT      = [q-by-1 matrix] of query text
%           QG      = [q-by-1 matrix] of query matrix index in G
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [QT,QG] = queryReader(query_file,varargin)
    fid = fopen(query_file,'r');
    data = textscan(fid,'%s','delimiter','\n\r');
    fclose(fid);
    QT = data{1};
    QG = [];
    if nargin>4,
        QG = zeros(size(QT));
        label = varargin(1); label = label{1};
        h_VA = varargin(2); h_VA = h_VA{1};
        h_VL = varargin(3); h_VL = h_VL{1};
        h_VVG = varargin(4); h_VVG = h_VVG{1};
        h_L = varargin(5); h_L = h_L{1};
        label = h_L(label);
        vs = keys(h_VA);
        for i = 1:length(vs)
            v = vs{i};
            for q = 1:length(QT)
                if strcmp(strtrim(QT{q}),strtrim(h_VA(v)))
                   vg = h_VVG(v);
                   QG(q) = vg;
                   if h_VL(v)~=label, disp(h_VL(v)); error([QT{q} ' is not of specified label']); end;
                end;
            end;
        end;
        non_query = find(QG==0);
        query = find(QG);
        if ~isempty(non_query)
            display('the following queries do not exist'); 
            display(QT(non_query)); 
        end;
        QG = QG(query);
        QT = QT(query);
    end;
end