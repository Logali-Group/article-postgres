namespace com.logaligroup;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Courses : cuid, managed {
    course      : String(100);
    description : LargeString;
    toStudents  : Composition of many CoursesHasStudents
                      on toStudents.course = $self;
};

entity CoursesHasStudents : cuid {
    course  : Association to Courses;
    student : Association to Students;
};

entity Students : cuid, managed {
    numberDocument : String(8) @assert.unique;
    firstName      : String(20);
    lastName       : String(20);
    fullName       : String = firstName || ' ' || lastName;
    toCourses      : Association to many CoursesHasStudents
                         on toCourses.student = $self;
};
