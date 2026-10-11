# Session 15 — Simple exponential smoothing: the equations

**Date:** Wednesday, 11 November 2026, 9:00–10:20 — IE Tower, room T-05.02

**Announcements:** this session's dates and deadlines are in [`announcements.md`](announcements.md).

**[fpp3](https://otexts.com/fpp3/index.html):** 8.1

**Slides:** [`session15_slides.html`](session15_slides.html). Theory deck, handwritten:
[`15_A`](15_A_SES_Equations.pdf). Notebook: [`15_B`](15_B_SES.html). Workbook for the homework:
[`15_C`](15_C_SES_excel_fittedvals_exercise.xlsx). Script: [`session15_code.R`](session15_code.R),
the notebook's R code in notebook order.

**Focus:** Naive, mean and simple exponential smoothing as three ways of weighting the past; the
weights as a geometric sequence, why they shrink and why they add up to one; the weighted average
form and why the forecasts are flat; the recursive form, where each new observation updates the
previous forecast; the component form with the level, and the initial level as a second parameter;
the fitted values computed by hand from alpha and the initial level; what fitting means: searching
for the alpha and initial level with the smallest sum of squared errors. Then in R: `ETS(A,N,N)`,
the parameters from `tidy()`, the fitted values from `augment()`, the weight on the three most
recent observations, and the forecast.

**R:** `ETS(y ~ error("A") + trend("N") + season("N"))`, `tidy()`, `augment()`, `forecast()`

**Homework:** the `15_C` workbook: the level and fitted-value columns from the given alpha and
initial level, the SSE, a check against R, and two sentences after changing alpha. Due date in
the announcements.

**Outcome:** Student writes the SES recursion, interprets alpha, and reproduces `fable`'s fitted
values from the parameters.

> First of five sessions on exponential smoothing, the model family that uses every tool from
> Sessions 9 to 14. Built by hand first, in a spreadsheet today and in R next session, then with
> `ETS()`.
