-- Project: US Domestic Passenger Traffic Analysis (2021–2025)
-- Query 03b: Analysis view coverage check
-- Purpose: Confirm that the analysis view contains all five years
-- and all 12 months in each year.





SELECT
  YEAR,
  COUNT(*) AS analysis_records,
  COUNT(DISTINCT MONTH) AS months_present,
  SUM(PASSENGERS) AS passengers
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
GROUP BY YEAR
ORDER BY YEAR;