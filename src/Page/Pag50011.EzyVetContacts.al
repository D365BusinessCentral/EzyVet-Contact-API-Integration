page 50011 "EzyVet Contacts"
{

    ApplicationArea = All;
    Caption = 'EzyVet Contacts';
    PageType = List;
    SourceTable = "EzyVet Contacts";
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
                field(ownership_id; Rec.ownership_id)
                {
                    ToolTip = 'Specifies the value of the ownership_id field';
                    ApplicationArea = All;
                }
                field(code; Rec.code)
                {
                    ToolTip = 'Specifies the value of the code field';
                    ApplicationArea = All;
                }
                field(first_name; Rec.first_name)
                {
                    ToolTip = 'Specifies the value of the first_name field';
                    ApplicationArea = All;
                }
                field(last_name; Rec.last_name)
                {
                    ToolTip = 'Specifies the value of the last_name field';
                    ApplicationArea = All;
                }

                field(business_name; Rec.business_name)
                {
                    ToolTip = 'Specifies the value of the business_name field';
                    ApplicationArea = All;
                }

                field(address_postal; Rec.address_postal)
                {
                    ToolTip = 'Specifies the value of the address_postal field';
                    ApplicationArea = All;
                }
                field(is_business; Rec.is_business)
                {
                    ToolTip = 'Specifies the value of the is_business field';
                    ApplicationArea = All;
                }
                field(is_customer; Rec.is_customer)
                {
                    ToolTip = 'Specifies the value of the is_customer field';
                    ApplicationArea = All;
                }
                field(is_staff_member; Rec.is_staff_member)
                {
                    ToolTip = 'Specifies the value of the is_staff_member field';
                    ApplicationArea = All;
                }
                field(is_supplier; Rec.is_supplier)
                {
                    ToolTip = 'Specifies the value of the is_supplier field';
                    ApplicationArea = All;
                }
                field(is_syndicate; Rec.is_syndicate)
                {
                    ToolTip = 'Specifies the value of the is_syndicate field';
                    ApplicationArea = All;
                }
                field(is_vet; Rec.is_vet)
                {
                    ToolTip = 'Specifies the value of the is_vet field';
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
                field(stop_credit; Rec.stop_credit)
                {
                    ToolTip = 'Specifies the value of the stop_credit field';
                    ApplicationArea = All;
                }
                field(EzyVet_created_date; rec.EzyVet_created_date)
                {
                    ToolTip = 'Specifies the value of the EzyVet_created_date field';
                    ApplicationArea = All;
                }
                field(EzyVet_modified_date; rec.EzyVet_modified_date)
                {
                    ToolTip = 'Specifies the value of the EzyVet_modified_date field';
                    ApplicationArea = All;
                }
                field(Record_Inserted_Date; rec.Record_Inserted_Date)
                {
                    ToolTip = 'Specifies the value of the Record_Inserted_Date field';
                    ApplicationArea = All;
                }
                field(Processed; rec.Processed)
                {
                    ToolTip = 'Specifies the value of the Processed field';
                    ApplicationArea = All;

                }
                field(Is_New_Contact; rec.Is_New_Contact)
                {
                    ToolTip = 'Specifies the value of the Is_New_Contact field';
                    ApplicationArea = All;

                }
                field(Modified_Contact; rec.Is_Modified_Contact)
                {
                    ToolTip = 'Specifies the value of the Is_Modified_Contact field';
                    ApplicationArea = All;

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UpdateContacts)
            {
                Caption = 'Get Contacts';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    GetContactInformation: Codeunit "EzyVet Get Contact Information";
                    lEndPoint: Option Contact,Address,Country;
                begin
                    //Clear(GetContactInformation);
                    //GetContactInformation.SetParameters(lEndPoint::Contact);
                    //GetContactInformation.RetrieveContactInforamtion();
                    Clear(EzyVetGetContactInfo);
                    EzyVetGetContactInfo.Parameters(lEndPoint::Contact);
                    EzyVetGetContactInfo.Run();

                end;
            }
            action(UpdateAddress)
            {
                Caption = 'Get Address';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    GetContactInformation: Codeunit "EzyVet Get Contact Information";
                    lEndPoint: Option Contact,Address,Country;
                begin
                    //Clear(GetContactInformation);
                    //GetContactInformation.SetParameters(lEndPoint::Address);
                    //GetContactInformation.RetrieveContactInforamtion();
                    Clear(EzyVetGetContactInfo);
                    EzyVetGetContactInfo.Parameters(lEndPoint::Address);
                    EzyVetGetContactInfo.Run();

                end;
            }
            action(UpdateCountry)
            {
                Caption = 'Get Country';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    GetContactInformation: Codeunit "EzyVet Get Contact Information";
                    lEndPoint: Option Contact,Address,Country;
                begin
                    //Clear(GetContactInformation);
                    //GetContactInformation.SetParameters(lEndPoint::Country);
                    //GetContactInformation.RetrieveContactInforamtion();
                    Clear(EzyVetGetContactInfo);
                    EzyVetGetContactInfo.Parameters(lEndPoint::Country);
                    EzyVetGetContactInfo.Run();
                end;
            }

            action(Address)
            {
                Caption = 'Contact Address';
                Image = ViewDetails;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = page "EzyVet Address";
                RunPageLink = contact_id = field(id);

            }

            action(CreateCustomer)
            {
                Caption = 'Create/Update Customer';
                Image = Create;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    UpdateCustomer: Codeunit "EzyVet Init Customer";
                begin
                    Clear(UpdateCustomer);
                    if Rec.Processed = false then begin
                        UpdateCustomer.SetParameters(Rec.entry_no);
                        UpdateCustomer.InitCustomerRecords;
                    end else
                        Error('Customer already created or updated');
                end;
            }

        }
    }
    var
        EzyVetGetContactInfo: Report EzyVetGetContactInformation;

}
