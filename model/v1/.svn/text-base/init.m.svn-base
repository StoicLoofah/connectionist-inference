function init(search, nUnits)

global net;

RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));

net.nUnits = nUnits;
net.nSamples = 1000;
net.nSteps = 10;
net.noiseSD = 1;
net.wtSD = 3;
net.prior = [.7 .4];

net.act = zeros(1, net.nUnits); 
net.extinput = zeros(1, net.nUnits);
net.netinput = zeros(1, net.nUnits);
net.weights = zeros(net.nUnits, net.nUnits);
net.clamp = [];
net.clampValue = [];

net.search = search;

if net.search == 3
    net.prevDist = 10000;
    net.dist = 10000;
    net.prevWeights = zeros(net.nUnits, net.nUnits);
    net.prevExtInput = zeros(1, net.nUnits);
end

net.debug = 0; % turn off for output and stops
