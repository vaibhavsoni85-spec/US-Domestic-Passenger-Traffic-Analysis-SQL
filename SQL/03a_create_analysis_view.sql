-- Project: US Domestic Passenger Traffic Analysis (2021-2025)
-- Query 03a: Create Analysis View
-- Purpose: Use the same Class F and data quality rules for all analyses.
-- Zero passengers are allowed if the other values pass the checks.
-- This creates a view; it does not change the source table.

CREATE OR REPLACE VIEW
  `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025` AS
SELECT
  *
FROM `portfolio-project-508812.us_domestic_passenger_traffic.t100_domestic_segments`
WHERE CLASS = 'F'
  AND YEAR BETWEEN 2021 AND 2025
  AND MONTH BETWEEN 1 AND 12
  AND DEPARTURES_PERFORMED > 0
  AND SEATS > 0
  AND PASSENGERS BETWEEN 0 AND SEATS
  AND DISTANCE > 0;