--Display all session notes for Jane Smith
SELECT notes,date
FROM  SessionNotes sn 
JOIN(	
	SELECT e.event_id,s.date
	FROM (
		Select *
		FROM Attends 
		WHERE member_id IN(
			SELECT member_id
			FROM Member
			WHERE fname = 'Jane' AND lname='Smith'
		)
	) e
	JOIN
	Schedule s
	ON e.event_id=s.event_id
) sch
ON sn.session_id = sch.event_id