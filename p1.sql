drop table Staff cascade constraint;
drop table StaffPhone cascade constraint;
drop table StaffPosition cascade constraint;
drop table Position cascade constraint;
drop table Location cascade constraint;
drop table Office cascade constraint;
drop table Coordinate cascade constraint;
drop table Edge cascade constraint;
drop table Path cascade constraint;
drop table PathListOfEdges cascade constraint;

create table Staff
(
    firstName varchar2(20) not null,
    lastName varchar2(20) not null,
    accountName varchar2(20),
    constraint staff_PK primary key (accountName)
);

create table StaffPhone (
    phone number(4),
    accountName varchar2(20),
    constraint accountNamesp_fk foreign key (accountName) references Staff(accountName)
);

create table StaffPosition (
    accountName varchar2(20),
    position varchar(20) default 'CURATOR',
    constraint accountNamespos_fk foreign key (accountName) references Staff(accountName)
);

create table Position
(
    positionID varchar2(20),
    title varchar2(35),
    payGrade number(10),
    constraint position_PK primary key (positionID)
);


create table Location
(
    locationID varchar2(4),
    locationName varchar2(20),
    locationType varchar2(20),
    floor number(1),
    constraint location_PK primary key (locationID)
);

create table Coordinate
(
    locationID varchar2(4),
    floor number(1),
    x_coordinate number(4),
    y_coordinate number(4),
    constraint combo_UQ Unique(floor, x_coordinate, y_coordinate),
    constraint locationID_fk foreign key (locationID) references Location(locationID)
);

create table Office
(
    locationID varchar2(20),
    maxOccupancy number(20),
    assignedStaff varchar2(20),
    constraint locationIDoffice_fk foreign key (locationID) references Location(locationID),
    constraint assignedStaff_FK foreign key (assignedStaff) references Staff(accountName)
);

create table Edge
(
    edgeID varchar2(20),
    startingLocation varchar2(4),
    endingLocation varchar2(4),
    constraint startlocationID_fk foreign key (startingLocation) references Location(locationID),
    constraint endlocationID_fk foreign key (endingLocation) references Location(locationID),
    constraint edgeID_PK primary key (edgeID)
);

create table Path (
    pathID varchar2(9),
    constraint pathID_PK primary key (pathID)
);

create table PathListOfEdges (
    pathID varchar2(9),
    edgeID varchar2(9),
    edgeOrder number(20),
    constraint PathListOfEdges_PK primary key (pathID, edgeID),
    constraint pathedge_FK foreign key (pathID) references Path(pathID),
    constraint edgeid_FK foreign key (edgeID) references Edge(edgeID)
);

insert into Staff values('Caroline', 'Fargo', 'fargo');
insert into Staff values('Charles ', 'Rick', 'rick');
insert into Staff values('Christine ', 'Arko', 'arko');
insert into Staff values('Sam ', 'Shoe', 'shoe');
insert into Staff values('Mark ', 'Williams', 'williams');
insert into Staff values('Dewayne ', 'Dixon', 'dixon');
insert into Staff values('Douglas ', 'Rodriguez', 'rodriguez');
insert into Staff values('Eli ', 'Stein', 'stein');
insert into Staff values('Amy ', 'Lin', 'lin');
insert into Staff values('George ', 'Hirsch', 'hirsch');
insert into Staff values('Katherine ', 'Pine', 'pine');
insert into Staff values('Hugh ', 'Landry', 'landry');
insert into Staff values('Moesha ', 'Simmons', 'simmons');
insert into Staff values('Eva ', 'Brown', 'brown');
insert into Staff values('Emily ', 'Fischer', 'fischer');
insert into Staff values('Gaurav ', 'Mehta', 'mehta');
insert into Staff values('Mark ', 'Clay', 'clay');
insert into Staff values('Michelle ', 'Hostra', 'hofstra');
insert into Staff values('Tom ', 'Haring ', 'haring');
insert into Staff values('Kiki ', 'Jones', 'jones');
insert into Staff values('Mohamed ', 'Isa', 'isa');
insert into Staff values('Neil ', 'Holmes', 'holmes');
insert into Staff values('Nicole ', 'Ford ', 'ford');
insert into Staff values('Ralph ', 'Cane', 'rcane');
insert into Staff values('Griffin ', 'Ganoon', 'ganoon');
insert into Staff values('William ', 'Tam', 'tam');

insert into StaffPhone values(2140, 'fargo');
insert into StaffPhone values(2445, 'rick');
insert into StaffPhone values(2178, 'arko');
insert into StaffPhone values(1433, 'shoe');
insert into StaffPhone values(4622, 'williams');
insert into StaffPhone values(4357, 'williams');
insert into StaffPhone values(2121, 'dixon');
insert into StaffPhone values(1993, 'rodriguez');
insert into StaffPhone values(2315, 'stein');
insert into StaffPhone values(2068, 'lin');
insert into StaffPhone values(2002, 'hirsch');
insert into StaffPhone values(1752, 'pine');
insert into StaffPhone values(1993, 'landry');
insert into StaffPhone values(2322, 'simmons');
insert into StaffPhone values(2656, 'brown');
insert into StaffPhone values(1618, 'fischer');
insert into StaffPhone values(3071, 'mehta');
insert into StaffPhone values(1909, 'clay');
insert into StaffPhone values(3411, 'hofstra');
insert into StaffPhone values(1617, 'haring');
insert into StaffPhone values(2674, 'jones');
insert into StaffPhone values(3669, 'jones');
insert into StaffPhone values(2921, 'isa');
insert into StaffPhone values(2069, 'holmes');
insert into StaffPhone values(1857, 'ford');
insert into StaffPhone values(1857, 'rcane');
insert into StaffPhone values(1857, 'ganoon');
insert into StaffPhone values(2206, 'tam');

insert into StaffPosition values('fargo', 'ASSOCCURATOR');
insert into StaffPosition values('rick', 'CURATOR');
insert into StaffPosition values('arko', 'DOCENT');
insert into StaffPosition values('shoe', 'ASSOCCURATOR');
insert into StaffPosition values('williams', 'DEPTHEAD');
insert into StaffPosition values('williams', 'CURATOR');
insert into StaffPosition values('dixon', 'CURATOR');
insert into StaffPosition values('rodriguez', 'ASSTARCHIVIST');
insert into StaffPosition values('stein', 'DIRARTS');
insert into StaffPosition values('stein', 'CURATOR');
insert into StaffPosition values('lin', 'ASSOCCURATOR');
insert into StaffPosition values('lin', 'COORDEXHIBITS');
insert into StaffPosition values('hirsch', 'ASSOCCURATOR');
insert into StaffPosition values('pine', 'HISTORIAN');
insert into StaffPosition values('landry', 'ARCHIVIST');
insert into StaffPosition values('simmons', 'ADMIN1');
insert into StaffPosition values('brown', 'ASSOCCURATOR');
insert into StaffPosition values('fischer', 'CURATOR');
insert into StaffPosition values('mehta', 'ASSTCURATOR');
insert into StaffPosition values('clay', 'CURATOR');
insert into StaffPosition values('hofstra', 'CURATOR');
insert into StaffPosition values('haring', 'HISTORIAN');
insert into StaffPosition values('jones', 'ADMIN2');
insert into StaffPosition values('isa', 'ASSOCCURATOR');
insert into StaffPosition values('holmes', 'CURATOR');
insert into StaffPosition values('holmes', 'DIRHISTORY');
insert into StaffPosition values('ford', 'DOCENT');
insert into StaffPosition values('rcane', 'COORDDESIGN');
insert into StaffPosition values('ganoon', 'ASSOCARCHIVIST');
insert into StaffPosition values('tam', 'ASSTARCHIVIST');

insert into Position values('ASSOCARCHIVIST', 'Associate Archivist', 5);
insert into Position values('DOCENT', 'Docent', 0);
insert into Position values('ASSTCURATOR', 'Assistant Curator', 4);
insert into Position values('ASSTARCHIVIST', 'Assistant Archivist', 3);
insert into Position values('ASSOCCURATOR', 'Associate Curator', 6);
insert into Position values('COORDEXHIBITS', 'Coordinator of Exhibits', 9);
insert into Position values('DEPTHEAD', 'Department Head', 10);
insert into Position values('DIRARTS', 'Director of Arts', 9);
insert into Position values('DIRHISTORY', 'Director of History', 9);
insert into Position values('COORDDESIGN', 'Coordinator of Design', 8);
insert into Position values('ADMIN1', 'Administrative Assistant I', 1);
insert into Position values('ADMIN2', 'Administrative Assistant II', 2);
insert into Position values('CURATOR', 'Curator', 7);
insert into Position values('HISTORIAN', 'Historian', 6);
insert into Position values('ARCHIVIST', 'Archivist', 7);

insert into Location values('201A', '201A', 'Office', 2);
insert into Location values('201B', '201B', 'Office', 2);
insert into Location values('201C', '201C', 'Office', 2);
insert into Location values('202', '202', 'Gallery', 2);
insert into Location values('202A', '202A', 'Office', 2);
insert into Location values('202B', '202B', 'Office', 2);
insert into Location values('202C', '202C', 'Office', 2);
insert into Location values('202D', '202D', 'Office', 2);
insert into Location values('202E', '202E', 'Office', 2);
insert into Location values('203', '203', 'Gallery', 2);
insert into Location values('204', '204 Lovecraft Room', 'Conference Room', 2);
insert into Location values('205', '205', 'Office', 2);
insert into Location values('206', '206', 'Office', 2);
insert into Location values('207', '207', 'Office', 2);
insert into Location values('208', '208', 'Closet', 2);
insert into Location values('209', '209 Museum Guides', 'Office', 2);
insert into Location values('S2', '2nd Floor Stairs', 'Stairs', 2);
insert into Location values('H201', 'Hallway 201', 'Hallway', 2);
insert into Location values('H202', 'Hallway 202', 'Hallway', 2);
insert into Location values('H203', 'Hallway 203', 'Hallway', 2);
insert into Location values('H204', 'Hallway 204', 'Hallway', 2);
insert into Location values('H205', 'Hallway 205', 'Hallway', 2);
insert into Location values('H206', 'Hallway 206', 'Hallway', 2);
insert into Location values('H207', 'Hallway 207', 'Hallway', 2);
insert into Location values('H208', 'Hallway 208', 'Hallway', 2);
insert into Location values('H209', 'Hallway 209', 'Hallway', 2);
insert into Location values('H210', 'Hallway 210', 'Hallway', 2);
insert into Location values('H211', 'Hallway 211', 'Hallway', 2);
insert into Location values('H212', 'Hallway 212', 'Hallway', 2);
insert into Location values('H213', 'Hallway 213', 'Hallway', 2);
insert into Location values('H214', 'Hallway 214', 'Hallway', 2);
insert into Location values('H215', 'Hallway 215', 'Hallway', 2);
insert into Location values('302A', '302A', 'Office', 3);
insert into Location values('302B', '302B', 'Office', 3);
insert into Location values('303', '303', 'Office', 3);
insert into Location values('304', '304', 'Conference Room', 3);
insert into Location values('305A', '305A', 'Office', 3);
insert into Location values('305B', '305B', 'Office', 3);
insert into Location values('305C', '305C', 'Office', 3);
insert into Location values('305D', '305D', 'Office', 3);
insert into Location values('306', '306', 'Gallery', 3);
insert into Location values('307', '307', 'Office', 3);
insert into Location values('308', '308', 'Gallery', 3);
insert into Location values('309', '309', 'Gallery', 3);
insert into Location values('M', 'Men"s Restroom', 'Restroom', 3);
insert into Location values('W', 'Women"s Restroom', 'Restroom', 3);
insert into Location values('S3', '3rd Floor Stairs', 'Stairs', 3);
insert into Location values('H301', 'Hallway 301', 'Hallway', 3);
insert into Location values('H302', 'Hallway 302', 'Hallway', 3);
insert into Location values('H303', 'Hallway 303', 'Hallway', 3);
insert into Location values('H304', 'Hallway 304', 'Hallway', 3);
insert into Location values('H305', 'Hallway 305', 'Hallway', 3);
insert into Location values('H306', 'Hallway 306', 'Hallway', 3);
insert into Location values('H307', 'Hallway 307', 'Hallway', 3);
insert into Location values('H308', 'Hallway 308', 'Hallway', 3);
insert into Location values('H309', 'Hallway 309', 'Hallway', 3);
insert into Location values('H310', 'Hallway 310', 'Hallway', 3);
insert into Location values('H311', 'Hallway 311', 'Hallway', 3);
insert into Location values('H312', 'Hallway 312', 'Hallway', 3);
insert into Location values('H313', 'Hallway 313', 'Hallway', 3);
insert into Location values('H314', 'Hallway 314', 'Hallway', 3);
insert into Location values('H315', 'Hallway 315', 'Hallway', 3);

insert into Office values('201A', 1, 'haring');
insert into Office values('201B', 1, 'fischer');
insert into Office values('201C', 2, 'pine');
insert into Office values('202A', 2, 'stein');
insert into Office values('202B', 1, 'mehta');
insert into Office values('202C', 1, 'brown');
insert into Office values('202D', 1, 'lin');
insert into Office values('202E', 2, 'rodriguez');
insert into Office values('202E', 2, 'landry');
insert into Office values('205', 2, 'fargo');
insert into Office values('205', 2, 'hofstra');
insert into Office values('206', 3, 'holmes');
insert into Office values('206', 3, 'shoe');
insert into Office values('207', 2, 'williams');
insert into Office values('207', 2, 'isa');
insert into Office values('209', 5, 'ford');
insert into Office values('209', 5, 'rcane');
insert into Office values('209', 5, 'arko');
insert into Office values('302A', 1, 'ganoon');
insert into Office values('302B', 1, 'simmons');
insert into Office values('303', 1, 'jones');
insert into Office values('305A', 1, 'dixon');
insert into Office values('305B', 2, 'hirsch');
insert into Office values('305C', 1, 'rick');
insert into Office values('305D', 3, 'tam');
insert into Office values('307', 1, 'clay');

insert into Edge values('201A_H208', '201A', 'H208');
insert into Edge values('H208_201A', 'H208', '201A');
insert into Edge values('H207_H208', 'H207', 'H208');
insert into Edge values('H208_H207', 'H208', 'H207');
insert into Edge values('201B_H207', '201B', 'H207');
insert into Edge values('H207_201B', 'H207', '201B');
insert into Edge values('H206_H207', 'H206', 'H207');
insert into Edge values('H207_H206', 'H207', 'H206');
insert into Edge values('201C_H206', '201C', 'H206');
insert into Edge values('H206_201C', 'H206', '201C');
insert into Edge values('H206_202', 'H206', '202');
insert into Edge values('202_H206', '202', 'H206');
insert into Edge values('H206_H205', 'H206', 'H205');
insert into Edge values('H205_H206', 'H205', 'H206');
insert into Edge values('202E_H205', '202E', 'H205');
insert into Edge values('H205_202E', 'H205', '202E');
insert into Edge values('H204_H205', 'H204', 'H205');
insert into Edge values('H205_H204', 'H205', 'H204');
insert into Edge values('202D_H204', '202D', 'H204');
insert into Edge values('H204_202D', 'H204', '202D');
insert into Edge values('H203_H204', 'H203', 'H204');
insert into Edge values('H204_H203', 'H204', 'H203');
insert into Edge values('202C_H203', '202C', 'H203');
insert into Edge values('H203_202C', 'H203', '202C');
insert into Edge values('H202_H203', 'H202', 'H203');
insert into Edge values('H203_H202', 'H203', 'H202');
insert into Edge values('202B_H202', '202B', 'H202');
insert into Edge values('H202_202B', 'H202', '202B');
insert into Edge values('H201_H202', 'H201', 'H202');
insert into Edge values('H202_H201', 'H202', 'H201');
insert into Edge values('202A_H201', '202A', 'H201');
insert into Edge values('H201_202A', 'H201', '202A');
insert into Edge values('H208_H209', 'H208', 'H209');
insert into Edge values('H209_H208', 'H209', 'H208');
insert into Edge values('H209_H210', 'H209', 'H210');
insert into Edge values('H210_H209', 'H210', 'H209');
insert into Edge values('H210_203', 'H210', '203');
insert into Edge values('203_H210', '203', 'H210');
insert into Edge values('H210_H211', 'H210', 'H211');
insert into Edge values('H211_H210', 'H211', 'H210');
insert into Edge values('204_H211', '204', 'H211');
insert into Edge values('H211_204', 'H211', '204');
insert into Edge values('H211_H212', 'H211', 'H212');
insert into Edge values('H212_H211', 'H212', 'H211');
insert into Edge values('209_H212', '209', 'H212');
insert into Edge values('H212_209', 'H212', '209');
insert into Edge values('H212_H213', 'H212', 'H213');
insert into Edge values('H213_H212', 'H213', 'H212');
insert into Edge values('208_H213', '208', 'H213');
insert into Edge values('H213_208', 'H213', '208');
insert into Edge values('H213_H214', 'H213', 'H214');
insert into Edge values('H214_H213', 'H214', 'H213');
insert into Edge values('207_H214', '207', 'H214');
insert into Edge values('H214_207', 'H214', '207');
insert into Edge values('H214_H215', 'H214', 'H215');
insert into Edge values('H215_H214', 'H215', 'H214');
insert into Edge values('206_H215', '206', 'H215');
insert into Edge values('H215_206', 'H215', '206');
insert into Edge values('205_H215', '205', 'H215');
insert into Edge values('H215_205', 'H215', '205');
insert into Edge values('H312_H313', 'H312', 'H313');
insert into Edge values('H313_H312', 'H313', 'H312');
insert into Edge values('H313_M', 'H313', 'M');
insert into Edge values('M_H313', 'M', 'H313');
insert into Edge values('H313_H314', 'H313', 'H314');
insert into Edge values('H314_H313', 'H314', 'H313');
insert into Edge values('309_H314', '309', 'H314');
insert into Edge values('H314_309', 'H314', '309');
insert into Edge values('H314_H315', 'H314', 'H315');
insert into Edge values('H315_H314', 'H315', 'H314');
insert into Edge values('307_H315', '307', 'H315');
insert into Edge values('H315_307', 'H315', '307');
insert into Edge values('308_H315', '308', 'H315');
insert into Edge values('H315_308', 'H315', '308');
insert into Edge values('H311_H312', 'H311', 'H312');
insert into Edge values('H312_H311', 'H312', 'H311');
insert into Edge values('W_H311', 'W', 'H311');
insert into Edge values('H311_W', 'H311', 'W');
insert into Edge values('H310_H311', 'H310', 'H311');
insert into Edge values('H311_H310', 'H311', 'H310');
insert into Edge values('302B_H310', '302B', 'H310');
insert into Edge values('H310_303B', 'H310', '302B');
insert into Edge values('H309_H310', 'H309', 'H310');
insert into Edge values('H310_H309', 'H310', 'H309');
insert into Edge values('306_H309', '306', 'H309');
insert into Edge values('H309_306', 'H309', '306');
insert into Edge values('H308_H309', 'H308', 'H309');
insert into Edge values('H309_H308', 'H309', 'H308');
insert into Edge values('302A_H308', '302A', 'H308');
insert into Edge values('H308_302A', 'H308', '302A');
insert into Edge values('H307_H308', 'H307', 'H308');
insert into Edge values('H308_H307', 'H308', 'H307');
insert into Edge values('H307_H306', 'H307', 'H306');
insert into Edge values('H306_H307', 'H306', 'H307');
insert into Edge values('303_H306', '303', 'H306');
insert into Edge values('H306_303', 'H306', '303');
insert into Edge values('H306_304', 'H306', '304');
insert into Edge values('304_H306', '304', 'H306');
insert into Edge values('H307_H305', 'H307', 'H305');
insert into Edge values('H305_H307', 'H305', 'H307');
insert into Edge values('H305_H304', 'H305', 'H304');
insert into Edge values('H304_H305', 'H304', 'H305');
insert into Edge values('305A_H304', '305A', 'H304');
insert into Edge values('H304_305A', 'H304', '305A');
insert into Edge values('H303_H304', 'H303', 'H304');
insert into Edge values('H304_H303', 'H304', 'H303');
insert into Edge values('305B_H303', '305B', 'H303');
insert into Edge values('H303_305B', 'H303', '305B');
insert into Edge values('H303_H302', 'H303', 'H302');
insert into Edge values('H302_H303', 'H302', 'H303');
insert into Edge values('305C_H302', '305C', 'H302');
insert into Edge values('H302_305C', 'H302', '305C');
insert into Edge values('H301_H302', 'H301', 'H302');
insert into Edge values('H302_H301', 'H302', 'H301');
insert into Edge values('305D_H301', '305D', 'H301');
insert into Edge values('H301_305D', 'H301', '305D');
insert into Edge values('H209_S2', 'H209', 'S2');
insert into Edge values('S2_H209', 'S2', 'H209');
insert into Edge values('S2_S3', 'S2', 'S3');
insert into Edge values('S3_S2', 'S3', 'S2');
insert into Edge values('S3_H312', 'S3', 'H312');
insert into Edge values('H312_S3', 'H312', 'S3');

insert into Path values('305B_M');
insert into Path values('S2_206');
insert into Path values('202E_H307');

insert into PathListOfEdges values('305B_M', '305B_H303', 1);
insert into PathListOfEdges values('305B_M', 'H303_H304', 2);
insert into PathListOfEdges values('305B_M', 'H304_H305', 3);
insert into PathListOfEdges values('305B_M', 'H305_H307', 4);
insert into PathListOfEdges values('305B_M', 'H307_H308', 5);
insert into PathListOfEdges values('305B_M', 'H308_H309', 6);
insert into PathListOfEdges values('305B_M', 'H309_H310', 7);
insert into PathListOfEdges values('305B_M', 'H310_H311', 8);
insert into PathListOfEdges values('305B_M', 'H311_H312', 9);
insert into PathListOfEdges values('305B_M', 'H312_H313', 10);
insert into PathListOfEdges values('305B_M', 'H313_M', 11);
insert into PathListOfEdges values('S2_206', 'S2_H209', 1);
insert into PathListOfEdges values('S2_206', 'H209_H210', 2);
insert into PathListOfEdges values('S2_206', 'H210_H211', 3);
insert into PathListOfEdges values('S2_206', 'H211_H212', 4);
insert into PathListOfEdges values('S2_206', 'H212_H213', 5);
insert into PathListOfEdges values('S2_206', 'H213_H214', 6);
insert into PathListOfEdges values('S2_206', 'H214_H215', 7);
insert into PathListOfEdges values('S2_206', 'H215_206', 8);
insert into PathListOfEdges values('202E_H307', '202E_H205', 1);
insert into PathListOfEdges values('202E_H307', 'H205_H206', 2);
insert into PathListOfEdges values('202E_H307', 'H206_H207', 3);
insert into PathListOfEdges values('202E_H307', 'H207_H208', 4);
insert into PathListOfEdges values('202E_H307', 'H208_H209', 5);
insert into PathListOfEdges values('202E_H307', 'H209_S2', 6);
insert into PathListOfEdges values('202E_H307', 'S2_S3', 7);
insert into PathListOfEdges values('202E_H307', 'S3_H312', 8);
insert into PathListOfEdges values('202E_H307', 'H312_H311', 9);
insert into PathListOfEdges values('202E_H307', 'H311_H310', 10);
insert into PathListOfEdges values('202E_H307', 'H310_H309', 11);
insert into PathListOfEdges values('202E_H307', 'H309_H308', 12);
insert into PathListOfEdges values('202E_H307', 'H308_H307', 13);

select *
from Staff;

select *
from StaffPhone;

select *
from StaffPosition;

select *
from Position;

select *
from Location;

select *
from Office;

select *
from Coordinate;

select *
from Edge;

select *
from Path;

select *
from PathListOfEdges;