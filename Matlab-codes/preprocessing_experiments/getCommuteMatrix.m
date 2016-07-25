%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CM = getCommuteMatrix(A,h_VL,path)
% input:    A       = [n-by-n matrix] adjacency matrix of graph G
%           h_VVG   = [map(int32,int32)] of matrix index and node id
%           h_VL    = [map(int32,char)] of node id and label id
%           path    = [1-by-k matrix] of (half) meta-path, label id
%           star    = indicate label of position i to be star iff 1
% output:   CM       = [n-by-n sparse matrix] commuting matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CM = getCommuteMatrix(A,h_VVG,h_VL,path,star)
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
    if nargin<5
        CM = Cs{1};
		
        for i = 2:length(Cs)
			tstart = tic;
            CM = CM*Cs{i};
			tend = toc(tstart);
			display(['before ' i ': duration = ' num2str(tend)]);
		end;
		else
        if length(path)~=length(star), disp('error: length of parameter star and path is not equal'); end;
        temp = cell(1,1); temp_i = 1;
        prev = 1;
        i = 2;
        while i<=length(Cs)+1
			tstart = tic;
            if star(i)==0
                if i>prev
                    temp{temp_i} = Cs{prev};
                    temp_i = temp_i+1;
                    prev = i;
                end;
            else
                X = Cs{i-1};
                i = i+1;
                while star(i)~=0
                    X = (X*Cs{i-1})>0;
                    i = i+1;
                end;
                X = (X*Cs{i-1})>0;
                temp{temp_i} = double(X);
                temp_i = temp_i+1;
                prev = i;
            end;
            i = i+1;
			tend = toc(tstart);
			display(['middle ' i ': duration = ' num2str(tend)]);
        end;
        %for j=1:length(temp)
        %    disp(j);
        %    disp(temp{j});
        %    disp(size(temp{j}));
        %end;
        CM = temp{1};
        for j=2:length(temp)
			tstart = tic;
            CM = CM*temp{j};
            %disp(CM);
			tend = toc(tstart);
			display(['after ' j ': duration = ' num2str(tend)]);
        end;
    end;
end