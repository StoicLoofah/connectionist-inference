function setWeights(tune)
global net;

if net.search == 1
    net.weights = randn(net.nUnits, net.nUnits) * net.wtSD + net.wtmean;
    net.extinput = randn(1, net.nUnits) * net.wtSD;
    
    net.pNoise = randn(1, net.nUnits) * .5 + .5;
    net.pNoise(net.pNoise < 0) = 0;
    net.pNoise(net.pNoise > 1) = 1;
    
    net.decay = rand(1, net.nUnits);    
    
elseif net.search == 2
    net.weights = (rand(net.nUnits, net.nUnits) - .5) * 2 + net.wtmean;
    net.extinput = rand(1, net.nUnits);
    net.pNoise = rand(1, net.nUnits) * .5 + .5;
    net.decay = rand(1, net.nUnits);    
    
elseif net.search == 3
    if net.dist < net.prevDist && net.prevDiff - net.diff < .01 && ...
            (~strcmp(net.start, '55/9631.mat') || net.pab > .09 && net.pac < .01 && net.pbc > .04)
        net.prevWeights = net.weights;
        net.prevExtInput = net.extinput;
        net.prevDist = net.dist;
        net.prevPNoise = net.pNoise;
    else
        net.weights = net.prevWeights;
        net.extinput = net.prevExtInput;
        net.dist = net.prevDist;
        net.pNoise = net.prevPNoise;
    end
    bump = randn(1) * net.wtSD / 10;
    if rand() < .1
        index = randi(net.nUnits);
        net.pNoise(index) = net.prevPNoise(index) + bump;
    elseif rand() < (1 / (net.nUnits + 1))
        index = randi(net.nUnits);
        net.extinput(index) = net.extinput(index) + bump;
    else
        x = randi(net.nUnits);
        y = randi(net.nUnits);
        net.weights(x, y) = net.weights(x, y) + bump;
    end
    
elseif net.search == 4
    bump = randn(1) * net.wtSD / 10;
    index = randi(net.nUnits);
    net.decay = net.prevDecay;
    net.decay(index) = net.prevDecay(index) + bump;
    
elseif net.search == 5
    bump = randn(1) * net.wtSD / 10;
    index = randi(net.nUnits);
    net.pNoise = net.prevPNoise;
    net.pNoise(index) = net.prevPNoise(index) + bump;    
        
elseif net.search == 6
    bump = randn(1) * net.wtSD / 10;
    index = randi(net.nUnits);
    net.extinput = net.prevExtInput;
    net.extinput(index) = net.extinput(index) + bump;
    
elseif net.search == 7
    bump = randn(1) * net.wtSD / 10;
    net.weights = net.prevWeights;
    x = randi(net.nUnits);
    y = randi(net.nUnits);
    net.weights(x, y) = net.weights(x, y) + bump;
        
elseif net.search == 8
    net.pNoise(tune) = net.pNoise(tune) + .01;
elseif net.search == 9
    net.extinput(tune) = net.extinput(tune) + .01;
end

