clc;

% Test problem 1
rng(610729)

% Test problem 2
% rng(YYMMDD) Replace YYMMDD by first group member’s date of birth
% rng(980520)

% Test problem 3 applicable only if two persons in the group
% Test problem 3
% rng(YYMMDD) Replace YYMMDD by second member’s date of birth
% rng(950927)

m=5;
n=12;
A=[randi([0 m],m,n-m) eye(m)];
b=randi([m 2*m],m,1);
c=[-randi([1 n-m],n-m,1) ; zeros(m,1) ];

Basis = [n-m+1:n];

simplex(A, b, c, Basis)