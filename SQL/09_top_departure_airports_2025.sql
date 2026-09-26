-- Project: US Domestic Passenger Traffic Analysis (2021–2025)
-- Query 09: Top 10 departure airports in 2025
-- Business question: Which airports had the most departing passengers?
-- Each passenger is counted at the airport where their segment began.



SELECT
  ORIGIN AS airport_code,
  ROUND(SUM(PASSENGERS) / 1000000, 2)
    AS departing_passengers_millions
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
WHERE YEAR = 2025
GROUP BY ORIGIN
ORDER BY SUM(PASSENGERS) DESC
LIMIT 10;