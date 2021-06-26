USE master
GO
CREATE DATABASE PhotographerDB
GO
USE PhotographerDB
GO
CREATE TABLE Gallerys
(
	GalleryID INT IDENTITY(1000,1),
	GalleryName VARCHAR(200) NOT NULL,
	GalleryViews INT DEFAULT 0,
	GalleryDescription VARCHAR(MAX),
	CONSTRAINT "PK_Gallerys" PRIMARY KEY
	(
		"GalleryID"
	),
	CONSTRAINT "UQ_GalleryName" UNIQUE
	(
		"GalleryName"
	)
)
CREATE TABLE Images
(
	ImageID INT IDENTITY(10000,1),
	GalleryID	INT NOT NULL,
	ImageName VARCHAR(500) NOT NULL,
	ImageAlt VARCHAR(MAX),
	ImageURL VARCHAR(500) NOT NULL,
	ImageViews INT DEFAULT 0,
	CONSTRAINT "PK_Images" PRIMARY KEY
	(
		"ImageID"
	),
	CONSTRAINT "UQ_ImageName" UNIQUE
	(
		"ImageName"
	),
	CONSTRAINT "FK_Images_Gallerys" FOREIGN KEY
	(
		"GalleryID"
	) REFERENCES "dbo"."Gallerys"
	(
		"GalleryID"
	)
)
CREATE TABLE Contacts
(
	AuthorID INT,
	[Address] VARCHAR(200),
	City VARCHAR(200),
	Country VARCHAR(200),
	Tel VARCHAR(30),
	Email VARCHAR(200),
	EmbedMap VARCHAR(500) NOT NULL,
	CONSTRAINT "CK_Email" CHECK
	(
		Email LIKE '%@%'
	),
	CONSTRAINT "PK_Contacts" PRIMARY KEY
	(
		"AuthorID"
	),
	CONSTRAINT "FK_Contacts_Websites" FOREIGN KEY
	(
		"AuthorID"
	) REFERENCES "dbo"."Websites"
	(
		"WebsiteID"
	)
)

CREATE TABLE Websites
(
	WebsiteID INT IDENTITY (100,1),
	WebsiteName VARCHAR(200) NOT NULL,
	WebsiteHits INT DEFAULT 0,
	WebsiteDescription VARCHAR(MAX),
	WebsiteLogoURL VARCHAR(300) NOT NULL,
	CONSTRAINT "PK_Websites" PRIMARY KEY
	(
		"WebsiteID"
	)
)
SELECT * FROM Contacts

--Insert data to Gallerys
INSERT INTO Gallerys (GalleryName, GalleryDescription) VALUES('Gallery 1','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation')
INSERT INTO Gallerys (GalleryName, GalleryDescription) VALUES('Gallery 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation')
INSERT INTO Gallerys (GalleryName, GalleryDescription) VALUES('Gallery 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation')

--Insert data to Images
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_01','This is Image number 1', 'img/img_1.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_02','This is Image number 2', 'img/img_2.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_03','This is Image number 3', 'img/img_3.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_04','This is Image number 4', 'img/img_4.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_05','This is Image number 5', 'img/img_5.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_06','This is Image number 6', 'img/img_6.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_07','This is Image number 7', 'img/img_7.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1000,'IMG_08','This is Image number 8', 'img/img_8.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_09','This is Image number 9', 'img/img_9.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_10','This is Image number 10', 'img/img_10.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_11','This is Image number 11', 'img/img_11.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_12','This is Image number 12', 'img/img_12.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_13','This is Image number 13', 'img/img_13.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_14','This is Image number 14', 'img/img_14.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_15','This is Image number 15', 'img/img_15.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1001,'IMG_16','This is Image number 16', 'img/img_16.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_17','This is Image number 17', 'img/img_17.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_18','This is Image number 18', 'img/img_18.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_19','This is Image number 19', 'img/img_19.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_20','This is Image number 20', 'img/img_20.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_21','This is Image number 21', 'img/img_21.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_22','This is Image number 22', 'img/img_22.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_23','This is Image number 23', 'img/img_23.jpg')
INSERT INTO Images (GalleryID,ImageName,ImageAlt,ImageURL)
VALUES(1002,'IMG_24','This is Image number 24', 'img/img_24.jpg')

INSERT INTO	Contacts (AuthorID,[Address],City,Country,Tel,Email,EmbedMap)
VALUES(100,'Thanh Chuong','Nghe An','Viet Nam','+84834481768','hoanglammaster@gmail.com','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d59593.56899963206!2d105.49732396817667!3d21.00874302813494!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1624289437347!5m2!1sen!2s')
SELECT * FROM Contacts
SELECT   * FROM Images ORDER BY ImageViews
SELECT * FROM Gallerys
SELECT TOP(3)
ImageID,ImageName,ImageAlt,ImageURL FROM Images ORDER BY ImageViews DESC
UPDATE Gallerys SET GalleryViews = GalleryViews + 1 WHERE GalleryID = 1000
UPDATE Hits SET WebViews = WebViews + 1;
UPDATE Images SET ImageViews = ImageViews + 1 WHERE ImageID = 10021

ALTER TABLE Gallerys ADD GalleryDescription VARCHAR(MAX) NULL
UPDATE Gallerys SET GalleryDescription = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation'

ALTER TABLE Websites ADD WebsiteLogoURL VARCHAR(300)
INSERT INTO Websites (WebsiteName,WebsiteDescription)
VALUES('PHOTOGRAPHER','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim')
UPDATE Websites SET WebsiteLogoURL = 'img/logo.png'
SELECT * FROM Websites
SELECT * FROM Contacts
SELECT * FROM Gallerys
SELECT * FROM Images
ALTER TABLE Images
ADD ImageTitle VARCHAR(MAX) NULL
UPDATE Images SET ImageTitle = 'Lorem ipsum dolor sit amet'
SELECT * FROM Gallerys

SELECT * FROM Images WHERE GalleryID = 1002
UPDATE Images SET ImageViews = 50 WHERE ImageURL = 'img/img_23.jpg'
SELECT TOP 1 * ImageID, ImageName, ImageAlt, ImageURL FROM Images WHERE GalleryID = 1000 ORDER BY ImageViews DESC
INSERT INTO Gallerys (GalleryName,GalleryViews,GalleryDescription)
VALUES
(
	'Gallery 4',
	0,
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation'
)
SELECT * FROM Images WHERE ImageURL ='img/img_23.jpg'
SELECT TOP(1) * FROM Images ORDER BY ImageViews DESC