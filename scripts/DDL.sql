create database managementsystem;
use managementSystem;

create table person(
id int NOT NULL PRIMARY KEY auto_increment,
addressId int DEFAULT NULL,
isStudent tinyint(1) DEFAULT 0,
firstName varchar(50) DEFAULT NULL,
lastName varchar(50) DEFAULT NULL,
email varchar(50) DEFAULT NULL,
password1 varchar(8) DEFAULT NULL,
phone varchar(15) DEFAULT NULL,
dob date DEFAULT NULL,
emergencyContact varchar(15) DEFAULT NULL,
bloodGroup varchar(8) DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table address(
id int NOT NULL PRIMARY KEY auto_increment,
addressLine1 varchar(100) NOT NULL,
addressLine2 varchar(100) DEFAULT NULL,
streetNo varchar(20) DEFAULT NULL,
city varchar(60) NOT NULL,
pinCode varchar(20) NOT NULL,
state varchar(50) NOT NULL,
country varchar(50) NOT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table previousEducation(
id int NOT NULL PRIMARY KEY auto_increment,
personId int DEFAULT NULL,
courseName varchar(50) DEFAULT NULL,
branchName varchar(50) DEFAULT NULL,
yearOfPassing  DATE NOT NULL,
percentage int DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table course(
id int NOT NULL PRIMARY KEY auto_increment,
courseMode int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
duration int DEFAULT NULL,
description varchar(100) DEFAULT NULL,
syllabus json DEFAULT NULL,
totalCredits int DEFAULT NULL,
totalFee int DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table courseMode(
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(20) DEFAULT NULL,
mainType varchar(20) DEFAULT NULL,
subType varchar(20) DEFAULT NULL
);

create table department(
id int NOT NULL PRIMARY KEY auto_increment,
courseId int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
description varchar(100) DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table staffeducation(
id int NOT NULL PRIMARY KEY auto_increment,
personId int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
qualification varchar(50) DEFAULT NULL,
specialization varchar(50) DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table book(
id int NOT NULL PRIMARY KEY auto_increment,
name varchar(50) DEFAULT NULL,
authorId int DEFAULT NULL,
bookRating varchar(3) DEFAULT NULL,
publisherName varchar(50) DEFAULT NULL,
editionNumber int DEFAULT NULL,
yop int DEFAULT NULL,
nop int DEFAULT NULL,
courseId int DEFAULT NULL,
departmentId int DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create table author(
id int NOT NULL PRIMARY KEY auto_increment,
firstname varchar(50) DEFAULT NULL,
lastname varchar(50) DEFAULT NULL,
dob date DEFAULT NULL,
details text DEFAULT NULL,
followon text DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create table libraryRecord(
id int NOT NULL PRIMARY KEY auto_increment,
bookId int DEFAULT NULL,
personId int DEFAULT NULL,
feedback longtext DEFAULT NULL,
userRating varchar(3) DEFAULT NULL,
dueDate date DEFAULT NULL,
dueFee int DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table departmentRecord(
id int NOT NULL PRIMARY KEY auto_increment,
personId int DEFAULT NULL,
courseId int DEFAULT NULL,
departmentId int DEFAULT NULL,
totalfee int DEFAULT NULL,
balancefee int DEFAULT NULL,
feedback longtext DEFAULT NULL,
userrating varchar(3) DEFAULT NULL,
startDate date DEFAULT NULL,
endDate date DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
modifiedDate timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table loginRecord(
id int NOT NULL PRIMARY KEY auto_increment,
personId int DEFAULT NULL,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

alter table course drop column syllabus;
alter table course add column syllabus varchar(100);
alter table department drop column subjects;
alter table department add column description varchar(100);