function [dist] = KLDiv(P, Q)
    Q(Q == 0) = .0001; %hack to toss infinities
    temp =  P.*log(P./Q);
    temp(isnan(temp))=0; % resolving the case when P(i)==0
    dist = sum(temp,2);