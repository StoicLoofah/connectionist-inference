function netreset(i, clamps, clampVals)
global net;
net.act(:,:) = 0;
net.extinput(:,:) = 0;
net.netinput(:,:) = 0;

%net.extinput(1:2) = invsigmoid(net.prior);

net.threshold = rand(1) * 10;
net.decay = rand(1);
if net.search == 1
    setNormalWeights(net.nUnits, net.wtSD);
    net.extinput = randn(1, net.nUnits) + 3;

elseif net.search == 2
    setUniformWeights(net.nUnits);
    net.extinput = rand(1, net.nUnits) * 10;
elseif net.search == 3
    
end






function z = invsigmoid(a)
z = log(a ./ (1 - a));
    
function [] = setNormalWeights(nUnits, wtSD)
global net;
net.weights = randn(nUnits, nUnits) * wtSD;

function [] = setUniformWeights(nUnits)
global net;
net.weights = (rand(nUnits, nUnits) - .5) * 10;
