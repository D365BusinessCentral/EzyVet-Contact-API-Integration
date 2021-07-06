table 50015 "EzyVet Tag"
{
    Caption = 'EzyVet Tag';
    DataClassification = CustomerContent;
    LookupPageId = "EzyVet Tag";

    fields
    {
        field(1; id; Text[100])
        {
            Caption = 'id';
            DataClassification = CustomerContent;
        }
        field(2; active; Text[20])
        {
            Caption = 'active';
            DataClassification = CustomerContent;
        }
        field(3; created_at; Text[20])
        {
            Caption = 'created_at';
            DataClassification = CustomerContent;
        }
        field(4; modified_at; Text[20])
        {
            Caption = 'modified_at';
            DataClassification = CustomerContent;
        }
        field(5; name; Text[100])
        {
            Caption = 'name';
            DataClassification = CustomerContent;
        }
        field(6; associated_id; Text[40])
        {
            Caption = 'associated_id';
            DataClassification = CustomerContent;
        }
        field(7; associated_type; Text[40])
        {
            Caption = 'associated_type';
            DataClassification = CustomerContent;
        }
        field(8; "category_id"; Text[40])
        {
            Caption = 'category_id';
            DataClassification = CustomerContent;
        }
        field(9; created_at_date; DateTime)
        {
            Caption = 'created_at_date';
            DataClassification = CustomerContent;
        }

        field(10; modified_at_date; DateTime)
        {
            Caption = 'modified_at_date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "id")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(LookupFields; id, name)
        {

        }
    }

}
