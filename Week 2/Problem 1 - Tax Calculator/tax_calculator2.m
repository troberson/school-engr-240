function [total_tax, effective_rate] = tax_calculator2(income)
    % TAX_CALCULATOR    Calculate tax burden and effective rate
    %   [total_tax, effective_rate] = TAX_CALCULATOR(income)

    % General tax info
    deduction = 6300;
    exemption = 4000;

    rates = [0.1 0.15 0.25 0.28 0.33 0.35 0.396];
    brackets = [0 9225 37450 90750 189300 411500 413200];

    % Taxable income
    taxable_income = income - deduction - exemption;

    % === Calculate total tax burden ===

    % Find the highest full bracket below the taxable income amount
    full_idx = find(brackets > taxable_income, 1) - 1;

    % For taxable income in excess of the top bracket, use the top marginal rate
    if isempty(full_idx)
        full_idx = length(rates);

    % For incomes in the lowest bracket, use the lowest marginal rate
    elseif full_idx == 0
        full_idx = 1;

    % Income below taxable amount, RETURN
    elseif full_idx == -1
        total_tax = 0;
        effective_rate = 0;
        return;
    end

    % Calculate tax burden for all full brackets and for the bracket that
    % includes the taxable income amount
    total_tax = sum(rates(1:full_idx) .* ...
        [diff(brackets(1:full_idx)), ...
         (taxable_income - brackets(full_idx))]);


    % === Calculate the effective tax rate ===
    effective_rate = total_tax / income;
end
