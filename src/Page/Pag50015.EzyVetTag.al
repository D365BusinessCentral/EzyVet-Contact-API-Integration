page 50015 "EzyVet Tag"
{

    ApplicationArea = All;
    Caption = 'EzyVet Tag';
    PageType = List;
    SourceTable = "EzyVet Tag";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(name; Rec.name)
                {
                    ToolTip = 'Specifies the value of the name field';
                    ApplicationArea = All;
                }
                field(associated_type; Rec.associated_type)
                {
                    ToolTip = 'Specifies the value of the associated_type field';
                    ApplicationArea = All;
                }
                field(associated_id; Rec.associated_id)
                {
                    ToolTip = 'Specifies the value of the associated_id field';
                    ApplicationArea = All;
                }
                field(category_id; rec.category_id)
                {
                    ToolTip = 'Specifies the value of the category_id field';
                    ApplicationArea = all;
                }
                field(created_at; Rec.created_at)
                {
                    ToolTip = 'Specifies the value of the created_at field';
                    ApplicationArea = All;
                }
                field(created_at_date; Rec.created_at_date)
                {
                    ToolTip = 'Specifies the value of the created_at_date field';
                    ApplicationArea = All;
                }
                field(modified_at; Rec.modified_at)
                {
                    ToolTip = 'Specifies the value of the modified_at field';
                    ApplicationArea = All;
                }
                field(modified_at_date; Rec.modified_at_date)
                {
                    ToolTip = 'Specifies the value of the modified_at_date field';
                    ApplicationArea = All;
                }
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(UpdateTag)
            {
                Caption = 'Get Tag';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    lEndPoint: Option Contact,Address,Country,Tag;
                    EzyVetGetContactInfo: Report EzyVetGetContactInformation;
                begin
                    Clear(EzyVetGetContactInfo);
                    EzyVetGetContactInfo.Parameters(lEndPoint::Tag);
                    EzyVetGetContactInfo.Run();
                end;
            }
        }
    }

}
