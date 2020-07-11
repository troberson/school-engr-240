% Week 1 - Program 1 - Spring Calculations

% Observed forces (in Newtons) and distances (in meters)
F = [14 18 8 9 13];
x = [0.013 0.020 0.009 0.010 0.012];

% Calculate spring constants (in Newtons/meter)
k = F ./ x;
load A1.dat;
check("Spring Constant", k, A1);

% Calculate potential energies (in Joules)
U = 0.5 * k .* x .^ 2;
load A2.dat;
check("Potential Energy", U, A2);

% Maximum and minimum potential energies
Umax_min = [max(U), min(U)];
load A3.dat;
check("U Max and Min", Umax_min, A3);
