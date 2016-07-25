function result = convertStars(star)
    n = length(star);
    result = zeros(size(star));
    for i = 1:n
        result(i) = str2double(star{i});
    end;
end

