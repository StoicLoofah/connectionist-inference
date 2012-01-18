function [conditionals] = calculateConditionals(state, clamps, clampVals)
    global net;
    assignments = zeros(net.nStates, net.nObserved);
    for i = 1:net.nStates
        temp = i - 1;
        for j = net.nObserved:-1:1
            if temp >= 2 ^ (j-1)
                assignments(i,j) = 1;
                temp = temp - 2 ^ (j -1);
            end
        end
    end

    conditionals = zeros(size(clamps,1) - 1, net.nStates);
    for i = 1:size(conditionals, 1)
        total = 0;
        for j = 1:net.nStates
            a = assignments(j,:);
            b = clampVals(i + 1,:);
            locs = find(clamps(i + 1, :));
            if all(a(locs) == b(locs))
                conditionals(i, j) = state(j);
                total = total + state(j);
            end
        end
        conditionals(i, :) = conditionals(i, :) / total;
    end

end