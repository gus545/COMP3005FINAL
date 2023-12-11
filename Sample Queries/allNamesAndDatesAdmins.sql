--Display names and dates for all admins
SELECT fname, lname, date
FROM (
		SELECT fname, lname, event_id
		FROM (
			Admin a 
			JOIN Manages m 
			ON a.admin_id = m.admin_id
		)
	) a
	JOIN Schedule 
	ON a.event_id=Schedule.event_id