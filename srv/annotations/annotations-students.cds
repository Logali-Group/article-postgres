using {LogaliGroup as service} from '../main';

annotate service.StudentSet with @odata.draft.enabled;

annotate service.StudentSet with {
    ID @Common : { 
        Text : fullName,
        TextArrangement : #TextOnly
    };
    numberDocument @title : 'Number Document';
    firstName @title : 'First Name';
    lastName @title : 'Last Name';
};

annotate service.StudentSet with @(
    UI.HeaderInfo: {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Student',
        TypeNamePlural : 'Students',
        Title : {
            $Type : 'UI.DataField',
            Value : fullName
        },
        Description : {
            $Type : 'UI.DataField',
            Value : numberDocument
        }
    },
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : numberDocument
        },
        {
            $Type : 'UI.DataField',
            Value : firstName
        },
        {
            $Type : 'UI.DataField',
            Value : lastName
        }
    ],
    UI.FieldGroup #GroupA : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : numberDocument
            },
            {
                $Type : 'UI.DataField',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Value : lastName
            }
        ]
    },
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GroupA'
        }
    ]
);

