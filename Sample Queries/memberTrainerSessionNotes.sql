--Get trainer’s notes for a member
SELECT sn.notes, s.date
FROM Instructs i
JOIN Schedule s ON i.event_id = s.event_id
JOIN SessionNotes sn ON s.event_id = sn.session_id
JOIN Attends a ON s.event_id = a.event_id
WHERE i.trainer_id = <INSERT HERE>
  AND a.member_id = <INSERT HERE>;