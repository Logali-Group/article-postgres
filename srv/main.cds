using {com.logaligroup as entities} from '../db/schema';

service LogaliGroup {
    entity CourseSet           as projection on entities.Courses;
    entity CourseHasStudentSet as projection on entities.CoursesHasStudents;
    entity StudentSet          as projection on entities.Students;
};
