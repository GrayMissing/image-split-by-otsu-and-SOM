function [ image ] = normalization( image )
[row col] = size(image);
mu = mean(image, 1);
image = image - repmat(mu, row, 1);
sigma = std(image, 0, 1);
image = image ./ repmat(sigma, row, 1);
end

