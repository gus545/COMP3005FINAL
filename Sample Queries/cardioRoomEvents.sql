-- Get all names and dates of all events in Cardio Rooms
SELECT event_name, date 
FROM EventType e JOIN Schedule s ON e.event_type = s.event_type  
WHERE room_id IN(
	SELECT room_id
	FROM Room
	WHERE room_type='Cardio Room'
);