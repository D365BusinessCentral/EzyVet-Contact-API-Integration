table 50014 "EzyVet Country"
{
    Caption = 'EzyVet Country';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; id; Text[100])
        {
            Caption = 'id';
            DataClassification = CustomerContent;
        }
        field(3; active; Text[20])
        {
            Caption = 'active';
            DataClassification = CustomerContent;
        }
        field(4; created_at; Text[20])
        {
            Caption = 'created_at';
            DataClassification = CustomerContent;
        }
        field(5; modified_at; Text[20])
        {
            Caption = 'modified_at';
            DataClassification = CustomerContent;
        }
        field(6; name; Text[100])
        {
            Caption = 'name';
            DataClassification = CustomerContent;
        }
        field(7; limit; Text[20])
        {
            Caption = 'limit';
            DataClassification = CustomerContent;
        }
        field(8; page; Text[20])
        {
            Caption = 'page';
            DataClassification = CustomerContent;
        }

        field(9; EzyVet_created_date; DateTime)
        {
            Caption = 'EzyVet_created_at_date';
            DataClassification = CustomerContent;
        }
        field(10; EzyVet_modified_date; DateTime)
        {
            Caption = 'EzyVet_modified_at_date';
            DataClassification = CustomerContent;
        }
        field(11; Record_Inserted_Date; Date)
        {
            Caption = 'Record_Inserted_Date';
            DataClassification = CustomerContent;
        }
        field(12; Processed; Boolean)
        {
            Caption = 'Processed';
            DataClassification = CustomerContent;
        }
        field(13; "Is_New_Country"; Boolean)
        {
            Caption = 'New Country';
            DataClassification = CustomerContent;
        }
        field(14; "Is_Modified_Country"; Boolean)
        {
            Caption = 'Modified Country';
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
