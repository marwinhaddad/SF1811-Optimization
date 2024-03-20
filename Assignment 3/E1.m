function [STD, MU] = E1(C, mu, n)
    
    r = 3:0.25:9;
    e = ones(n, 1);
    lower_bound = zeros(n, 1);
    f = zeros(n, 1);
    Aeq = [mu e]';
    H = 2 * C;
    
    STD = zeros(length(r), 1);
    MU = zeros(length(r), 1);
    for i = 1:length(r)
        beq = [r(i) 1]';
        [x, fval] = quadprog(H, f, [], [], Aeq, beq, lower_bound);
        MU(i) = mu' * x;
        STD(i) = sqrt(fval);
    end
end