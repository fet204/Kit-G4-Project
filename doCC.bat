-dropdb group4
-dropdb GCCA

CREATEDB group4

CREATE TABLE Person(
	UserID INTEGER PRIMARY KEY,
	FullName VARCHAR,
	Email VARCHAR,
	Phone VARCHAR, 
	DateAdded DATE,
	IsMember BOOLEAN,
	IsStaff BOOLEAN);

CREATE TABLE Event (
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (UserID) References Person (UserID),
	Date DATE,
	Location VARCHAR,
	Description VARCHAR,
	TIME TIME,
	WebsiteLink VARCHAR,
	Document VARCHAR,
	Status INTEGER,
	SubmittedBy VARCHAR);

CREATE TABLE Comment ( 
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (UserID) References Person (UserID),
	Status INTEGER,
	CommentDate DATE,
	Comment VARCHAR);

CREATE TABLE Resource(
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (UserID) References Person (UserID),
	CommentTitle VARCHAR,
	Website VARCHAR,
	Comment VARCHAR,
	CommentDate DATE,
	SubmittedBy VARCHAR,
	Status INTEGER,
	InHouseInfo BOOLEAN);

CREATE TABLE PaymentData (
	PaymentID INTEGER PRIMARY KEY,
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (UserID) References Person(UserID),
	BillingAddress VARCHAR,
	Amount NUMERIC(14,2),
	PaymentDate DATE,
	PaymentType VARCHAR);

CREATE TABLE Sale (
	SaleID INTEGER PRIMARY KEY,
	PaymentID INTEGER,
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (PaymentID) References PaymentData(PaymentID),
	CONSTRAINT extraworkhere2 FOREIGN KEY (UserID) References Person(UserID),
	ItemName VARCHAR,
	ShippingAddress VARCHAR,
	DatePurchased DATE,
	DateShipped DATE);

CREATE TABLE Merchandise (
	MerchandiseID INTEGER PRIMARY KEY,
	ItemName VARCHAR,
	Description VARCHAR,
	Units VARCHAR,
	PricePerUnit NUMERIC(14,2),
	Quantity INTEGER,
	EntryDate DATE);

CREATE TABLE LineItem (
	SaleID INTEGER,
	MerchandiseID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (SaleID) References Sale(SaleID),
	CONSTRAINT extraworkhere2 FOREIGN KEY (MerchandiseID) References Merchandise(MerchandiseID),
	Quantity INTEGER);

CREATE TABLE Donation (
	PaymentID INTEGER, 
	UserID INTEGER,
	CONSTRAINT extraworkhere FOREIGN KEY (PaymentID) References PaymentData(PaymentID),
	CONSTRAINT extraworkhere2 FOREIGN KEY (UserID) References Person(UserID),
	Amount NUMERIC(14,2),
	RecordDate DATE);

\dt

INSERT INTO Person VALUES 
('1', 'Jill Killer', 'JillKileer@gmail.com', '2065551245', '2019-03-29'),
('2', 'Mark Lowen', 'lowen@msn.com', '', '2020-04-19'),
('3', 'Wendy Nelson', 'wnelson@yahoo.com', '4565551265', '2020-05-01'),
('4', 'Krystal Brown', 'krystalball@hotmail.com', '9045552211', '2021-05-20'),
('5', 'Bob Danielson', 'bd2035@gmail.com', '3605552030', '2020-06-10'),
('6', 'Ta Nguyen', 'tnguyen304@gmail.com', '', '2020-07-12'),
('7', 'Nichole Bradley', 'nicholeb@harvest.org', '2225552323', '2020-07-15'),
('8', 'Lindsey Peterson', 'lp@msn.com', '', '2020-02-10'),
('9', 'Marcus Tellerman', 'mtellerman@yahoo.com', '', '2020-10-30'),
('10', 'Hamid Brown', 'hamidb@outlook.com', '', '2020-08-14'),
('11', 'Ha Li', 'hali@gmail.com', '', '2020-10-15'),
('12', 'Ken Jackson', 'kj202@yahoo.com', '', '2020-10-15'),
('13', 'Wendy Nelson', 'windynelson@morningstar.org', '', '2020-10-16');


INSERT INTO Event VALUES 
('1', '2022-12-03', 'Room 313 Convention Center 200 Pike Street Seattle, WA, 98122', 'Price 250.00 per attendee', '0000', '', '', '3', 'Unknown'),
('2', '2022-01-13', 'UN Convention House 2 UN Plaza New York, NY, 00231', 'Price Free, but limited seats', '0000', '', '', '3', 'Unknown');

INSERT INTO Comment VALUES 
('7', '3', '2020-10-20', 'Climate.nasa.gov | This site is gorgeous and useful. Well worth the time to visit and explore its features.'),
('3', '3', '2020-10-22', 'I attended the Convention on Climate policy last year and it was quite enlightening. They had discussions from several high ranking scientists and politicians. Worth the price.');

INSERT INTO Resource VALUES 
('1', 'Partnership for Energy progress', 'https://www.pepnw.orgabout-us', 'The Partnership for Energy Progress is a collaboration of utilities, farmers, workers, small and large businesses, and community advocates across the Northwest. Our goal is to communicate the work we do to provide reliable, affordable energy to homes and businesses, and highlight the progress we are making to address climate change.', '2020-09-12', 'Jill Keller', '3', FALSE),
('1', 'Siemens Company', 'https://new.siemens.com/us/en/company/sustainability/environmental-action.html', 'Siemens is supporting the Decade of Action to accelerate the adoption of sustainable technologies so our customers, our communities and our employees can lead the U.S. towards a low-carbon future.', '2020-10-09', 'Jill Keller', '3', FALSE),
('5', 'UN Environment Program', 'https://www.unep-wcmc.org/', 'UN Environment Programme World Conservation Monitoring Centre is a world leader in biodiversity knowledge. It works with scientists and policy makers worldwide to place biodiversity at the heart of environment and development decision-making to enable enlightened choices for people and the planet.', '2020-10-18', 'Bob Danielson', '3', FALSE),
('6', 'NASA on Climate Change', 'https://climate.nasa.gov/', 'Explore a real-time data visualization of NASAs Earth-orbiting satellites and the data they collect about climate change.', '2020-10-25', 'Ta Nguyen', '3', FALSE);

INSERT INTO PaymentData VALUES 
('1', '8', '161 Brown Street, Chicago, IL, 80092', '200.52', '2020-10-02', ''),
('2', '4', '303 South Market Seattle, WA, 98112', '40.54', '2020-10-09', ''),
('3', '9', '2020 North Street San Francisco, CA. 99122', '23.54', '2020-10-30', 'MASTERCARD'),
('4', '10', '', '10.00', '2020-08-14', ''),
('5', '11', '', '200.00', '2020-10-15', ''),
('6', '12', '', '15.00', '2020-10-15', ''),
('7', '13', '', '135.00', '2020-08-14', ''),
('8', '12', '', '15.00', '2022-03-02', '');

INSERT INTO Sale VALUES 
('1', '1', '8', 'Earth Rise puzzle', '161 Brown Street, Chicago, IL, 80092', '2020-02-10', '2020-04-10'),
('2', '1', '8', 'Earth Rise T-shirt', '161 Brown Street, Chicago, IL, 80092', '2020-02-10', '2020-04-10'),
('3', '2', '4', 'Earth rise T-shirt', '120 Pine Street Seattle, WA 98122', '2020-09-10', '2019-12-10'),
('4', '3', '9', 'last views', '2020 North Street San Francisco, CA. 99122', '2020-10-30', '2020-10-30');

INSERT INTO Merchandise VALUES 
('1', 'Earth Rise T-Shirt', 'T-shirt with earth rising over moon', '1 T-Shirt', '15.50', '20', '2020-02-15'),
('2', 'Earth Rise Puzzle', '1000 piece jigsaw puzzle of earth rising over moon', '1 box', '9.35', '15', '2020-03-01'),
('3', 'Endangered Habitats', 'Tabletop book', '1 book', '35.30', '25', '2020-03-01'),
('4', 'Last Views', '4k UHD documentary on endangered species', '1 disc', '23.90', '10', '2020-04-12'),
('5', 'Call to Action', 'Book on climate change action', '1 book', '6.45', '30', '2020-04-15');

INSERT INTO Donation VALUES 
('4', '10', '10.00', '2020-08-14'),
('5', '11', '200.00', '2020-10-15'),
('6', '12', '15.00', '2020-10-15'),
('7', '13', '135.00', '2020-08-14'),
('8', '12', '15.00', '2022-03-02');




















