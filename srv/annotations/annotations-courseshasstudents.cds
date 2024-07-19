using {LogaliGroup as service} from '../main';


annotate service.CourseHasStudentSet with {
    course @title : 'Course ID';
    student @title : 'Student ID' @Common : { 
        Text : student.fullName,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'StudentSet',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : student_ID,
                    ValueListProperty : 'ID'
                }
            ]
        }
     };
};

annotate service.CourseHasStudentSet with @(
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Student',
        TypeNamePlural : 'Students',
    },
    UI.LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : student.numberDocument
        },
        {
            $Type : 'UI.DataField',
            Value : student.firstName
        },
        {
            $Type : 'UI.DataField',
            Value : student.lastName
        },
    ],
    UI.FieldGroup  : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : student_ID
            }
        ]
    },
    UI.Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            Label : 'Student Information'
        }
    ]
);


