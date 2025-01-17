
CREATE TABLE com_logaligroup_Courses (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  course NVARCHAR(100),
  description NCLOB,
  PRIMARY KEY(ID)
);

CREATE TABLE com_logaligroup_CoursesHasStudents (
  ID NVARCHAR(36) NOT NULL,
  course_ID NVARCHAR(36),
  student_ID NVARCHAR(36),
  PRIMARY KEY(ID)
);

CREATE TABLE com_logaligroup_Students (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP_TEXT,
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP_TEXT,
  modifiedBy NVARCHAR(255),
  numberDocument NVARCHAR(8),
  firstName NVARCHAR(20),
  lastName NVARCHAR(20),
  PRIMARY KEY(ID)
);

CREATE VIEW LogaliGroup_CourseSet AS SELECT
  Courses_0.ID,
  Courses_0.createdAt,
  Courses_0.createdBy,
  Courses_0.modifiedAt,
  Courses_0.modifiedBy,
  Courses_0.course,
  Courses_0.description
FROM com_logaligroup_Courses AS Courses_0;

CREATE VIEW LogaliGroup_CourseHasStudentSet AS SELECT
  CoursesHasStudents_0.ID,
  CoursesHasStudents_0.course_ID,
  CoursesHasStudents_0.student_ID
FROM com_logaligroup_CoursesHasStudents AS CoursesHasStudents_0;

CREATE VIEW LogaliGroup_StudentSet AS SELECT
  Students_0.ID,
  Students_0.createdAt,
  Students_0.createdBy,
  Students_0.modifiedAt,
  Students_0.modifiedBy,
  Students_0.numberDocument,
  Students_0.firstName,
  Students_0.lastName,
  Students_0.firstName || ' ' || Students_0.lastName AS fullName
FROM com_logaligroup_Students AS Students_0;

