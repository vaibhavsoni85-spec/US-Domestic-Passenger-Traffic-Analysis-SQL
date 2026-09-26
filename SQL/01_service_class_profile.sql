-- Project: US Domestic Passenger Traffic Analysis (2021-2025)
-- Query 01: Service Class Profile
-- Purpose: Compare the service classes in the source data.
-- Why it matters: This check helps explain why the analysis uses Class F.
-- Source table: portfolio-project-508812.us_domestic_passenger_traffic.t100_domestic_segments


SELECT
  CLASS AS service_class,
  COUNT(*) AS records,
  SUM(PASSENGERS) AS passengers,
  SUM(SEATS) AS seats,
  SUM(DEPARTURES_PERFORMED) AS departures
FROM `portfolio-project-508812.us_domestic_passenger_traffic.t100_domestic_segments`
GROUP BY CLASS
ORDER BY passengers DESC;