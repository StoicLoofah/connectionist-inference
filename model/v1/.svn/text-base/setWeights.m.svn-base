function setWeights(i)
global net;
%net.extinput(1:2) = invsigmoid(net.prior);

if net.search == 1
    setNormalWeights(net.nUnits, net.wtSD);
    net.extinput = randn(1, net.nUnits);
elseif net.search == 2
    setUniformWeights(net.nUnits);
    net.extinput = (rand(1, net.nUnits) - .5) * 10;
elseif net.search == 3
    if i == 1
        setUniformWeights(net.nUnits);
        net.extinput = (rand(1, net.nUnits) - .5) * 10;
    else
        if net.dist < net.prevDist
            net.prevWeights = net.weights;
            net.prevExtInput = net.extinput;
            net.prevDist = net.dist;
        else
            net.weights = net.prevWeights;
            net.extinput = net.prevExtInput;
            net.dist = net.prevDist;
        end
        bump = randn() * net.wtSD / 100;
        if rand() < (1 / (net.nUnits + 1))
            index = randi(net.nUnits);
            net.extinput(index) = net.extinput(index) + bump;
        else
            x = randi(net.nUnits);
            y = randi(net.nUnits);
            net.weights(x, y) = net.weights(x, y) + bump;
        end
    end
end

function z = invsigmoid(a)
z = log(a ./ (1 - a));
    
function [] = setNormalWeights(nUnits, wtSD)
global net;
net.weights = randn(nUnits, nUnits) * wtSD;

function [] = setUniformWeights(nUnits)
global net;
net.weights = (rand(nUnits, nUnits) - .5) * 10;
