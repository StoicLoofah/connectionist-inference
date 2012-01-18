function [] = makeFigures(num, name)
uiopen(['summary/' num '.csv'],1)
input('waiting');

f = figure;
scatter(data(:,5), data(:,2))
title(['dist v. ' name])
saveas(f, ['distv' name '_' num], 'fig');
f = figure;
scatter(data(:,5), data(:,3))
title(['diff v. ' name])
saveas(f, ['diffv' name '_' num], 'fig');
f = figure;
scatter(data(:,5), data(:,4))
title(['p v. ' name])
saveas(f, ['pv' name '_' num], 'fig');
