codeunit 50018 "EzyVet Update Customer"
{
    procedure CreateCustomer(lEzyVetContacts: Record "EzyVet Contacts")
    var
        lCustomer: Record Customer;
    begin
        APIConfiguration.Get();
        CustomerTemplate.Get(APIConfiguration."Default Customer Template");
        lCustomer.Reset;
        lCustomer.SetRange(lcustomer."No.", lEzyVetContacts.id);
        if not lCustomer.FindFirst() then begin
            lCustomer.Init();
            lCustomer."No." := lEzyVetContacts.id;
            lCustomer.Insert();
        end;
        CopyFromCustomerTemplate(lCustomer);
        CopyFromEzyVetContact(lEzyVetContacts, lCustomer);
        lCustomer.Modify();
        if GuiAllowed then
            Message('Customer %1 created/modified for EzyVet contact', lCustomer."No.");
    end;

    local procedure CopyFromEzyVetContact(lEzyVetContacts: Record "EzyVet Contacts"; var lCustomer: Record Customer)
    var
        lEzyVetAddress: Record "EzyVet Address";
        lEzyVetCountry: Record "EzyVet Country";
        lPostCode: Record "Post Code";
        lEzyVetTag: Record "EzyVet Tag";
        lEzyVetCustomerTag: Record "EzyVet Customer Tag";
    begin

        lCustomer.Name := CopyStr(lEzyVetContacts.first_name, 1, 100);
        lCustomer."Name 2" := CopyStr(lEzyVetContacts.last_name, 1, 100);
        lEzyVetAddress.Reset();
        lEzyVetAddress.SetRange(contact_id, lEzyVetContacts.id);
        lEzyVetAddress.SetRange(id, lEzyVetContacts.address_postal);
        lEzyVetAddress.SetRange(Processed, false);
        if lEzyVetAddress.FindLast() then begin
            lCustomer.Address := copystr(lEzyVetAddress.street_1, 1, 100);
            lCustomer."Address 2" := copystr(lEzyVetAddress.street_2, 1, 100);
            lPostCode.Reset();
            lPostCode.SetRange(Code, CopyStr(lEzyVetAddress.post_code, 1, 20));
            lPostCode.SetRange(City, UpperCase(CopyStr(lEzyVetAddress.city, 1, 30)));
            if not lPostCode.FindFirst() then begin
                lPostCode.Init();
                lPostCode.Code := Copystr(lEzyVetAddress.post_code, 1, 20);
                lPostCode.City := CopyStr(lEzyVetAddress.city, 1, 30);
                lPostCode.County := CopyStr(lEzyVetAddress.state, 1, 30);
                lEzyVetCountry.Reset();
                lEzyVetCountry.SetRange(id, lEzyVetAddress.country_id);//todo
                lEzyVetCountry.FindFirst();
                lPostCode."Country/Region Code" := lEzyVetCountry.name;//todo
                lPostCode.Insert();
            end;
            lCustomer.Validate("Post Code", lPostCode.Code);
            lCustomer.Validate(City, UPPERCASE(CopyStr(lEzyVetAddress.city, 1, 30)));
        end;
        lEzyVetTag.Reset();
        lEzyVetTag.SetFilter(associated_type, '');
        lEzyVetTag.SetFilter(associated_id, lEzyVetContacts.id);
        if lEzyVetTag.FindFirst() then begin
            lEzyVetCustomerTag.Reset();
            lEzyVetCustomerTag.SetRange("Customer No.", lCustomer."No.");
            lEzyVetCustomerTag.SetRange(tag_id, lEzyVetTag.id);
            if not lEzyVetCustomerTag.FindFirst() then begin
                lEzyVetCustomerTag.Init();
                lEzyVetCustomerTag."Customer No." := lCustomer."No.";
                lEzyVetCustomerTag.tag_id := lEzyVetTag.id;
                lEzyVetCustomerTag.Insert();
                lEzyVetCustomerTag.tag_name := lEzyVetTag.name;
                lEzyVetCustomerTag.Modify();
            end;
        end;
        //lCustomer.Modify();

    end;

    local procedure CopyFromCustomerTemplate(var lCustomer: Record Customer)
    begin
        lCustomer.CopyFromNewCustomerTemplate(CustomerTemplate);
        //lCustomer.Modify();
    end;

    var
        APIConfiguration: Record "EzyVet API Configuration";
        CustomerTemplate: Record "Customer Templ.";
}
