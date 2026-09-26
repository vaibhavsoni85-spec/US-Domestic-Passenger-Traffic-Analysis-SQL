-- Project: US Domestic Passenger Traffic Analysis (2021-2025)
-- Query 04: Annual Traffic and Capacity
-- Business question: How did passengers, seats, departures, and
-- utilization change from 2021 to 2025?
-- Purpose: Compare annual passenger demand with the capacity offered.
-- Distance-weighted load factor compares passenger miles with seat miles.



SELECT
  YEAR,
  ROUND(SUM(PASSENGERS) / 1000000, 2) AS passengers_millions,
  ROUND(SUM(SEATS) / 1000000, 2) AS seats_millions,
  SUM(DEPARTURES_PERFORMED) AS departures,
  ROUND(
    100 * SAFE_DIVIDE(
      SUM(PASSENGERS * DISTANCE),
      SUM(SEATS * DISTANCE)
    ),
    2
  ) AS distance_weighted_load_factor_pct
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
GROUP BY YEAR
ORDER BY YEAR;