Problem 1: Tax Calculator
-------------------------

 The simplest income tax calculation for a single person filing federal income
 taxes in the United States involves applying a standard deduction, personal
 exemption and marginal tax rates to the annual income of the taxpayer. For tax
 year 2015, the standard deduction for an individual was $6300 and the personal
 exemption was $4000. The 2015 tax rates vary by income bracket and are given
 in the table below.

| __Tax Rate__ | __Income Range__          |
|-------------:|---------------------------|
|          10% | $0.01 - $9,225.00         |
|          15% | $9,225.01 - $37,450.00    |
|          25% | $37,450.01 - $90,750.00   |
|          28% | $90,750.01 - $189,300.00  |
|          33% | $189,300.01 - $411,500.00 |
|          35% | $411,500.01 - $413,200.00 |
|        39.6% | Over $413,200             |

To compute the tax liability on a given income, first the deduction and
exemption amounts are subtracted, then each portion of the income is taxed at
the marginal rate according to the table. For example, for an income of $51,939
(US median income in 2014) you first apply the standard $6,300 deduction and
the $4,000 exemption to get a taxable income of $51,939-$6,300-$4000 = $41,639.
Then to compute the tax liability you have:

> TotalTax = 0.1 * 9225 + 0.15 * (37400 - 9225) + 0.25 * (41639 - 37450)

which equals $6203.50. You can calculate an "effective tax rate" based on the
original income as

> EffectiveTaxRate = 6203 / 51939

which equals 11.9%.

Write a function that accepts total income as a single input. Your function
should apply the standard deduction and exemption before using the marginal
rates given in the table above to compute the total tax liability. Also compute
the effective tax rate and return its value (decimal value, *not percent*) as
the second output of the function.
