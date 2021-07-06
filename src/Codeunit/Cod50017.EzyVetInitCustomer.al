codeunit 50017 "EzyVet Init Customer"
{
    procedure InitCustomerRecords()
    begin
        GetCustomerTemplate();
        EzyVetContacts.Reset();
        if gContactEntryNo <> 0 then
            EzyVetContacts.SetRange(entry_no, gContactEntryNo);
        EzyVetContacts.SetRange(Processed, false);
        if EzyVetContacts.FindFirst() then
            repeat
                if EzyVetContacts.is_customer = '1' then begin
                    EzyVetInsertCustomers.CreateCustomer(EzyVetContacts);
                end;
                EzyVetContacts.Processed := true;
                EzyVetContacts.Modify();
            until EzyVetContacts.Next() = 0;

    end;

    local procedure GetCustomerTemplate()
    var
        APIConfiguration: Record "EzyVet API Configuration";
    begin
        APIConfiguration.Get();
        APIConfiguration.TestField("Default Customer Template");
        CustomerTemplate.Get(APIConfiguration."Default Customer Template");
    end;

    procedure SetParameters(lContactEntryNo: Integer)
    begin
        gContactEntryNo := lContactEntryNo;
    end;

    var
        EzyVetContacts: Record "EzyVet Contacts";
        EzyVetInsertCustomers: Codeunit "EzyVet Update Customer";
        CustomerTemplate: Record "Customer Templ.";
        gContactEntryNo: Integer;

}
