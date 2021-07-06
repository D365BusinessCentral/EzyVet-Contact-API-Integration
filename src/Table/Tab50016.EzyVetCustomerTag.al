table 50016 "EzyVet Customer Tag"
{
    Caption = 'Ezyvet Customer Tag';
    DataClassification = CustomerContent;
    LookupPageId = "EzyVet Customer Tag";

    fields
    {
        field(1; "Customer No."; code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(2; tag_id; Text[100])
        {
            Caption = 'Tag Id';
            DataClassification = CustomerContent;
        }
        field(3; tag_name; Text[200])
        {
            Caption = 'Tag Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Customer No.", tag_id)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(LookupFields; tag_id, tag_name)
        {

        }
    }

}
