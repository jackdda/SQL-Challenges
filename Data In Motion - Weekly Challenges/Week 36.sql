/* Data in Motion Weekly SQL Challenge #36
Challenge #1:
Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours. Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name. */

SELECT firstname
	, surname
	, ROUND((SUM(slots)/2), -1) AS hours
	, RANK() OVER(ORDER BY ROUND((SUM(slots)/2), -1) DESC) AS rank
FROM cd.bookings b
JOIN cd.members m
	ON b.memid = m.memid
GROUP BY firstname, surname
ORDER BY hours DESC, surname, firstname

/* Challenge #2:
Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour. The output table should consist of the facility id, name, and hours booked, sorted by facility id. Try formatting the hours to two decimal places. */

SELECT b.facid
	, name
	, ROUND(SUM(slots)/2.0, 2) as total_hours
FROM cd.bookings b
JOIN cd.facilities f
	ON b.facid = f.facid
GROUP BY b.facid, name
ORDER BY facid