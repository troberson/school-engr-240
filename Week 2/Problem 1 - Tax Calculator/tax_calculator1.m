function [total_tax, effective_rate] = tax_calculator1(income)
    % TAX_CALCULATOR    Calculate tax burden and effective rate
    %   [total_tax, effective_rate] = TAX_CALCULATOR(income)

    % General tax info
    deduction = 6300;
    exemption = 4000;
    rates = [0.1 0.15 0.25 0.28 0.33 0.35 0.396];
    brackets = [0 9225 37450 90750 189300 411500 413200];

    total_tax = 0;

    % Taxable income
    taxable_income = income - deduction - exemption;

    % Calculate total tax burden
    % For each tax bracket, add the amount of taxable income in that bracket
    for idx = 1:length(rates)
        cur_bracket = brackets(idx);

        % Check if we're done
        if taxable_income <= cur_bracket
            break;
        end

        % Amount of income in the bracket
        % If we're not at the top tax rate and the taxable income is greater
        % than the bottom of the next bracket, then use the next bracket.
        % Otherwise, we use the amount of taxable income.
        if idx ~= length(rates) && taxable_income > brackets(idx + 1)
            amt = brackets(idx + 1);
        else
            amt = taxable_income;
        end

        % Add the taxed amount for this bracket to the total tax burden
        total_tax = total_tax + rates(idx) * (amt - cur_bracket);
    end

    % Calculate the effective tax rate
    effective_rate = 0;
    if income > 0
        effective_rate = total_tax / income;
    end
end
