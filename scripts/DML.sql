use managementsystem;

INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('1', 'Bachelor of Technology', '4', 'This course is available for Candidates in various specializations', '150', '220000');
UPDATE `managementsystem`.`course` SET `duration` = '1' WHERE (`id` = '1');

INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Full-time', 'Offline');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Full-time', 'Online');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Part-time', 'Offline');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Part-time', 'Online');
INSERT INTO `managementsystem`.`coursemode` (`name`) VALUES ('Hybrid');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('1', 'Full-Stack Web Development', '12', 'Front-end and Back-end web development', '120', '120000');

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
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('2', 'Bachelor of Commerce', '3', 'This is about accounts and businesses', '120', '45600');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('3', 'Bachelor of Science', '4', 'This is about physics, chemistry and maths', '100', '2300');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('4', 'Bachelor of Arts', '2', 'This is about history, geography and etc.', '40', '45000');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('5', 'Java Development', '4', 'This is all about building apps with Java including OOPS.', '80', '3200');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('2', 'Python Development', '1', 'This is all about building apps with Python including OOPS.', '90', '87500');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('4', 'Power BI', '2', 'This is teaching tool about data management and presentation skills', '100', '9800');
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('3', 'Dev-Ops', '3', 'This is about maintaining applications and dealing with security', '90', '8900');
