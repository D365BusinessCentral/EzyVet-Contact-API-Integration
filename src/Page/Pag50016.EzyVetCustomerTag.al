page 50016 "EzyVet Customer Tag"
{

    ApplicationArea = All;
    Caption = 'EzyVet Customer Tag';
    PageType = List;
    SourceTable = "EzyVet Customer Tag";
    UsageCategory = Lists;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer Code"; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer Code field';
                    ApplicationArea = All;
                }
                field(tag_id; Rec.tag_id)
                {
                    ToolTip = 'Specifies the value of the Tag Id field';
                    ApplicationArea = All;
                }
                field(tag_name; Rec.tag_name)
                {
                    ToolTip = 'Specifies the value of the Tag Name field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
