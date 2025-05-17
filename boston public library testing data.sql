use bostonpubliclibrary;

INSERT INTO Library (LibraryName, phone, email, address)
VALUES
    ('Boston public Library', 1234567890, 'mainlibrary@example.com', '123 Main Street'),
    ('Branch Library 1', 9876543210, 'branch1@example.com', '456 Branch Avenue'),
    ('Branch Library 2', 5555555555, 'branch2@example.com', '789 Branch Road'),
    ('Downtown Library', 1112223333, 'downtown@example.com', '1 Downtown Blvd'),
    ('Northside Library', 4445556666, 'northside@example.com', '50 North Ave'),
    ('West End Library', 7778889999, 'westend@example.com', '100 West End St'),
    ('Eastside Library', 8889990000, 'eastside@example.com', '75 Eastside Rd'),
    ('Southtown Library', 2223334444, 'southtown@example.com', '200 Southtown Ave'),
    ('Hilltop Library', 6667778888, 'hilltop@example.com', '15 Hilltop Way'),
    ('Riverside Library', 9990001111, 'riverside@example.com', '300 Riverside Dr');


INSERT INTO CollectionType (CollectionTypeName)
VALUES
    ('Book'),
    ('DVD'),
    ('Magazine'),
    ('Audiobook'),
    ('eBook'),
    ('CD'),
    ('Newspaper'),
    ('Map'),
    ('Vinyl Record'),
    ('Comic Book');
    

INSERT INTO Contributor (ContributorName, Gender, Country, Age, Education, Major, Job)
VALUES
    ('John Doe', 'Male', 'USA', 35, 'Master\'s', 'English Literature', 'Author'),
    ('Jane Smith', 'Female', 'USA', 42, 'Ph.D.', 'History', 'Historian'),
    ('Michael Johnson', 'Male', 'USA', 28, 'Bachelor\'s', 'Computer Science', 'Software Engineer'),
    ('Emily Williams', 'Female', 'UK', 29, 'Bachelor\'s', 'Biology', 'Biologist'),
    ('Robert Lee', 'Male', 'Canada', 40, 'Ph.D.', 'Physics', 'Physicist'),
    ('Laura Brown', 'Female', 'Australia', 38, 'Master\'s', 'Psychology', 'Psychologist'),
    ('David Miller', 'Male', 'USA', 25, 'Bachelor\'s', 'Chemistry', 'Chemist'),
    ('Emma Wilson', 'Female', 'UK', 33, 'Ph.D.', 'Philosophy', 'Philosopher'),
    ('Christopher Clark', 'Male', 'Canada', 37, 'Master\'s', 'Sociology', 'Sociologist'),
    ('Sophia Turner', 'Female', 'Australia', 22, 'Bachelor\'s', 'Fine Arts', 'Artist');
    
INSERT INTO Publisher (PublisherName, Country, City)
VALUES
    ('Random House', 'USA', 'New York'),
    ('HarperCollins', 'USA', 'San Francisco'),
    ('Penguin Books', 'USA', 'Boston'),
    ('Oxford University Press', 'UK', 'London'),
    ('Allen & Unwin', 'Australia', 'Sydney'),
    ('Simon & Schuster', 'USA', 'Chicago'),
    ('Macmillan Publishers', 'UK', 'Oxford'),
    ('Hachette Livre', 'France', 'Paris'),
    ('Wiley', 'USA', 'Hoboken'),
    ('Bloomsbury Publishing', 'UK', 'London');
    
INSERT INTO Collection (CollectionName, AddingDate, ColleDescript, ISBN, CollectionTypeID)
VALUES
    ('Harry Potter and the Sorcerer\'s Stone', '2023-07-01', 'Fantasy', '978-1234567890', 1),
    ('Introduction to Python', '2023-07-15', 'Programming', '978-0987654321', 1),
    ('National Geographic', '2023-07-10', 'Nature', NULL, 3),
    ('The Great Gatsby', '2023-07-05', 'Classic Fiction', '978-9876543210', 1),
    ('The Lord of the Rings', '2023-07-12', 'Fantasy', '978-5678912345', 1),
    ('Travel Photography', '2023-07-20', 'Photography', NULL, 2),
    ('The New York Times', '2023-07-08', 'News', NULL, 3),
    ('City Map', '2023-07-03', 'Navigation', NULL, 8),
    ('Vinyl Classics', '2023-07-17', 'Music', NULL, 9),
    ('Superhero Adventures', '2023-07-25', 'Comic', NULL, 10);
    
INSERT INTO collection_contributors (ContributorID, CollectionID)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 6),
    (8, 7),
    (9, 8);

INSERT INTO publisher__publish_collection (PublisherID, CollectionID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Item (ItemID, ItemStatus, CollectionID, libraryID)
VALUES
    (1, 'Available', 1, 1),
	(11, 'Available', 1, 1),
    (2, 'Available', 2, 1),
    (3, 'Available', 3, 1),
    (4, 'Available', 4, 1),
    (5, 'Available', 1, 2),
    (6, 'Available', 2, 2),
    (7, 'Available', 3, 2),
    (8, 'Available', 4, 2),
    (9, 'Available', 1, 3),
    (10, 'Available', 2, 3);

INSERT INTO Customer (CustomerName, SSN, email, phone, libraryID)
VALUES
    ('Alice Johnson', 123456789, 'alice@example.com', 5551112222, 1),
    ('Bob Smith', 987654321, 'bob@example.com', 4442223333, 2),
    ('Emily Williams', 567891234, 'emily@example.com', 7774445555, 3),
    ('Michael Brown', 543216789, 'michael@example.com', 8887776666, 4),
    ('Sophia Lee', 987654321, 'sophia@example.com', 9992221111, 5),
    ('Oliver Wilson', 192837465, 'oliver@example.com', 6665554444, 6),
    ('Emma Davis', 456789123, 'emma@example.com', 3331110000, 7),
    ('James Miller', 789123456, 'james@example.com', 2223334444, 8),
    ('Ava Taylor', 135792468, 'ava@example.com', 4445556666, 9),
    ('Alexander Martinez', 246813579, 'alex@example.com', 7778889999, 10);

INSERT INTO LibraryCard (CardStatus, CustomerID)
VALUES
    ('Active', 1),
    ('Active', 2),
    ('Active', 3),
    ('Active', 4),
    ('Active', 5),
    ('Active', 6),
    ('Active', 7),
    ('Active', 8),
    ('Active', 9),
    ('Active', 10);

INSERT INTO Reservation (ReservationDate, ReturnedDate, CardID, ItemID)
VALUES
    ('2023-07-20 10:00:00', NULL, 1, 1),
	('2023-07-25 14:30:00', '2023-07-25 14:30:00', 1, 3),
	('2023-07-05 09:45:00', NULL, 4, 5);
    
INSERT INTO Appointment (AppointmentType, AppointmentStatus, CardID, libraryID)
VALUES
    ('Library Tour', 'Scheduled', 1, 1),
    ('Reference Help', 'Completed', 2, 2),
    ('Computer Class', 'Scheduled', 3, 3),
    ('Resume Workshop', 'Completed', 4, 4),
    ('Story Time', 'Scheduled', 5, 5),
    ('Language Exchange', 'Completed', 6, 6),
    ('Book Club Meeting', 'Scheduled', 7, 7),
    ('Job Fair', 'Completed', 8, 8),
    ('Yoga Class', 'Scheduled', 9, 9),
    ('Art Workshop', 'Completed', 10, 10);

INSERT INTO SpecialEvent (EventName, EventDescription, EventStatus, libraryID)
VALUES
    ('Book Signing', 'Meet the author of Harry Potter', 'Upcoming', 1),
    ('Reading Workshop', 'Improve your reading skills', 'Ongoing', 2),
    ('Photography Exhibition', 'Explore stunning travel photography', 'Upcoming', 3),
    ('Literary Discussion', 'Discuss classic literature with fellow readers', 'Ongoing', 4),
    ('Music Performance', 'Enjoy a live vinyl record performance', 'Upcoming', 5),
    ('Comic Book Day', 'Celebrate your favorite comic characters', 'Ongoing', 6),
    ('City Map Workshop', 'Learn to read and navigate with maps', 'Upcoming', 7),
    ('Art and Crafts Fair', 'Showcase your creative talent', 'Ongoing', 8),
    ('Science Seminar', 'Discover new frontiers in science', 'Upcoming', 9),
    ('Community Outreach', 'Engage with local organizations', 'Ongoing', 10);

INSERT INTO Course (CourseName, CourseDescription, CourseStatus, libraryID)
VALUES
    ('Introduction to Programming', 'Learn the basics of programming', 'Active', 1),
    ('English Literature 101', 'Explore classic works of literature', 'Completed', 3),
    ('Photography Fundamentals', 'Master the art of photography', 'Active', 5),
    ('Financial Literacy', 'Learn essential financial skills', 'Completed', 7),
    ('Yoga for Beginners', 'Relax and rejuvenate with yoga', 'Active', 9),
    ('Painting Workshop', 'Unleash your creativity through painting', 'Completed', 2),
    ('Language Exchange Program', 'Practice language skills with native speakers', 'Active', 4),
    ('History of Art', 'Journey through the world of art history', 'Completed', 6),
    ('Science for Kids', 'Fun and interactive science activities', 'Active', 8),
    ('Cooking Class', 'Discover culinary delights from around the world', 'Completed', 10);

INSERT INTO Department (DepartmentName, email, phone, libraryID)
VALUES
    ('Reference', 'reference@example.com', 6179466491, 1),
	('Children''s Library', 'childrenslibrary@example.com', 1234567890, 1),
    ('Community Learning Center', 'communitycenter@example.com', 2345678901, 1),
    ('Kirstein Business Library & Innovation Center (KBLIC)', 'kblic@example.com', 3456789012, 1),
    ('MassEdCO Education & Career Planning Center', 'massedco@example.com', 4567890123, 1),
    ('Norman B. Leventhal Map & Education Center', 'leventhalmap@example.com', 5678901234, 1),
    ('Special Collections', 'specialcollections@example.com', 6789012345, 1),
    ('Teen Central', 'teencentral@example.com', 7890123456, 1),
    ('Circulation', 'circulation@example.com', 6664443333, 2),
    ('Technology', 'tech@example.com', 5552221111, 3),
    ('Programming', 'programming@example.com', 4446665555, 4),
    ('Children\'s', 'childrens@example.com', 3337778888, 5),
    ('Arts', 'arts@example.com', 2228889999, 6),
    ('Language Services', 'languages@example.com', 1119990000, 7),
    ('History', 'history@example.com', 9990001111, 8),
    ('Science', 'science@example.com', 8881112222, 9),
    ('Community Outreach', 'community@example.com', 7772223333, 10);


INSERT INTO Employee (EmployeeName, ssn, gender, email, phone, EmployeeStatus, DepartmentId)
VALUES
    ('Mary Brown', 111223333, 'Female', 'mary@example.com', 9990001111, 'Active', 1),
    ('James Miller', 444556666, 'Male', 'james@example.com', 2223334444, 'Inactive', 2),
    ('Sophia Lee', 777889999, 'Female', 'sophia@example.com', 5556667777, 'Active', 3),
    ('Michael Johnson', 222334444, 'Male', 'michael@example.com', 8889990000, 'Inactive', 4),
    ('Oliver Wilson', 555667777, 'Male', 'oliver@example.com', 1112223333, 'Active', 5),
    ('Emma Davis', 888990000, 'Female', 'emma@example.com', 4445556666, 'Inactive', 6),
    ('Alexander Martinez', 111222333, 'Male', 'alex@example.com', 7778889999, 'Active', 7),
    ('Ava Taylor', 444555666, 'Female', 'ava@example.com', 3334445555, 'Inactive', 8),
    ('William Clark', 777888999, 'Male', 'william@example.com', 6667778888, 'Active', 9),
    ('Grace Turner', 999000111, 'Female', 'grace@example.com', 1112223333, 'Inactive', 10);

INSERT INTO employee_serve_appointment (AppointmentID, EmployeeID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, libraryID, AppointmentID, CourseID, EventID, DepartmentID)
VALUES
    -- Schedule for Main Library (boston public library)
    (1, '09:00:00', '18:00:00', 1, NULL, NULL, NULL, NULL), -- Monday
    (2, '09:00:00', '18:00:00', 1, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '09:00:00', '18:00:00', 1, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '09:00:00', '18:00:00', 1, NULL, NULL, NULL, NULL), -- Thursday
    (5, '09:00:00', '18:00:00', 1, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Branch Library 1
    (1, '10:00:00', '17:00:00', 2, NULL, NULL, NULL, NULL), -- Monday
    (2, '10:00:00', '17:00:00', 2, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '10:00:00', '17:00:00', 2, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '10:00:00', '17:00:00', 2, NULL, NULL, NULL, NULL), -- Thursday
    (5, '10:00:00', '17:00:00', 2, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Branch Library 2
    (1, '11:00:00', '16:30:00', 3, NULL, NULL, NULL, NULL), -- Monday
    (2, '11:00:00', '16:30:00', 3, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '11:00:00', '16:30:00', 3, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '11:00:00', '16:30:00', 3, NULL, NULL, NULL, NULL), -- Thursday
    (5, '11:00:00', '16:30:00', 3, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Downtown Library
    (1, '08:30:00', '19:30:00', 4, NULL, NULL, NULL, NULL), -- Monday
    (2, '08:30:00', '19:30:00', 4, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '08:30:00', '19:30:00', 4, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '08:30:00', '19:30:00', 4, NULL, NULL, NULL, NULL), -- Thursday
    (5, '08:30:00', '19:30:00', 4, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Northside Library
    (1, '09:00:00', '17:00:00', 5, NULL, NULL, NULL, NULL), -- Monday
    (2, '09:00:00', '17:00:00', 5, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '09:00:00', '17:00:00', 5, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '09:00:00', '17:00:00', 5, NULL, NULL, NULL, NULL), -- Thursday
    (5, '09:00:00', '17:00:00', 5, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for West End Library
    (1, '08:00:00', '18:00:00', 6, NULL, NULL, NULL, NULL), -- Monday
    (2, '08:00:00', '18:00:00', 6, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '08:00:00', '18:00:00', 6, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '08:00:00', '18:00:00', 6, NULL, NULL, NULL, NULL), -- Thursday
    (5, '08:00:00', '18:00:00', 6, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Eastside Library
    (1, '10:00:00', '17:00:00', 7, NULL, NULL, NULL, NULL), -- Monday
    (2, '10:00:00', '17:00:00', 7, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '10:00:00', '17:00:00', 7, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '10:00:00', '17:00:00', 7, NULL, NULL, NULL, NULL), -- Thursday
    (5, '10:00:00', '17:00:00', 7, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Southtown Library
    (1, '09:30:00', '18:30:00', 8, NULL, NULL, NULL, NULL), -- Monday
    (2, '09:30:00', '18:30:00', 8, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '09:30:00', '18:30:00', 8, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '09:30:00', '18:30:00', 8, NULL, NULL, NULL, NULL), -- Thursday
    (5, '09:30:00', '18:30:00', 8, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Hilltop Library
    (1, '08:30:00', '19:00:00', 9, NULL, NULL, NULL, NULL), -- Monday
    (2, '08:30:00', '19:00:00', 9, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '08:30:00', '19:00:00', 9, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '08:30:00', '19:00:00', 9, NULL, NULL, NULL, NULL), -- Thursday
    (5, '08:30:00', '19:00:00', 9, NULL, NULL, NULL, NULL), -- Friday

    -- Schedule for Riverside Library
    (1, '09:00:00', '17:30:00', 10, NULL, NULL, NULL, NULL), -- Monday
    (2, '09:00:00', '17:30:00', 10, NULL, NULL, NULL, NULL), -- Tuesday
    (3, '09:00:00', '17:30:00', 10, NULL, NULL, NULL, NULL), -- Wednesday
    (4, '09:00:00', '17:30:00', 10, NULL, NULL, NULL, NULL), -- Thursday
    (5, '09:00:00', '17:30:00', 10, NULL, NULL, NULL, NULL); -- Friday
    
    
-- Schedule for courses
-- Schedule for Course 1: Introduction to Programming
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '10:00:00', '12:00:00', 1, 1, NULL, NULL, NULL), -- Monday (1 class, 2 hours)
    (6, '09:00:00', '11:00:00', 1, 1, NULL, NULL, NULL); -- Saturday (1 class, 2 hours)

-- Schedule for Course 2: English Literature 101
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '11:00:00', '12:30:00', 2, 3, NULL, NULL, NULL), -- Tuesday (1 class, 1.5 hours)
    (5, '09:00:00', '11:00:00', 2, 3, NULL, NULL, NULL); -- Friday (1 class, 2 hours)

-- Schedule for Course 3: Photography Fundamentals
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '13:00:00', '15:00:00', 3, 5, NULL, NULL, NULL), -- Monday (1 class, 2 hours)
    (6, '14:00:00', '16:00:00', 3, 5, NULL, NULL, NULL); -- Saturday (1 class, 2 hours)

-- Schedule for Course 4: Financial Literacy
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '09:30:00', '11:00:00', 4, 7, NULL, NULL, NULL), -- Tuesday (1 class, 1.5 hours)
    (5, '11:30:00', '13:00:00', 4, 7, NULL, NULL, NULL); -- Friday (1 class, 1.5 hours)

-- Schedule for Course 5: Yoga for Beginners
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '10:30:00', '12:00:00', 5, 9, NULL, NULL, NULL), -- Monday (1 class, 1.5 hours)
    (5, '08:30:00', '10:00:00', 5, 9, NULL, NULL, NULL), -- Friday (1 class, 1.5 hours)
    (6, '09:00:00', '11:00:00', 5, 9, NULL, NULL, NULL), -- Saturday (1 class, 2 hours)
    (7, '11:30:00', '13:00:00', 5, 9, NULL, NULL, NULL); -- Sunday (1 class, 1.5 hours)

-- Schedule for Course 6: Painting Workshop
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '11:00:00', '13:00:00', 6, 2, NULL, NULL, NULL), -- Monday (1 class, 2 hours)
    (4, '14:30:00', '16:30:00', 6, 2, NULL, NULL, NULL); -- Thursday (1 class, 2 hours)

-- Schedule for Course 7: Language Exchange Program
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '09:00:00', '11:00:00', 7, 4, NULL, NULL, NULL), -- Tuesday (1 class, 2 hours)
    (6, '11:00:00', '12:30:00', 7, 4, NULL, NULL, NULL); -- Saturday (1 class, 1.5 hours)

-- Schedule for Course 8: History of Art
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '14:00:00', '15:30:00', 8, 6, NULL, NULL, NULL); -- Monday (1 class, 1.5 hours)

-- Schedule for Course 9: Music Theory
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '16:00:00', '17:30:00', 9, 8, NULL, NULL, NULL), -- Wednesday (1 class, 1.5 hours)
    (6, '14:00:00', '15:00:00', 9, 8, NULL, NULL, NULL); -- Saturday (1 class, 1 hour)

-- Schedule for Course 10: Creative Writing
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (4, '13:00:00', '14:30:00', 10, 10, NULL, NULL, NULL); -- Thursday (1 class, 1.5 hours)



-- schedule for special events
-- Schedule for Special Event 1: Book Launch Party
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '18:00:00', '20:00:00', NULL, 1, NULL, 1, NULL); -- Tuesday

-- Schedule for Special Event 2: Art Exhibition
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (4, '17:00:00', '19:00:00', NULL, 2, NULL, 2, NULL), -- Thursday
    (6, '14:00:00', '16:00:00', NULL, 2, NULL, 2, NULL); -- Saturday

-- Schedule for Special Event 3: Tech Talk
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '19:30:00', '21:00:00', NULL, 3, NULL, 3, NULL); -- Wednesday

-- Schedule for Special Event 4: Storytelling Night
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (5, '19:00:00', '20:30:00', NULL, 5, NULL, 4, NULL), -- Friday
    (7, '18:00:00', '19:30:00', NULL, 5, NULL, 4, NULL); -- Sunday

-- Schedule for Special Event 5: Movie Marathon
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (6, '12:00:00', '18:00:00', NULL, 7, NULL, 5, NULL); -- Saturday

-- Schedule for Special Event 6: Author Talk
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '17:30:00', '19:00:00', NULL, 9, NULL, 6, NULL), -- Monday
    (4, '18:00:00', '20:00:00', NULL, 9, NULL, 6, NULL); -- Thursday

-- Schedule for Special Event 7: Food Tasting
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '13:00:00', '15:00:00', NULL, 10, NULL, 7, NULL), -- Tuesday
    (6, '11:30:00', '13:30:00', NULL, 10, NULL, 7, NULL); -- Saturday

-- Schedule for Special Event 8: Science Fair
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (5, '15:00:00', '17:00:00', NULL, 4, NULL, 8, NULL); -- Friday

-- Schedule for Special Event 9: Music Concert
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '19:00:00', '21:30:00', NULL, 6, NULL, 9, NULL); -- Wednesday

-- Schedule for Special Event 10: Craft Workshop
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (7, '10:00:00', '12:00:00', NULL, 8, NULL, 10, NULL); -- Sunday

-- schedule for appointment
-- Schedule for Appointment 1: Resume Writing Session
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '15:00:00', '16:30:00', NULL, 1, 1, NULL, NULL); -- Tuesday

-- Schedule for Appointment 2: Career Counseling
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '10:00:00', '12:00:00', NULL, 3, 2, NULL, NULL), -- Wednesday
    (5, '14:00:00', '15:30:00', NULL, 3, 2, NULL, NULL); -- Friday

-- Schedule for Appointment 3: Financial Consultation
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '13:30:00', '15:00:00', NULL, 5, 3, NULL, NULL), -- Monday
    (4, '16:00:00', '17:30:00', NULL, 5, 3, NULL, NULL); -- Thursday

-- Schedule for Appointment 4: Health Checkup
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '13:00:00', '14:30:00', NULL, 7, 4, NULL, NULL), -- Wednesday
    (6, '10:00:00', '11:30:00', NULL, 7, 4, NULL, NULL); -- Saturday

-- Schedule for Appointment 5: Academic Advising
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '11:00:00', '12:30:00', NULL, 9, 5, NULL, NULL), -- Tuesday
    (4, '15:00:00', '16:30:00', NULL, 9, 5, NULL, NULL); -- Thursday

-- Schedule for Appointment 6: Language Tutoring
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (1, '16:00:00', '17:30:00', NULL, 2, 6, NULL, NULL), -- Monday
    (3, '18:00:00', '19:30:00', NULL, 2, 6, NULL, NULL); -- Wednesday

-- Schedule for Appointment 7: Computer Help Desk
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (5, '11:00:00', '13:00:00', NULL, 4, 7, NULL, NULL), -- Friday
    (7, '12:00:00', '14:00:00', NULL, 4, 7, NULL, NULL); -- Sunday

-- Schedule for Appointment 8: Writing Assistance
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (2, '13:00:00', '15:00:00', NULL, 6, 8, NULL, NULL), -- Tuesday
    (4, '10:00:00', '12:00:00', NULL, 6, 8, NULL, NULL); -- Thursday

-- Schedule for Appointment 9: Language Conversation Practice
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (3, '16:00:00', '17:30:00', NULL, 8, 9, NULL, NULL); -- Wednesday

-- Schedule for Appointment 10: Job Interview Coaching
INSERT INTO TimeSchedule (DayOfWeek, StartTime, EndTime, CourseID, libraryID, AppointmentID, EventID, DepartmentID)
VALUES
    (6, '13:00:00', '15:00:00', NULL, 10, 10, NULL, NULL); -- Saturday


