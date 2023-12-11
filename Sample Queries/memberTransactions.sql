--Get all transactions from a member
SELECT t.trans_id, t.trans_type, t.value, t.points_spent, t.points_earned
FROM Transaction t
JOIN Member m ON t.member_id = m.member_id
WHERE m.member_id = 1
ORDER BY t.trans_id DESC;