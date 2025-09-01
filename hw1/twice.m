%% Part (b): Write a MATLAB function y=twice(x) that adds an additional element between
% neighboring elements of an arbitrary length vector x (where index n starts at
% 0). The additional elements are equal to the average value of their neighboring
% elements

function y = twice(x)
    if isempty(x)
        y = x;
        return
    end

    mids = (x(1:end-1) + x(2:end))/2;
    y = reshape([x(1:end-1); mids], 1, []);
    y = [y x(end)]; % append last element
end