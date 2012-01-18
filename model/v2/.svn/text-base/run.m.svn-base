function [stateDistro] = run()
global net;

stateDistro = zeros(1, 8);

for i=1:net.nSteps * net.nSamples
   
   wtNoise = (net.noiseSD .* randn(net.nUnits, net.nUnits));
   unitNoise = net.noiseSD .* randn(1, net.nUnits);
   
   net.firing = net.act > net.threshold;
   net.firing(net.clamp) = net.clampValue;
   
   net.act(net.firing) = 0;
   
   net.act = net.act + net.firing * (net.weights + wtNoise) + net.extinput + unitNoise;
   
   if mod(i, net.nSteps) == 0
       state = net.firing(1) + 2 * net.firing(2) + 4 * net.firing(3) + 1;
       stateDistro(state) = stateDistro(state) + 1;
   end
   
%    display(net.netinput);
%    display(net.act);
%    input('Wait');
   
end

stateDistro = stateDistro / net.nSamples;

function a = sigmoid(z)
    a = 1.0 ./ (1.0 + exp(-z));
    