CREATE DATABASE db_library

USE db_library

CREATE TABLE tbl_BOOK (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(100,1),
	Title VARCHAR(225) NOT NULL,
); 

CREATE TABLE tbl_PUBLISHER (
	PublisherName VARCHAR(225) NOT NULL PRIMARY KEY,
	PublisherAddress VARCHAR(225) NOT NULL,
	PublisherPhone VARCHAR(30) NOT NULL
);

ALTER TABLE tbl_BOOK 
	ADD PublisherName VARCHAR(225) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
;

CREATE TABLE tbl_LIBRARY_BRANCH (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY (10,1),
	BranchName VARCHAR(100) NOT NULL,
	BranchAddress VARCHAR(225) NOT NULL
);

CREATE TABLE tbl_BORROWER (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (1000,1),
	BorrowerName VARCHAR(225) NOT NULL,
	BorrowerAddress VARCHAR(225) NOT NULL,
	BorrowerPhone VARCHAR(30) NOT NULL,
);

CREATE TABLE tbl_BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(225) NOT NULL
);


CREATE TABLE tbl_BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_book_id_loans FOREIGN KEY REFERENCES tbl_BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_branch_id_loans FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_cardNo_loans FOREIGN KEY REFERENCES tbl_BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


CREATE TABLE tbl_BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_book_id_copies FOREIGN KEY REFERENCES tbl_BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_branch_id_copies FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Copies INT NOT NULL
);

INSERT INTO tbl_PUBLISHER (PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Pearson', '677 Hill Street', '495-987-3549'),
	('Wiley', '3240 Oliver Street', '817-349-5993'),
	('Phoenix Publishing', '3910 Whitman Court', '203-645-4925'),
	('Penguin Random House', '1732 Brookview Drive', '409-276-5331'),
	('Simon & Schuster', '2885 Cambridge Court', '479-754-0269')
;

INSERT INTO tbl_BOOK (Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Pearson'),
	('The Hunger Games', 'Wiley'),
	('The Expanse', 'Phoenix Publishing'),
	('Calvin and Hobbes', 'Penguin Random House'),
	('Game of Thrones', 'Simon & Schuster'),
	('City of Ashes', 'Pearson'),
	('Throne of Glass', 'Wiley'),
	('Harry Potter and the Prisoner of Azkaban', 'Phoenix Publishing'),
	('Memento Mori', 'Penguin Random House'),
	('Carrie', 'Simon & Schuster'),
	('Cujo', 'Pearson'),
	('Forgotten Lore', 'Wiley'),
	('East of Eden', 'Phoenix Publishing'),
	('Ready Player One', 'Penguin Random House'),
	('Brave New World', 'Simon & Schuster'),
	('Turtles All the Way Down', 'Pearson'),
	('The Bear and the Nightingale', 'Wiley'),
	('The Three-Body Problem', 'Phoenix Publishing'),
	('Duck Duck Ghost', 'Penguin Random House'),
	('Sword of Destiny', 'Simon & Schuster')
;

INSERT INTO tbl_LIBRARY_BRANCH (BranchName, BranchAddress)
	VALUES
	('Sharpstown', '3108 Goosetown Drive'),
	('Central', '1548 Radio Park Drive'),
	('Scranton', '3096 Coal Street'),
	('Pawnee', '1652 Midway Road')
;

SELECT * FROM tbl_BOOK

INSERT INTO tbl_BOOK_AUTHORS (BookID, AuthorName)
	VALUES
	('100', 'Mark Davidson'),
	('101', 'Suzanne Collins'),
	('102', 'James S.A. Corey'),
	('103', 'Bill Waterson'),
	('104', 'George R.R. Martin'),
	('105', 'Cliff Nielsen'),
	('106', 'Sarah J. Mass'),
	('107', 'J.K. Rowling'),
	('108', 'Muriel Spark'),
	('109', 'Stephen King'),
	('110', 'Stephen King'),
	('111', 'Martin Lewis'),
	('112', 'John Steinbeck'),
	('113', 'Earnest Cline'),
	('114', 'Aldous Huxley'),
	('115', 'John Green'),
	('116', 'Katherine Arden'),
	('117', 'Liu Cixin'),
	('118', 'Rhys Ford'),
	('119', 'Andrzej Sapkowski')
;

INSERT INTO tbl_BOOK_COPIES (BookID, BranchID, Copies)
	VALUES
	('100', '10', '2'),
	('101', '10', '5'),
	('102', '10', '3'),
	('103', '10', '4'),
	('104', '10', '6'),
	('105', '10', '7'),
	('106', '10', '2'),
	('107', '10', '8'),
	('108', '10', '3'),
	('109', '10', '5'),
	('110', '11', '8'),
	('100', '11', '4'),
	('102', '11', '2'),
	('104', '11', '8'),
	('106', '11', '3'),
	('109', '11', '9'),
	('110', '11', '5'),
	('112', '11', '4'),
	('114', '11', '6'),
	('116', '11', '2'),
	('101', '12', '7'),
	('103', '12', '3'),
	('105', '12', '5'),
	('107', '12', '9'),
	('109', '12', '4'),
	('111', '12', '8'),
	('113', '12', '2'),
	('115', '12', '6'),
	('117', '12', '5'),
	('119', '12', '4'),
	('100', '13', '7'),
	('103', '13', '3'),
	('106', '13', '8'),
	('109', '13', '4'),
	('112', '13', '9'),
	('115', '13', '3'),
	('118', '13', '6'),
	('104', '13', '5'),
	('108', '13', '2'),
	('117', '13', '8')
;

/* Later on while working, I had to run the below queries to fix tbl_BOOK_COPIES up a bit*/

UPDATE tbl_BOOK_COPIES
SET BranchID = 11
WHERE BookID = 109 AND BranchID = 10;

UPDATE tbl_BOOK_COPIES
SET BookID = 101
WHERE BookID = 110 AND BranchID = 11 AND Copies = 5;

/* End Table Fixup */

INSERT INTO tbl_BORROWER (BorrowerName, BorrowerAddress, BorrowerPhone)
	VALUES
	('Steve Rogers', '1775 New Street', '541-284-8964'),
	('Tony Stark', '4734 Lincoln Street', '609-492-8744'),
	('Thor Odinson', '4169 Anmoore Road', '718-743-9260'),
	('Bruce Banner', '1456 Hall Valley Drive', '304-690-3245'),
	('Carol Danvers', '4395 Vesta Drive', '773-685-4097'),
	('Stephen Strange', '328 Chapel Street', '281-642-3872'),
	('Natalia Romanova', '4897 Leisure Lane', '805-567-6856'),
	('Peter Parker', '348 Kildeer Drive', '740-996-4122')
;

INSERT INTO tbl_BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	('102', '10', '1005', '2018-03-17', '2018-03-24'),
	('108', '13', '1001', '2018-03-17', '2018-03-24'),
	('100', '11', '1007', '2018-03-17', '2018-03-24'),
	('103', '12', '1002', '2018-03-17', '2018-03-24'),
	('103', '10', '1005', '2018-03-17', '2018-03-24'),
	('102', '11', '1003', '2018-03-17', '2018-03-24'),
	('101', '12', '1007', '2018-03-17', '2018-03-24'),
	('102', '10', '1001', '2018-03-17', '2018-03-24'),
	('105', '12', '1007', '2018-03-17', '2018-03-24'),
	('104', '13', '1003', '2018-03-17', '2018-03-24'),
	('107', '12', '1005', '2018-03-17', '2018-03-24'),
	('113', '12', '1003', '2018-03-17', '2018-03-24'),
	('114', '11', '1003', '2018-03-17', '2018-03-24'),
	('117', '13', '1005', '2018-03-17', '2018-03-24'),
	('115', '13', '1002', '2018-03-17', '2018-03-24'),
	('105', '12', '1001', '2018-03-19', '2018-03-26'),
	('104', '11', '1006', '2018-03-19', '2018-03-26'),
	('106', '13', '1007', '2018-03-19', '2018-03-26'),
	('107', '12', '1003', '2018-03-19', '2018-03-26'),
	('117', '12', '1001', '2018-03-19', '2018-03-26'),
	('103', '10', '1006', '2018-03-19', '2018-03-26'),
	('119', '12', '1005', '2018-03-19', '2018-03-26'),
	('119', '12', '1003', '2018-03-19', '2018-03-26'),
	('118', '13', '1002', '2018-03-19', '2018-03-26'),
	('110', '11', '1007', '2018-03-19', '2018-03-26'),
	('106', '13', '1004', '2018-03-19', '2018-03-26'),
	('114', '11', '1001', '2018-03-19', '2018-03-26'),
	('116', '11', '1003', '2018-03-19', '2018-03-26'),
	('112', '13', '1005', '2018-03-19', '2018-03-26'),
	('110', '11', '1001', '2018-03-21', '2018-03-28'),
	('108', '10', '1003', '2018-03-21', '2018-03-28'),
	('117', '12', '1004', '2018-03-21', '2018-03-28'),
	('101', '12', '1003', '2018-03-21', '2018-03-28'),
	('108', '10', '1004', '2018-03-21', '2018-03-28'),
	('113', '12', '1007', '2018-03-21', '2018-03-28'),
	('111', '13', '1006', '2018-03-21', '2018-03-28'),
	('115', '12', '1007', '2018-03-24', '2018-03-31'),
	('109', '12', '1003', '2018-03-24', '2018-03-31'),
	('119', '12', '1002', '2018-03-24', '2018-03-31'),
	('109', '13', '1001', '2018-03-24', '2018-03-31'),
	('105', '10', '1005', '2018-03-24', '2018-03-31'),
	('116', '11', '1007', '2018-03-24', '2018-03-31'),
	('111', '13', '1005', '2018-03-24', '2018-03-31'),
	('110', '11', '1004', '2018-03-24', '2018-03-31'),
	('115', '12', '1003', '2018-03-24', '2018-03-31'),
	('112', '13', '1001', '2018-03-24', '2018-03-31'),
	('118', '13', '1007', '2018-03-24', '2018-03-31'),
	('119', '12', '1005', '2018-03-24', '2018-03-31'),
	('114', '11', '1004', '2018-03-24', '2018-03-31'),
	('117', '13', '1005', '2018-03-24', '2018-03-31')
;


/* Stored Procedure to Retrieve Copies of The Lost Tribe Owned by Sharpstown */

CREATE PROC dbo.uspLostTribeSharpstown
AS
SELECT a1.Title AS 'Book', a2.Copies AS 'Copies', a3.BranchName AS 'Branch'
FROM tbl_BOOK a1 
	INNER JOIN	tbl_BOOK_COPIES a2 ON a2.BookID = a1.BookID
	INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
GO

/* Stored Procedure to Retrieve Copies of The Lost Tribe Owned by All Branches */

CREATE PROC dbo.uspLostTribeAllBranches
AS
SELECT a1.Title AS 'Book', a2.Copies AS 'Copies', a3.BranchName AS 'Branch'
FROM tbl_BOOK a1 
	INNER JOIN	tbl_BOOK_COPIES a2 ON a2.BookID = a1.BookID
	INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
WHERE Title = 'The Lost Tribe'
GO

/* Stored Procedure to Retrieve Names of Borrowers Who Do Not Have Books Checked Out */

CREATE PROC dbo.uspNoBooksCheckedOut
AS
SELECT Borrower.BorrowerName AS 'Borrowers With No Books Checked Out:'
FROM tbl_BORROWER AS Borrower
	FULL OUTER JOIN tbl_BOOK_LOANS AS Loans ON Loans.CardNo = Borrower.CardNo
	WHERE Loans.CardNo IS NULL
GO

/* Stored Procedure to Retrieve Book Title/Borrowers Name/Borrower Address for each book from Sharpstown branch */

DROP PROC [dbo].[uspDueAtSharpstownToday]

USE db_library

CREATE PROC dbo.uspDueAtSharpstownToday
AS

DECLARE @results varchar(10)
DECLARE @errorString varchar(100)
DECLARE @todaysDate datetime
SET @todaysDate =(SELECT GETDATE())
SET @errorString = 'There are no books due at Sharpstown today.'

BEGIN TRY
	SET @results = (SELECT COUNT(tbl_BOOK_LOANS.DateDue) FROM tbl_BOOK_LOANS WHERE DateDue = Convert(date,@todaysDate))
		IF @results = 0
			BEGIN
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE IF @results > 0
			BEGIN
				SELECT a1.Title, a3.BorrowerName AS 'Borrower Name:', a3.BorrowerAddress AS 'Borrower Address:'
				FROM tbl_BOOK a1
					INNER JOIN tbl_BOOK_LOANS a2 ON a2.BookID = a1.BookID
					INNER JOIN tbl_BORROWER a3 ON a3.CardNo = a2.CardNo
					INNER JOIN tbl_LIBRARY_BRANCH a4 ON a4.BranchID = a2.BranchID
				WHERE BranchName = 'Sharpstown' and DateDue = Convert(date,@todaysDate)
			;
			END
END TRY

BEGIN CATCH
	SELECT @errorString = ERROR_MESSAGE()
	RAISERROR (@errorString, 10, 1)
END CATCH 
GO

/* Stored Procedure to Retrieve Branch Name and Total Number of Books Loaned */

CREATE PROC dbo.uspBooksLoanedFromAllBranches 
AS
SELECT BranchName, COUNT(*) AS 'Books Loaned:'
 FROM
	(	
		SELECT Branch.BranchName
		FROM tbl_LIBRARY_BRANCH Branch
			INNER JOIN tbl_BOOK_LOANS Loans ON Loans.BranchID = Branch.BranchID
			
	) src
GROUP BY BranchName
GO

/* Stored Procedure to Retrieve Name/Address/Number of Books for People with > 5 books */

CREATE PROC dbo.uspBorrowersWithMoreThan5Books
AS
SELECT BorrowerName, BorrowerAddress, COUNT(*) AS 'Books Currently Checked Out:'
FROM
	(
	SELECT Loans.CardNo, Person.BorrowerName, Person.BorrowerAddress
	FROM tbl_BORROWER AS Person
		INNER JOIN tbl_BOOK_LOANS AS Loans ON Loans.CardNo = Person.CardNo
	) src
GROUP BY CardNo, BorrowerName, BorrowerAddress HAVING COUNT (CardNo) > 5 
GO

SELECT CardNo, COUNT(*) FROM tbl_BOOK_LOANS GROUP BY CardNo HAVING COUNT(CardNo) > 5

/* Books Authored by Stephen King at Central and # of Copies */

CREATE PROC dbo.uspStephenKingCentral
AS
SELECT a1.Title AS 'Book Title', a4.AuthorName as 'Author', a2.Copies, a3.BranchName AS 'Branch'
FROM tbl_BOOK a1 
	INNER JOIN	tbl_BOOK_COPIES a2 ON a2.BookID = a1.BookID
	INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.BranchID = a2.BranchID
	INNER JOIN tbl_BOOK_AUTHORS a4 ON a4.BookID = a1.BookID
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
GO