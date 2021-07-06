page 50012 "EzyVet Address"
{

    ApplicationArea = All;
    Caption = 'EzyVet Address';
    PageType = List;
    SourceTable = "EzyVet Address";
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
                field(street_1; Rec.street_1)
                {
                    ToolTip = 'Specifies the value of the street_1 field';
                    ApplicationArea = All;
                }
                field(street_2; Rec.street_2)
                {
                    ToolTip = 'Specifies the value of the street_2 field';
                    ApplicationArea = All;
                }
                field(suburb; Rec.suburb)
                {
                    ToolTip = 'Specifies the value of the suburb field';
                    ApplicationArea = All;
                }
                field(city; Rec.city)
                {
                    ToolTip = 'Specifies the value of the city field';
                    ApplicationArea = All;
                }
                field(region; Rec.region)
                {
                    ToolTip = 'Specifies the value of the region field';
                    ApplicationArea = All;
                }
                field(post_code; Rec.post_code)
                {
                    ToolTip = 'Specifies the value of the post_code field';
                    ApplicationArea = All;
                }
                field(state; Rec.state)
                {
                    ToolTip = 'Specifies the value of the state field';
                    ApplicationArea = All;
                }
                field(country_id; Rec.country_id)
                {
                    ToolTip = 'Specifies the value of the country_id field';
                    ApplicationArea = All;
                }
                field("Country Name"; Rec."Country Name")
                {
                    ToolTip = 'Specifies the value of the Country Name field';
                    ApplicationArea = All;
                }
                field(latitude; Rec.latitude)
                {
                    ToolTip = 'Specifies the value of the latitude field';
                    ApplicationArea = All;
                }
                field(longitude; Rec.longitude)
                {
                    ToolTip = 'Specifies the value of the longitude field';
                    ApplicationArea = All;
                }
                field(contact_id; rec.contact_id)
                {
                    ToolTip = 'Specifies the value of the contact_id field';
                    ApplicationArea = All;

                }
                field(Processed; rec.Processed)
                {
                    ToolTip = 'Specifies the value of the Processed field';
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
        }
    }

}
