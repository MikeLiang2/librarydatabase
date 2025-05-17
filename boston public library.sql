/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS bostonpubliclibrary;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE bostonpubliclibrary;
use bostonpubliclibrary;

/*******************************************************************************
   Create tables
********************************************************************************/
Drop table if exists Library;
CREATE TABLE Library (
    LibraryID INT PRIMARY KEY AUTO_INCREMENT,
    LibraryName VARCHAR(40) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(40) NOT NULL,
    address VARCHAR(50) NOT NULL
);

Drop table if exists  CollectionType;
CREATE TABLE CollectionType (
    CollectionTypeID INT PRIMARY KEY AUTO_INCREMENT,
    CollectionTypeName VARCHAR(20) NOT NULL
);

Drop table if exists  Contributor;
CREATE TABLE Contributor (
    ContributorID INT PRIMARY KEY AUTO_INCREMENT,
    ContributorName VARCHAR(20) NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Education VARCHAR(20) NOT NULL,
    Major VARCHAR(20) NOT NULL,
    Job VARCHAR(20) NOT NULL
);

Drop table if exists  Publisher;
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(50) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    City VARCHAR(20) NOT NULL
);

Drop table if exists  Collection;
CREATE TABLE Collection (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    CollectionName VARCHAR(50) NOT NULL,
    AddingDate DATE NOT NULL,
    ColleDescript VARCHAR(20) NOT NULL,
    ISBN VARCHAR(20),
    CollectionTypeID INT NOT NULL,
    CONSTRAINT collection_type_fk FOREIGN KEY (CollectionTypeID)
        REFERENCES CollectionType (CollectionTypeID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists collection_contributors;
CREATE TABLE collection_contributors (
    ContributorID INT NOT NULL,
    CollectionID INT NOT NULL,
    CONSTRAINT contribute_pk PRIMARY KEY (ContributorID , CollectionID),
    CONSTRAINT contribute_collection_fk FOREIGN KEY (CollectionID)
        REFERENCES Collection (CollectionID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT contribute_contributor_fk FOREIGN KEY (ContributorID)
        REFERENCES Contributor (ContributorID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists publisher__publish_collection;
CREATE TABLE publisher__publish_collection (
    PublisherID INT NOT NULL,
    CollectionID INT NOT NULL,
    CONSTRAINT published_pk PRIMARY KEY (PublisherID , CollectionID),
    CONSTRAINT publisher__publish_fk FOREIGN KEY (PublisherID)
        REFERENCES Publisher (PublisherID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT publish_collection_fk FOREIGN KEY (CollectionID)
        REFERENCES Collection (CollectionID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Item;
CREATE TABLE Item (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemStatus CHAR(20) NOT NULL,
    CollectionID INT NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT item_collection_fk FOREIGN KEY (CollectionID)
        REFERENCES Collection (CollectionID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT item_library_fk FOREIGN KEY (libraryID)
        REFERENCES library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Customer;
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName CHAR(30) NOT NULL,
    SSN INT NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone CHAR(10) NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT customer_library_fk FOREIGN KEY (libraryID)
        REFERENCES library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists LibraryCard;
CREATE TABLE LibraryCard (
    CardID INT PRIMARY KEY AUTO_INCREMENT,
    CardStatus CHAR(20) NOT NULL,
    CustomerID INT NOT NULL,
    CONSTRAINT card_customer_fk FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Reservation;
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationDate DATETIME NOT NULL,
    ReturnedDate DATETIME,
    CardID INT NOT NULL,
    ItemID INT NOT NULL,
    CONSTRAINT reservation_item_fk FOREIGN KEY (ItemID)
        REFERENCES Item (ItemID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT reservation_card_fk FOREIGN KEY (CardID)
        REFERENCES LibraryCard (CardID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Appointment;
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentType VARCHAR(40) NOT NULL,
    AppointmentStatus CHAR(10) NOT NULL,
    CardID INT NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT appointment_library_fk FOREIGN KEY (libraryID)
        REFERENCES Library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT appointment_card_fk FOREIGN KEY (CardID)
        REFERENCES LibraryCard (CardID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists SpecialEvent;
CREATE TABLE SpecialEvent (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(50) NOT NULL,
    EventDescription VARCHAR(50) NOT NULL,
    EventStatus VARCHAR(20) NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT event_library_fk FOREIGN KEY (libraryID)
        REFERENCES Library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Course;
CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(40) NOT NULL,
    CourseDescription VARCHAR(50) NOT NULL,
    CourseStatus VARCHAR(20) NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT course_library_fk FOREIGN KEY (libraryID)
        REFERENCES Library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Department;
CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(60) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    libraryID INT NOT NULL,
    CONSTRAINT department_library_fk FOREIGN KEY (libraryID)
        REFERENCES Library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists Employee;
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(30) NOT NULL,
    ssn INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    EmployeeStatus CHAR(20) NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT employee_department_fk FOREIGN KEY (DepartmentId)
        REFERENCES Department (DepartmentId)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists employee_serve_appointment;
CREATE TABLE employee_serve_appointment (
    AppointmentID INT NOT NULL,
    EmployeeID INT NOT NULL,
    CONSTRAINT serve_pk PRIMARY KEY (AppointmentID , EmployeeID),
    CONSTRAINT serve_appointment_fk FOREIGN KEY (AppointmentID)
        REFERENCES Appointment (AppointmentID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT employee_appointment_fk FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

Drop table if exists TimeSchedule;
CREATE TABLE TimeSchedule (
    ScheduleId INT PRIMARY KEY AUTO_INCREMENT,
    DayOfWeek INT NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    libraryID INT,
    AppointmentID INT,
    CourseID INT,
    EventID INT,
    DepartmentID INT,
    CONSTRAINT schedule_library_fk FOREIGN KEY (libraryID)
        REFERENCES library (libraryID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT schedule_appointment_fk FOREIGN KEY (AppointmentID)
        REFERENCES Appointment (AppointmentID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT schedule_course_fk FOREIGN KEY (CourseID)
        REFERENCES Course (CourseID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT schedule_event_fk FOREIGN KEY (EventID)
        REFERENCES SpecialEvent (EventID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT schedule_department_fk FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);


/*Drop table if exists library_have_collection;
CREATE TABLE library_have_collection (
    LibraryID INT not null,
    collectionid INT NOT NULL,
    CONSTRAINT library_collection_pk PRIMARY KEY (LibraryID , collectionid),
    CONSTRAINT library_collection_fk FOREIGN KEY (LibraryID)
        REFERENCES Library (LibraryID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT collection_library_fk FOREIGN KEY (collectionid)
        REFERENCES collection (collectionid)
        ON UPDATE CASCADE ON DELETE CASCADE
);*/

-- trigger when update one item
DROP TRIGGER IF EXISTS trg_new_reservation;
DELIMITER //
CREATE TRIGGER trg_new_reservation
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    CASE 
	 WHEN (
		SELECT COUNT(*) AS TotalReservations FROM Reservation
		WHERE Cardid = new.cardid and new.ReturnedDate is null) > 5 THEN
			set @message = 'reservation over maximum item: 5';
			signal sqlstate 'ERROR' set message_text = @message;
	 WHEN (SELECT itemstatus from item where itemid = new.itemid) = 'Available' THEN
		UPDATE Item
		SET ItemStatus = 'Transferred'
		WHERE ItemID = NEW.ItemID;
     ELSE set @message = 'cannot reserve a unavaible item';
		signal sqlstate 'ERROR' set message_text = @message;
        end case;
END;
//
DELIMITER ;


DROP TRIGGER IF EXISTS trg_item_returned;
DELIMITER //
CREATE TRIGGER trg_item_returned
BEFORE UPDATE ON Reservation
FOR EACH ROW
BEGIN
    IF NEW.ReturnedDate IS NOT NULL THEN
        -- Update the status of the returned item in the Item table to "Available"
        UPDATE Item
        SET ItemStatus = 'Available'
        WHERE ItemID = NEW.ItemID;
    END IF;
END;
//
DELIMITER ;

-- Drop the existing trigger if it exists
DROP TRIGGER IF EXISTS trg_one_library_card_per_customer;

DELIMITER //
CREATE TRIGGER trg_one_library_card_per_customer
BEFORE INSERT ON LibraryCard
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM LibraryCard
        WHERE CustomerID = NEW.CustomerID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'One customer can only have one library card';
    END IF;
END;
//
DELIMITER ;




