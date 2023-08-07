use managementsystem;

select * from course;

select * from person;
select * from address;

select * from course;
alter table course drop column syllabus;
alter table course add column syllabus varchar(100);

alter table department drop column subjects;
alter table department add column description varchar(100);

select * from department;

-- "Select Blood Group", "A+", "O+", "B+", "AB+", "A-", "O-", "B-", "AB-"

-- "Select Gender", "Male", "Female", "Other"

-- "Select Semester", "Semester-1", "Semester-2", "Semester-3", "Semester-4", "Semester-5", "Semester-6", 
-- "Semester-7", "Semester-8"

-- "Select Year", "2018", "2019", "2020", "2021"

-- "Select Course Type", "Under Graduation", "Post Graduation" 

-- Select Department", "Mechanical Engineering", "Computer Science", "Information Technology", "Electrical Engineering",
-- "Civil Engineering", "Computer Application

use managementSystem;
select * from department;
select * from course;


INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('1', 'Bachelor of Technology', '4', 'This course is available for Candidates in various specializations', '150', '220000');
UPDATE `managementsystem`.`course` SET `duration` = '1' WHERE (`id` = '1');
select * from address;

INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('3rd Main Road', 'JP Nagar', '3', 'Bangalore', '265281', 'Karnataka', 'India');
INSERT INTO `managementsystem`.`address` (`id`, `addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`, `createdDate`, `modifiedDate`) VALUES (NULL, '1 st stage', 'BTM', '1', 'Bangalore', '456732', 'Karnataka', 'India', '2023-07-09 07:33:41', '2023-07-09 07:33:41');
INSERT INTO `managementsystem`.`address` (`id`, `addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`, `createdDate`, `modifiedDate`) VALUES (NULL, '3rd Main Road', 'JP Nagar', '3', 'Bangalore', '265281', 'Karnataka', 'India', '2023-07-30 06:55:04', '2023-07-30 06:55:04');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('2nd cross main road', 'Tin factory', '17', 'Bangalore', '879383', 'Karnataka', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('1st Cross Road', 'Jaya nagar', '12', 'Bangalore', '367223', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('KEB colony', 'Jp Nagar', '2', 'Bangalore', '764733', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('Sai Colony', 'HSR layout', '4', 'Bangalore', '090393', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('Baba Colony', 'Marathahalli', '5', 'Bangalore', '284748', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('Venkateswara Colony', 'KR puram', '1', 'Bangalore', '476457', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('Market road', 'KR market', '6', 'Bangalore', '263547', 'Bangalore', 'India');
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('Food Street', 'Vijaya nagara', '5', 'Bangalore', '247582', 'Bangalore', 'India');

select p.firstName, p.lastName, p.email, p.password1, p.phone, p.dob, p.emergencyContact, p.bloodGroup, ad.addressLine1, ad.addressLine2, ad.streetNo, ad.city, ad.pinCode, ad.state, ad.country from person p left join address ad on p.addressId = ad.id where p.isStudent = 1;

UPDATE `managementsystem`.`courseMode` SET `mainType` = 'Both' WHERE (`id` = '5');

INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('2', 'Bachelor of Commerce', '3', 'This is about accounts and businesses', '120', '45600');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('3', 'Bachelor of Science', '4', 'This is about physics, chemistry and maths', '100', '2300');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('4', 'Bachelor of Arts', '2', 'This is about history, geography and etc.', '40', '45000');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('5', 'Java Development', '4', 'This is all about building apps with Java including OOPS.', '80', '3200');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('2', 'Python Development', '1', 'This is all about building apps with Python including OOPS.', '90', '87500');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('4', 'Power BI', '2', 'This is teaching tool about data management and presentation skills', '100', '9800');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('3', 'Dev-Ops', '3', 'This is about maintaining applications and dealing with security', '90', '8900');

