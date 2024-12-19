
CREATE DATABASE ride_analysis;
CREATE TABLE Trips (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    driver_id INT NOT NULL,
    city_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    request_at DATE NOT NULL
);

CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    banned VARCHAR(3) NOT NULL,
    ROLE VARCHAR(10) NOT NULL
);
-- Insert into Trips
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at)
VALUES 
(1, 1, 10, 1, 'completed', '2023-07-12'),
(2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
(3, 3, 12, 6, 'completed', '2023-07-12'),
(4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
(5, 1, 10, 1, 'completed', '2023-07-13'),
(6, 2, 11, 6, 'completed', '2023-07-13'),
(7, 3, 12, 6, 'completed', '2023-07-13'),
(8, 2, 12, 12, 'completed', '2023-07-14'),
(9, 3, 10, 12, 'completed', '2023-07-14'),
(10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');

-- Insert into Users
INSERT INTO Users (users_id, banned, ROLE)
VALUES 
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

--Filter out banned users using the Users table
WITH NonBannedUsers AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No' AND ROLE = 'client'
)
SELECT *
FROM NonBannedUsers;

--Join NonBannedUsers with Trips to get only rides involving non-banned users
SELECT t.*
FROM Trips t
JOIN (
    SELECT users_id
    FROM Users
    WHERE banned = 'No' AND ROLE = 'client'
) AS NonBannedUsers ON t.client_id = NonBannedUsers.users_id;

SELECT *
FROM Trips;



