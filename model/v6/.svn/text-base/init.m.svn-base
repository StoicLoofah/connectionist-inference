function init(search, nUnits, nObserved, debug, wtmean)

global net;

RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));

net.nSamples = 1000;
net.nSteps = 10;
net.wtSD = .5;

net.nUnits = nUnits;
net.nObserved = nObserved;
net.nStates = 2^nObserved;
net.wtmean = wtmean;

net.threshold = 1;
net.pNoise = ones(1, net.nUnits) * .7;
net.decay = zeros(1, net.nUnits);
net.extinput = zeros(1, net.nUnits);
net.weights = zeros(net.nUnits, net.nUnits);


net.act = zeros(1, net.nUnits); 
net.firing = zeros(1, net.nUnits);

net.clamp = [];
net.clampValue = [];

net.search = search;

if net.search == 3
    net.prevDist = 10000;
    net.dist = 10000;
end

net.debug = debug; % turn off for output and stops
