function [joint state] = test(debug, nUnits, nObserved, start, search, wtmean, tune, structure, name)
if exist(['results/' name], 'dir') == 0
    mkdir(['results/' name]);
end

if search == 0
    type = 0; %oneshot test
elseif search <= 2
    type = 1; %random search
elseif search <= 7
    type = 2; %directed search
else
    type = 3; %grid search
end
    
global net;
nTrials = 10000;
init(search, nUnits, nObserved, debug, wtmean);
net.start = start;
[clamps, clampVals] = generateClampStates();

if ~strcmp(start, '')
    load(['results/' start]);
    net.prevDist = 10000;
    net.dist = 10000;
    net.search = search;
    net.debug = debug;
    net.prevDiff = -1;
    net.prevPab = -1;
    net.prevPac = -1;
    net.prevPbc = -1;
    net.start = start;
end

if type == 0
    nTrials = 1;
    net.nSamples = 10000;
elseif type == 2
    net.nSamples = 10000;
    net.prevDecay = net.decay;
    net.prevPNoise = net.pNoise;
    net.prevExtInput = net.extinput;
    net.prevWeights = net.weights;
elseif type == 3
    net.nSamples = 10000;
    nTrials = 100;
    if search == 8
        net.pNoise(tune) = 0;
    elseif search == 9
        net.extinput(tune) = 0;
    end
end

distanceThreshold = .1;
if nObserved == 3
    distanceThreshold = 5;
end

fid = -1;
if type ~= 0
    fid = fopen(['summary/' name '.csv'], 'w');
end

nClamps = size(clamps, 1);

dist = zeros(1, nClamps);
for i = 1:nTrials
    if net.search ~= 0
        setWeights(tune);
    end

    net.clamp = find(clamps(1, :));
    net.clampValue = [];
    joint = run();
    
    degenerate = 0;
    if any(joint == 0)
        degenerate = 1;
    end
    
    conditionals = calculateConditionals(joint, clamps, clampVals);    

    state = zeros(nClamps - 1, net.nStates);
    for j = 2:nClamps
        net.clamp = find(clamps(j, :));
        net.clampValue = clampVals(j, net.clamp);

        state(j - 1, :) = run();
        dist(j) = KLDiv(conditionals(j - 1, :), state(j - 1, :));
    end

    net.dist = sum(dist);  

    if net.nObserved == 2
        net.diff = abs((joint(2) + joint(4)) * (joint(3) + joint(4)) - joint(4));
    elseif net.nObserved == 3
        pa = joint(2) + joint(4) + joint(6) + joint(8);
        pb = joint(3) + joint(4) + joint(7) + joint(8);
        pc = joint(5) + joint(6) + joint(7) + joint(8);
        net.diff = abs(pa * pb * pc - joint(8));
        
        if structure
            net.pab = abs(pa * pb - (joint(4) + joint(8)));
            net.pac = abs(pa * pc - (joint(6) + joint(8)));
            net.pbc = abs(pb * pc - (joint(7) + joint(8)));
            display(sprintf('%f,%f,%f', net.pab, net.pac, net.pbc));
            paired = (net.pab > .03) + (net.pac > .03) + (net.pbc > .03);
        end
    end
    if ~type==1 && net.prevDiff == -1
        net.prevDiff = net.diff;
        if structure
            net.prevPab = net.pab;
            net.prevPac = net.pac;
            net.prevPbc = net.pbc;
        end
    end
    
    result = 'success';
    if degenerate == 0 && net.dist < distanceThreshold && ...
            net.diff > .03 && (~structure || paired == 2)
        if type == 1 || net.search == 3 && net.dist < net.prevDist
            if ~strcmp(start, '55/9631.mat') || net.pab > .09 && net.pac < .01 && net.pbc > .04 
                save(['results/' name '/' num2str(i) '.mat'], 'net');
            end
        end
    else
        result = 'fail';
    end
    
    if net.debug == 1
        display(joint);
        display(conditionals);
        display(state);
    end
    
    display(sprintf('%d,%s,%s,%d,%f,%f', i, start, result, degenerate, net.dist, net.diff));

    if type == 2 && search ~= 3
        field = net.decay;
        if net.search == 5
            field = net.pNoise;
        elseif net.search == 6
            field = net.extinput;
        end
        display([num2str(net.dist) ' ' num2str(field)]);
        fprintf(fid, '%d,%f,%d,%f,', i, net.dist, degenerate, net.diff);
        fprintf(fid, '%d,', field);
        fprintf(fid, '\n');
    elseif type == 1 || search == 3
        fprintf(fid, '%d,%f,%d,%f,\n', i, net.dist, degenerate, net.diff);
    elseif type == 3
        p = joint(2) + joint(4) + joint(6) + joint(8);
        if tune == 2
            p = joint(3) + joint(4) + joint(7) + joint(8);
        elseif tune == 3
            p = joint(5) + joint(6) + joint(7) + joint(8);
        end
        
        if search == 8
           fprintf(fid, '%d,%s,%s,%d,%f,%f,%f,%f\n', i, start, result, degenerate, net.dist, net.diff, p, net.pNoise(tune));
        elseif search == 9
           fprintf(fid, '%d,%s,%s,%d,%f,%f,%f,%f\n', i, start, result, degenerate, net.dist, net.diff, p, net.extinput(tune));
        end
    end
end

if fid ~= -1
    fclose(fid);
end
   
dist = net.dist;
diff = net.diff;