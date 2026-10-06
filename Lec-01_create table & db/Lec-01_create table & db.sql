-- Step 1: Create Database
CREATE DATABASE userDB;

-- Step 2: Use Database
USE userDB;

-- Step 3: Create 'users' table
CREATE TABLE users(
    userID INT PRIMARY KEY AUTO_INCREMENT,   -- Auto increment primary key
    username VARCHAR(50) NOT NULL,           -- Correct spelling of 'username'
    useremail VARCHAR(50) UNIQUE,            -- Unique email
    age INT CHECK (age > 18),                -- Age must be greater than 18
    userphone VARCHAR(20)                    -- Phone stored as string (better than INT)
);

-- Step 4: Create 'dept' table
CREATE TABLE dept(
    deptID INT PRIMARY KEY AUTO_INCREMENT,   -- Auto increment primary key
    employee VARCHAR(50) NOT NULL            -- Employee name
);

-- Step 5: Alter 'users' table to add new columns
ALTER TABLE users
    ADD userAddress VARCHAR(100),            -- Add address column
    ADD userStatus TINYINT;                  -- Add status column

-- Step 6: Modify column type
ALTER TABLE users
    MODIFY useremail VARCHAR(150) NOT NULL;  -- Increase email length and make NOT NULL

-- Step 7: Rename column
ALTER TABLE users
    CHANGE COLUMN userAddress address VARCHAR(50); -- Rename userAddress → address

-- Step 8: Drop unnecessary columns
ALTER TABLE users
    DROP COLUMN address,                     -- Drop address column
    DROP COLUMN userStatus;                  -- Drop userStatus column

-- Step 9: Rename table
ALTER TABLE users
    RENAME TO userlist;                      -- Rename table 'users' → 'userlist'

-- Step 10: Insert data into 'userlist'
INSERT INTO userlist (username, useremail, age, userphone)
VALUES
('prottay', 'prottay@gmail.com', 22, '46895'),
('prottay M', 'prottay@ymail.com', 27, '43895'),
('prottayM', 'prottay@yahoomail.com', 24, '35495'),
('Mojumder', 'mojumder@gmail.com', 21, '46892');

-- Delete Query

-- নির্দিষ্ট user delete করা (username দিয়ে)
DELETE FROM userlist
WHERE username = 'PM';

-- নির্দিষ্ট user delete করা (email দিয়ে)
DELETE FROM userlist
WHERE useremail = 'pm@yahoo.com';

-- নির্দিষ্ট user delete করা (ID দিয়ে)
DELETE FROM userlist
WHERE userID = 2;

-- সব row delete করা (টেবিল খালি হবে, structure থাকবে)
DELETE FROM userlist;

-- পুরো টেবিল খালি করে auto_increment reset করতে চাইলে
TRUNCATE TABLE userlist;

-- Update Query

-- নির্দিষ্ট user এর phone number update করা
UPDATE userlist
SET userphone = '01712345678'
WHERE username = 'Mojumder';

-- একসাথে একাধিক column update করা
UPDATE userlist
SET age = 23, useremail = 'pm_new@yahoo.com'
WHERE username = 'ProttayM';

-- নির্দিষ্ট ID দিয়ে update করা
UPDATE userlist
SET username = 'Prottay Mojumder'
WHERE userID = 1;


-- Step 11: Read data from 'userlist'
SELECT * FROM userlist;
