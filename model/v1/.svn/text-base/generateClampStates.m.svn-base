function [clamps, clampVals] = generateClampStates()
global net;
clamps = zeros(19, net.nUnits);
clampVals = zeros(19, net.nUnits);
index = 1;
for i = 1:3
    for j = 1:3
        for k = 1:3
            if i == 1 || j == 1 || k == 1
                clamps(index, :) = [(i > 1) (j > 1) (k > 1) zeros(1, net.nUnits - 3)];
                clampVals(index, :) = [(i - 2) (j - 2) (k - 2) zeros(1, net.nUnits - 3)];
                index = index + 1;
            end
        end
    end
end
