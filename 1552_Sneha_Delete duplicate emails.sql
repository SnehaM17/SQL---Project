
CREATE DATABASE email_management;
CREATE TABLE Emails (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15)
);

INSERT INTO Emails (NAME, email, phone) VALUES
('Rahul', 'rahul@example.com', '9839473902'),
('Rohit', 'rohit@example.com', '9883782971'),
('Suresh', 'rahul@example.com', '7654321098'),
('Manish', 'manish@example.com', '8927394619'),
('Amit', 'amit@example.com', '9399303840'),
('Rahul', 'rahul@example.com', '9737466147');

SELECT * FROM Emails;
SELECT email, MIN(id) AS keep_id
FROM Emails
GROUP BY email
HAVING COUNT(email) > 1;

DELETE FROM Emails
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Emails
    GROUP BY email
);
SELECT * FROM Emails;
