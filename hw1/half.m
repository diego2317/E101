%% Part (a): Write a MATLAB function y=half(x) that removes every other element of an
% arbitrary length vector of values x. 

function y = half(x)
    y = x(1:2:end);
end