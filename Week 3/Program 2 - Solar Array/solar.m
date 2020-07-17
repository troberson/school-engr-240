function [V_mp, V_mp_residual] = solar(T, V_OC, V_mp_guess, es)
% Solar array calculator for voltage with maximum power
%
% Inputs
%   T: scalar or vector of temperatures (in kelvin)
%   V_OC: open circuit voltage (in volts)
%   V_mp_guess: initial guess for the numerical solution of V_mp (in volts)
%   es: stopping criterion for the root finder
%
% Outputs
%   V_mp: column vector of voltages corresponding to the input temperatures T
%   V_mp_residual: column vector of residual values corresponding to the input temperatures T

    % All 4 arguments are required
    narginchk(4, 4);

    % Ensure T is a column vector (or scalar)
    if isrow(T)
        T = T';
    end

    % Constants
    q = 1.6022e-19; % elementary charge (in coulombs)
    k_B = 1.3806e-23; % Boltzmann constant (in joules/kelvin)

    % Vector of thermal voltages (in volts)
    vt = T * k_B / q;

    % Primary Equation
    % vmp: the voltage for maximum power output
    % therm: thermal voltage
    eqn = @(vmp, therm) exp(vmp/therm) * (1 + vmp/therm) - exp(V_OC/therm);

    % Root finder function for the primary equation with a given thermal voltage
    solve = @(therm) fzero(@(vmp) eqn(vmp, therm), ...
        V_mp_guess, optimset('TolX', es));

    % Apply the root finder to each thermal voltage
    [V_mp, V_mp_residual] = arrayfun(solve, vt);
end
