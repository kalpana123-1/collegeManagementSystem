use managementsystem;
select * from course;
ALTER TABLE course RENAME COLUMN courseMode to courseModeId;
ALTER TABLE person ADD COLUMN role enum('user', 'admin');

select * from person;

use managementsystem;
select * from address;
INSERT INTO `managementsystem`.`address` (`addressLine1`, `addressLine2`, `streetNo`, `city`, `pinCode`, `state`, `country`) VALUES ('1 st stage', 'BTM', '1', 'Bangalore', '456732', 'Karnataka', 'India');

SELECT * FROM person;
INSERT INTO `managementsystem`.`person` (`addressId`, `isStudent`, `firstName`, `lastName`, `email`, `password1`, `phone`, `dob`, `emergencyContact`, `bloodGroup`, `role`) VALUES ('1', '1', 'Kalpana', 'Tamatam', 'k@mailinator.com', '1234', '6368276445', '2023-06-12', '7738492942', 'o+', 'Admin');

