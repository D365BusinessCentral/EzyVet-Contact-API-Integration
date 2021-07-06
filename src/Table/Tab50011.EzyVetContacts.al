table 50011 "EzyVet Contacts"
{
    Caption = 'EzyVet Contact';
    DataClassification = CustomerContent;

    fields
    {
        field(1; entry_no; Integer)
        {
            Caption = 'entry_no';
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
        field(6; ownership_id; Text[100])
        {
            Caption = 'ownership_id';
            DataClassification = CustomerContent;
        }
        field(7; code; Text[50])
        {
            Caption = 'code';
            DataClassification = CustomerContent;
        }
        field(8; "first_name"; Text[300])
        {
            Caption = 'first_name';
            DataClassification = CustomerContent;
        }
        field(9; last_name; Text[300])
        {
            Caption = 'last_name';
            DataClassification = CustomerContent;
        }
        field(10; business_name; Text[300])
        {
            Caption = 'business_name';
            DataClassification = CustomerContent;
        }
        field(11; is_business; Text[20])
        {
            Caption = 'is_business';
            DataClassification = CustomerContent;
        }
        field(12; is_customer; Text[20])
        {
            Caption = 'is_customer';
            DataClassification = CustomerContent;
        }
        field(13; is_supplier; Text[20])
        {
            Caption = 'is_supplier';
            DataClassification = CustomerContent;
        }
        field(14; is_vet; Text[20])
        {
            Caption = 'is_vet';
            DataClassification = CustomerContent;
        }
        field(15; is_syndicate; Text[20])
        {
            Caption = 'is_syndicate';
            DataClassification = CustomerContent;
        }
        field(16; is_staff_member; Text[20])
        {
            Caption = 'is_staff_member';
            DataClassification = CustomerContent;
        }
        field(17; "address_postal"; Text[50])
        {
            Caption = 'address_postal';
            DataClassification = CustomerContent;
        }
        field(18; stop_credit; Text[50])
        {
            Caption = 'stop_credit';
            DataClassification = CustomerContent;
        }
        field(19; limit; Text[10])
        {
            Caption = 'limit';
            DataClassification = CustomerContent;
        }
        field(20; page; Text[10])
        {
            Caption = 'page';
            DataClassification = CustomerContent;
        }
        field(21; EzyVet_created_date; DateTime)
        {
            Caption = 'EzyVet_created_at_date';
            DataClassification = CustomerContent;
        }
        field(22; EzyVet_modified_date; DateTime)
        {
            Caption = 'EzyVet_modified_at_date';
            DataClassification = CustomerContent;
        }
        field(23; Record_Inserted_Date; Date)
        {
            Caption = 'Record_Inserted_Date';
            DataClassification = CustomerContent;
        }
        field(24; Processed; Boolean)
        {
            Caption = 'Processed';
            DataClassification = CustomerContent;
        }
        field(25; "Is_New_Contact"; Boolean)
        {
            Caption = 'New Contact';
            DataClassification = CustomerContent;
        }
        field(26; "Is_Modified_Contact"; Boolean)
        {
            Caption = 'Modified Contact';
            DataClassification = CustomerContent;
        }
        field(27; "Address Updated"; Boolean)
        {
            Caption = 'Address Updated';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; entry_no)
        {
            Clustered = true;
        }
    }

}
