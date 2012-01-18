function [] = testall()

names = [66:81];
for j = 1:length(names)
    name = num2str(names(j));

    files = dir(['results/' name]);

    for i = 1:length(files)
        filename = files(i).name;
        if length(filename) > 2
            test(0, 10, 3, [name '/' filename], 0, 0, 0, 1, '0');
            load(['results/' name '/' filename]);
            net.decay = net.decay / net.threshold;
            net.weights = net.weights / net.threshold;
            net.extinput = net.extinput / net.threshold;
            net.threshold = 1;

    %         if dist > .1 || diff < .03
    %             input('delete?');
    %             delete(['results/' filename]);
    %         end

            %display(net.weights);
            %display(net.threshold);
            %display(net.extinput);
            %display(net.decay);
        end
    end
end