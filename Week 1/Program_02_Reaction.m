% Week 1 - Program 2 - Reaction Rates

% Temperature range to use (in degrees Kelvin)
temps = (273:353)';

% Calculate rates of first reaction
k1 = calculate_reaction_rates(7e16, 1e5, temps);
load A4.dat;
check("Reaction 1", k1, A4);

% Calculate rates of second reaction
k2 = calculate_reaction_rates(8e16, 1.5e5, temps);
load A5.dat;
check("Reaction 2", k2, A5);

% Plot reaction rates
% Left plot (Standard axes)
subplot(1,2,1);
graph(@plot, 'Linear', temps, k1, k2);

% Right plot (Logarithmic y-axis)
subplot(1,2,2);
graph(@semilogy, 'Logarithmic', temps, k1, k2);

% Calculate ratios of the two reaction rates
k_ratio = k1 ./ k2;
load A6.dat;
check("Reaction Ratios", k_ratio, A6);

%
% Functions
%

% Graph helper function 
function graph(plot_func, label, x, data1, data2)
    plot_func(x, data1);
    title(sprintf('Temperature v. Reaction Rate (%s)', label));
    xlabel('Temperature (K)');
    ylabel('Reaction Rate (s^{-1})');

    hold on;
    plot_func(x, data2);
    legend('Reaction 1', 'Reaction 2');
    hold off;
end

function rates = calculate_reaction_rates(freq, energy, temps)
% CALCULATE_REACTION_RATES   calculate the rates of a chemical reaction at given temperatures
%   rates = CALCULATE_REACTION_RATES(freq, energy, temp) 
%       where freq is the frequency factor, 
%       energy is the activation energy in Joules,
%       and temps is a vector of temperatures in degrees Kelvin

    ideal_gas_constant = 8.314;
    rates = freq * exp(-energy ./ (ideal_gas_constant * temps));
end
