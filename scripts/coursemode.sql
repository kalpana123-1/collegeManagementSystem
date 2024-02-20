SELECT * FROM coursemode;

INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Full-time', 'Offline');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Full-time', 'Online');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Part-time', 'Offline');
INSERT INTO `managementsystem`.`coursemode` (`name`, `mainType`) VALUES ('Part-time', 'Online');
INSERT INTO `managementsystem`.`coursemode` (`name`) VALUES ('Hybrid');

select id, name, description, totalCredits, totalFee, date(createdDate) from course;
INSERT INTO `managementsystem`.`course` (`courseModeId`, `name`, `duration`, `description`, `totalCredits`, `totalFee`) VALUES ('1', 'Full-Stack Web Development', '12', 'Front-end and Back-end web development', '120', '120000');


-- Course list query
select c.id, c.name, c.description, cm.name as courseModeName, cm.mainType as courseMainType, c.totalCredits, c.totalFee, date(c.createdDate) from course c left join courseMode cm on c.courseModeId = cm.id;


-- Department list query
select d.id, c.name as courseName, d.name, d.description, date(d.createdDate) as createdDate from department d
left join course c on d.courseId = c.id
group by d.courseId;