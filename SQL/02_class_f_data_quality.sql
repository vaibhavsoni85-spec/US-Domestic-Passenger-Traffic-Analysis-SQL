-- Project: US Domestic Passenger Traffic Analysis (2021-2025)
-- Query 02: Class F Data Quality
-- Purpose: Count zero and invalid values in raw Class F records.
-- Why it matters: These checks explain which records the analysis view
-- can use. One record may appear in more than one check.
-- Note: Zero passengers alone does not exclude a record.

SELECT
  COUNT(*) AS total_records,
  COUNTIF(DEPARTURES_PERFORMED <= 0 OR DEPARTURES_PERFORMED IS NULL)
    AS invalid_departures,
  COUNTIF(SEATS <= 0 OR SEATS IS NULL)
    AS invalid_seats,
  COUNTIF(PASSENGERS = 0) AS zero_passengers,
  COUNTIF(PASSENGERS < 0 OR PASSENGERS IS NULL)
    AS invalid_passengers,
  COUNTIF(PASSENGERS > SEATS) AS passengers_above_seats,
  COUNTIF(DISTANCE <= 0 OR DISTANCE IS NULL)
    AS invalid_distance,
  COUNTIF(MONTH NOT BETWEEN 1 AND 12 OR MONTH IS NULL)
    AS invalid_month
FROM `portfolio-project-508812.us_domestic_passenger_traffic.t100_domestic_segments`
WHERE CLASS = 'F';