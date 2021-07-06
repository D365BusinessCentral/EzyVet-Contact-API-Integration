table 50013 "EzyVet Address"
{
    Caption = 'EzyVet Address';
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
        field(3; active; Text[50])
        {
            Caption = 'active';
            DataClassification = CustomerContent;
        }
        field(4; created_at; Text[50])
        {
            Caption = 'created_at';
            DataClassification = CustomerContent;
        }
        field(5; modified_at; Text[50])
        {
            Caption = 'modified_at';
            DataClassification = CustomerContent;
        }
        field(6; name; Text[300])
        {
            Caption = 'name';
            DataClassification = CustomerContent;
        }
        field(7; street_1; Text[300])
        {
            Caption = 'street_1';
            DataClassification = CustomerContent;
        }
        field(8; street_2; Text[300])
        {
            Caption = 'street_2';
            DataClassification = CustomerContent;
        }
        field(9; suburb; Text[300])
        {
            Caption = 'suburb';
            DataClassification = CustomerContent;
        }
        field(10; city; Text[200])
        {
            Caption = 'city';
            DataClassification = CustomerContent;
        }
        field(11; region; Text[200])
        {
            Caption = 'region';
            DataClassification = CustomerContent;
        }
        field(12; post_code; Text[100])
        {
            Caption = 'post_code';
            DataClassification = CustomerContent;
        }
        field(13; country_id; Text[100])
        {
            Caption = 'country_id';
            DataClassification = CustomerContent;
        }
        field(14; state; Text[100])
        {
            Caption = 'state';
            DataClassification = CustomerContent;
        }
        field(15; longitude; Text[50])
        {
            Caption = 'longitude';
            DataClassification = CustomerContent;
        }
        field(16; latitude; Text[50])
        {
            Caption = 'latitude';
            DataClassification = CustomerContent;
        }
        field(17; "Country Name"; Text[100])
        {
            Caption = 'Country Name';
            DataClassification = CustomerContent;
        }
        field(18; Record_Modified_Date; Date)
        {
            Caption = 'Record Modified Date';
            DataClassification = CustomerContent;
        }
        field(19; contact_id; Text[100])
        {
            Caption = 'Contact Id';
            DataClassification = CustomerContent;
        }
        field(20; Processed; Boolean)
        {
            Caption = 'Processed';
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
