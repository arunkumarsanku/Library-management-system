CREATE TABLE StorageSection (
    Storage_Section_ID SERIAL PRIMARY KEY,
    Section_Name VARCHAR(100) NOT NULL
);
CREATE TABLE LibraryAdministrator (
    Admin_ID SERIAL PRIMARY KEY,
    Admin_Name VARCHAR(100) NOT NULL
);
CREATE TABLE Catalog (
    Catalog_ID SERIAL PRIMARY KEY,
    Description TEXT,
    Condition VARCHAR(50),
    Availibility BOOLEAN,
    Admin_ID INT REFERENCES LibraryAdministrator(Admin_ID)
);
CREATE TABLE Publisher (
    ISBN VARCHAR(13) PRIMARY KEY,
    Publisher_Language VARCHAR(50)
);
CREATE TABLE Author (
    Author_Name VARCHAR(100) PRIMARY KEY,
    Author_Genre VARCHAR(50)
);
CREATE TABLE Patron (
    Patron_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    BorrowingHistory TEXT
);
CREATE TABLE Reservation (
    Reservation_ID SERIAL PRIMARY KEY,
    Status VARCHAR(50),
    Reservation_Date DATE,
    Request_Date DATE
);
CREATE TABLE LateFee (
    Late_Fee_ID SERIAL PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL
);
CREATE TABLE TransactionReport (
    Transaction_ID SERIAL PRIMARY KEY,
    Return_Date DATE
);
CREATE TABLE Loan (
    Loan_ID SERIAL PRIMARY KEY,
    Return_Date DATE,
    Due_Date DATE,
    Check_Out_Date DATE,
    Late_Fee_ID INT REFERENCES LateFee(Late_Fee_ID),
    Transaction_ID INT REFERENCES TransactionReport(Transaction_ID)
);
CREATE TABLE Renewal (
    Renewal_ID SERIAL PRIMARY KEY,
    NewDueDate DATE NOT NULL,
    Subscription VARCHAR(255) NOT NULL,
    Transaction_ID INT NOT NULL,
    FOREIGN KEY (Transaction_ID) REFERENCES TransactionReport(Transaction_ID)
);
CREATE TABLE Book (
    Book_ID SERIAL PRIMARY KEY,
    Edition VARCHAR(50),
    Availibility BOOLEAN,
    ISBN VARCHAR(13) REFERENCES Publisher(ISBN),
    Author_Name VARCHAR(100) REFERENCES Author(Author_Name),
    Catalog_ID INT REFERENCES Catalog(Catalog_ID),
    Storage_Section_ID INT REFERENCES StorageSection(Storage_Section_ID),
    Patron_ID INT REFERENCES Patron(Patron_ID),
    Reservation_ID INT REFERENCES Reservation(Reservation_ID),
    Loan_ID INT REFERENCES Loan(Loan_ID)
);
INSERT INTO StorageSection (Section_Name) VALUES ('Fiction');
INSERT INTO StorageSection (Section_Name) VALUES ('Non-Fiction');
INSERT INTO StorageSection (Section_Name) VALUES ('Science');
INSERT INTO StorageSection (Section_Name) VALUES ('History');
INSERT INTO StorageSection (Section_Name) VALUES ('Mystery');
INSERT INTO StorageSection (Section_Name) VALUES ('Biography');
INSERT INTO StorageSection (Section_Name) VALUES ('Self-Help');
INSERT INTO StorageSection (Section_Name) VALUES ('Fantasy');
INSERT INTO StorageSection (Section_Name) VALUES ('Technology');
INSERT INTO StorageSection (Section_Name) VALUES ('Travel');
INSERT INTO StorageSection (Section_Name) VALUES ('Art');
INSERT INTO StorageSection (Section_Name) VALUES ('Cooking');
INSERT INTO StorageSection (Section_Name) VALUES ('Music');
INSERT INTO StorageSection (Section_Name) VALUES ('Health');
INSERT INTO StorageSection (Section_Name) VALUES ('Philosophy');
INSERT INTO StorageSection (Section_Name) VALUES ('Sports');
INSERT INTO StorageSection (Section_Name) VALUES ('Religion');
INSERT INTO StorageSection (Section_Name) VALUES ('Psychology');
INSERT INTO StorageSection (Section_Name) VALUES ('Drama');
INSERT INTO StorageSection (Section_Name) VALUES ('Poetry');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('John Doe');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Jane Smith');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Robert Johnson');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Emily Davis');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Michael Wilson');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Amanda Lee');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Christopher White');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Jessica Brown');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Daniel Miller');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Laura Garcia');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Brian Taylor');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Sarah Martinez');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Richard Anderson');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Ashley Thomas');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('William Hernandez');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Christine Walker');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Matthew Jackson');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Olivia Moore');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Ethan Davis');
INSERT INTO LibraryAdministrator (Admin_Name) VALUES ('Sophia Brown');
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Introduction to Programming', 'Good', true, 1);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('History of Ancient Civilizations', 'Excellent', true, 2);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Machine Learning Essentials', 'Fair', false, 3);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('The Art of Cooking', 'Good', true, 4);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Traveling the World: A Guide', 'Excellent', true, 5);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Financial Management Basics', 'Good', false, 6);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Fictional Mystery Novels Collection', 'Fair', true, 7);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Health and Wellness Handbook', 'Excellent', true, 8);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Art History: From Renaissance to Modern', 'Good', true, 9);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Science Fiction Classics', 'Good', true, 10);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Philosophy Masterpieces', 'Fair', false, 11);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Biography of Influential Leaders', 'Excellent', true, 12);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Classical Music Compositions', 'Good', true, 13);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Self-Help and Motivation Collection', 'Excellent', false, 14);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Drama Play Scripts', 'Fair', true, 15);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Technology Trends and Innovations', 'Good', true, 16);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Religious Texts and Scriptures', 'Excellent', true, 17);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Sports and Fitness Guides', 'Good', false, 18);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Psychology Insights and Theories', 'Good', true, 19);
INSERT INTO Catalog (Description, Condition, Availibility, Admin_ID) VALUES ('Poetry Anthology', 'Excellent', true, 20);
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9781593275846', 'English');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780061120084', 'Spanish');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9781492047846', 'French');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780316529304', 'German');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780141439587', 'Italian');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780525564024', 'Japanese');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780060850524', 'Chinese');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780199535569', 'Russian');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780141983769', 'Portuguese');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9781400033416', 'Arabic');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780735211292', 'Korean');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780385537858', 'Dutch');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780812988406', 'Swedish');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780451493296', 'Greek');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780735212763', 'Turkish');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780307476463', 'Hindi');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780735215870', 'Vietnamese');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780399562455', 'Hebrew');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9781250301697', 'Thai');
INSERT INTO Publisher (ISBN, Publisher_Language) VALUES ('9780735219465', 'Indonesian');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Jane Austen', 'Fiction');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Leo Tolstoy', 'Classics');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Agatha Christie', 'Mystery');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('George Orwell', 'Dystopian');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('J.K. Rowling', 'Fantasy');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Stephen King', 'Horror');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Gabriel Garcia Marquez', 'Magical Realism');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Haruki Murakami', 'Contemporary');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Jane Goodall', 'Non-Fiction');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Malcolm Gladwell', 'Psychology');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Neil Gaiman', 'Fantasy');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Ernest Hemingway', 'Classics');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Maya Angelou', 'Poetry');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Isaac Asimov', 'Science Fiction');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Roald Dahl', 'Childrens Literature');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Yuval Noah Harari', 'History');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Toni Morrison', 'Literary Fiction');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('George R.R. Martin', 'Fantasy');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Arthur Conan Doyle', 'Detective Fiction');
INSERT INTO Author (Author_Name, Author_Genre) VALUES ('Khaled Hosseini', 'Drama');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Lucas Johnson', 'lucas.johnson@example.com', '+1122334455', 'Machine Learning Essentials, Drama Play Scripts');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Sophie Wilson', 'sophie.wilson@example.com', '+1555666777', 'Philosophy Masterpieces, Poetry Anthology');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Adam Brown', 'adam.brown@example.com', '+1333444555', 'Fictional Mystery Novels Collection, Science Fiction Classics');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Emma Davis', 'emma.davis@example.com', '+1223344555', 'Introduction to Programming, Non-Fiction');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Liam Martinez', 'liam.martinez@example.com', '+1777888999', 'Classical Music Compositions, Traveling the World: A Guide');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Zoe Smith', 'zoe.smith@example.com', '+1888777666', 'Health and Wellness Handbook, Fictional Mystery Novels Collection');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Mia Taylor', 'mia.taylor@example.com', '+1999444555', 'Financial Management Basics, Drama Play Scripts');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Henry Garcia', 'henry.garcia@example.com', '+1333444555', 'Art History: From Renaissance to Modern, Poetry Anthology');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Ella White', 'ella.white@example.com', '+1223344555', 'Technology Trends and Innovations, Religious Texts and Scriptures');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Noah Brown', 'noah.brown@example.com', '+1555666777', 'Biography of Influential Leaders, Fantasy Classics');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Ava Wilson', 'ava.wilson@example.com', '+1888777666', 'History of Ancient Civilizations, Drama Play Scripts');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Oliver Johnson', 'oliver.johnson@example.com', '+1223344555', 'Self-Help and Motivation Collection, Philosophy Masterpieces');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Isabella Moore', 'isabella.moore@example.com', '+1777888999', 'Science Fiction Classics, Fictional Mystery Novels Collection');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Jacob Davis', 'jacob.davis@example.com', '+1999444555', 'Health and Wellness Handbook, Technology Trends and Innovations');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Sophia Taylor', 'sophia.taylor@example.com', '+1333444555', 'Religious Texts and Scriptures, Poetry Anthology');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('William Brown', 'william.brown@example.com', '+1223344555', 'Drama Play Scripts, Financial Management Basics');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Amelia Garcia', 'amelia.garcia@example.com', '+1555666777', 'Traveling the World: A Guide, Fictional Mystery Novels Collection');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Benjamin Smith', 'benjamin.smith@example.com', '+1888777666', 'Introduction to Programming, History of Ancient Civilizations');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Charlotte Wilson', 'charlotte.wilson@example.com', '+1777888999', 'Classics, Biography of Influential Leaders');
INSERT INTO Patron (Name, Email, PhoneNumber, BorrowingHistory) VALUES ('Daniel Miller', 'daniel.miller@example.com', '+1999444555', 'Philosophy Masterpieces, Drama Play Scripts');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-15', '2023-12-10');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-16', '2023-12-11');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-17', '2023-12-12');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-18', '2023-12-13');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-19', '2023-12-14');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-20', '2023-12-15');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-21', '2023-12-16');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-22', '2023-12-17');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-23', '2023-12-18');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-24', '2023-12-19');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-25', '2023-12-20');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-26', '2023-12-21');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-27', '2023-12-22');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-28', '2023-12-23');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-29', '2023-12-24');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2023-12-30', '2023-12-25');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2023-12-31', '2023-12-26');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2024-01-01', '2023-12-27');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Pending', '2024-01-02', '2023-12-28');
INSERT INTO Reservation (Status, Reservation_Date, Request_Date) VALUES ('Approved', '2024-01-03', '2023-12-29');
INSERT INTO LateFee (Amount) VALUES (5.00);
INSERT INTO LateFee (Amount) VALUES (7.50);
INSERT INTO LateFee (Amount) VALUES (3.00);
INSERT INTO LateFee (Amount) VALUES (6.00);
INSERT INTO LateFee (Amount) VALUES (4.50);
INSERT INTO LateFee (Amount) VALUES (8.00);
INSERT INTO LateFee (Amount) VALUES (5.50);
INSERT INTO LateFee (Amount) VALUES (9.00);
INSERT INTO LateFee (Amount) VALUES (3.50);
INSERT INTO LateFee (Amount) VALUES (6.50);
INSERT INTO LateFee (Amount) VALUES (4.00);
INSERT INTO LateFee (Amount) VALUES (7.00);
INSERT INTO LateFee (Amount) VALUES (5.00);
INSERT INTO LateFee (Amount) VALUES (8.50);
INSERT INTO LateFee (Amount) VALUES (6.00);
INSERT INTO LateFee (Amount) VALUES (9.50);
INSERT INTO LateFee (Amount) VALUES (4.50);
INSERT INTO LateFee (Amount) VALUES (7.50);
INSERT INTO LateFee (Amount) VALUES (5.50);
INSERT INTO LateFee (Amount) VALUES (8.00);
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-15');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-16');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-17');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-18');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-19');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-20');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-21');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-22');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-23');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-24');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-25');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-26');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-27');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-28');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-29');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-30');
INSERT INTO TransactionReport (Return_Date) VALUES ('2023-12-31');
INSERT INTO TransactionReport (Return_Date) VALUES ('2024-01-01');
INSERT INTO TransactionReport (Return_Date) VALUES ('2024-01-02');
INSERT INTO TransactionReport (Return_Date) VALUES ('2024-01-03');
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-15', '2024-01-15', '2023-12-01', 1, 1);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-16', '2024-01-16', '2023-12-02', 2, 2);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-17', '2024-01-17', '2023-12-03', 3, 3);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-18', '2024-01-18', '2023-12-04', 4, 4);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-19', '2024-01-19', '2023-12-05', 5, 5);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-20', '2024-01-20', '2023-12-06', 6, 6);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-21', '2024-01-21', '2023-12-07', 7, 7);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-22', '2024-01-22', '2023-12-08', 8, 8);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-23', '2024-01-23', '2023-12-09', 9, 9);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-24', '2024-01-24', '2023-12-10', 10, 10);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-25', '2024-01-25', '2023-12-11', 11, 11);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-26', '2024-01-26', '2023-12-12', 12, 12);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-27', '2024-01-27', '2023-12-13', 13, 13);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-28', '2024-01-28', '2023-12-14', 14, 14);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-29', '2024-01-29', '2023-12-15', 15, 15);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-30', '2024-01-30', '2023-12-16', 16, 16);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2023-12-31', '2024-01-31', '2023-12-17', 17, 17);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2024-01-01', '2024-02-01', '2023-12-18', 18, 18);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2024-01-02', '2024-02-02', '2023-12-19', 19, 19);
INSERT INTO Loan (Return_Date, Due_Date, Check_Out_Date, Late_Fee_ID, Transaction_ID) VALUES ('2024-01-03', '2024-02-03', '2023-12-20', 20, 20);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-15', 'Monthly', 1);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-16', 'Monthly', 2);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-17', 'Monthly', 3);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-18', 'Monthly', 4);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-19', 'Monthly', 5);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-20', 'Monthly', 6);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-21', 'Monthly', 7);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-22', 'Monthly', 8);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-23', 'Monthly', 9);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-24', 'Monthly', 10);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-25', 'Monthly', 11);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-26', 'Monthly', 12);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-27', 'Monthly', 13);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-28', 'Monthly', 14);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-02-29', 'Monthly', 15);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-03-01', 'Monthly', 16);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-03-02', 'Monthly', 17);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-03-03', 'Monthly', 18);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-03-04', 'Monthly', 19);
INSERT INTO Renewal (NewDueDate, Subscription, Transaction_ID) VALUES ('2024-03-05', 'Monthly', 20);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Paperback', true, '9781593275846', 'Jane Austen', 1, 1, 1, 1, 1);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Hardcover', true, '9780061120084', 'Leo Tolstoy', 2, 2, 2, 2, 2);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Digital', true, '9781492047846', 'Agatha Christie', 3, 3, 3, 3, 3);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Audiobook', true, '9780316529304', 'George Orwell', 4, 4, 4, 4, 4);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Special Edition', true, '9780141439587', 'J.K. Rowling', 5, 5, 5, 5, 5);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Revised Edition', true, '9780525564024', 'Stephen King', 6, 6, 6, 6, 6);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Collector''s Edition', true, '9780060850524', 'Gabriel Garcia Marquez', 7, 7, 7, 7, 7);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('First Edition', true, '9780199535569', 'Haruki Murakami', 8, 8, 8, 8, 8);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Deluxe Edition', true, '9780141983769', 'Jane Goodall', 9, 9, 9, 9, 9);
INSERT INTO Book (Edition, Availibility, ISBN, Author_Name, Catalog_ID, Storage_Section_ID, Patron_ID, Reservation_ID, Loan_ID)
VALUES ('Limited Edition', true, '9781400033416', 'Malcolm Gladwell', 10, 10, 10, 10, 10);
