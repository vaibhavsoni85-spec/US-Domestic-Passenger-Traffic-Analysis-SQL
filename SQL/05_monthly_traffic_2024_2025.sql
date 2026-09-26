-- Project: US Domestic Passenger Traffic Analysis (2021-2025)
-- Query 05: Monthly Traffic, 2024 vs 2025
-- Business question: Which 2025 months drove the change from 2024?
-- Purpose: Compare passengers and offered seats for the same month
-- in each year. The percentage change uses totals before rounding.



SELECT
  MONTH,
  ROUND(SUM(IF(YEAR = 2024, PASSENGERS, 0)) / 1000000, 2)
    AS passengers_2024_millions,
  ROUND(SUM(IF(YEAR = 2025, PASSENGERS, 0)) / 1000000, 2)
    AS passengers_2025_millions,
  ROUND(
    100 * SAFE_DIVIDE(
      SUM(IF(YEAR = 2025, PASSENGERS, 0))
        - SUM(IF(YEAR = 2024, PASSENGERS, 0)),
      SUM(IF(YEAR = 2024, PASSENGERS, 0))
    ),
    2
  ) AS passenger_change_pct,
  ROUND(SUM(IF(YEAR = 2024, SEATS, 0)) / 1000000, 2)
    AS seats_2024_millions,
  ROUND(SUM(IF(YEAR = 2025, SEATS, 0)) / 1000000, 2)
    AS seats_2025_millions
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
WHERE YEAR IN (2024, 2025)
GROUP BY MONTH
ORDER BY MONTH;