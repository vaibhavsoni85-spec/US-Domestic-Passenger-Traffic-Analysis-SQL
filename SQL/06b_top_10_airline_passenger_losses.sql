-- Project: US Domestic Passenger Traffic Analysis (2021–2025)
-- Query 06b: Top 10 airlines with passenger losses
-- Business question: Which airlines lost the most passengers
-- from 2024 to 2025?
-- A negative change means fewer passengers in 2025 than in 2024.




WITH airline_totals AS (
  SELECT
    UNIQUE_CARRIER AS carrier_code,
    MAX(UNIQUE_CARRIER_NAME) AS carrier_name,
    SUM(IF(YEAR = 2024, PASSENGERS, 0)) AS passengers_2024,
    SUM(IF(YEAR = 2025, PASSENGERS, 0)) AS passengers_2025,
    SUM(IF(YEAR = 2024, SEATS, 0)) AS seats_2024,
    SUM(IF(YEAR = 2025, SEATS, 0)) AS seats_2025
  FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
  WHERE YEAR IN (2024, 2025)
  GROUP BY UNIQUE_CARRIER
)

SELECT
  carrier_code,
  carrier_name,
  ROUND(passengers_2024 / 1000000, 2) AS passengers_2024_millions,
  ROUND(passengers_2025 / 1000000, 2) AS passengers_2025_millions,
  ROUND((passengers_2025 - passengers_2024) / 1000000, 2)
    AS passenger_change_millions,
  ROUND(seats_2024 / 1000000, 2) AS seats_2024_millions,
  ROUND(seats_2025 / 1000000, 2) AS seats_2025_millions
FROM airline_totals
WHERE passengers_2025 < passengers_2024
ORDER BY passengers_2025 - passengers_2024 ASC
LIMIT 10;