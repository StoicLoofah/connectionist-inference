function [] = pullData()

files = dir('results');

spiking = [];
%decay = [];
extinput = [];
weight = [];

for i = 1:length(files)
    filename = files(i).name;
    if length(filename) > 2 && strcmp(filename(2:2), '_') && ~strcmp(filename(1:1), '9')
        load(['results/' filename]);
        spiking = [spiking net.pNoise];
        %decay = [decay net.decay];
        extinput = [extinput [net.extinput(1,1);net.extinput(1,2)]];
        weight = [weight sum(sum(net.weights))];
    end
end

figure;
hist(spiking);
title('P of spiking');

% figure;
% hist(decay);
% title('Decay');

figure;
subplot(211) 
hist(extinput(1, :));
title('External Input 1');
subplot(212);
hist(extinput(2, :));
title('External Input 2');

figure;
hist(weight);
title('Weight');
end
