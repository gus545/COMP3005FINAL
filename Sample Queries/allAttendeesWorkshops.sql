-- Get names of attendees of workshops
SELECT *
FROM Member m
JOIN Attends a ON m.member_id=a.member_id
JOIN Schedule s ON a.event_id=s.event_id
WHERE s.event_type IN (
	SELECT event_type
	FROM EventType
	WHERE event_name='Workshop'
)