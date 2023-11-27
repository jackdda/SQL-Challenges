/* Amazon Web Services (AWS) is powered by fleets of servers. Senior management has requested data-driven solutions to optimize server usage.

Write a query that calculates the total time that the fleet of servers was running. The output should be in units of full days.

Assumptions:

Each server might start and stop several times.
The total time in which the server fleet is running can be calculated as the sum of each server's uptime..*/

With lag_time AS (
  SELECT server_id, session_status
    , status_time - LAG(status_time) OVER(PARTITION BY server_id ORDER BY server_id,status_time) AS lag_time
  FROM server_utilization
  ORDER BY server_id, status_time
)

SELECT EXTRACT(DAY FROM JUSTIFY_HOURS(SUM(lag_time))) AS total_uptime_hours
FROM lag_time
WHERE session_status = 'stop'