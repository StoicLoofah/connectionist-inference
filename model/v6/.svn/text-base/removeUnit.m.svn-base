function [net] = removeUnit(start, remove, file)
load(['results/' start]);
nUnits = net.nUnits;
is = [1:(remove - 1) (remove + 1):nUnits];
net.pNoise = net.pNoise(is);
net.decay = net.decay(is);
net.extinput = net.extinput(is);
net.weights = net.weights(is, is);
net.act = zeros(1, nUnits - 1);
net.firing = zeros(1, nUnits - 1);
net.nUnits = net.nUnits - 1;
save(['results/' file], 'net');