-- SQL Query for Monthly Ride Pattern Analysis
-- Objective: To analyze the ride patterns by day of the week for each month in 2023.

-- Query to calculate the number of rides for casual and member riders
SELECT
  CASE
    WHEN day_of_week = 1 then 'Sunday' 
    WHEN day_of_week = 2  then 'Monday' 
    WHEN day_of_week = 3 then 'Tuesday' 
    WHEN day_of_week = 4 then 'Wednesday' 
    WHEN day_of_week = 5 then 'Thursday' 
    WHEN day_of_week = 6 then 'Friday' 
    WHEN day_of_week = 7 then 'Saturday'
END
  AS day_of_week_number,
  SUM(CASE
      WHEN member_casual = 'casual' THEN 1
      ELSE 0
  END
    ) AS number_rides_casual,
  SUM(CASE
      WHEN member_casual = 'member' THEN 1
      ELSE 0
  END
    ) AS number_rides_member,
/*  SUM(CASE
      WHEN member_casual is NUll THEN 1
      ELSE 0
  END
    ) AS number_rides_null
*/
FROM
 cyclist_bikeshare.january ;
GROUP BY
  day_of_week
ORDER BY
  day_of_week;
  
-- repeat for each month by replacing the name of month 