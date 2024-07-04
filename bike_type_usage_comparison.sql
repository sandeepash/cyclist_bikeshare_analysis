-- SQL Query for Bike Type Usage Comparison
-- Objective: To compare the usage patterns of different bike types (classic, docked, electric) between casual and member riders.

-- Query to calculate the number of rides for casual and member riders by bike type
SELECT
  CASE
    WHEN day_of_week = 1 THEN 'Sunday'
    WHEN day_of_week = 2 THEN 'Monday'
    WHEN day_of_week = 3 THEN 'Tuesday'
    WHEN day_of_week = 4 THEN 'Wednesday'
    WHEN day_of_week = 5 THEN 'Thursday'
    WHEN day_of_week = 6 THEN 'Friday'
    WHEN day_of_week = 7 THEN 'Saturday'
  END AS day_of_week_text,
  SUM(CASE WHEN member_casual = 'casual' AND rideable_type = 'classic_bike' THEN 1 ELSE 0 END) AS count_rideable_type_casual_classic_bike,
  SUM(CASE WHEN member_casual = 'casual' AND rideable_type = 'docked_bike' THEN 1 ELSE 0 END) AS count_rideable_type_casual_docked_bike,
  SUM(CASE WHEN member_casual = 'casual' AND rideable_type = 'electric_bike' THEN 1 ELSE 0 END) AS count_rideable_type_casual_electric_bike,
  SUM(CASE WHEN member_casual = 'member' AND rideable_type = 'classic_bike' THEN 1 ELSE 0 END) AS count_rideable_type_member_classic_bike,
  SUM(CASE WHEN member_casual = 'member' AND rideable_type = 'docked_bike' THEN 1 ELSE 0 END) AS count_rideable_type_member_docked_bike,
  SUM(CASE WHEN member_casual = 'member' AND rideable_type = 'electric_bike' THEN 1 ELSE 0 END) AS count_rideable_type_member_electric_bike
FROM cyclist_bikeshare.january
GROUP BY day_of_week
ORDER BY day_of_week;

-- repeat for each month by replacing the name of month 