function mpath = findMetaPathID(metapath,h_L)
    n = length(metapath);
    mpath = zeros(size(metapath));
    for i = 1:n
        mpath(i) = h_L(metapath{i});
    end;
end

