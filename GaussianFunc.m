function f = GaussianFunc( x, mu, sigma )
[row col] = size(x);
d2 = sum((x - repmat(mu, row, 1)) .^ 2, 2);
f = 1 / (sqrt(2 * pi) * sigma) * exp(- (d2) / (2 * sigma ^ 2));


end

