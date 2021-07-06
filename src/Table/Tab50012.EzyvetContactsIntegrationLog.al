table 50012 EzyvetContactsIntegrationLog
{
    Caption = 'Ezyvet Contact Integration Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[500])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Success,Error;
            DataClassification = ToBeClassified;
        }
        field(4; LogDateTime; DateTime)
        {
            Caption = 'Log Time';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
