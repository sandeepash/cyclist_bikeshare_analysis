-- SQL Query for Station Visit Distribution
-- Objective: Identify the top 50 start and end stations by the number of visits for both casual and member riders.
 
-- Query to find the top 50 start stations by the number of visits
SELECT 
  'January' AS month,
  start_station_name,
  start_lat,
  start_lng,
  SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS start_casual_no_of_visits,
  SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS start_member_no_of_visits,
  COUNT(start_station_name) AS start_total_no_of_visits
FROM cyclist_bikeshare.january
GROUP BY start_station_name, start_lat, start_lng
HAVING start_station_name <> ''
ORDER BY start_total_no_of_visits DESC
LIMIT 50;

-- Query to find the top 50 end stations by the number of visits
SELECT 
  end_station_name,
  end_lat,
  end_lng,
  SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS end_casual_no_of_visits,
  SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS end_member_no_of_visits,
  COUNT(end_station_name) AS end_total_no_of_visits
FROM cyclist_bikeshare.january
GROUP BY end_station_name, end_lat, end_lng
HAVING end_station_name <> ''
ORDER BY end_total_no_of_visits DESC
LIMIT 50;


-- repeat for each month by replacing the name of month 