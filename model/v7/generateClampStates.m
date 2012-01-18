function [clamps, clampVals] = generateClampStates()
global net;
if net.nObserved == 2
    clamps = [0 0; 1 0; 1 0; 0 1; 0 1];
    clampVals = [-1 -1; 0 -1; 1 -1; -1 0; -1 1];
elseif net.nObserved == 3
    clamps = zeros(19, net.nUnits);
    clampVals = zeros(19, net.nUnits);
    index = 1;
    for i = 1:3
        for j = 1:3
            for k = 1:3
                if i == 1 || j == 1 || k == 1
                    clamps(index, 1:3) = [(i > 1) (j > 1) (k > 1)];
                    clampVals(index, 1:3) = [(i - 2) (j - 2) (k - 2)];
                    index = index + 1;
                end
            end
        end
    end
end