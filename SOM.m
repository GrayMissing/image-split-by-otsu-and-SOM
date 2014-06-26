function [ m ] = SOM( image, c, alpha, max_iter )
[row col] = size(image);
m = [image(randperm(row, c))];
while m(1) == m(2)
    m = [image(randperm(row, c))];
end
for time = 1:max_iter
    for i = 1:row
        x = double(image(i, :));
        d = repmat(x, 2, 1) - m;
        [value index] = min(sum(d .^ 2, 2) .^ 0.5);
        m = m + alpha .* d .* GaussianFunc(m, m(index, :), 1);
    end
end  
end

