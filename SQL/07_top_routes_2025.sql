-- Project: US Domestic Passenger Traffic Analysis (2021–2025)
-- Query 07: Top 10 routes in 2025
-- Business question: Which directional routes carried the most passengers?
-- Each direction is counted separately (for example, LAX to JFK
-- and JFK to LAX are two routes).




SELECT
  ORIGIN,
  DEST,
  SUM(PASSENGERS) AS total_passengers
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
WHERE YEAR = 2025
GROUP BY ORIGIN, DEST
ORDER BY total_passengers DESC
LIMIT 10;