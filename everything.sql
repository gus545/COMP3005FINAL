CREATE TABLE Member (
    member_id SERIAL PRIMARY KEY,
    fName VARCHAR(255),
    lName VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255),
    phone VARCHAR(10) NOT NULL UNIQUE,
    point_balance INT
);


CREATE TABLE Trainer (
    trainer_id SERIAL PRIMARY KEY,
    fName VARCHAR(255),
    lName VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    phone VARCHAR(10) UNIQUE,
    certification INT
);


CREATE TABLE Admin (
    admin_id SERIAL PRIMARY KEY,
    fName VARCHAR(255),
    lName VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    phone VARCHAR(10) UNIQUE,
    access_level INT
);

CREATE TABLE TransactionType (
    trans_type SERIAL PRIMARY KEY,
    trans_name VARCHAR(255) UNIQUE
);

CREATE TABLE Equipment (
	equipment_id SERIAL PRIMARY KEY,
	equipment_type INTEGER,
	status BOOL
);
CREATE TABLE EquipmentType (
    equipment_type SERIAL PRIMARY KEY,
    equipment_name VARCHAR(255) UNIQUE
);
	

CREATE TABLE EventType (
    event_type SERIAL PRIMARY KEY,
    event_name VARCHAR(255)
);


CREATE TABLE Room (
    room_id SERIAL PRIMARY KEY,
    room_type VARCHAR(255) UNIQUE
);

CREATE TABLE Schedule (
    event_id SERIAL PRIMARY KEY ,
    event_type INT REFERENCES EventType(event_type),
    room_id INT REFERENCES Room(room_id),
    date TIMESTAMP
);

CREATE TABLE SessionNotes (
    session_id INT REFERENCES Schedule(event_id),
    notes TEXT,
    PRIMARY KEY (session_id)
);



CREATE TABLE Transaction (
    trans_id SERIAL PRIMARY KEY,
    trans_type INT,
    member_id INT REFERENCES Member(member_id),
    admin_id INT REFERENCES Admin(admin_id),
    value DECIMAL,
    points_spent INT,
    points_earned INT
);





CREATE TABLE Goal (
    goal_id SERIAL PRIMARY KEY UNIQUE,
    member_id INT REFERENCES Member(member_id),
    goal_description TEXT,
    achieved BOOLEAN
);


CREATE TABLE Metrics (
    member_id INT REFERENCES Member(member_id),
    height INT,
    weight INT,
    fitness_level INT,
    PRIMARY KEY (member_id)
);


CREATE TABLE Routine (
    routine_id SERIAL PRIMARY KEY UNIQUE,
    member_id INT REFERENCES Member(member_id),
    routine_desc TEXT,
    performed INT
);


CREATE TABLE Attends (
    member_id INT REFERENCES Member(member_id),
    event_id INT REFERENCES Schedule(event_id),
    PRIMARY KEY (member_id, event_id)
);


CREATE TABLE Manages (
    admin_id INT REFERENCES Admin(admin_id),
    event_id INT REFERENCES Schedule(event_id),
    PRIMARY KEY (admin_id, event_id)
);


CREATE TABLE Maintains (
    admin_id INT REFERENCES Admin(admin_id),
    equipment_id INT REFERENCES Equipment(equipment_id),
    PRIMARY KEY (admin_id, equipment_id)
);


CREATE TABLE Instructs (
    trainer_id INT REFERENCES Trainer(trainer_id),
    event_id INT REFERENCES Schedule(event_id),
    PRIMARY KEY (trainer_id, event_id)
);



INSERT INTO Member (fName, lName, email, address, phone, point_balance) VALUES
    ('John', 'Doe', 'john.doe@example.com', '123 Main St', '6131234567', 100),
    ('Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', '6139876543', 150),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '789 Maple St', '6131112233', 200),
    ('Bob', 'Williams', 'bob.williams@example.com', '101 Pine St', '6134445678', 75);


INSERT INTO Trainer (fName, lName, email, address, phone, certification) VALUES
    ('Tracy', 'Anderson', 'tracy.anderson@example.com', '123 Fitness Blvd', '6131356567', 12345),
    ('Mark', 'Johnson', 'mark.johnson@example.com', '456 Health Lane', '6139172533', 54321),
    ('Sarah', 'Smith', 'sarah.smith@example.com', '789 Wellness Ave', '6132222233', 67890),
    ('Chris', 'Williams', 'chris.williams@example.com', '101 Gym Street', '6135455678', 98765);




INSERT INTO Admin (fName, lName, email, address, phone, access_level) VALUES
    ('Olivia', 'Turner', 'olivia.turner@example.com', '123 Dumbbell St', '6131238587', 1),
    ('Ethan', 'Ramirez', 'ethan.ramirez@example.com', '456 Bench Ln', '6139476443', 1),
    ('Zoey', 'Mitchell', 'zoey.mitchell@example.com', '789 Sweat Ave', '6131212434', 2),
    ('Adrian', 'Parker', 'adrian.parker@example.com', '101 Grind Blvd', '6136465678', 2);



INSERT INTO TransactionType (trans_name) VALUES
    ('Membership Fee'),
    ('Personal Training'),
    ('Class Registration'),
    ('Event Registration');


INSERT INTO EquipmentType (equipment_name) VALUES
    ('Treadmill'),
    ('Bench Press'),
    ('Elliptical Machine'),
    ('Stationary Bike');

INSERT INTO Equipment (equipment_type, status) VALUES
	(1, true),
	(1,false),
	(2,true),
	(2,false),
	(3,false),
	(3,true),
	(4, false),
	(4,true);


INSERT INTO EventType (event_name) VALUES
    ('Class'),
    ('Session'),
    ('Workshop'),
    ('Special Event');


INSERT INTO Room (room_type) VALUES
    ('Cardio Room'),
    ('Free-Weight Room'),
    ('Yoga Studio'),
    ('Multipurpose Room');

INSERT INTO Schedule (event_type, room_id, date) VALUES
    (1, 1, '2023-01-15 10:00:00'),
    (2, 2, '2023-01-20 14:30:00'),
	(2, 1, '2023-01-27 17:00:00'),
    (1, 3, '2023-01-25 18:00:00'),
    (3, 4, '2023-02-01 09:45:00');


INSERT INTO SessionNotes (session_id, notes) VALUES
    (2, 'Good progress today. Focused on upper body strength.'),
    (3, 'Worked on cardio exercises. Member seems more energetic.');



INSERT INTO Transaction (trans_type, member_id, admin_id, value, points_spent, points_earned) VALUES
    (1, 1, 1, 50, 5, 2),
    (2, 2, 2, 100, 10, 5),
    (3, 3, 3, 75, 8, 4),
    (4, 4, 4, 200, 15, 8);


INSERT INTO Goal (member_id, goal_description, achieved) VALUES
    (1, 'Lose 10 pounds by the end of the month', false),
    (2, 'Run a 5K within two months', false),
    (3, 'Increase muscle mass in arms and chest', true),
    (4, 'Improve flexibility through yoga', true);


INSERT INTO Metrics (member_id, height, weight, fitness_level) VALUES
    (1, 170, 70, 8),
    (2, 160, 65, 7),
    (3, 175, 80, 9),
    (4, 155, 55, 6);


INSERT INTO Routine (member_id, routine_desc, performed) VALUES
    (1, 'Cardio workout - 30 minutes', 5),
    (2, 'Weight training - Upper body', 3),
    (3, 'Yoga and stretching', 4),
    (4, 'Interval training - 45 minutes', 6);




INSERT INTO Attends (member_id, event_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1),
    (1, 3),
    (2, 4);




INSERT INTO Manages (admin_id, event_id) VALUES
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4);


INSERT INTO Maintains (admin_id, equipment_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4);


INSERT INTO Instructs (trainer_id, event_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

--Get upcoming events that a member is registered for
SELECT s.event_id, s.date, e.event_name, r.room_type
FROM Attends a
JOIN Schedule s ON a.event_id = s.event_id
JOIN EventType e ON s.event_type = e.event_type
JOIN Room r ON s.room_id = r.room_id
WHERE a.member_id = <INSERT HERE>
ORDER BY s.date;

--Get metrics of a member
SELECT *
FROM Metrics
WHERE member_id = <INSERT HERE>;

--Get a member’s basic information
SELECT *
FROM Member
WHERE member_id = <INSERT HERE>;

--Get all transactions from a member
SELECT t.trans_id, t.trans_type, t.value, t.points_spent, t.points_earned
FROM Transaction t
JOIN Member m ON t.member_id = m.member_id
WHERE m.member_id = 1
ORDER BY t.trans_id DESC;

--Get trainer’s notes for a member
SELECT sn.notes, s.date
FROM Instructs i
JOIN Schedule s ON i.event_id = s.event_id
JOIN SessionNotes sn ON s.event_id = sn.session_id
JOIN Attends a ON s.event_id = a.event_id
WHERE i.trainer_id = <INSERT HERE>
  AND a.member_id = <INSERT HERE>;

--Get trainer’s upcoming sessions
SELECT s.event_id, s.date, e.event_name
FROM Instructs i
JOIN Schedule s ON i.event_id = s.event_id
JOIN EventType e ON s.event_type = e.event_type
WHERE i.trainer_id = <INSERT HERE>
  AND e.event_name = 'Session';



-- Get names of attendees of workshops
SELECT fName,lName
FROM Member
WHERE member_id IN(
	SELECT member_id 
	FROM Attends 
	WHERE event_id IN (
		SELECT event_type 
		FROM EventType e
		WHERE event_name='Workshop'
	)
);
		
-- Get all names and dates of all events in Cardio Rooms
SELECT event_name, date 
FROM EventType e JOIN Schedule s ON e.event_type = s.event_type  
WHERE room_id IN(
	SELECT room_id
	FROM Room
	WHERE room_type='Cardio Room'
);

--Display all transactions from John Doe
SELECT * 
FROM Transaction
WHERE member_id IN(
	SELECT member_id
	FROM Member
	WHERE fName = 'John' AND lName = 'Doe'
)

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

-- DROP TABLE IF EXISTS Instructs;
-- DROP TABLE IF EXISTS Maintains;
-- DROP TABLE IF EXISTS Manages;
-- DROP TABLE IF EXISTS Attends;
-- DROP TABLE IF EXISTS Routine;
-- DROP TABLE IF EXISTS Metrics;
-- DROP TABLE IF EXISTS Goal;
-- DROP TABLE IF EXISTS Transaction;
-- DROP TABLE IF EXISTS SessionNotes;
-- DROP TABLE IF EXISTS Schedule;
-- DROP TABLE IF EXISTS Room;
-- DROP TABLE IF EXISTS EventType;
-- DROP TABLE IF EXISTS EquipmentType;
-- DROP TABLE IF EXISTS Equipment;
-- DROP TABLE IF EXISTS TransactionType;
-- DROP TABLE IF EXISTS Admin;
-- DROP TABLE IF EXISTS Trainer;
-- DROP TABLE IF EXISTS Member;
