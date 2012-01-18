function [stateDistro] = runSplit()
global net;

stateDistro = zeros(5, 8);
segmentSize = net.nSteps * net.nSamples / 5;

for i=1:net.nSteps * net.nSamples
   
   wtNoise = (net.noiseSD .* randn(net.nUnits, net.nUnits));
   unitNoise = net.noiseSD .* randn(1, net.nUnits);
   
   net.netinput = net.act * (net.weights + wtNoise) + net.extinput + unitNoise;

   vals = rand(1, net.nUnits);
   net.act = vals < sigmoid(net.netinput);
   net.act(net.clamp) = net.clampValue;
   
   if mod(i, net.nSteps) == 0
       state = net.act(1) + 2 * net.act(2) + 4 * net.act(3) + 1;
       stateDistro(floor((i - 1) / segmentSize) + 1, state) = stateDistro(floor((i - 1) / segmentSize) + 1, state) + 1;
   end
end

stateDistro = stateDistro / net.nSamples;

function a = sigmoid(z)
    a = 1.0 ./ (1.0 + exp(-z));
    