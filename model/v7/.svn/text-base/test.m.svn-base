function [joint state] = test(debug, nUnits, nObserved, start, name)
if exist(['results/' name], 'dir') == 0
    mkdir(['results/' name]);
end

global net;
nTrials = 10000;
init(search, nUnits, nObserved, debug, wtmean);
net.start = start;
[clamps, clampVals] = generateClampStates();

load(['results/' start]);
net.prevDist = 10000;
net.dist = 10000;
net.debug = debug;
net.start = start;
net.nSamples = 10000;

net.targetDistro = [.11 .050625 .0275 .061875 .2475 .0675 .165 .27];

fid = -1;
if type ~= 0
    fid = fopen(['summary/' name '.csv'], 'w');
end

nClamps = size(clamps, 1);

dist = zeros(1, nClamps);
for i = 1:nTrials
	if i~= 1
		setWeights(i);
	end

    net.clamp = find(clamps(1, :));
    net.clampValue = [];
    net.joint = run();
    
    conditionals = calculateConditionals(net.targetDistro, clamps, clampVals);
	net.conditionals = conditionals;

    net.state = zeros(nClamps - 1, net.nStates);
    for j = 2:nClamps
        net.clamp = find(clamps(j, :));
        net.clampValue = clampVals(j, net.clamp);

        net.state(j - 1, :) = run();
        dist(j) = KLDiv(conditionals(j - 1, :), net.state(j - 1, :));
    end

    net.dist = sum(dist) + KLDiv(net.targetDistro, net.joint);  

    result = 'success';
	if net.dist < net.prevDist
		save(['results/' name '/' num2str(i) '.mat'], 'net');
		net.prevDist = net.dist;
    else
        result = 'fail';
    end
    
    if net.debug == 1
        display(net.joint);
        display(conditionals);
        display(net.state);
    end

    display(sprintf('%d,%s,%s,%d,%f,%f', i, start, result, degenerate, net.dist, net.diff));
	display(joint);
	fprintf(fid, '%d,%s,%s,%d,%f,%f', i, start, result, degenerate, net.dist, net.diff);
    
end

if fid ~= -1
    fclose(fid);
end

state = net.state;