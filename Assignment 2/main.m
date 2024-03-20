clc;
format default

%% Primal problem


A_P = [7 10 1 0 0;
      5   3 0 1 0;
      1   2 0 0 1];

b_P = [2800 1400 350]';

c_P = [-135 -115 0 0 0]';

basis_P = [3 4 5];

x = simplex(A_P, b_P, c_P, basis_P)


%% Dual Problem

A_D = [7 5 1 -1 0;
       10 3 2 0 -1];

b_D = [2800 1400 350 0 0]';

c_D = [135 115]';

basis_D = [1 2];

y = simplex(A_D, c_D, b_D, basis_D)

%% Confirmation Primal equals Primal

z_P = -c_P' * x
z_D = b_D' * y
