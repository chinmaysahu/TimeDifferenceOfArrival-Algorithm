function t = TDOAGenerator(t0,x,y,n,c)
% Function to generate TDOA quantities
% Quantities:
%   q: Number of dimensions
%   m: Number of anchors
% Inputs: 
%   t0: Baseline time
%   x: target location; 1xq vector
%   y: anchor locations; mxq matrix
%   n: measurement noise variance; scalar
%   c: propagation speed
% Output:
%   t = times of the transmitted signal reaching each anchor; mx1 vector

[m,~] = size(y);

t = zeros(m,1);
% Compute times
for time_loop = 1:m
    t(time_loop) = (norm(y(time_loop,:)-x))/c + t0 + randn*sqrt(n);
end

end
