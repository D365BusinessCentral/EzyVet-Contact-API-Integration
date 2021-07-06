codeunit 50020 EzyVetUpdateCustomersJobQueue
{
    trigger OnRun()
    begin
        //Insert/Update Customer Records
        Clear(InitCustomers);
        InitCustomers.InitCustomerRecords();
    end;

    var
        InitCustomers: Codeunit "EzyVet Init Customer";


}