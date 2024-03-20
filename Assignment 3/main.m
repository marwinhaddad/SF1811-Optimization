clc
clear
close

seed = 980520;
[C, mu, n] = getData(seed);

% choose function to plot with E1
Enr = 4;    %%% 2, 3 or 4 %%% 

[STD, MU] = E1(C, mu, n);

plot(STD, MU, color="blue", DisplayName="Exercise 1")
grid on
ylabel('Expected return $\mu(x) = \mu^Tx$','Interpreter','latex')
xlabel('Standard deviation $\sigma(x) = \sqrt{x^TCx}$','Interpreter','latex')


if Enr == 2
    [otherSTD, otherMU] = E2(C, mu, n);
elseif Enr == 3
    [otherSTD, otherMU] = E3(C, mu, n);
elseif Enr == 4
    [otherSTD, otherMU] = E4(C, mu, n);
end

if (2 <= Enr) && (Enr <= 4)
    hold on
    plot(otherSTD, otherMU, Color="r", DisplayName="Exercise " + Enr)
    legend(Location="northwest")
end





















