function [] = testOne(init_net, j)
global net;
load(init_net);

[clamps, clampVals] = generateClampStates();
    
load('trueDistro.mat');

net.clamp = find(clamps(j, :));
net.clampValue = clampVals(j, net.clamp);

display(net.clamp);
display(net.clampValue);
input('Above are the clamped states');

state = run();

dist = KLDiv(trueDistro(j, :), state);
display(state);
display(trueDistro(j, :));
display(dist);
