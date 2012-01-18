function [trueDistro] = generateTrueDistro(clamps, clampVals)
    global net;
    trueDistro = zeros(size(clamps, 1), 8);
    q = .1;
    nTrueTrials = 100000;
    for j = 1:size(clamps, 1)
        i = 1;
        while i < nTrueTrials
            ab = rand(1,2) < net.prior;
            blah = sum(ab);
            if blah == 2
                c = rand() < 1 - q * q;
            elseif blah == 1
                c = rand() < 1 - q;
            elseif blah == 0
                c = 0;
            end
            if (clamps(j, 1) == 0 || clampVals(j, 1) == ab(1)) && ...
                    (clamps(j, 2) == 0 || clampVals(j, 2) == ab(2)) && ...
                    (clamps(j, 3) == 0 || clampVals(j, 3) == c)
                state = ab(1) + ab(2) * 2 + c * 4 + 1;
                trueDistro(j, state) = trueDistro(j, state) + 1;
                i = i + 1;
            end
        end
    end
    trueDistro = trueDistro / nTrueTrials;
    display(trueDistro);  