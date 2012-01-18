function [] = checkOverRun()
for i = 1:10
   netreset(1);
   stateDistro = runSplit();
   diffs = zeros(1, 10);
   index = 1;
   for j = 1:4
       for k = j + 1: 5
           diffs(index) = KLDiv(stateDistro(j, :), stateDistro(k, :));
           index = index + 1;
       end
   end
   display(diffs);
end