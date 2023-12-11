--Get trainer’s upcoming sessions
SELECT s.event_id, s.date, e.event_name
FROM Instructs i
JOIN Schedule s ON i.event_id = s.event_id
JOIN EventType e ON s.event_type = e.event_type
WHERE i.trainer_id = <INSERT HERE>
  AND e.event_name = 'Session';