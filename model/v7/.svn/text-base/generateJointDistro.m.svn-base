function [trueDistro] = generateJointDistro()
    global net;
    trueDistro = zeros(1, 8);
    q = .1;
    nTrueTrials = 100000;
    for i = 1:nTrueTrials
        ab = rand(1,2) < net.prior;
        blah = sum(ab);
        if blah == 2
            c = rand() < 1 - q * q;
        elseif blah == 1
            c = rand() < 1 - q;
        elseif blah == 0
            c = 0;
        end
        state = ab(1) + ab(2) * 2 + c * 4 + 1;
        trueDistro(state) = trueDistro(state) + 1;
    end
    trueDistro = trueDistro / nTrueTrials;
    display(trueDistro); 