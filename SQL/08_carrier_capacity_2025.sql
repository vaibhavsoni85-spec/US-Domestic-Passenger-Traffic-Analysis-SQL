-- Project: US Domestic Passenger Traffic Analysis (2021–2025)
-- Query 08: Carrier capacity versus demand in 2025
-- Business question: Which airlines offered the most seats, and
-- how many passengers did they carry?
-- Passenger-to-seat percentage compares passengers with available seats.
-- It is different from the distance-weighted load factor in Query 04.




SELECT
  UNIQUE_CARRIER AS carrier_code,
  UNIQUE_CARRIER_NAME AS carrier_name,
  ROUND(SUM(SEATS) / 1000000, 2) AS seats_millions,
  ROUND(SUM(PASSENGERS) / 1000000, 2) AS passengers_millions,
  ROUND(100 * SUM(PASSENGERS) / SUM(SEATS), 2)
    AS passenger_to_seat_pct
FROM `portfolio-project-508812.us_domestic_passenger_traffic.vw_scheduled_segments_2021_2025`
WHERE YEAR = 2025
GROUP BY UNIQUE_CARRIER, UNIQUE_CARRIER_NAME
ORDER BY SUM(SEATS) DESC
LIMIT 10;