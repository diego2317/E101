%% Part (b): Write a MATLAB function y=twice(x) that adds an additional element between
% neighboring elements of an arbitrary length vector x (where index n starts at
% 0). The additional elements are equal to the average value of their neighboring
% elements

function y = twice(x)
    N = length(x);                % original length
    y = zeros(1, 2*N - 1);        % output has length 2N - 1

    % even n → copy from x
    y(1:2:end) = x;

    % odd n → average of neighbors
    y(2:2:end) = (x(1:end-1) + x(2:end)) / 2;
end