# Session 18 — Holt–Winters seasonal methods

**Date:** Wednesday, 25 November 2026, 9:00–10:20 — IE Tower, room T-05.02

**Announcements:** this session's dates and deadlines are in [`announcements.md`](announcements.md).

**[fpp3](https://otexts.com/fpp3/index.html):** 8.3

**Slides:** [`session18_slides.html`](session18_slides.html). Notebook:
[`18_A`](18_A_ExpSmoothing_Seasonal.html). Workbook for the homework:
[`18_B`](18_B_ExpSmoothing_Seasonal_students2.xlsx). Script: [`session18_code.R`](session18_code.R),
the notebook's R code in notebook order.

**Focus:** Holt's method plus a seasonal index for each period of the year, with its own smoothing
parameter gamma; additive versus multiplicative seasonality, Session 5's question again; the four
equations and how each is a weighted average; the `k` subindex, which always picks the same season
of the last observed year; the fitted values by hand, with a whole year of starting values; why
multiplicative seasonality goes with multiplicative errors; the holiday-trips example fitted both
ways, the number of parameters, and why `fable` reports `beta` as alpha times beta*; damped
Holt–Winters and the daily pedestrian example.

**R:** `ETS(y ~ error("A") + trend("A") + season("A"))`, `ETS(y ~ error("M") + trend("A") + season("M"))`,
`trend("Ad")`, `components()`, `tidy()`

**Homework:** the `18_B` workbook (Holt–Winters additive by hand) plus the notebook's exercise on
arrivals from New Zealand, questions 1 to 6. Due date in the announcements.

**Outcome:** Student chooses and fits the right Holt–Winters variant and justifies it.

> The `k` subindex in the seasonal component is the easiest thing to get wrong here. Take it slowly.
