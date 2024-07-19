using {LogaliGroup as service} from '../main';

using from './annotations-courseshasstudents';

annotate service.CourseSet with @odata.draft.enabled;

annotate service.CourseSet with {
    course @title : 'Course';
    description @title : 'Description' @UI.MultiLineText;
};

annotate service.CourseSet with @(
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Course',
        TypeNamePlural : 'Courses',
        Title : {
            $Type : 'UI.DataField',
            Value : course
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description
        },
    },
    UI.LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : course
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ],
    UI.FieldGroup #GroupA : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : course
            },
            {
                $Type : 'UI.DataField',
                Value : description
            }
        ]
    },
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GroupA',
            Label : 'Course Information'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'toStudents/@UI.LineItem'
        }
    ]
);

