page 50013 "EzyVet Country"
{

    ApplicationArea = All;
    Caption = 'EzyVet Country';
    PageType = List;
    SourceTable = "EzyVet Country";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                }
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the id field';
                    ApplicationArea = All;
                }
                field(active; Rec.active)
                {
                    ToolTip = 'Specifies the value of the active field';
                    ApplicationArea = All;
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field';
                    ApplicationArea = All;
                }
                field(modified_at; Rec.modified_at)
                {
                    ToolTip = 'Specifies the value of the modified_at field';
                    ApplicationArea = All;
                }
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field';
                    ApplicationArea = All;
                }
                field(limit; Rec.limit)
                {
                    ToolTip = 'Specifies the value of the limit field';
                    ApplicationArea = All;
                }
                field(page; Rec.page)
                {
                    ToolTip = 'Specifies the value of the page field';
                    ApplicationArea = All;
                }
                field(EzyVet_created_date; Rec.EzyVet_created_date)
                {
                    ToolTip = 'Specifies the value of the EzyVet_created_at_date field';
                    ApplicationArea = All;
                }
                field(EzyVet_modified_date; Rec.EzyVet_modified_date)
                {
                    ToolTip = 'Specifies the value of the EzyVet_modified_at_date field';
                    ApplicationArea = All;
                }
                field(Record_Inserted_Date; Rec.Record_Inserted_Date)
                {
                    ToolTip = 'Specifies the value of the Record_Inserted_Date field';
                    ApplicationArea = All;
                }
                field(Is_New_Country; Rec.Is_New_Country)
                {
                    ToolTip = 'Specifies the value of the New Country field';
                    ApplicationArea = All;
                }
                field(Is_Modified_Country; Rec.Is_Modified_Country)
                {
                    ToolTip = 'Specifies the value of the Modified Country field';
                    ApplicationArea = All;
                }
                field(Processed; Rec.Processed)
                {
                    ToolTip = 'Specifies the value of the Processed field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
