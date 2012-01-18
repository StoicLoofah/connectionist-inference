function [stateDistro] = run()
global net;
stateDistro = zeros(1, net.nStates);

net.act(:,:) = 2;
net.firing(:,:) = 0;

for i=1:net.nSteps * net.nSamples
    net.firing = net.act > net.threshold;
    net.firing(net.clamp) = net.clampValue;
    net.act(net.firing) = 0;
    net.act = net.act + net.firing * net.weights + (net.extinput .* (rand(1, net.nUnits) < net.pNoise));
    %net.act = net.act - net.decay;
    if mod(i, net.nSteps) == 0
        state = sum(net.firing(1:net.nObserved) .* (2 .^ (0:net.nObserved - 1))) + 1;
        stateDistro(state) = stateDistro(state) + 1;
    end
    
     if net.debug
%         display(net.firing .* net.weights(:,7)');
        display(net.firing);
        display(net.act);
        input('next');
     end
end

stateDistro = stateDistro / net.nSamples;