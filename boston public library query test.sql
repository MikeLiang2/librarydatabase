-- sample query
use bostonpubliclibrary;

-- 1 basic one, list all related boston public library
select * from library;

-- 2 given an collection name, return the status of all such item under the collection 
-- and also return the collection name, publisher name, isbn, contributors name and collection 
-- which library hold this item
SELECT
    col.CollectionName,
    pub.PublisherName,
    col.ISBN,
    GROUP_CONCAT(con.ContributorName) AS Contributors,
    itm.ItemStatus,
    lib.LibraryName AS LibraryHoldingItem
FROM
    Collection col
JOIN
    publisher__publish_collection pub_col ON col.CollectionID = pub_col.CollectionID
JOIN
    Publisher pub ON pub_col.PublisherID = pub.PublisherID
JOIN
    collection_contributors col_con ON col.CollectionID = col_con.CollectionID
JOIN
    Contributor con ON col_con.ContributorID = con.ContributorID
JOIN
    Item itm ON col.CollectionID = itm.CollectionID
JOIN
    Library lib ON itm.libraryID = lib.LibraryID
WHERE
    col.CollectionName = 'Harry Potter and the Sorcerer\'s Stone'
GROUP BY
    col.CollectionName,
    pub.PublisherName,
    col.ISBN,
    itm.ItemStatus,
    lib.LibraryName;
    
-- 3 find the open schedule for one library
SELECT
    ts.DayOfWeek,
    ts.StartTime,
    ts.EndTime
FROM
    TimeSchedule ts
JOIN
    Library lib ON ts.libraryID = lib.LibraryID
WHERE
    lib.LibraryName = 'Boston public library'
    AND ts.AppointmentID IS NULL
    AND ts.CourseID IS NULL
    AND ts.eventid IS NULL
    AND ts.departmentid IS NULL;

-- 4 list all collection type in a library
SELECT DISTINCT ct.CollectionTypeName
FROM CollectionType ct
JOIN Collection c ON ct.CollectionTypeID = c.CollectionTypeID
JOIN Item i ON c.CollectionID = i.CollectionID
JOIN Library l ON i.libraryID = l.LibraryID
WHERE l.LibraryName = 'boston public library';

-- 5 list the recent event and time shedule for a library
SELECT se.EventName, se.EventDescription, se.EventStatus, ts.StartTime, ts.EndTime, dayofweek
FROM SpecialEvent se
JOIN TimeSchedule ts ON se.EventID = ts.EventID
WHERE se.libraryID = (SELECT LibraryID FROM Library WHERE LibraryName = 'boston public library')
ORDER BY ts.StartTime DESC;


-- 6 customer borrow one item, add the reservation, check the change of item status (using trigger)
select * from item;
-- item 2 is available then we borrow that item
INSERT INTO Reservation (ReservationDate, ReturnedDate, CardID, ItemID)
VALUES
    ('2023-08-01 10:00:00', NULL, 1, 2);
select * from item;
select * from reservation;

-- 7 customer return one item, update the reservation, check the change of item status (using trigger)
select * from item;
-- item 2 is ready for return for this time! recall every item is unique！
Update reservation set returneddate = now() where itemid = 2;
select * from item;


-- 8 employee check the appointment they assigned
SELECT A.AppointmentType, TS.DayOfWeek, TS.StartTime, TS.EndTime, E.EmployeeName, A.AppointmentStatus
FROM Appointment A
JOIN TimeSchedule TS ON A.AppointmentID = TS.AppointmentID
JOIN employee_serve_appointment ESA ON A.AppointmentID = ESA.AppointmentID
JOIN Employee E ON ESA.EmployeeID = E.EmployeeID
WHERE E.EmployeeID = 1
	AND A.AppointmentStatus <> 'Completed'
	AND ts.CourseID IS NULL
	AND ts.eventid IS NULL
	AND ts.departmentid IS NULL;
  
-- 9 list all active courses in boston public library and the schedule
select * from course;
SELECT C.CourseName, C.CourseDescription, TS.DayOfWeek, TS.StartTime, TS.EndTime
FROM Course C
JOIN TimeSchedule TS ON C.CourseID = TS.CourseID
WHERE C.CourseStatus = 'Active'
  AND C.libraryid = 1;

-- 10 find the most popular collection in all library (highest reservation number)
SELECT C.CollectionName, COUNT(*) AS ReservationCount
FROM Collection C
JOIN Item I ON C.CollectionID = I.CollectionID
JOIN Reservation R ON I.ItemID = R.ItemID
GROUP BY C.CollectionID
ORDER BY ReservationCount DESC
LIMIT 1;

-- 11 find all collection and collection name from a given contributor
select * from contributor;
SELECT C.CollectionID, C.CollectionName
FROM Collection C
JOIN collection_contributors CC ON C.CollectionID = CC.CollectionID
JOIN Contributor Co ON CC.ContributorID = Co.ContributorID
WHERE Co.ContributorName = 'John Doe';

-- 12 find all collection and collection name from a given publisher
select * from publisher;
SELECT C.CollectionID, C.CollectionName, p.publishername
FROM Collection C
JOIN publisher__publish_collection PC ON C.CollectionID = PC.CollectionID
JOIN Publisher P ON PC.PublisherID = P.PublisherID
WHERE P.PublisherName = 'Wiley';

-- 13 find all unreturned item reserved by a customer
SELECT I.ItemID, I.ItemStatus, C.CollectionName
FROM Item I
JOIN Reservation R ON I.ItemID = R.ItemID
JOIN LibraryCard LC ON R.CardID = LC.CardID
JOIN Collection C ON I.CollectionID = C.CollectionID
WHERE LC.CustomerID = 1 AND R.ReturnedDate IS NULL;

-- 14 count all unreturned item reserved by a customer
SELECT count(cardid) FROM Reservation WHERE Cardid = 1 and ReturnedDate is null;

-- 15 someone borrow more than 5 book, there will be a warning! completed using trigger trg_new_reservation
select * from item;
select * from reservation;
INSERT INTO Reservation (ReservationDate, ReturnedDate, CardID, ItemID)
VALUES
    ('2023-08-01 10:00:00', NULL, 1, 10),
    ('2023-08-01 10:00:00', NULL, 1, 6),
    ('2023-08-01 10:00:00', NULL, 1, 7),
    ('2023-08-01 10:00:00', NULL, 1, 8);
-- rejected when tried to borrow more than 5 books
INSERT INTO Reservation (ReservationDate, ReturnedDate, CardID, ItemID)
VALUES
    ('2023-08-01 10:00:00', NULL, 1, 11);
    
-- 16 someone borrow an unavailable item, there will be a warning! completed using trigger trg_new_reservation
INSERT INTO Reservation (ReservationDate, ReturnedDate, CardID, ItemID)
VALUES
    ('2023-08-01 10:00:00', NULL, 2, 1);

-- 17 someone try to have multiple library card, should rejected
INSERT INTO LibraryCard (CardStatus, CustomerID)
VALUES
    ('Active', 1);