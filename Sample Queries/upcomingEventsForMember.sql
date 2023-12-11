--Get upcoming events that a member is registered for
SELECT s.event_id, s.date, e.event_name, r.room_type
FROM Attends a
JOIN Schedule s ON a.event_id = s.event_id
JOIN EventType e ON s.event_type = e.event_type
JOIN Room r ON s.room_id = r.room_id
WHERE a.member_id = <INSERT HERE>
ORDER BY s.date;