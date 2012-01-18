function [] = accumulateStats()
    [joint state] = test(1, 10, 3, '55/9631.mat', 0, 0, 0, 1, '0');
    pa = joint(2) + joint(4) + joint(6) + joint(8);
    pb = joint(3) + joint(4) + joint(7) + joint(8);
    pc = joint(5) + joint(6) + joint(7) + joint(8);
    pba0c0 = joint(3) / (joint(1) + joint(3));
    pba0c1 = joint(7) / (joint(5) + joint(7));
    pba1c0 = joint(4) / (joint(2) + joint(4));
    pba1c1 = joint(8) / (joint(6) + joint(8));
    display(sprintf('p(a)           = %f', pa));
    display(sprintf('p(b)           = %f', pb));
    display(sprintf('p(c)           = %f', pc));
    display(sprintf('p(a)p(b)p(c)   = %f', pa * pb *pc));
    display(sprintf('p(b=1|a=0,c=0) = %f', pba0c0));
    display(sprintf('p(b=1|a=0,c=1) = %f', pba0c1));
    display(sprintf('p(b=1|a=1,c=0) = %f', pba1c0));
    display(sprintf('p(b=1|a=1,c=1) = %f', pba1c1));