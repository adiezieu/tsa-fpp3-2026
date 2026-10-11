# R code from the 19_A_ExpSmoothing_Classification, 19_B_ESmoothing_Model_Selection notebooks, in notebook order.

# 19_A_ExpSmoothing_Classification ====

# 19_B_ESmoothing_Model_Selection ====

# Libraries ----
library(fpp3)

# Automatic ETS model selection ----

## Example 1: national populations ----
fit <- global_economy |>
  mutate(Pop = Population / 1e6) |>
  model(ets = ETS(Pop))

fit

fit |> glance()

fit |> filter(Country == "China") |> tidy()

log_lik <- fit |> glance() |> filter(Country == "China") |> pull(log_lik)

# k = 4 parameters and initial states + 1 residual variance
-2 * log_lik + 2 * (4 + 1)

fit |> glance() |> filter(Country == "China") |> pull(AIC)

fit |>
  filter(Country == "Argentina") |>
  report()

fit |>
  filter(Country == "Argentina") |>
  components() |>
  autoplot()

fc <- fit |>
  forecast(h = 5)

fc

# Forecasting with ETS models ----
aus_holidays <- tourism |>
  filter(Purpose == "Holiday") |>
  summarise(Trips = sum(Trips) / 1e3)

fit <- aus_holidays |>
  model(ETS(Trips))

report(fit)

aus_holidays |>
  model(
    MNA = ETS(Trips ~ error("M") + trend("N") + season("A")),
    MNM = ETS(Trips ~ error("M") + trend("N") + season("M"))
  ) |>
  glance() |>
  select(.model, AICc)

fit |>
  forecast(h = 8) |>
  autoplot(aus_holidays) +
  labs(title = "Australian domestic tourism",
       y = "Overnight trips (millions)")

fit |>
  forecast(h = 8) |>
  hilo(level = 95) |>
  head(4)

# Exercise 2 ----
aus_holidays_total <- tourism |>
  filter(Purpose == "Holiday") |>
  summarise(Trips = sum(Trips))

aus_holidays_total

# Exercise 3 ----
h02 <- PBS |>
  filter(ATC2 == "H02") |>
  summarise(Cost = sum(Cost))

h02 |> autoplot(Cost)
