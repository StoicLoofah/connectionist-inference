function [] = test(name, search, nUnits)
    global net;
    init(search, nUnits);

    nTrials = 100000;

    [clamps, clampVals] = generateClampStates();
    
    %generateJointDistro();
    
    %trueDistro = zeros(19, 8);
    %trueDistro = generateTrueDistro(clamps, clampVals);
    load('trueDistro.mat');
    
    %input('stopped');
    
    best = 1;
    bestDist = 10000;
    
    if net.debug == 0
        fid = fopen(['summary/' name '.csv'], 'w');
    end
    
    dist = zeros(1, 19);
    for i = 1:nTrials
        tic;
        
        setWeights(i);
        
        for j = 1:19
            net.clamp = find(clamps(j, :));
            net.clampValue = clampVals(j, net.clamp);
            
            state = run();
            dist(j) = KLDiv(trueDistro(j, :), state);
            if net.debug
                display(state);
                display(dist(j));
                input('Hit enter to continue');
            end
        end
        
        net.dist = sum(dist);

        if net.debug
            display(net.dist);
            input('Hit enter to continue');
        end        
        
        if net.dist < bestDist
            best = i;
            bestDist = sum(dist);
        end
        
        if net.debug == 0
            if best == i || mod(i, 1000) == 0
                save(['results/' name '_' num2str(i) '.mat'], 'net');
            end
            fprintf(fid, '%d,%f,%d,%f,\n', i, net.dist, best, bestDist);
        end
        toc
    end

    
    fclose(fid);
     
    
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
